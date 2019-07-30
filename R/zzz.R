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