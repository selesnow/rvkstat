vkGetGroupStat <-
  function(
    date_from    = Sys.Date() - 7, 
    date_to      = Sys.Date(), 
    group_id     = NULL, 
    interval     = "day",
    intervals_count = NULL,
    filters      = NULL,
    stats_groups = c("visitors", "reach", "activity"),
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
    
    # query
    answer <- GET("https://api.vk.com/method/stats.get", 
                  query = list(
                    group_id = group_id,
                    timestamp_from = as.numeric(as.POSIXct(date_from), tz = Sys.timezone()),
                    timestamp_to = as.numeric(as.POSIXct(paste0(date_to, " 23:59:59"), tz = Sys.timezone())),
                    interval = interval,
                    intervals_count = intervals_count,
                    extended = 0,
                    filters = filters,
                    stats_groups = paste0(stats_groups, collapse = ","),
                    access_token = access_token,
                    v            = api_version
                  )
    )
    
    
    # check status
    stop_for_status(answer)
    
    # parsing body
    dataRaw <- content(answer, "parsed", "application/json")
    
    # check for error
    if(!is.null(dataRaw$error)){
      stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
    }
    
    # convert to tibble
    result <- tibble(response = dataRaw$response) %>%
              unnest_wider("response") 
    
    if ( "activity" %in% names(result) ) {
      
      result <- unnest_wider(result, "activity")
      
    }
    
    result <- unnest_wider(result, "reach")    %>%
              unnest_wider("visitors") %>%
              relocate(c("period_from", "period_to"), .before = everything()) %>%
              mutate( across(where(is.numeric), replace_na, 0) ) 
    
    # convert timestamp
    if ( nrow(result) > 0 ) {
      
      result$period_from <- as.POSIXct(result$period_from, origin = '1970-01-01')
      result$period_to   <- as.POSIXct(result$period_to, origin = '1970-01-01')
      
    }
    
    # end
    return(result)
}
