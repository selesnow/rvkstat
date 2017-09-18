vkGetAdClients <- function(account_id = NULL,
                           access_token = NULL){

  if(is.null(access_token)){
    stop("Не заполнен access_token, этот аргумент является обязательным.")
  }
  
  if(!(period %in% c("day","month","overall"))){
    stop("Неверное значение в аргументе period, доступные значения day, month и overall")
  }
  
  #Результирующий дата фрейм
  result  <- data.frame()
  
  
  #Формируем запрос
  query <- paste0("https://api.vk.com/method/ads.getClients?account_id=",account_id,"&access_token=",access_token)
  answer <- GET(query)
  stop_for_status(answer)
  dataRaw <- content(answer, "parsed", "application/json")
  
  #Проверка ответа на ошибки
  if(!is.null(dataRaw$error)){
    stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
  }
  
  #Парсинг результата
  for(i in 1:length(dataRaw$response)){
    result  <- rbind(result,
                     data.frame(id                  = ifelse(is.null(dataRaw$response[[i]]$id), NA,dataRaw$response[[i]]$id),
                                name                = ifelse(is.null(dataRaw$response[[i]]$name), NA,dataRaw$response[[i]]$name),
                                day_limit           = ifelse(is.null(dataRaw$response[[i]]$day_limit), NA,dataRaw$response[[i]]$day_limit),
                                all_limit           = ifelse(is.null(dataRaw$response[[i]]$all_limit), NA,dataRaw$response[[i]]$all_limit),
                                stringsAsFactors = F))}
  
    #Преобразование в числа
  result$day_limit   <- as.numeric(result$day_limit)
  result$all_limit   <- as.numeric(result$all_limit)
  
  return(result)
}