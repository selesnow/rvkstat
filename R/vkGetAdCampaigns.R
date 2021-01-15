vkGetAdCampaigns <- function(
  account_id      = vkCurrentAdAccount(),
  client_id       = vkCurrentClientAccount(),
  include_deleted = TRUE,
  campaign_ids    = "null",
  username        = getOption("rvkstat.username"),
  api_version     = getOption("rvkstat.api_version"),
  token_path      = vkTokenPath(),
  access_token    = getOption("rvkstat.access_token")
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
  
  # camp filter to JSON format
  if(campaign_ids != "null"){
    campaign_ids <- toJSON(campaign_ids)
  }
  
  # camp status filter
  include_deleted <- as.integer(include_deleted) 
  
  # api request
  # send query
  answer <- GET("https://api.vk.com/method/ads.getCampaigns",
                query = list(
                  account_id      = account_id,
                  client_id       = client_id,
                  include_deleted = include_deleted,
                  campaign_ids    = campaign_ids,
                  v               = api_version,
                  access_token    = access_token
                ))
  # check
  stop_for_status(answer)
  
  # get answer
  dataRaw <- content(answer, "parsed", "application/json")# result frame
  
  # check error
  
  # check for error
  if(!is.null(dataRaw$error)){
    stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
  }
  
  # convert result to data frame
  result <- tibble(items = dataRaw$response) %>%
            unnest_wider("items")
  
  # load status dictionary
  result$status <- as.character(merge(result, campaign_status, by.x = "status", by.y = "id", all.x = T)$status_name)
  
  # convert to date
  result$create_time <- as.POSIXct(as.integer(result$create_time), origin="1970-01-01")
  result$update_time <- as.POSIXct(as.integer(result$update_time), origin="1970-01-01")
  result$start_time  <- as.POSIXct(as.integer(result$start_time),  origin="1970-01-01")
  result$stop_time   <- as.POSIXct(as.integer(result$stop_time),   origin="1970-01-01")
  
  # convert to numeric
  result$day_limit   <- as.numeric(result$day_limit)
  result$all_limit   <- as.numeric(result$all_limit)
  
  # return
  return(result)
}
