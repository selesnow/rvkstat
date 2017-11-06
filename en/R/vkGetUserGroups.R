vkGetUserGroups <- function(user_id = NULL,
                            filter = NULL,
                            access_token = NULL){
  
  if(is.null(access_token)){
    stop("Enter the access_token, this argument is requred..")
  }
  
  
  #Рещультирующая таблица
  result <- data.frame(stringsAsFactors = F)  
  
  #Постраничная выгрузка
  offset <- 0
  count <- 1000
  last_iteration <- FALSE
  
  while(last_iteration == FALSE){
  #Формируем запрос
  query <- paste0("https://api.vk.com/method/groups.get?fields=city,country,place,description,wiki_page,members_count,counters,start_date,finish_date,can_post,can_see_all_posts,activity,status,contacts,links,fixed_post,verified,site,can_create_topic",ifelse(is.null(user_id),"",paste0("&user_id=",user_id)),"&extended=1","&offset=",offset,"&count=10000",ifelse(is.null(filter),"",paste0("&filter=",filter)),"&access_token=",access_token)
  answer <- GET(query)
  stop_for_status(answer)
  dataRaw <- content(answer, "parsed", "application/json")
  
  #Проверка ответа на ошибки
  if(!is.null(dataRaw$error)){
    stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
  }
  
  for(i in 2:length(dataRaw$response)){
    
          result  <- rbind(result,
                         data.frame(gid                           = ifelse(is.null(dataRaw$response[[i]]$gid), NA,dataRaw$response[[i]]$gid),
                                    name                          = ifelse(is.null(dataRaw$response[[i]]$name), NA,dataRaw$response[[i]]$name),
                                    screen_name                   = ifelse(is.null(dataRaw$response[[i]]$screen_name), NA,dataRaw$response[[i]]$screen_name),
                                    is_closed                     = ifelse(is.null(dataRaw$response[[i]]$is_closed), NA,dataRaw$response[[i]]$is_closed),
                                    type                          = ifelse(is.null(dataRaw$response[[i]]$type), NA,dataRaw$response[[i]]$type),
                                    description                   = ifelse(is.null(dataRaw$response[[i]]$description), NA,dataRaw$response[[i]]$description),
                                    wiki_page                     = ifelse(is.null(dataRaw$response[[i]]$wiki_page), NA,dataRaw$response[[i]]$wiki_page),
                                    members_count                 = ifelse(is.null(dataRaw$response[[i]]$members_count), NA,dataRaw$response[[i]]$members_count),
                                    start_date                    = ifelse(is.null(dataRaw$response[[i]]$start_date), NA,dataRaw$response[[i]]$start_date),
                                    can_post                      = ifelse(is.null(dataRaw$response[[i]]$can_post), NA,dataRaw$response[[i]]$can_post),
                                    can_see_all_posts             = ifelse(is.null(dataRaw$response[[i]]$can_see_all_posts), NA,dataRaw$response[[i]]$can_see_all_posts),
                                    activity                      = ifelse(is.null(dataRaw$response[[i]]$activity), NA,dataRaw$response[[i]]$activity),
                                    status                        = ifelse(is.null(dataRaw$response[[i]]$status), NA,dataRaw$response[[i]]$status),
                                    fixed_post                    = ifelse(is.null(dataRaw$response[[i]]$fixed_post), NA,dataRaw$response[[i]]$fixed_post),
                                    verified                      = ifelse(is.null(dataRaw$response[[i]]$verified), NA,dataRaw$response[[i]]$verified),
                                    site                          = ifelse(is.null(dataRaw$response[[i]]$site), NA,dataRaw$response[[i]]$site),
                                    can_create_topic              = ifelse(is.null(dataRaw$response[[i]]$can_create_topic), NA,dataRaw$response[[i]]$can_create_topic),
                                    photo                         = ifelse(is.null(dataRaw$response[[i]]$photo), NA,dataRaw$response[[i]]$photo),
                                    photo_medium                  = ifelse(is.null(dataRaw$response[[i]]$photo_medium), NA,dataRaw$response[[i]]$photo_medium),
                                    photo_big                     = ifelse(is.null(dataRaw$response[[i]]$photo_big), NA,dataRaw$response[[i]]$photo_big),
                                    stringsAsFactors = F))}
  
  #Переводим дату в нужный формат
  if(length(dataRaw$response) < 1000){
    last_iteration <- TRUE}
  
  #Niauaai offet
  offset <- offset + count}
  
  #Преобразуем дату в формат Windows
  result$start_date <- as.POSIXct(as.integer(result$start_date), origin="1970-01-01")
  
  #Возвращаем результирующий дата фрейм
  return(result)
}
