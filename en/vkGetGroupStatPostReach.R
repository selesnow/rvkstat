vkGetGroupStatPostReach <- function(owner_id = NULL,
                                    post_ids = NULL,
                                    api_version = NULL,
                                    access_token = NULL){
   
  if (is.null(access_token) | is.null(post_ids) | is.null(owner_id)){
    stop("Аргументы owner_id, post_ids и access_token являются обязательными!")
  }
  
  if (length(post_ids) > 300){
    warning("Данные по статистике доступны только для 300 последних (самых свежих) записей на стене сообщества. Аргумент post_id будет сокращён до 300 элементов.")
    post_ids <- head(post_ids[order(-post_ids)], 300)
  }
  
  if (grepl("^\\d", owner_id)) {
    owner_id <- paste0("-", owner_id)
  }
  
  # Устанавливаем версию API
  api_version <- api_version_checker(api_version)
  
  #?auoeuoe?o?uay oaaeeoa
  result <- data.frame(stringsAsFactors = F)  
  
  #Запускаем прогресс бар
  if (length(post_ids) > 1){      
    #Progress settings
    pb_step <- 1
    pb <- txtProgressBar(pb_step, length(post_ids), style = 3)}
  
  for (post_id in post_ids){
    #Send query
    answer <- GET("https://api.vk.com/method/stats.getPostReach", query = list(owner_id = owner_id, post_id = post_id, v = api_version, access_token = access_token))
    stop_for_status(answer)
    dataRaw <- content(answer, "parsed", "application/json")
    
    # Проверка на наличие ошибок
    if (!is.null(dataRaw$error)){
      stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
    }
    
    # Прикрепляем данные к результирующему дата фрейму
    result <- rbind(result, cbind(do.call(cbind, dataRaw$response[[1]]), post_id))
    # Пауза перед следующим запросом
    Sys.sleep(.5)
    # Переставляем счётчик
    if (exists("pb")){
      pb_step <- pb_step + 1
      setTxtProgressBar(pb, pb_step)}
  }
  
  # Закрываем прогресс бар
  if(exists("pb")){
  close(pb)
  }
  # Возвращем результат
  return(result)
}