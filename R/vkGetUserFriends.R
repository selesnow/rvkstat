vkGetUserFriends <- function(
      user_id      = NULL,
      name_case    = "nom",
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
  
  # Paging
  count  <- 5000
  offset <- 0 
  last_iteration <- FALSE
  
  # result
  result <- list()
  
  # query
  answer <- GET("https://api.vk.com/method/friends.get", 
                query = list(
                  user_id = user_id,
                  fields  = "nickname,domain,sex,bdate,city,country,timezone,photo_50,photo_100,photo_200_orig,has_mobile,contacts,education,online,relation,last_seen,status,can_write_private_message,can_see_all_posts,can_post,universities",
                  count   = count,
                  offset  = offset,
                  name_case = name_case,
                  v = api_version,
                  access_token = access_token
                ))
  
  stop_for_status(answer)
  
  dataRaw <- content(answer, "parsed", "application/json")

  # check for error
  if(!is.null(dataRaw$error)){
    stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
  }
  
  # Paging get total rows
  total_rows <- dataRaw$response$count
  get_rows   <- length(dataRaw$response$items)
  
  # unnesting
  temp <-   
    tibble(items = dataRaw$response$items) %>%
    unnest_wider("items")  %>%
    unnest_wider("city", names_sep = "_") %>%
    unnest_wider("country", names_sep = "_") %>%
    unnest_wider("last_seen", names_sep = "_") 
  
  # add ti result
  result <- append(result, list(temp))
 
  
  # Paging 
  while ( get_rows < total_rows ) {
    
    offset <- 0 + get_rows
    
    # query
    answer <- GET("https://api.vk.com/method/friends.get?", 
                  query = list(
                    user_id = user_id,
                    fields  = "nickname,domain,sex,bdate,city,country,timezone,photo_50,photo_100,photo_200_orig,has_mobile,contacts,education,online,relation,last_seen,status,can_write_private_message,can_see_all_posts,can_post,universities",
                    count   = count,
                    offset  = offset,
                    name_case = name_case,
                    v = api_version,
                    access_token = access_token
                  ))
    
    stop_for_status(answer)
    
    dataRaw <- content(answer, "parsed", "application/json")
    
    # check for error
    if(!is.null(dataRaw$error)){
      stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
    }
    
    # new get rows
    get_rows   <- length(dataRaw$response$items)
    
    # unnesting
    temp <-   
      tibble(items = dataRaw$response$items) %>%
      unnest_wider("items")  %>%
      unnest_wider("city", names_sep = "_") %>%
      unnest_wider("country", names_sep = "_") %>%
      unnest_wider("last_seen", names_sep = "_") 
    
    # add ti result
    result <- append(result, list(temp))
    
    Sys.sleep(0.5)
    
  }
  
  # binding
  result <- bind_rows(result)
  
  # conver date
  result$last_seen_time <- as.POSIXct(as.integer(result$last_seen_time), origin="1970-01-01")
  
  # return result
  return(result)
}
