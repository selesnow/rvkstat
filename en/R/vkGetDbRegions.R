vkGetDbRegions <- function(country_id = NULL,
                           q = NULL,
                           access_token = NULL){

  if(is.null(access_token)){
    stop("Enter the access_token, this argument is requred..")
  }
  
  
  #Фильтр по статусу объявления
  if(nchar(q) > 15 && !(is.null(q))){
  stop(paste0("In argument q maximum length 15 character. You entered query of ", nchar(q)," characters!"))
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
  last_iteration <- FALSE
  
  while(last_iteration == FALSE){

  #Формируем запрос
  query <- paste0("https://api.vk.com/method/database.getRegions?need_all=",need_all,"&country_id=",country_id,ifelse(!(is.null(region_id)),paste0("&region_id=",region_id),""),ifelse(!(is.null(q)),paste0("&q=",q),""),"&offset=",offset,"&count=",count,"&access_token=",access_token)
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
                     data.frame(region_id            = ifelse(is.null(dataRaw$response[[i]]$region_id), NA,dataRaw$response[[i]]$region_id),
                                title                = ifelse(is.null(dataRaw$response[[i]]$title), NA,dataRaw$response[[i]]$title),
                                stringsAsFactors = F))}
  
  if(length(dataRaw$response) < 1000){
    last_iteration <- TRUE}
  
  #Смещаем offet
  offset <- offset + count
  }
  
  return(result)
}
  