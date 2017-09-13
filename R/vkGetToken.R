vkGetToken <-
function(apppId = NULL) {
tokenURL <- paste0("https://oauth.vk.com/authorize?client_id=",apppId,"&display=page&redirect_uri=https://oauth.vk.com/blank.html&scope=offline,groups,ads,stats&response_type=token&v=5.52")
browseURL(tokenURL)
vkToken <- readline("Your vk token from URL parameter access_token: ")
save(vkToken, file = "vkauth")
return(vkToken)
}
