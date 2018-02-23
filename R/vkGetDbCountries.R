vkGetDbCountries <- function(need_all = TRUE,
                             code = NULL,
							 api_version  = NULL,
                             access_token = NULL){

  if(is.null(access_token)){
    stop("Не заполнен access_token, этот аргумент является обязательным.")
  }
  
  api_version <- api_version_checker(api_version)
	
  #Фильтр по статусу объявления
  if(!(is.null(code))){
  code <- paste0(code, collapse = ",")
  }
  
  if(need_all == TRUE){
    need_all <- 1
  } else {
    need_all <- 0
  }
  
  #Результирующий дата фрейм
  result  <- data.frame()
  
  
  #Постраничная выгрузка
  offset <- 0
  count <- 1000
  

  #Формируем запрос
  query <- paste0("https://api.vk.com/method/database.getCountries?need_all=",need_all,ifelse(!(is.null(code)),paste0("&code=",code),""),"&offset=",offset,"&count=",count,"&access_token=",access_token,"&v=",api_version)
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
                     data.frame(cid                  = ifelse(is.null(dataRaw$response[[i]]$cid), NA,dataRaw$response[[i]]$cid),
                                title                = ifelse(is.null(dataRaw$response[[i]]$title), NA,dataRaw$response[[i]]$title),
                                stringsAsFactors = F))}
  
  return(result)
}
  