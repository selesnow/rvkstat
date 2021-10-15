vkGetUserWall <- function(
  user_id      = NULL,
  domain       = NULL,
  filter       = NULL,
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
  
  # result frame
  result <- list()
  
  # paging
  offset <- 0
  count <- 100
  last_iteration <- FALSE
  
  while( last_iteration == FALSE ){
    
    # query
    answer <- GET("https://api.vk.com/method/wall.get", 
                  query = list(
                    extended     = 1,
                    owner_id     = user_id,
                    domain       = domain,
                    offset       = offset,
                    count        = count,
                    filter       = filter,
                    access_token = access_token,
                    v            = api_version
                  ))
    
    # check status
    stop_for_status(answer)
    
    # parse
    dataRaw <- content(answer, "parsed", "application/json")
    
    # check for error
    if(!is.null(dataRaw$error)){
      stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
    } 
    
    # unnest temp result
    tempData <- 
      tibble(items = dataRaw$response$items) %>%
      unnest_wider("items") 
      
    # add to result
    result <- append(result, list(tempData))

    
    if(length(dataRaw$response$items) < 100){
      last_iteration <- TRUE}
    
    # offset
    offset <- offset + count
    Sys.sleep(0.5)
  }
  
  # bind result
  result <- 
    bind_rows(result) %>%
    unnest_wider("comments", names_sep = '_') %>%
    unnest_wider("likes", names_sep = '_') %>%
    unnest_wider("reposts", names_sep = '_') %>%
    unnest_wider("donut", names_sep = '_') %>% 
    unnest_longer("views", indices_include = FALSE)
  
  # check views
  if ( "views" %in% names(result) ) {
    result <- unnest_longer(result, "views", indices_include = FALSE)
      
  }

  
  # convert to date
  result$date <- as.POSIXct(as.integer(result$date), origin="1970-01-01")
  # return result
  return(result)
}
