vkGetDbCountries <- function(
    need_all     = TRUE,
    code         = NULL,
    username     = getOption("rvkstat.username"),
    api_version  = getOption("rvkstat.api_version"),
    token_path   = vkTokenPath(),
    access_token = getOption("rvkstat.access_token")
    ){

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
  
	# collect countries codes
  if(!(is.null(code))){
  code <- paste0(code, collapse = ",")
  }
  
  # convert to integer
  need_all <- as.integer(need_all)
  
  # paging
  offset <- 0
  count  <- 1000
  
  # res object
  res <- list()
  
  # API request
  answer <- GET("https://api.vk.com/method/database.getCountries",
                query = list(
                  need_all     = need_all,
                  code         = code,
                  offset       = offset,
                  count        = count,
                  access_token = access_token,
                  v            = api_version
                ))
  
  
  stop_for_status(answer)

  dataRaw <- content(answer, "parsed", "application/json")
  
  # check for error
  if(!is.null(dataRaw$error)){
    stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
  }
  
  # paging
  read_items  <- length(dataRaw$response$items)
  total_items <- dataRaw$response$count
  
  # to result
  res <- append(res, dataRaw$response$items)
  
  # paging
  offset <- offset + read_items
  
  # go paging
  while ( offset < total_items ) {
    
    # pause
    Sys.sleep(0.6)
    
    # API request
    answer <- GET("https://api.vk.com/method/database.getCountries",
                  query = list(
                    need_all     = need_all,
                    code         = code,
                    offset       = offset,
                    count        = count,
                    access_token = access_token,
                    v            = api_version
                  ))
    
    
    stop_for_status(answer)
    
    dataRaw <- content(answer, "parsed", "application/json")
    
    # check for error
    if(!is.null(dataRaw$error)){
      stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
    }
    
    # to result
    res <- append(res, dataRaw$response$items)
    
    # paging
    read_items  <- length(dataRaw$response$items)
    offset <- offset + read_items
    
  }
  
  # temp result
  result <- tibble(items = res) %>%
            unnest_wider("items")
  
  # end 
  return(result)
}
  
