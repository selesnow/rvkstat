.onAttach <- function(lib, pkg,...){
  packageStartupMessage(rvkstatWelcomeMessage())
}

#
#

rvkstatWelcomeMessage <- function(){
  # library(utils)
  
  paste0("\n",
         "---------------------\n",
         "Welcome to rvkstat version ", utils::packageDescription("rvkstat")$Version, "\n",
         "\n",
         "Author:           Alexey Seleznev (Head of analytics dept at Netpeak).\n",
         "Telegram channel: https://t.me/R4marketing \n",
         "Email:            selesnow@gmail.com\n",
         "Blog:             https://alexeyseleznev.wordpress.com \n",
         "Facebook:         https://facebook.com/selesnown \n",
         "Linkedin:         https://www.linkedin.com/in/selesnow \n",
         "\n",
         "Type ?rvkstat for the main documentation.\n",
         "The github page is: https://github.com/selesnow/rvkstat/\n",
         "\n",
         "Suggestions and bug-reports can be submitted at: https://github.com/selesnow/rvkstat/issues\n",
         "Or contact: <selesnow@gmail.com>\n",
         "\n",
         "\tTo suppress this message use:  ", "suppressPackageStartupMessages(library(rvkstat))\n",
         "---------------------\n"
  )
}


.onLoad <- function(libname, pkgname) {
  
  # where function 
  utils::globalVariables("where")
  
  # lgr
  assign(
    "lg", 
    lgr::get_logger(name = "rvkstat"),  
    envir = parent.env(environment())
  )
  
  # check environment variables
  ## token path
  if ( Sys.getenv("RVK_TOKEN_PATH") != "" ) {
    
    vk_token_path <- Sys.getenv("RVK_TOKEN_PATH")
    
    lg$info("Set token_path from system variable RVK_TOKEN_PATH")
    
  } else {
    
    vk_token_path <- NULL
    
  }
  
  ## username
  if ( Sys.getenv("RVK_USER") != "" ) {
    
    vk_user <- Sys.getenv("RVK_USER")
    
    lg$info("Set username from system variable RVK_USER")
    
  } else {
    
    vk_user <- NULL
    
  }
  
  ## access token
  if ( Sys.getenv("RVK_API_TOKEN") != "" ) {
    
    vk_token <- Sys.getenv("RVK_API_TOKEN")
    
    lg$info("Set access_token from system variable RVK_API_TOKEN")
    
  } else {
    
    vk_token <- NULL
    
  }
  
  op <- options()
  op.rvkstat <- list(rvkstat.api_version  = "5.131",
                     rvkstat.access_token = vk_token,
                     rvkstat.account_id   = NULL,
                     rvkstat.agency_id    = NULL,
                     rvkstat.token_path   = vk_token_path,
                     rvkstat.username     = vk_user,
                     rvkstat.app_id       = 5344605,
                     rvkstat.app_secret   = "CAyGdHhdgEBEW8fJCmzS")
  
  toset <- !(names(op.rvkstat) %in% names(op))
  if (any(toset)) options(op.rvkstat[toset])
  
  invisible()
}
