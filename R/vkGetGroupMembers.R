vkGetGroupMembers <-
  function(
    group_id     = NULL,
    sort         = c('time_desc', 'time_asc', 'id_desc', 'id_asc'),
    fields       = c('sex', 'bdate', 'city', 'country', 'photo_50', 'photo_100', 
                     'photo_200_orig', 'photo_200', 'photo_400_orig', 'photo_max', 
                     'photo_max_orig', 'online', 'online_mobile', 'lists', 'domain', 
                     'has_mobile', 'contacts', 'connections', 'site', 'education', 
                     'universities', 'schools', 'can_post', 'can_see_all_posts', 
                     'can_see_audio', 'can_write_private_message', 'status', 
                     'last_seen', 'common_count', 'relation', 'relatives'),
    filter       = c('all', 'friends', 'unsure', 'managers', 'donut'),
    username     = getOption("rvkstat.username"),
    api_version  = getOption("rvkstat.api_version"),
    token_path   = vkTokenPath(),
    access_token = getOption("rvkstat.access_token")
  ) {
    
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
    
    # check args
    sort <- match.arg(sort)
    fields <- match.arg(fields, several.ok = TRUE)
    filter <- match.arg(filter)
    
    if ( filter == 'all' ) filter <- NULL
    
    fields <- paste0(fields, collapse = ',')
    
    # result frame
    result <- list()
    
    # paging
    offset <- 0
    count <- 1000
    last_iteration <- FALSE
    
    while( last_iteration == FALSE ){
      
      # query
      answer <- GET("https://api.vk.com/method/groups.getMembers", 
                    query = list(
                      group_id     = group_id,
                      sort         = sort,
                      fields       = fields,
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
        unnest_wider("items") %>% 
        unnest_wider('country', names_sep = '_') %>% 
        unnest_wider('last_seen', names_sep = '_') %>% 
        unnest_wider('universities', names_sep = '_') %>% 
        unnest_wider('city', names_sep = '_') %>% 
        unnest_wider('relatives', names_sep = '_') %>% 
        unnest_wider('relation_partner', names_sep = '_') %>% 
        unnest_wider('schools', names_sep = '_')

      # add to result
      result <- append(result, list(tempData))
      
      if(length(dataRaw$response$items) < 1000){
        last_iteration <- TRUE}
      
      # offset
      offset <- offset + count
      Sys.sleep(0.5)
    }
    
    result <- bind_rows(result)
    
    # return result
    return(result)
    
}
