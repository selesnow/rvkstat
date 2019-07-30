vkGetDbRegions <- function(country_id = NULL,
                           q = NULL,
						   api_version  = NULL,
                           access_token = NULL){

  if(is.null(access_token)){
    stop("Access token isn't set")
  }
  
  region_id <- NULL
  
  #Фильтр по статусу объявления
  if(nchar(q) > 15 && !(is.null(q))){
  stop(paste0("In query ( argument q ) max length is 15 characters. You enter ", nchar(q)," characters!"))
  }
  
  api_version <- api_version_checker(api_version)
	
  if(need_all == TRUE){
    need_all <- 1
  } else {
    need_all <- 0
  }
  
  # result frame
  result  <- data.frame()
  
  
  # paging
  offset <- 0
  count <- 1000
  last_iteration <- FALSE
  
  while(last_iteration == FALSE){

  # query
  query <- paste0("https://api.vk.com/method/database.getRegions?need_all=",need_all,"&country_id=",country_id,ifelse(!(is.null(region_id)),paste0("&region_id=",region_id),""),ifelse(!(is.null(q)),paste0("&q=",q),""),"&offset=",offset,"&count=",count,"&access_token=",access_token,"&v=",api_version)
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
                     data.frame(region_id            = ifelse(is.null(dataRaw$response[[i]]$region_id), NA,dataRaw$response[[i]]$region_id),
                                title                = ifelse(is.null(dataRaw$response[[i]]$title), NA,dataRaw$response[[i]]$title),
                                stringsAsFactors = F))}
  
  if(length(dataRaw$response) < 1000){
    last_iteration <- TRUE}
  
  # offset
  offset <- offset + count
  }
  
  return(result)
}
  
