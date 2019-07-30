vkGetGroupStatAge <-
function(date_from = Sys.Date(), date_to = Sys.Date(), group_id = NULL, access_token = NULL){
  # Create query text
  apiQuery <- paste0("https://api.vk.com/method/stats.get?group_id=",group_id,"&date_from=",date_from,"&date_to=",date_to,"&v=5.52&access_token=",access_token)
  
  #G et json data
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
  
  vkAge <- data.frame()
  for (i in 1:length(vkdataRaw$response.day)) {
    temp <- data.frame()
    try(temp <- data.frame(date = vkdataRaw$response.day[i],do.call(rbind.data.frame, vkdataRaw$response.age[i])), silent = TRUE)
    try(vkAge <- rbind(vkAge, temp),silent = TRUE)
    try(rm(temp), silent = TRUE)}
  colnames(vkAge) <- c("Date", "Visitors", "AgeGroup")
  vkAge <- vkAge[c(1,3,2)]
  vkAge$Date <- as.POSIXct(vkAge$Date, format = "%Y-%m-%d")
  vkAge$AgeGroup <- as.factor(vkAge$AgeGroup)
  return(vkAge)
}
