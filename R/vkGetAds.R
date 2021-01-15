vkGetAds <- function(
    account_id      = vkCurrentAdAccount(),
    client_id       = vkCurrentClientAccount(),
    include_deleted = TRUE,
    only_deleted    = FALSE,
    campaign_ids    = "null",
    ad_ids          = "null",
    status_names    = TRUE,
    username        = getOption("rvkstat.username"),
    api_version     = getOption("rvkstat.api_version"),
    token_path      = vkTokenPath(),
    access_token    = getOption("rvkstat.access_token")
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
  
  # camp filter to json format
  if(campaign_ids != "null"){
    campaign_ids <- toJSON(campaign_ids)
  }
  
  # ad filter to json format
  if(ad_ids != "null"){
    ad_ids <- toJSON(ad_ids)
  }
  
  # status filter
  include_deleted <- as.integer(include_deleted) 
  only_deleted    <- as.integer(only_deleted)
  
  # API request
  answer <- GET("https://api.vk.com/method/ads.getAds", 
                query = list(
                  account_id = account_id,
                  client_id = client_id,
                  include_deleted = include_deleted,
                  only_deleted = only_deleted,
                  campaign_ids = campaign_ids,
                  ad_ids = ad_ids,
                  access_token = access_token,
                  v            = api_version
                ))
  
  # check answer status
  stop_for_status(answer)
  # pars answer body
  dataRaw <- content(answer, "parsed", "application/json")
  
  # to table
  result <- tibble(response = dataRaw$response) %>%
            unnest_wider("response")
  
  # status names
  if(status_names == TRUE){
      # convert to data
      result$create_time <- as.POSIXct(as.integer(result$create_time), origin="1970-01-01")
      result$update_time <- as.POSIXct(as.integer(result$update_time), origin="1970-01-01")
      
      # ad platform
      result$ad_platform <- as.character(result$ad_platform)
      result$ad_platform <- as.character(merge(result, ad_platform, by.x = c("ad_format", "ad_platform"), by.y = c("ad_format_id", "id"), all.x = T)$ad_platform_name)
                                         
      # formats names
      result$ad_format <- as.character(merge(result, ad_formats, by.x = "ad_format", by.y = "id", all.x = T)$format)
      
      # approves status names
      result$approved <- as.character(merge(result, ad_approveds, by.x = "approved", by.y = "id", all.x = T)$approved_name)
      
      # cost type names
      result$cost_type <- as.character(merge(result, ad_cost_type, by.x = "cost_type", by.y = "id", all.x = T)$cost_type_name)
      
      # age_restriction names
      result$age_restriction <- as.character(merge(result, ad_age_restriction, by.x = "age_restriction", by.y = "id", all.x = T)$age_label)
      
      # status names
      result$status <- as.character(merge(result, ad_status, by.x = "status", by.y = "id", all.x = T)$status_name)
      
      # goal_type
      result$goal_type <- as.character(merge(result, goal_type, by.x = "goal_type", by.y = "id", all.x = T)$goal_type_name)

      }

  # to percent
  result$cpc   <- as.numeric(result$cpc) / 100 
  result$cpm   <- as.numeric(result$cpm) / 100
  
  # end
  return(result)
}

