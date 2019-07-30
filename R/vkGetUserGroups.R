vkGetUserGroups <- function(user_id = NULL,
                            filter = NULL,
							api_version = NULL,
                            access_token = NULL){
  
  if(is.null(access_token)){
    stop("Set access_token in options, is require.")
  }
  
  # check api version
  api_version <- api_version_checker(api_version)
  
  # Result frame
  result <- data.frame(stringsAsFactors = F)  
  
  # Paging
  offset <- 0
  count <- 1000
  last_iteration <- FALSE
  
  while(last_iteration == FALSE){
  # Query
  query <- paste0("https://api.vk.com/method/groups.get?fields=city,country,place,description,wiki_page,members_count,counters,start_date,finish_date,can_post,can_see_all_posts,activity,status,contacts,links,fixed_post,verified,site,can_create_topic",ifelse(is.null(user_id),"",paste0("&user_id=",user_id)),"&extended=1","&offset=",offset,"&count=1000",ifelse(is.null(filter),"",paste0("&filter=",filter)),"&access_token=",access_token,"&v=",api_version)
  answer <- GET(query)
  stop_for_status(answer)
  dataRaw <- content(answer, "parsed", "application/json")
  
  # Check for error
  if(!is.null(dataRaw$error)){
    stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
  }
  
  # parsing
  for(i in 1:length(dataRaw$response$items)){
    
          result  <- rbind(result,
                         data.frame(gid                           = ifelse(is.null(dataRaw$response$items[[i]]$id), NA,dataRaw$response$items[[i]]$id),
                                    name                          = ifelse(is.null(dataRaw$response$items[[i]]$name), NA,dataRaw$response$items[[i]]$name),
                                    screen_name                   = ifelse(is.null(dataRaw$response$items[[i]]$screen_name), NA,dataRaw$response$items[[i]]$screen_name),
                                    is_closed                     = ifelse(is.null(dataRaw$response$items[[i]]$is_closed), NA,dataRaw$response$items[[i]]$is_closed),
                                    type                          = ifelse(is.null(dataRaw$response$items[[i]]$type), NA,dataRaw$response$items[[i]]$type),
                                    description                   = ifelse(is.null(dataRaw$response$items[[i]]$description), NA,dataRaw$response$items[[i]]$description),
                                    wiki_page                     = ifelse(is.null(dataRaw$response$items[[i]]$wiki_page), NA,dataRaw$response$items[[i]]$wiki_page),
                                    members_count                 = ifelse(is.null(dataRaw$response$items[[i]]$members_count), NA,dataRaw$response$items[[i]]$members_count),
                                    start_date                    = ifelse(is.null(dataRaw$response$items[[i]]$start_date), NA,dataRaw$response$items[[i]]$start_date),
                                    can_post                      = ifelse(is.null(dataRaw$response$items[[i]]$can_post), NA,dataRaw$response$items[[i]]$can_post),
                                    can_see_all_posts             = ifelse(is.null(dataRaw$response$items[[i]]$can_see_all_posts), NA,dataRaw$response$items[[i]]$can_see_all_posts),
                                    activity                      = ifelse(is.null(dataRaw$response$items[[i]]$activity), NA,dataRaw$response$items[[i]]$activity),
                                    status                        = ifelse(is.null(dataRaw$response$items[[i]]$status), NA,dataRaw$response$items[[i]]$status),
                                    fixed_post                    = ifelse(is.null(dataRaw$response$items[[i]]$fixed_post), NA,dataRaw$response$items[[i]]$fixed_post),
                                    verified                      = ifelse(is.null(dataRaw$response$items[[i]]$verified), NA,dataRaw$response$items[[i]]$verified),
                                    site                          = ifelse(is.null(dataRaw$response$items[[i]]$site), NA,dataRaw$response$items[[i]]$site),
                                    can_create_topic              = ifelse(is.null(dataRaw$response$items[[i]]$can_create_topic), NA,dataRaw$response$items[[i]]$can_create_topic),
                                    photo                         = ifelse(is.null(dataRaw$response$items[[i]]$photo), NA,dataRaw$response$items[[i]]$photo),
                                    photo_medium                  = ifelse(is.null(dataRaw$response$items[[i]]$photo_medium), NA,dataRaw$response$items[[i]]$photo_medium),
                                    photo_big                     = ifelse(is.null(dataRaw$response$items[[i]]$photo_big), NA,dataRaw$response$items[[i]]$photo_big),
                                    stringsAsFactors = F))}
  
  # check for next iteration
  if(length(dataRaw$response) < 1000){
    last_iteration <- TRUE}
  
  # offset
  offset <- offset + count}
  
  # convert to date
  result$start_date <- as.POSIXct(as.integer(result$start_date), origin="1970-01-01")
  
  # return result
  return(result)
}
