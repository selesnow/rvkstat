vkGetAdCityStats <- function(
    account_id   = vkCurrentAdAccount(),
    ids_type     = c("campaign", "ad"),
    ids          = NULL,
    period       = c("day", "month", "overall"),
    date_from    = Sys.Date() - 30,
    date_to      = Sys.Date(),
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
	
  
  # date to month
  if(period == "month"){
    date_from <- format(as.Date(as.character(date_from)), "%Y-%m")
    date_to   <- format(as.Date(as.character(date_to)), "%Y-%m")
  }
  
  if(period == "overall"){
    date_from <- 0
    date_to   <- 0
  }
  
  # check ids type
  ids_type <- match.arg(ids_type)
  
  # check period
  period <- match.arg(period)
  
  # ids sep
  ids <- paste0(ids, collapse = ",")
  
  # API request 
  answer <- GET("https://api.vk.com/method/ads.getDemographics",
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
  
  # check answer status
  stop_for_status(answer)
  # get answer body
  dataRaw <- content(answer, "parsed", "application/json")
  
  # check for error
  if(!is.null(dataRaw$error)){
    stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
  }
  
  # check 
  
  # parsing 
  result <- tibble(response = dataRaw$response) %>%
            unnest_wider("response") %>%
            unnest_longer("stats") %>%
            unnest_wider("stats") %>%
            select(-"sex", -"age", -"sex_age") %>%
            unnest_longer("cities") %>%
            unnest_wider("cities") %>%
            mutate(value = lapply("value", as.character)) %>%
            unnest_longer("value") %>%
            rename(city_id = "value") %>%
            mutate( across( where(is.numeric), replace_na, 0 ) )
  
  # convert date
  if ( tolower(period) == 'day' ) {
    
    result <- mutate(result, day = as.Date("day"))
    
  }
  
  # end
  return(result)
}
