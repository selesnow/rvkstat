vkCheckLimit <- function(
  account_id,
  access_token,
  api_version
) {
  
  answer <- GET("https://api.vk.com/method/ads.getFloodStats", 
                query = list(
                  account_id   = account_id,
                  access_token = access_token,
                  v            = api_version
                ))
  stop_for_status(answer)
  dataRaw <- content(answer, "parsed", "application/json")
  
  if ( dataRaw$response$left < 5 ) {
    
    cat("Flood limit pause!")
    message("Sleeping for ",dataRaw$response$refresh + 1," seconds until queries limit will refresh...")
    Sys.sleep(dataRaw$response$refresh + 1)
    
  }
  
}
