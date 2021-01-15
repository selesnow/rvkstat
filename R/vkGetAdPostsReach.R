vkGetAdPostsReach <- function(
    account_id   = vkCurrentAdAccount(),
    ids_type     = "campaign",
    ids          = NULL,
    username     = getOption("rvkstat.username"),
    api_version  = getOption("rvkstat.api_version"),
    token_path   = vkTokenPath(),
    access_token = getOption("rvkstat.access_token")
    ) {
  
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
  
  # sep ids
  ids <- paste0(ids, collapse = ",")
  
  # API request
  answer <- GET("https://api.vk.com/method/ads.getPostsReach", 
                query = list(
                  account_id   = account_id,
                  ids_type     = ids_type,
                  ids          = ids,
                  access_token = access_token,
                  v            = api_version
                ))
  
  # check status
  stop_for_status(answer)
  # get answer body
  dataRaw <- content(answer, "parsed", "application/json")
  
  # check for error
  if(!is.null(dataRaw$error)){
    stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
  }

  # parse
  result <- tibble(response = dataRaw$response) %>%
                  unnest_wider("response")

  
  # return result
  return(result)
}
