vkGetToken <-
function(app_id = getOption("rvkstat.app_id")) {
tokenURL <- paste0("https://oauth.vk.com/authorize?client_id=",app_id,"&display=page&redirect_uri=https://selesnow.github.io/rvkstat/getCode/get_token.html&scope=offline,groups,ads,stats&response_type=token&v=5.68")
browseURL(tokenURL)
vkToken <- readline("Your vk token from URL parameter access_token: ")
return(vkToken)
}
