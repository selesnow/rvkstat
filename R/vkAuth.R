vkAuth <- function(app_id = 5344605, app_secret = "CAyGdHhdgEBEW8fJCmzS", apiVersion = "5.68"){

  browseURL(paste0("https://oauth.vk.com/authorize?client_id=",app_id,"&redirect_uri=https://selesnow.github.io/rvkstat/getCode/get_code.html&display=popup&scope=offline,groups,ads,stats&response_type=code&v=",apiVersion))
  code <- readline(prompt = "Enter code from URL: ")

  token <- GET(paste0("https://oauth.vk.com/access_token?client_id=",app_id,"&client_secret=",app_secret,"&redirect_uri=https://selesnow.github.io/rvkstat/getCode/get_code.html&code=",code))
  stop_for_status(token)
  accessCredentilas <- content(token, "parsed", "application/json")

  return(accessCredentilas)
}
