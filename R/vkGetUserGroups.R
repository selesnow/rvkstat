vkGetUserGroups <- function(
    user_id = NULL,
    filter = NULL,
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
  
  # Result frame
  result <- list()  
  
  # Paging
  offset <- 0
  count <- 1000
  last_iteration <- FALSE
  
  while ( last_iteration == FALSE ){
    
    # Query
    answer <- GET("https://api.vk.com/method/groups.get", 
                  query = list(
                    fields = "city,country,place,description,wiki_page,members_count,counters,start_date,finish_date,can_post,can_see_all_posts,activity,status,contacts,links,fixed_post,verified,site,can_create_topic",
                    user_id = user_id,
                    extended = 1,
                    offset = offset,
                    count = count,
                    filter = filter,
                    access_token = access_token,
                    v = api_version
                  ))
    
    # check status
    stop_for_status(answer)
    
    # pars answer
    dataRaw <- content(answer, "parsed", "application/json")
    
    # Check for error
    if(!is.null(dataRaw$error)){
      stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
    }
    
    # unnest temp result
    tempData <- 
      tibble(items = dataRaw$response$items) %>%
      unnest_wider("items") 
  
    # add to result
    result <- append(result, list(tempData))
    
    # check for next iteration
    if(length(dataRaw$response) < 1000){
      last_iteration <- TRUE}
    
    # offset
    offset <- offset + count
  }
  
  # unnest result
  result <- 
    bind_rows(result) %>%
    unnest_wider("city", names_sep = '_') %>%
    unnest_wider("country", names_sep = '_')
  
  # convert to date
  result$start_date <- as.POSIXct(as.integer(result$start_date), origin="1970-01-01")
  
  # return result
  return(result)
}
