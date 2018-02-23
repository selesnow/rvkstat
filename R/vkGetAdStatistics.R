vkGetAdStatistics <- function(account_id = NULL,
                              ids_type = "office",
                              ids = NULL,
                              period = "overall",
                              date_from = Sys.Date() - 30,
                              date_to = Sys.Date(),
							  api_version = NULL,
                              access_token = NULL){
  
  if(is.null(access_token)){
    stop("Не заполнен access_token, этот аргумент является обязательным.")
  }
  
  #Проверка версии API
  api_version <- api_version_checker(api_version)
  
  if(!(period %in% c("day","month","overall"))){
    stop("Неверное значение в аргументе period, доступные значения day, month и overall")
  }
  
  #Преобразуем фильтр по кампаниям в json массив
  if(period == "month"){
    date_from <- format(as.Date(as.character(date_from)), "%Y-%m")
    date_to   <- format(as.Date(as.character(date_to)), "%Y-%m")
  }
  
  if(period == "overall"){
    date_from <- 0
    date_to   <- 0
  }
  

  #Фильтр по статусу объявления
  ids <- paste0(ids, collapse = ",")
  
  #Рещультирующая таблица
  result <- data.frame()  

  #Формируем запрос
  query <- paste0("https://api.vk.com/method/ads.getStatistics?account_id=",account_id,"&ids_type=",ids_type,"&ids=",ids,"&period=",period,"&date_from=",date_from,"&date_to=",date_to,"&access_token=",access_token)
  answer <- GET(query)
  stop_for_status(answer)
  dataRaw <- content(answer, "parsed", "application/json")
  
  #Проверка ответа на ошибки
  if(!is.null(dataRaw$error)){
    stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
  }

    for(i in 1:length(dataRaw$response)){
    
    #Парсинг результата
    if(period == "day"){
    for(dt in 1:length(dataRaw$response[[i]]$stats)){
    if(length(dataRaw$response[[i]]$stats)==0) next
    result  <- rbind(result,
                     data.frame(id                  = ifelse(is.null(dataRaw$response[[i]]$id), NA,dataRaw$response[[i]]$id),
                                type                = ifelse(is.null(dataRaw$response[[i]]$type), NA,dataRaw$response[[i]]$type),
                                day                 = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$day), NA,dataRaw$response[[i]]$stats[[dt]]$day),
                                spent               = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$spent), NA,dataRaw$response[[i]]$stats[[dt]]$spent),
                                impressions         = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$impressions), NA,dataRaw$response[[i]]$stats[[dt]]$impressions),
                                clicks              = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$clicks), NA,dataRaw$response[[i]]$stats[[dt]]$clicks),
                                reach               = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$reach), NA,dataRaw$response[[i]]$stats[[dt]]$reach),
                                video_views         = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$video_views), NA,dataRaw$response[[i]]$stats[[dt]]$video_views),
                                video_views_half    = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$video_views_half), NA,dataRaw$response[[i]]$stats[[dt]]$video_views_half),
                                video_views_full    = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$video_views_full), NA,dataRaw$response[[i]]$stats[[dt]]$video_views_full),
                                video_clicks_site   = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$video_clicks_site), NA,dataRaw$response[[i]]$stats[[dt]]$video_clicks_site),
                                join_rate           = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$join_rate ), NA,dataRaw$response[[i]]$stats[[dt]]$join_rate),
                                stringsAsFactors = F))}
    }
   if(period == "month"){
   for(dt in 1:length(dataRaw$response[[i]]$stats)){
     if(length(dataRaw$response[[i]]$stats)==0) next
     result  <- rbind(result,
                      data.frame(id                  = ifelse(is.null(dataRaw$response[[i]]$id), NA,dataRaw$response[[i]]$id),
                                 type                = ifelse(is.null(dataRaw$response[[i]]$type), NA,dataRaw$response[[i]]$type),
                                 month               = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$month), NA,dataRaw$response[[i]]$stats[[dt]]$month),
                                 spent               = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$spent), NA,dataRaw$response[[i]]$stats[[dt]]$spent),
                                 impressions         = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$impressions), NA,dataRaw$response[[i]]$stats[[dt]]$impressions),
                                 clicks              = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$clicks), NA,dataRaw$response[[i]]$stats[[dt]]$clicks),
                                 reach               = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$reach), NA,dataRaw$response[[i]]$stats[[dt]]$reach),
                                 video_views         = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$video_views), NA,dataRaw$response[[i]]$stats[[dt]]$video_views),
                                 video_views_half    = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$video_views_half), NA,dataRaw$response[[i]]$stats[[dt]]$video_views_half),
                                 video_views_full    = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$video_views_full), NA,dataRaw$response[[i]]$stats[[dt]]$video_views_full),
                                 video_clicks_site   = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$video_clicks_site), NA,dataRaw$response[[i]]$stats[[dt]]$video_clicks_site),
                                 join_rate           = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$join_rate ), NA,dataRaw$response[[i]]$stats[[dt]]$join_rate),
                                 stringsAsFactors = F))}
   }
   if(period == "overall"){
      for(dt in 1:length(dataRaw$response[[i]]$stats)){
        if(length(dataRaw$response[[i]]$stats)==0) next
        result  <- rbind(result,
                         data.frame(id                  = ifelse(is.null(dataRaw$response[[i]]$id), NA,dataRaw$response[[i]]$id),
                                    type                = ifelse(is.null(dataRaw$response[[i]]$type), NA,dataRaw$response[[i]]$type),
                                    day_from            = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$day_from), NA,dataRaw$response[[i]]$stats[[dt]]$day_from),
                                    day_to              = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$day_to), NA,dataRaw$response[[i]]$stats[[dt]]$day_to),
                                    spent               = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$spent), NA,dataRaw$response[[i]]$stats[[dt]]$spent),
                                    impressions         = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$impressions), NA,dataRaw$response[[i]]$stats[[dt]]$impressions),
                                    clicks              = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$clicks), NA,dataRaw$response[[i]]$stats[[dt]]$clicks),
                                    reach               = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$reach), NA,dataRaw$response[[i]]$stats[[dt]]$reach),
                                    video_views         = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$video_views), NA,dataRaw$response[[i]]$stats[[dt]]$video_views),
                                    video_views_half    = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$video_views_half), NA,dataRaw$response[[i]]$stats[[dt]]$video_views_half),
                                    video_views_full    = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$video_views_full), NA,dataRaw$response[[i]]$stats[[dt]]$video_views_full),
                                    video_clicks_site   = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$video_clicks_site), NA,dataRaw$response[[i]]$stats[[dt]]$video_clicks_site),
                                    join_rate           = ifelse(is.null(dataRaw$response[[i]]$stats[[dt]]$join_rate ), NA,dataRaw$response[[i]]$stats[[dt]]$join_rate),
                                    stringsAsFactors = F))}
    }
}
  
  result$spent <- as.numeric(result$spent)
  return(result)
}