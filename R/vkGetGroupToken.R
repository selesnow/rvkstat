vkGetGroupToken <-
  function(app_id = getOption("rvkstat.app_id"), group_ids = NULL) {
    group_ids <- paste0(group_ids, collapse = ",")
    tokenURL <- paste0("https://oauth.vk.com/authorize?client_id=",app_id,"&group_ids=",group_ids,"&display=popup&redirect_uri=https://oauth.vk.com/blank.html&scope=messages,manage,photos,docs,stories&response_type=token&v=5.68")
    browseURL(tokenURL)
    vkToken <- readline("Your vk token from URL parameter access_token: ")
    return(vkToken)
  }
