vkGetDbCountries <- function(need_all = TRUE,
                             code = NULL,
							 api_version  = NULL,
                             access_token = NULL){

  if(is.null(access_token)){
    stop("Access token isn't set")
  }
  
  api_version <- api_version_checker(api_version)
	
  if(!(is.null(code))){
  code <- paste0(code, collapse = ",")
  }
  
  if(need_all == TRUE){
    need_all <- 1
  } else {
    need_all <- 0
  }
  
  # result
  result  <- data.frame()
  
  
  # paging
  offset <- 0
  count <- 1000
  

  # request
  query <- paste0("https://api.vk.com/method/database.getCountries?need_all=",need_all,ifelse(!(is.null(code)),paste0("&code=",code),""),"&offset=",offset,"&count=",count,"&access_token=",access_token,"&v=",api_version)
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
                     data.frame(cid                  = ifelse(is.null(dataRaw$response[[i]]$cid), NA,dataRaw$response[[i]]$cid),
                                title                = ifelse(is.null(dataRaw$response[[i]]$title), NA,dataRaw$response[[i]]$title),
                                stringsAsFactors = F))}
  
  return(result)
}
  
