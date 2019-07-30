vkGetAdCampaigns <- function(account_id = NULL,
                             client_id = NULL,
                             include_deleted = TRUE,
                             campaign_ids = "null",
							               api_version  = NULL,
                             access_token = NULL){
							 
							 

  if(is.null(account_id)){
    stop("Set access_token in options, is require.")
  }
  
  api_version <- api_version_checker(api_version)	
  
  # camp filter to JSON format
  if(campaign_ids != "null"){
    campaign_ids <- toJSON(campaign_ids)
  }
  
  # camp status filter
  include_deleted <- ifelse(include_deleted == T,1,0) 
  
  # result frame
  result  <- data.frame(id               = integer(0),
                        type             = integer(0),
                        name             = character(0),
                        status           = character(0),
                        day_limit        = character(0),
                        all_limit        = character(0),
                        start_time       = integer(0),
                        stop_time        = character(0),
                        create_time      = character(0),
                        update_time      = integer(0),
                        stringsAsFactors = F)
  
  
  # request
  query <- paste0("https://api.vk.com/method/ads.getCampaigns?account_id=",account_id,ifelse(is.null(client_id), "",paste0("&client_id=",client_id)),"&include_deleted=",include_deleted,"&campaign_ids=",campaign_ids,"&access_token=",access_token,"&v=",api_version)
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
                                type                = ifelse(is.null(dataRaw$response[[i]]$type), NA,dataRaw$response[[i]]$type),
                                name                = ifelse(is.null(dataRaw$response[[i]]$name), NA,dataRaw$response[[i]]$name),
                                status              = ifelse(is.null(dataRaw$response[[i]]$status), NA,dataRaw$response[[i]]$status),
                                day_limit           = ifelse(is.null(dataRaw$response[[i]]$day_limit), NA,dataRaw$response[[i]]$day_limit),
                                all_limit           = ifelse(is.null(dataRaw$response[[i]]$all_limit), NA,dataRaw$response[[i]]$all_limit),
                                start_time          = ifelse(is.null(dataRaw$response[[i]]$start_time), NA,as.POSIXct(as.integer(dataRaw$response[[i]]$start_time), origin="1970-01-01")),
                                stop_time           = ifelse(is.null(dataRaw$response[[i]]$stop_time), NA,as.POSIXct(as.integer(dataRaw$response[[i]]$stop_time), origin="1970-01-01")),                                
                                create_time         = ifelse(is.null(dataRaw$response[[i]]$create_time), NA,as.POSIXct(as.integer(dataRaw$response[[i]]$create_time), origin="1970-01-01")),
                                update_time         = ifelse(is.null(dataRaw$response[[i]]$update_time), NA,as.POSIXct(as.integer(dataRaw$response[[i]]$update_time), origin="1970-01-01")),
                                stringsAsFactors = F))}
  
  # load status dictionary
  #campaign_status <- getURL("https://raw.githubusercontent.com/selesnow/rvkstat/master/Dictionary/campaign.status.csv", .encoding = "1251")
  #campaign_status <- read.csv(text = campaign_status, sep = ";")
  result$status <- as.character(merge(result, campaign_status, by.x = "status", by.y = "id", all.x = T)$status_name)
  
  # convert to date
  result$create_time <- as.POSIXct(as.integer(result$create_time), origin="1970-01-01")
  result$update_time <- as.POSIXct(as.integer(result$update_time), origin="1970-01-01")
  result$start_time  <- as.POSIXct(as.integer(result$start_time), origin="1970-01-01")
  result$stop_time   <- as.POSIXct(as.integer(result$stop_time), origin="1970-01-01")
  
  # convert to numeric
  result$day_limit   <- as.numeric(result$day_limit)
  result$all_limit   <- as.numeric(result$all_limit)
  
  return(result)
}
