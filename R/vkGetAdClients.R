vkGetAdClients <- function(account_id = NULL,
						   api_version  = NULL,
                           access_token = NULL){

  if(is.null(access_token)){
    stop("�� �������� access_token, ���� �������� �������� ������������.")
  }
  
  #Ðåçóëüòèðóþùèé äàòà ôðåéì
  result  <- data.frame()
  
  
  #Ôîðìèðóåì çàïðîñ
  query <- paste0("https://api.vk.com/method/ads.getClients?account_id=",account_id,"&access_token=",access_token,"&v=",api_version)
  answer <- GET(query)
  stop_for_status(answer)
  dataRaw <- content(answer, "parsed", "application/json")
  
  #Ïðîâåðêà îòâåòà íà îøèáêè
  if(!is.null(dataRaw$error)){
    stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
  }
  
  #Ïàðñèíã ðåçóëüòàòà
  for(i in 1:length(dataRaw$response)){
    result  <- rbind(result,
                     data.frame(id                  = ifelse(is.null(dataRaw$response[[i]]$id), NA,dataRaw$response[[i]]$id),
                                name                = ifelse(is.null(dataRaw$response[[i]]$name), NA,dataRaw$response[[i]]$name),
                                day_limit           = ifelse(is.null(dataRaw$response[[i]]$day_limit), NA,dataRaw$response[[i]]$day_limit),
                                all_limit           = ifelse(is.null(dataRaw$response[[i]]$all_limit), NA,dataRaw$response[[i]]$all_limit),
                                stringsAsFactors = F))}
  
    #Ïðåîáðàçîâàíèå â ÷èñëà
  result$day_limit   <- as.numeric(result$day_limit)
  result$all_limit   <- as.numeric(result$all_limit)
  
  return(result)
}
