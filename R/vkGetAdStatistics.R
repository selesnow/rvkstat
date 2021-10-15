vkGetAdStatistics <- function(
  account_id   = vkCurrentAdAccount(),
  ids_type     = c("office", "client", "campaign", "ad"),
  ids,
  period       = c("day", "week", "month", "year", "overall"),
  date_from    = Sys.Date() - 30,
  date_to      = Sys.Date(),
  username     = getOption("rvkstat.username"),
  api_version  = getOption("rvkstat.api_version"),
  token_path   = vkTokenPath(),
  access_token = getOption("rvkstat.access_token")
) 
{
  
  # auth
  if ( is.null(access_token) ) {    
    
    if ( Sys.getenv("RVK_API_TOKEN") != "" )  {
      access_token <- Sys.getenv("RVK_API_TOKEN")    
    } else {
      access_token <- vkAuth(username   = username, 
                             token_path = token_path)$access_token
    }
  }
  
  if ( class(access_token) == "vk_auth" ) {
    
    access_token <- access_token$access_token
    
  }
  
  # check args
  ids_type <- match.arg(ids_type)
  period   <- match.arg(period)
  
  # transfroming filter for campaigns in json
  if(period == "month"){
    date_from <- ifelse( as.character(date_from) != 0, format(as.Date(as.character(date_from)), "%Y-%m"), 0)
    date_to   <- format(as.Date(as.character(date_to)), "%Y-%m")
  }
  
  if(period == "year"){
    date_from <- ifelse( as.character(date_from) != 0, format(as.Date(as.character(date_from)), "%Y"), "0")
    date_to   <- format(as.Date(as.character(date_to)), "%Y")
  }
  
  if(period == "overall"){
    date_from <- 0
    date_to   <- 0
  }
  
  # split if there are more than 400 ids
  numb <- 250
  divnumb <- length(ids) %/% numb + 1
  ids_list <- list()
  
  for (i in 1:divnumb) {
    
    ids_list[[i]] <- ids[1:numb]
    ids <- ids[-(1:numb)] 
    
  }
  
  ids_list <- lapply(ids_list, function(x) x[!is.na(x)])
  
  # resulting data frame
  result <- list()
  
  for ( i in ids_list )  {
    
    # ids in this iteraction
    ids <- paste0(i, collapse = ",")
    
    # check if flood control
    Sys.sleep(2) #vk limit
    
    # check API limit
    vkCheckLimit(
      account_id,
      access_token,
      api_version
    )
    
    # API request
    answer <- GET("https://api.vk.com/method/ads.getStatistics", 
                  query = list(
                    account_id   = account_id,
                    ids_type     = ids_type,
                    ids          = ids,
                    period       = period,
                    date_from    = date_from,
                    date_to      = date_to,
                    access_token = access_token,
                    v            = api_version
                  ))
    
    # check status
    stop_for_status(answer)
    # get body
    dataRaw <- content(answer, "parsed", "application/json")
    
    # check if errors
    if(!is.null(dataRaw$error)){
      stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
    }
    
    message(dataRaw)
    
    #if   (length(dataRaw$response[[1]]$stats) > 0)
    #	{
    # parsing 
    tryCatch(
      
      {
        temp <- tibble(response = dataRaw$response) %>%
          unnest_wider("response") %>%
          unnest_longer("stats") %>%
          unnest_wider("stats")
        
        # append to result
        result <- append(result, list(temp))
        #    }
      }
      , error = function(ex) 
      {
        # here 'ex' is an instance of 'simpleError'
        message(as.character(ex))
        message(ex$message)
      })
    
    
    Sys.sleep(2) #vk limit
    
  }
  
  # collect result
  result <- bind_rows(result) 
  message(result)
  # data type mismatch handler 
  if (nrow(result) > 0) {
    
    result <- 
      filter(result, !is.na("impressions")) %>%
      mutate(
        across( everything(), replace_na, 0 ),
        across( 4:length(result), as.numeric ))
    
  }
  
  # end
  return(result) 
}