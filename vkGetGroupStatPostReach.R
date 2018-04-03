vkGetGroupStatPostReach <- function(owner_id = NULL,
                                    post_ids = NULL,
                                    api_version = NULL,
                                    access_token = NULL){
   
  if (is.null(access_token) | is.null(post_ids) | is.null(owner_id)){
    stop("Àðãóìåíòû owner_id, post_ids è access_token ÿâëÿþòñÿ îáÿçàòåëüíûìè!")
  }
  
  if (length(post_ids) > 300){
    warning("Äàííûå ïî ñòàòèñòèêå äîñòóïíû òîëüêî äëÿ 300 ïîñëåäíèõ (ñàìûõ ñâåæèõ) çàïèñåé íà ñòåíå ñîîáùåñòâà. Àðãóìåíò post_id áóäåò ñîêðàù¸í äî 300 ýëåìåíòîâ.")
    post_ids <- head(post_ids[order(-post_ids)], 300)
  }
  
  if (grepl("^\\d", owner_id)) {
    owner_id <- paste0("-", owner_id)
  }
  
  # Óñòàíàâëèâàåì âåðñèþ API
  api_version <- api_version_checker(api_version)
  
  #?auoeuoe?o?uay oaaeeoa
  result <- data.frame(stringsAsFactors = F)  
  
  #Çàïóñêàåì ïðîãðåññ áàð
  if (length(post_ids) > 1){      
    #Progress settings
    pb_step <- 1
    pb <- txtProgressBar(pb_step, length(post_ids), style = 3)}
  
  for (post_id in post_ids){
    #Send query
    answer <- GET("https://api.vk.com/method/stats.getPostReach", query = list(owner_id = owner_id, post_id = post_id, v = api_version, access_token = access_token))
    stop_for_status(answer)
    dataRaw <- content(answer, "parsed", "application/json")
    
    # Ïðîâåðêà íà íàëè÷èå îøèáîê
    if (!is.null(dataRaw$error)){
      stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
    }
    
    # Ïðèêðåïëÿåì äàííûå ê ðåçóëüòèðóþùåìó äàòà ôðåéìó
    result <- rbind(result, cbind(do.call(cbind, dataRaw$response[[1]]), post_id))
    # Ïàóçà ïåðåä ñëåäóþùèì çàïðîñîì
    Sys.sleep(.5)
    # Ïåðåñòàâëÿåì ñ÷¸ò÷èê
    if (exists("pb")){
      pb_step <- pb_step + 1
      setTxtProgressBar(pb, pb_step)}
  }
  
  # Çàêðûâàåì ïðîãðåññ áàð
  if(exists("pb")){
  close(pb)
  }
  # Âîçâðàùåì ðåçóëüòàò
  return(result)
}