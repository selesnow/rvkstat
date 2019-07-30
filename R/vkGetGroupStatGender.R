vkGetGroupStatGender <-
function(date_from = Sys.Date(), date_to = Sys.Date(), group_id = NULL, access_token = NULL){
  # Create query text
  apiQuery <- paste0("https://api.vk.com/method/stats.get?group_id=",group_id,"&date_from=",date_from,"&date_to=",date_to,"&v=5.52&access_token=",access_token)
  
  # Get json data
  vkdatajson <- getURL(apiQuery)
  
  # Transform json to list
  vkdatalist <- fromJSON(vkdatajson)
  
  # Transform list to data frame
  vkdataRaw <- as.data.frame(vkdatalist)
  
  # Check stringsAsFactors
  if(getOption("stringsAsFactors")) {
	  oldpar <- options(stringsAsFactors = FALSE)
	  on.exit(options(oldpar))
  }
  
  
  vkGender <- data.frame()
  for (i in 1:length(vkdataRaw$response.day)) {
    temp <- data.frame()
    try(temp <- data.frame(date = vkdataRaw$response.day[i],do.call(rbind.data.frame, vkdataRaw$response.sex[i])), TRUE)
    try(vkGender <- rbind(vkGender, temp),TRUE)
    try(rm(temp))}
  colnames(vkGender) <- c("Date", "Visitors", "Gender")
  vkGender <- vkGender[c(1,3,2)]
  vkGender$Date <- as.POSIXct(vkGender$Date, format = "%Y-%m-%d")
  vkGender$Gender <- as.factor(vkGender$Gender)
  return(vkGender)

}
