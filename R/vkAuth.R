vkAuth <- function(app_id = NULL, client_secret = NULL, apiVersion = "5.68"){
  #Ïîëó÷àåì code
  browseURL(paste0("https://oauth.vk.com/authorize?client_id=",app_id,"&redirect_uri=https://oauth.vk.com/blank.html&display=popup&scope=offline,groups,ads,stats&response_type=code&v=",apiVersion))
  code <- readline(prompt = "Enter code from URL: ")
  #Ïîëó÷àåì òîêåí
  token <- GET(paste0("https://oauth.vk.com/access_token?client_id=",client_id,"&client_secret=",client_secret,"&redirect_uri=https://oauth.vk.com/blank.html&code=",code))
  stop_for_status(token)
  accessCredentilas <- content(token, "parsed", "application/json")
  save(accessCredentilas, file = "vkauth.RData")
  return(accessCredentilas)
}
