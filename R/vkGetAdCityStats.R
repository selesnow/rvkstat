vkGetAdCityStats <- function(account_id = NULL,
                             ids_type = "campaign",
                             ids = NULL,
                             period = "day",
                             date_from = Sys.Date() - 30,
                             date_to = Sys.Date(),
							 api_version  = NULL,
                             access_token = NULL){
  if(is.null(access_token)){
    stop("Set access_token in options, is require.")
  }
  
  api_version <- api_version_checker(api_version)
	
  if(!(period %in% c("day","month","overall"))){
    stop("Set correctly period, one of: day, month or overall")
  }
  
  # date to month
  if(period == "month"){
    date_from <- format(as.Date(as.character(date_from)), "%Y-%m")
    date_to   <- format(as.Date(as.character(date_to)), "%Y-%m")
  }
  
  if(period == "overall"){
    date_from <- 0
    date_to   <- 0
  }
  
  # ids sep
  ids <- paste0(ids, collapse = ",")
  
  # result
  result <- data.frame()  
  
  # query
  query <- paste0("https://api.vk.com/method/ads.getDemographics?account_id=",account_id,"&ids_type=",ids_type,"&ids=",ids,"&period=",period,"&date_from=",date_from,"&date_to=",date_to,"&access_token=",access_token,"&v=",api_version)
  answer <- GET(query)
  stop_for_status(answer)
  dataRaw <- content(answer, "parsed", "application/json")
  
  # check for error
  if(!is.null(dataRaw$error)){
    stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
  }
  
  for(i in 1:length(dataRaw$response)){
    
    # parsing
    if(period == "day"){
      for(dt in 1:length(dataRaw$response[[i]]$stats)){
        
        for(city_i in 1:length(dataRaw$response[[i]]$stats[[dt]]$cities)){
          
          if(length(dataRaw$response[[i]]$stats[[dt]]$cities)==0) next
          
        result  <- rbind(result,
                         data.frame(id                  = ifelse(is.null(dataRaw$response[[i]]$id), NA,dataRaw$response[[i]]$id),
                                    type                = ifelse(is.null(dataRaw$response[[i]]$type), NA,dataRaw$response[[i]]$type),
                                    day                 = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$day), NA,dataRaw$response[[i]]$stats[[dt]]$day),
                                    city_id             = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$value), NA,dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$value),
                                    city_name           = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$name), NA,dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$name),
                                    impressions_rate    = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$impressions_rate), NA,dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$impressions_rate),
                                    clicks_rate         = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$clicks_rate), NA,dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$clicks_rate),
                                    stringsAsFactors = F))}
      }
    }

    if(period == "month"){
      for(dt in 1:length(dataRaw$response[[i]]$stats)){
        
        for(city_i in 1:length(dataRaw$response[[i]]$stats[[dt]]$cities)){
          
          if(length(dataRaw$response[[i]]$stats[[dt]]$cities)==0) next

        result  <- rbind(result,
                         data.frame(id                  = ifelse(is.null(dataRaw$response[[i]]$id), NA,dataRaw$response[[i]]$id),
                                    type                = ifelse(is.null(dataRaw$response[[i]]$type), NA,dataRaw$response[[i]]$type),
                                    month               = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$month), NA,dataRaw$response[[i]]$stats[[dt]]$month),
                                    city_id             = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$value), NA,dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$value),
                                    city_name           = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$name), NA,dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$name),
                                    impressions_rate    = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$impressions_rate), NA,dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$impressions_rate),
                                    clicks_rate         = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$clicks_rate), NA,dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$clicks_rate),
                                    stringsAsFactors = F))}
    }
  }
    if(period == "overall"){
      for(dt in 1:length(dataRaw$response[[i]]$stats)){
        
        for(city_i in 1:length(dataRaw$response[[i]]$stats[[dt]]$cities)){
          
          if(length(dataRaw$response[[i]]$stats[[dt]]$cities)==0) next
          
          result  <- rbind(result,
                           data.frame(id                  = ifelse(is.null(dataRaw$response[[i]]$id), NA,dataRaw$response[[i]]$id),
                                      type                = ifelse(is.null(dataRaw$response[[i]]$type), NA,dataRaw$response[[i]]$type),
                                      day_from            = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$day_from), NA,dataRaw$response[[i]]$stats[[dt]]$day_from),
                                      day_to              = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$day_to), NA,dataRaw$response[[i]]$stats[[dt]]$day_to),
                                      city_id             = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$value), NA,dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$value),
                                      city_name           = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$name), NA,dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$name),
                                      impressions_rate    = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$impressions_rate), NA,dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$impressions_rate),
                                      clicks_rate         = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$clicks_rate), NA,dataRaw$response[[i]]$stats[[dt]]$cities[[city_i]]$clicks_rate),
                                      stringsAsFactors = F))}
      }
    }
    
  }
  
  
  return(result)
}
