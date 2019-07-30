vkGetUserFriends <- function(user_id  = NULL,
                         access_token = NULL,
						 api_version  = NULL,
                         name_case    = "nom"){
  
  if(is.null(access_token)){
    stop("Set access_token in options, is require.")
  }
  
  api_version <- api_version_checker(api_version)
  
  # result frame
  result <- data.frame(stringsAsFactors = F)  
  
  # query
  query <- paste0("https://api.vk.com/method/friends.get?",ifelse(is.null(user_id),"",paste0("user_id=",user_id)),"&hints&count=10000&fields=nickname,domain,sex,bdate,city,country,timezone,photo_50,photo_100,photo_200_orig,has_mobile,contacts,education,online,relation,last_seen,status,can_write_private_message,can_see_all_posts,can_post,universities&name_case",name_case,"&access_token=",access_token,"&v=",api_version)
  answer <- GET(query)
  stop_for_status(answer)
  dataRaw <- content(answer, "parsed", "application/json")
  
  # check for error
  if(!is.null(dataRaw$error)){
    stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
  }
  
  # parsing
  for(i in 1:length(dataRaw$response)){
    
          result  <- rbind(result,
                         data.frame(user_id                       = ifelse(is.null(dataRaw$response[[i]]$uid), NA,dataRaw$response[[i]]$uid),
                                    first_name                    = ifelse(is.null(dataRaw$response[[i]]$first_name), NA,dataRaw$response[[i]]$first_name),
                                    last_name                     = ifelse(is.null(dataRaw$response[[i]]$last_name), NA,dataRaw$response[[i]]$last_name),
                                    gender                        = ifelse(is.null(dataRaw$response[[i]]$sex), NA,dataRaw$response[[i]]$sex),
                                    nickname                      = ifelse(is.null(dataRaw$response[[i]]$nickname ), NA,dataRaw$response[[i]]$nickname),
                                    domain                        = ifelse(is.null(dataRaw$response[[i]]$domain), NA,dataRaw$response[[i]]$domain),
                                    bdate                         = ifelse(is.null(dataRaw$response[[i]]$bdate), NA,dataRaw$response[[i]]$bdate),
                                    city                          = ifelse(is.null(dataRaw$response[[i]]$city), NA,dataRaw$response[[i]]$city),
                                    country                       = ifelse(is.null(dataRaw$response[[i]]$country), NA,dataRaw$response[[i]]$country),
                                    photo_50                      = ifelse(is.null(dataRaw$response[[i]]$photo_50), NA,dataRaw$response[[i]]$photo_50),
                                    photo_100                     = ifelse(is.null(dataRaw$response[[i]]$photo_100), NA,dataRaw$response[[i]]$photo_100),
                                    photo_200_orig                = ifelse(is.null(dataRaw$response[[i]]$photo_200_orig), NA,dataRaw$response[[i]]$photo_200_orig),
                                    has_mobile                    = ifelse(is.null(dataRaw$response[[i]]$has_mobile), NA,dataRaw$response[[i]]$has_mobile),
                                    online                        = ifelse(is.null(dataRaw$response[[i]]$online), NA,dataRaw$response[[i]]$online),
                                    can_post                      = ifelse(is.null(dataRaw$response[[i]]$can_post), NA,dataRaw$response[[i]]$can_post),
                                    can_see_all_posts             = ifelse(is.null(dataRaw$response[[i]]$can_see_all_posts), NA,dataRaw$response[[i]]$can_see_all_posts),
                                    can_write_private_message     = ifelse(is.null(dataRaw$response[[i]]$can_write_private_message), NA,dataRaw$response[[i]]$can_write_private_message),
                                    home_phone                    = ifelse(is.null(dataRaw$response[[i]]$home_phone), NA,dataRaw$response[[i]]$home_phone),
                                    status                        = ifelse(is.null(dataRaw$response[[i]]$status), NA,dataRaw$response[[i]]$status),
                                    last_seen_time                = ifelse(is.null(dataRaw$response[[i]]$last_seen$time), NA,dataRaw$response[[i]]$last_seen$time),
                                    last_seen_platform            = ifelse(is.null(dataRaw$response[[i]]$last_seen$platform), NA,dataRaw$response[[i]]$last_seen$platform),
                                    university                    = ifelse(is.null(dataRaw$response[[i]]$university), NA,dataRaw$response[[i]]$university),
                                    university_name               = ifelse(is.null(dataRaw$response[[i]]$university_name), NA,dataRaw$response[[i]]$university_name),
                                    faculty                       = ifelse(is.null(dataRaw$response[[i]]$faculty), NA,dataRaw$response[[i]]$faculty),
                                    faculty_name                  = ifelse(is.null(dataRaw$response[[i]]$faculty_name), NA,dataRaw$response[[i]]$faculty_name),
                                    graduation                    = ifelse(is.null(dataRaw$response[[i]]$graduation), NA,dataRaw$response[[i]]$graduation),
                                    education_form                = ifelse(is.null(dataRaw$response[[i]]$education_form), NA,dataRaw$response[[i]]$education_form),
                                    education_status              = ifelse(is.null(dataRaw$response[[i]]$education_status), NA,dataRaw$response[[i]]$education_status),
                                    relation                      = ifelse(is.null(dataRaw$response[[i]]$relation), NA,dataRaw$response[[i]]$relation),
                                    stringsAsFactors = F))}
  # conver date
  result$last_seen_time <- as.POSIXct(as.integer(result$last_seen_time), origin="1970-01-01")
  
  # return result
  return(result)
}
