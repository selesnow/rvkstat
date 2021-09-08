vkGetAdsLayout <- function(
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
  answer <- GET("https://api.vk.com/method/ads.getAdsLayout", 
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
  result <- tibble(data = dataRaw$response) %>% 
            unnest_wider("data")

  if(status_names == TRUE){
    # formats names
    result$ad_format <- as.character(merge(result, ad_formats, by.x = "ad_format", by.y = "id", all.x = T)$format)
    
    # cost type names
    result$cost_type <- as.character(merge(result, ad_cost_type, by.x = "cost_type", by.y = "id", all.x = T)$cost_type_name)
  }
  
  # return result
  return(result)

}
