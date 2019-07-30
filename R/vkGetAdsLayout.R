vkGetAdsLayout <- function(account_id = NULL,
                           client_id = NULL,
                           include_deleted = TRUE,
                           campaign_ids = "null",
                           ad_ids = "null",
                           api_version = NULL,
                           status_names = TRUE,
                           access_token = NULL){
  
  
  if(is.null(access_token)){
    stop("Set access_token in options, is require.")
  }
  
  # API version
  api_version <- api_version_checker(api_version)
  
  # camp filter to json format
  if(campaign_ids != "null"){
    campaign_ids <- toJSON(campaign_ids)
  }
  
  # ad filter to json format
  if(ad_ids != "null"){
    ad_ids <- toJSON(ad_ids)
  }
  
  # status filter
  include_deleted <- ifelse(include_deleted == T,1,0) 
  
  # result frame
  result  <- data.frame(id                  = integer(0),
                        campaign_id         = integer(0),
                        title               = character(0),
                        link_url            = character(0),
                        link_domain         = character(0),
                        cost_type           = character(0),
                        ad_format           = integer(0),
                        preview_link        = character(0),
                        image_src           = character(0),
                        stringsAsFactors = F)
  
  
  # query
  query <- paste0("https://api.vk.com/method/ads.getAdsLayout?account_id=",account_id,ifelse(is.null(client_id), "",paste0("&client_id=",client_id)),"&include_deleted=",include_deleted,"&campaign_ids=",campaign_ids,"&ad_ids=",ad_ids,"&access_token=",access_token,"&v=",api_version)
  answer <- GET(query)
  stop_for_status(answer)
  dataRaw <- content(answer, "parsed", "application/json")
  
  # check for error
  if(!is.null(dataRaw$error)){
    stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
  }
  
    
  # parsing
  for(i in 1:length(dataRaw$response)){
    result  <- rbind(result,
                     data.frame(id                  = ifelse(is.null(dataRaw$response[[i]]$id), NA,dataRaw$response[[i]]$id),
                                campaign_id         = ifelse(is.null(dataRaw$response[[i]]$campaign_id), NA,dataRaw$response[[i]]$campaign_id),
                                age_restriction     = ifelse(is.null(dataRaw$response[[i]]$age_restriction), NA,dataRaw$response[[i]]$age_restriction),
                                title               = ifelse(is.null(dataRaw$response[[i]]$title), NA,dataRaw$response[[i]]$title),
                                link_url            = ifelse(is.null(dataRaw$response[[i]]$link_url), NA,dataRaw$response[[i]]$link_url),
                                link_domain         = ifelse(is.null(dataRaw$response[[i]]$link_domain), NA,dataRaw$response[[i]]$link_domain),
                                cost_type           = ifelse(is.null(dataRaw$response[[i]]$cost_type), NA,dataRaw$response[[i]]$cost_type),
                                ad_format           = ifelse(is.null(dataRaw$response[[i]]$ad_format), NA,dataRaw$response[[i]]$ad_format),
                                preview_link        = ifelse(is.null(dataRaw$response[[i]]$preview_link), NA,dataRaw$response[[i]]$preview_link),
                                image_src           = ifelse(is.null(dataRaw$response[[i]]$image_src), NA,dataRaw$response[[i]]$image_src),
                                stringsAsFactors = F))}
  if(status_names == TRUE){
    # formats names
    #ad_formats <- getURL("https://raw.githubusercontent.com/selesnow/rvkstat/master/Dictionary/ad.formats.csv", .encoding = "1251")
    #ad_formats <- read.csv(text = ad_formats, sep = ";")
    result$ad_format <- as.character(merge(result, ad_formats, by.x = "ad_format", by.y = "id", all.x = T)$format)
    
    # cost type names
    #ad_cost_type <- getURL("https://raw.githubusercontent.com/selesnow/rvkstat/master/Dictionary/ad.cost_type.csv", .encoding = "1251")
    #ad_cost_type <- read.csv(text = ad_cost_type, sep = ";")
    result$cost_type <- as.character(merge(result, ad_cost_type, by.x = "cost_type", by.y = "id", all.x = T)$cost_type_name)
  }
  
  # return result
  return(result)

}
