vkGetPostReach <- function(owner_id = NULL,
                           post_ids = NULL,
                           api_version = NULL,
                           access_token = NULL){
   
  if(is.null(access_token)){
    stop("Íå çàïîëíåí access_token, ýòîò àðãóìåíò ÿâëÿåòñÿ îáÿçàòåëüíûì.")
  }
  
  #Ïðîâåðêà âåðñèè API
  api_version <- api_version_checker(api_version)
  
  #Ðåùóëüòèðóþùàÿ òàáëèöà
  result <- data.frame(stringsAsFactors = F)  

  for (post_id in post_ids){
    #Send query
    answer <- GET("https://api.vk.com/method/stats.getPostReach", query = list(owner_id = owner_id, post_id = post_id, v = api_version, access_token = access_token))
    stop_for_status(answer)
    dataRaw <- content(answer, "parsed", "application/json")
    
    #I?iaa?ea ioaaoa ia ioeaee
    if(!is.null(dataRaw$error)){
      stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
    }
    
    result <- rbind(result, cbind(do.call(cbind, dataRaw$response[[1]]), post_id))
    Sys.sleep(1)
 }
  return(result)
}

