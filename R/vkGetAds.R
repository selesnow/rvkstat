vkGetAds <- function(account_id = NULL,
                     client_id = NULL,
                     include_deleted = TRUE,
                     campaign_ids = "null",
                     ad_ids = "null",
                     status_names = TRUE,
					           api_version = NULL,
                     access_token = NULL){
  
  if(is.null(access_token)){
    stop("Set access_token in options, is require.")
  }
  
  # check api version
  api_version <- api_version_checker(api_version)
  
  # camp filter to json
  if(any(campaign_ids != "null")){
    campaign_ids <- toJSON(campaign_ids)
  }
  
  # ads filter to json
  if(ad_ids != "null"){
    ad_ids <- toJSON(ad_ids)
  }
  
  # ads status filter
  include_deleted <- ifelse(include_deleted == T,1,0) 

  # result frame
  result  <- data.frame(id                  = integer(0),
                        campaign_id         = integer(0),
                        name                = character(0),
                        status              = character(0),
                        ad_format           = character(0),
                        approved            = character(0),
                        all_limit           = integer(0),
                        create_time         = character(0),
                        update_time         = character(0),
                        age_restriction     = integer(0),
                        category1_id        = integer(0),
                        category2_id        = integer(0),
                        cost_type           = integer(0),
                        cpc                 = numeric(0),
                        cpm                 = numeric(0),
                        impressions_limit   = integer(0),
                        impressions_limited = integer(0),
                        ad_platform         = integer(0),
                        video               = integer(0),
                        stringsAsFactors = F)
                        

  # query
  query <- paste0("https://api.vk.com/method/ads.getAds?account_id=",account_id,ifelse(is.null(client_id), "",paste0("&client_id=",client_id)),"&include_deleted=",include_deleted,"&campaign_ids=",campaign_ids,"&ad_ids=",ad_ids,"&access_token=",access_token,"&v=",api_version)
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
                                name                = ifelse(is.null(dataRaw$response[[i]]$name), NA,dataRaw$response[[i]]$name),
                                status              = ifelse(is.null(dataRaw$response[[i]]$status), NA,dataRaw$response[[i]]$status),
                                ad_format           = ifelse(is.null(dataRaw$response[[i]]$ad_format), NA,dataRaw$response[[i]]$ad_format),
                                approved            = ifelse(is.null(dataRaw$response[[i]]$approved), NA,dataRaw$response[[i]]$approved),
                                all_limit           = ifelse(is.null(dataRaw$response[[i]]$all_limit), NA,dataRaw$response[[i]]$all_limit),
                                create_time         = ifelse(is.null(dataRaw$response[[i]]$create_time), NA,as.POSIXct(as.integer(dataRaw$response[[i]]$create_time), origin="1970-01-01")),
                                update_time         = ifelse(is.null(dataRaw$response[[i]]$update_time), NA,as.POSIXct(as.integer(dataRaw$response[[i]]$update_time), origin="1970-01-01")),
                                age_restriction     = ifelse(is.null(dataRaw$response[[i]]$age_restriction), NA,dataRaw$response[[i]]$age_restriction),
                                category1_id        = ifelse(is.null(dataRaw$response[[i]]$category1_id), NA,dataRaw$response[[i]]$category1_id),
                                category2_id        = ifelse(is.null(dataRaw$response[[i]]$category2_id), NA,dataRaw$response[[i]]$category2_id),
                                cost_type           = ifelse(is.null(dataRaw$response[[i]]$cost_type), NA,dataRaw$response[[i]]$cost_type),
                                cpc                 = ifelse(is.null(dataRaw$response[[i]]$cpc), NA,dataRaw$response[[i]]$cpc),
                                cpm                 = ifelse(is.null(dataRaw$response[[i]]$cpm), NA,dataRaw$response[[i]]$cpm),
                                impressions_limit   = ifelse(is.null(dataRaw$response[[i]]$impressions_limit), NA,dataRaw$response[[i]]$impressions_limit),
                                impressions_limited = ifelse(is.null(dataRaw$response[[i]]$impressions_limited), NA,dataRaw$response[[i]]$impressions_limited),
                                ad_platform         = ifelse(is.null(dataRaw$response[[i]]$ad_platform), NA,dataRaw$response[[i]]$ad_platform),
                                video               = ifelse(is.null(dataRaw$response[[i]]$video), NA,dataRaw$response[[i]]$video),
                                stringsAsFactors = F))}

if(status_names == TRUE){
    # convert to data
    result$create_time <- as.POSIXct(as.integer(result$create_time), origin="1970-01-01")
    result$update_time <- as.POSIXct(as.integer(result$update_time), origin="1970-01-01")
    
    # formats names
    #ad_formats <- getURL("https://raw.githubusercontent.com/selesnow/rvkstat/master/Dictionary/ad.formats.csv", .encoding = "1251")
    #ad_formats <- read.csv(text = ad_formats, sep = ";")
    result$ad_format <- as.character(merge(result, ad_formats, by.x = "ad_format", by.y = "id", all.x = T)$format)
    
    # approves status names
    #ad_approveds <- getURL("https://raw.githubusercontent.com/selesnow/rvkstat/master/Dictionary/ad.approveds.csv", .encoding = "1251")
    #ad_approveds <- read.csv(text = ad_approveds, sep = ";")
    result$approved <- as.character(merge(result, ad_approveds, by.x = "approved", by.y = "id", all.x = T)$approved_name)
    
    # cost type names
    #ad_cost_type <- getURL("https://raw.githubusercontent.com/selesnow/rvkstat/master/Dictionary/ad.cost_type.csv", .encoding = "1251")
    #ad_cost_type <- read.csv(text = ad_cost_type, sep = ";")
    result$cost_type <- as.character(merge(result, ad_cost_type, by.x = "cost_type", by.y = "id", all.x = T)$cost_type_name)
    
    # age_restriction names
    #ad_age_restriction <- getURL("https://raw.githubusercontent.com/selesnow/rvkstat/master/Dictionary/ad.age_restriction.csv", .encoding = "1251")
    #ad_age_restriction <- read.csv(text = ad_age_restriction, sep = ";")
    result$age_restriction <- as.character(merge(result, ad_age_restriction, by.x = "age_restriction", by.y = "id", all.x = T)$age_label)
    
    # status names
    #ad_status <- getURL("https://raw.githubusercontent.com/selesnow/rvkstat/master/Dictionary/ad.status.csv", .encoding = "1251")
    #ad_status <- read.csv(text = ad_status, sep = ";")
    result$status <- as.character(merge(result, ad_status, by.x = "status", by.y = "id", all.x = T)$status_name)
    }

#Преобрахуем в числовой формат
result$cpc   <- as.numeric(result$cpc) / 100 
result$cpm   <- as.numeric(result$cpm) / 100

#Возвращаем результат
return(result)
}
