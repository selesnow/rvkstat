vkGetAdCategories <- function(
  version      = c("v1", "v2"),
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

  # query
  answer <- GET("https://api.vk.com/method/ads.getCategories", 
                query = list(
                  access_token = access_token,
                  v            = api_version
                ))
  
  # check status
  stop_for_status(answer)
  
  # parsing body
  dataRaw <- content(answer, "parsed", "application/json")
  
  # check for error
  if(!is.null(dataRaw$error)){
    stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
  }
  
  # convert to tibble
  result <- tibble(response = dataRaw$response[[version]]) %>%
          unnest_wider("response") %>%
          unnest_longer("subcategories") %>%
          unnest_wider("subcategories", names_sep = "_")
  
  # return
  return(result)
}
