vkGetAdCategories <- function(access_token = NULL,
							  api_version  = NULL){
  if(is.null(access_token)){
    stop("Не заполнен access_token, этот аргумент является обязательным.")
  }
  
  api_version <- api_version_checker(api_version)
  
  #Создаём результирующий дата фрейм
  result <- data.frame()
  
  #Формируем запрос
  query <- paste0("https://api.vk.com/method/ads.getCategories?access_token=",access_token,"&v=",api_version)
  answer <- GET(query)
  stop_for_status(answer)
  dataRaw <- content(answer, "parsed", "application/json")
  
  #Проверка ответа на ошибки
  if(!is.null(dataRaw$error)){
    stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
  }
  
  #Парсинг результата
  for(i in 1:length(dataRaw$response)){
    for(subcat in 1:(if(length(dataRaw$response[[i]]$subcategories)==0) 1 else length(dataRaw$response[[i]]$subcategories))){
      
    result  <- rbind(result,
                     data.frame(id                  = ifelse(is.null(dataRaw$response[[i]]$id), NA,dataRaw$response[[i]]$id),
                                name                = ifelse(is.null(dataRaw$response[[i]]$name), NA,dataRaw$response[[i]]$name),
                                subcategories_id    = ifelse(is.null(dataRaw$response[[i]]$subcategories[[subcat]]$id), NA,dataRaw$response[[i]]$subcategories[[subcat]]$id),
                                ubcategories_name   = ifelse(is.null(dataRaw$response[[i]]$subcategories[[subcat]]$name), NA,dataRaw$response[[i]]$subcategories[[subcat]]$name),
                                stringsAsFactors = F))}
    
  }
  
  
  return(result)}