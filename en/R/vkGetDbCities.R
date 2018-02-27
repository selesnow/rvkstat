vkGetDbCities <- function(country_id = TRUE,
                          region_id = NULL,
                          q = NULL,
                          need_all = TRUE,
						  api_version  = NULL,
                          access_token = NULL){

  if(is.null(access_token)){
    stop("Не заполнен access_token, этот аргумент является обязательным.")
  }
  
  #Фильтр по статусу объявления
  if(is.null(country_id)){
  stop("Не заполнен country_id, этот аргумент является обязательным.")
  }
  
    #Фильтр по статусу объявления
  if(nchar(q) > 15 && !(is.null(q))){
  stop(paste0("В аргументе q максимальная длина строки — 15 символов. Вы ввели щапрос состоящий из ", nchar(q)," символов!"))
  }
  
  api_version <- api_version_checker(api_version)
	
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
  last_iteration <- FALSE
  
  while(last_iteration == FALSE){

  #Формируем запрос
  query <- paste0("https://api.vk.com/method/database.getCities?need_all=",need_all,"&country_id=",country_id,ifelse(!(is.null(region_id)),paste0("&region_id=",region_id),""),ifelse(!(is.null(q)),paste0("&q=",q),""),"&offset=",offset,"&count=",count,"&access_token=",access_token,"&v=",api_version)
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
                                important            = ifelse(is.null(dataRaw$response[[i]]$important), NA,dataRaw$response[[i]]$important),
                                area                 = ifelse(is.null(dataRaw$response[[i]]$area), NA,dataRaw$response[[i]]$area),
                                region               = ifelse(is.null(dataRaw$response[[i]]$region), NA,dataRaw$response[[i]]$region),
                                stringsAsFactors = F))}
  
  if(length(dataRaw$response) < 1000){
    last_iteration <- TRUE}
  
  #Смещаем offet
  offset <- offset + count
  }
  
  return(result)
}
