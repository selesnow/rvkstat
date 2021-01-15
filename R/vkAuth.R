vkAuth <- function(
    username    = getOption("rvkstat.username"),
    app_id      = getOption("rvkstat.app_id"), 
    app_secret  = getOption("rvkstat.app_secret"), 
    api_version = getOption("rvkstat.api_version"),
    token_path  = vkTokenPath(),
    reauth      = FALSE,
    skip_option = FALSE) 
  {
  
  # full path to file
  access_path <- file.path(token_path, paste(username, "vk_auth.rds", sep = "."))
  
  # check options
  if ( ! is.null(getOption( "rvkstat.access_token" )) && !skip_option ) {
    
    lg$debug("Access token was setted by option, if you want set new access token use skip_options = TRUE.")
    return( getOption( "rvkstat.access_token" ) )
    
  }
  
  # check environ variables
  if ( Sys.getenv("VK_API_TOKEN") != "" && !skip_option ) {
    
    lg$debug("Access token was setted from environment variables, if you want set new access token use skip_options = TRUE.")
    return( Sys.getenv("RVK_API_TOKEN")  )
    
  }
  
  # check cach file
  if ( file.exists( access_path ) && !reauth ) {
    
    accessCredentilas <- readRDS(access_path)
    lg$debug("Token load from %s", access_path)
    
  } else {
  
  # #############################
  # open browser for auth
  browseURL(paste0("https://oauth.vk.com/authorize?client_id=",app_id,"&redirect_uri=https://selesnow.github.io/rvkstat/getCode/get_code.html&display=popup&scope=offline,groups,ads,stats&response_type=code&v=",api_version))
  
  # wait code
  code <- readline(prompt = "Enter code from URL: ")
  
  # get token
  token <- GET(paste0("https://oauth.vk.com/access_token?client_id=",app_id,"&client_secret=",app_secret,"&redirect_uri=https://selesnow.github.io/rvkstat/getCode/get_code.html&code=",code))
  # check api answer
  stop_for_status(token)
  # parse credential
  accessCredentilas <- content(token, "parsed", "application/json")
  

  
  # ask fo cache
  message(str_interp("Do you want save your access token into rds file ${access_path} for use it between R sessions ? "))
  to_cash <- readline( str_interp("y / n (recmedation y) ?: ") )
  
  # cache 
  if ( to_cash %in% tolower( c("y", "yes", "ok", "save") ) ) {
    
    if ( !dir.exists(token_path) ) {
      
      dir.create(token_path, recursive = T)
      
    }
    
    # save data to rds file
    saveRDS(object = accessCredentilas, 
            file   = access_path)
    
    lg$info(str_interp("Token saved in %s", access_path))
    
    }
  }
  
  # add token claas 
  class(accessCredentilas) <- "vk_auth"
  
  # return
  return(accessCredentilas)
}

# detect token path
vkTokenPath <- function() {
  
  ifelse( is.null(getOption("rvkstat.token_path")), 
          getwd(), 
          getOption("rvkstat.token_path") )
  
}

# S3 print for token
print.vk_auth <- function (x, show_token = FALSE, ...) {
  
  cat("Vkontakte API Token:\n")
  cat("access_token:", ifelse(show_token, x$access_token, "<hidden>"), "\n")
  cat("expires_in:  ", x$expires_in, "\n")
  cat("user_id:     ", x$user_id)
  
}
