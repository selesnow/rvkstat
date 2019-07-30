vkGetAdCategories <- function(access_token = NULL,
							  api_version  = NULL){
  if(is.null(access_token)){
    stop("Set access_token in options, is require.")
  }
  
  api_version <- api_version_checker(api_version)
  
  # result
  result <- data.frame()
  
  # query
  query <- paste0("https://api.vk.com/method/ads.getCategories?access_token=",access_token,"&v=",api_version)
  answer <- GET(query)
  stop_for_status(answer)
  dataRaw <- content(answer, "parsed", "application/json")
  
  # check for error
  if(!is.null(dataRaw$error)){
    stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
  }
  
  # parsing
  for(i in 1:length(dataRaw$response$v2)){
    for(subcat in 1:(if(length(dataRaw$response$v2[[i]]$subcategories)==0) 1 else length(dataRaw$response$v2[[i]]$subcategories))){

      result  <- rbind(result,
                       data.frame(id                  = ifelse(is.null(dataRaw$response$v2[[i]]$id), NA,dataRaw$response$v2[[i]]$id),
                                  name                = ifelse(is.null(dataRaw$response$v2[[i]]$name), NA,dataRaw$response$v2[[i]]$name),
                                  subcategories_id    = ifelse(is.null(dataRaw$response$v2[[i]]$subcategories[[subcat]]$id), NA,dataRaw$response$v2[[i]]$subcategories[[subcat]]$id),
                                  ubcategories_name   = ifelse(is.null(dataRaw$response$v2[[i]]$subcategories[[subcat]]$name), NA,dataRaw$response$v2[[i]]$subcategories[[subcat]]$name),
                                  stringsAsFactors = F))}
    
  }
  
  
  return(result)}
