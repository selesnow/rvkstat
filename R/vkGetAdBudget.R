vkGetAdBudget <- function(account_id = NULL, 
                          access_token = NULL,
                          api_version  = NULL){
  
  
  if(is.null(account_id)){
    stop("Set account_id, is require.")
  }
  
  if(is.null(access_token)){
    stop("Set access_token in options, is require.")
  }
  
  api_version <- api_version_checker(api_version)		
	
  # query
  query <- paste0("https://api.vk.com/method/ads.getBudget?account_id=",account_id,"&access_token=",access_token,"&v=",api_version)
  answer <- GET(query)
  stop_for_status(answer)
  dataRaw <- content(answer, "parsed", "application/json")
  
  # check for error
  if(!is.null(dataRaw$error)){
    stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
  }
  
  return(as.numeric(dataRaw$response))
}
