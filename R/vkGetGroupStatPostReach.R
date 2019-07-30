vkGetGroupStatPostReach <- function(owner_id = NULL,
                                    post_ids = NULL,
                                    api_version = NULL,
                                    access_token = NULL){
   
  if (is.null(access_token) | is.null(post_ids) | is.null(owner_id)){
    stop("Arguments owner_id, post_ids and access_token is required!")
  }
  
  if (length(post_ids) > 300){
    warning("Statistics data is available only for the latest 300 (most recent) posts on the community wall. The post_id argument will be abbreviated to 300 elements.")
    post_ids <- head(post_ids[order(-post_ids)], 300)
  }
  
  if (grepl("^\\d", owner_id)) {
    owner_id <- paste0("-", owner_id)
  }
  
  # set api version
  api_version <- api_version_checker(api_version)
  
  # result
  result <- data.frame(stringsAsFactors = F)  
  
  # progress bar
  if (length(post_ids) > 1){      
    #Progress settings
    pb_step <- 1
    pb <- txtProgressBar(pb_step, length(post_ids), style = 3)}
  
  for (post_id in post_ids){
    #Send query
    answer <- GET("https://api.vk.com/method/stats.getPostReach", query = list(owner_id = owner_id, post_id = post_id, v = api_version, access_token = access_token))
    stop_for_status(answer)
    dataRaw <- content(answer, "parsed", "application/json")
    
    # Пcheck for error
    if (!is.null(dataRaw$error)){
      stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
    }
    
    # union with result
    result <- rbind(result, cbind(do.call(cbind, dataRaw$response[[1]]), post_id))
    # pause
    Sys.sleep(.5)
    # set pb
    if (exists("pb")){
      pb_step <- pb_step + 1
      setTxtProgressBar(pb, pb_step)}
  }
  
  # close pb
  if(exists("pb")){
  close(pb)
  }
  # return result
  return(result)
}
