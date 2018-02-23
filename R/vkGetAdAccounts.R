vkGetAdAccounts <- function(access_token = NULL, 
							api_version  = NULL){
    if(is.null(access_token)){
    stop("Не заполнен access_token, этот аргумент является обязательным.")
  }
  
  api_version <- api_version_checker(api_version)						

  query <- paste0("https://api.vk.com/method/ads.getAccounts?v=",api_version,"&access_token=",access_token)
  answer <- GET(query)
  stop_for_status(answer)
  dataRaw <- content(answer, "parsed", "application/json")
  
  #Проверка ответа на ошибки
  if(!is.null(dataRaw$error)){
    stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
  }
  
  #Результирующий дата фрейм
  result  <- data.frame(account_id     = integer(0),
                        account_type   = character(0),
                        account_status = character(0),
                        access_role    = character(0))
  
  #Парсинг результата
  for(i in 1:length(dataRaw$response)){
    result  <- rbind(result,
                     data.frame(account_id     = dataRaw$response[[i]]$account_id,
                                account_type   = dataRaw$response[[i]]$account_type,
                                account_status = dataRaw$response[[i]]$account_status,
                                access_role    = dataRaw$response[[i]]$access_role))}
  
  return(result)
}