vkGetDbRegions <- function(
    country_id,
    q = NULL,
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
    stop(paste0("In query ( argument q ) max length is 15 characters. You enter ", nchar(q)," characters!"))
  }

  # result frame
  result  <- list()
  
  # paging
  offset <- 0
  count <- 1000
  last_iteration <- FALSE
  
  while ( last_iteration == FALSE ) {

  # API request
  answer <- GET("https://api.vk.com/method/database.getRegions",
                query = list(
                  country_id = country_id,
                  q = q,
                  offset       = offset,
                  count        = count,
                  access_token = access_token,
                  v            = api_version
                ))
  
  # check status
  stop_for_status(answer)
  # get answer body
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
  
  # offset
  offset <- offset + length( dataRaw$response$items )
  
  # sleep
  Sys.sleep(0.5)
  }
  
  # collect result
  result <- bind_rows(result)
  
  # end
  return(result)
}
  
