vkGetDbCities <- function(
    country_id,
    region_id    = NULL,
    q            = NULL,
    need_all     = TRUE,
    username     = getOption("rvkstat.username"),
    api_version  = getOption("rvkstat.api_version"),
    token_path   = vkTokenPath(),
    access_token = getOption("rvkstat.access_token")
    )
  {
  
  # auth
  if ( is.null(access_token) ) {    
    
    if ( Sys.getenv("RVK_API_TOKEN") != "" )  {
      access_token <- Sys.getenv("RVK_API_TOKEN")    
    } else {
      access_token <- vkAuth(username   = username, 
                             token_path = token_path)$access_token
    }
  }
  
  if ( class(access_token) == "vk_auth" ) {
    
    access_token <- access_token$access_token
    
  }

  # check query length
  if(nchar(q) > 15 && !(is.null(q))){
    stop(paste0("In q argument maximum length of string is 15 characters. You enter string with ", nchar(q)," characters!"))
  }
  
  need_all <- as.integer(need_all)

  # paging
  offset <- 0
  count <- 1000
  last_iteration <- FALSE
  result <- list()
  
  while ( last_iteration == FALSE ) {
    
    # query
    answer <- GET("https://api.vk.com/method/database.getCities", 
                  query = list(
                    need_all     = need_all,
                    country_id   = country_id,
                    region_id    = region_id,
                    q            = q,
                    offset       = offset,
                    count        = count,
                    access_token = access_token,
                    v            = api_version)
    )
    
    # check status
    stop_for_status(answer)
    # get query body
    dataRaw <- content(answer, "parsed", "application/json")
    
    # check for error
    if(!is.null(dataRaw$error)){
      stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
    }
    
    # add ti result
    result <- append(result, dataRaw$response$items)
    
    # check iteraction
    if ( length( dataRaw$response$items ) < count ) {
      
      last_iteration <- TRUE
      
    }
  
    # offet
    offset <- offset + count

    # sleep
    Sys.sleep(0.5)
    
  }
  
  # collect result
  result <- bind_rows(result)
 
  # end
  return(result)
  
}
