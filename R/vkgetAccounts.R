vkgetAccounts <- function(access_token = NULL){
  query <- paste0("https://api.vk.com/method/ads.getAccounts?&v=5.52&access_token=",my_new_tok$access_token)
  answer <- GET(query)
  stop_for_status(answer)
  dataRaw <- content(answer, "parsed", "application/json")
  
  #Результирующий дата фрейм
  result  <- data.frame(account_id     = integer(0),
                        account_type   = character(0),
                        account_status = character(0),
                        access_role    = character(0))
  
  #Парсинг результата
  for(i in 1:length(dataRaw$response)){
    result  <- rbind(result,
                     data.frame(account_id     = dataRaw$response[[1]]$account_id,
                                account_type   = dataRaw$response[[1]]$account_type,
                                account_status = dataRaw$response[[1]]$account_status,
                                access_role    = dataRaw$response[[1]]$access_role))}
  
  return(result)
}