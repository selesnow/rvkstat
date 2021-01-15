vkGetAdBudget <- function(
    account_id   = getOption("rvkstat.account_id"), 
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
  
  if(is.null(account_id)){
    stop("Set account_id, is require.")
  }
  
  # query
  answer <- GET("https://api.vk.com/method/ads.getBudget", 
                query = list(
                  account_id = account_id,
                  access_token = access_token,
                  v = api_version
                ))
  
  stop_for_status(answer)
  
  dataRaw <- content(answer, "parsed", "application/json")
  
  # check for error
  if(!is.null(dataRaw$error)){
    stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
  }
  
  return(as.numeric(dataRaw$response))
}
