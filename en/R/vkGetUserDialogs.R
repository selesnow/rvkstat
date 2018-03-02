vkGetUserDialogs <- function(offset = NULL,
                             count = NULL,
                             start_message_id = NULL,
                             preview_length = 0,
                             unread = 0,
                             important = 0,
                             unanswered =  0,
                             api_version = NULL,
                             access_token = NULL){
  
  if(is.null(access_token)){
    stop("Не заполнен access_token, этот аргумент является обязательным.")
  }

  #Проверка версии API
  api_version <- api_version_checker(api_version)
  
  #Собираем параметры
  params <- c()
  
  for(param in ls()[! ls() %in% c("params","api_version")]){
    if(is.null(get(param))) next
    params <- c(params,paste0(param,"=",get(param)))
    rm(param)
  }
  
  params <- paste0(params, collapse = "&")
  
  #Результирующий дата фрейм
  result  <- data.frame(id                  = integer(0),
                        date                = as.Date(character()),
                        out                 = integer(0),
                        user_id             = integer(0),
                        read_state          = integer(0),
                        title               = character(0),
                        body                = character(0),
                        stringsAsFactors = F)
  
 
  #Формируем запрос
  query <- paste0("https://api.vk.com/method/messages.getDialogs?",params,"&v=",api_version)
  answer <- GET(query)
  stop_for_status(answer)
  dataRaw <- content(answer, "parsed", "application/json")
  
  #Проверка ответа на ошибки
  if(!is.null(dataRaw$error)){
    stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
  }
  
  
  #Парсинг результата
  for(i in 1:length(dataRaw$response$items)){
    result  <- rbind(result,
                     data.frame(id                  = ifelse(is.null(dataRaw$response$items[[i]]$message$id), NA,dataRaw$response$items[[i]]$message$id),
                                date                = ifelse(is.null(dataRaw$response$items[[i]]$message$date), NA,as.POSIXct(dataRaw$response$items[[i]]$message$date, origin="1970-01-01")),
                                out                 = ifelse(is.null(dataRaw$response$items[[i]]$message$out), NA,dataRaw$response$items[[i]]$message$out),
                                user_id             = ifelse(is.null(dataRaw$response$items[[i]]$message$user_id), NA,dataRaw$response$items[[i]]$message$user_id),
                                read_state          = ifelse(is.null(dataRaw$response$items[[i]]$message$read_state), NA,dataRaw$response$items[[i]]$message$read_state),
                                title               = ifelse(is.null(dataRaw$response$items[[i]]$message$title), NA,dataRaw$response$items[[i]]$message$title),
                                body                = ifelse(is.null(dataRaw$response$items[[i]]$message$body), NA,dataRaw$response$items[[i]]$message$body),
                                random_id           = ifelse(is.null(dataRaw$response$items[[i]]$message$random_id), NA,dataRaw$response$items[[i]]$message$random_id),
                                stringsAsFactors = F))}
   #Конвертируем дату
   result$date <- as.POSIXct(result$date, origin="1970-01-01")
  
  #Возвращаем результат
  return(result)}