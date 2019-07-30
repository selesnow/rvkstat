vkGetGroupStatCity <-
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
  
  
    vkCities <- data.frame()
    for (i in 1:length(vkdataRaw$response.day)) {
      temp <- data.frame()
      try(temp <- data.frame(date = vkdataRaw$response.day[i],do.call(rbind.data.frame, vkdataRaw$response.cities[i])), silent = TRUE)
      try(vkCities <- rbind(vkCities, temp), silent = TRUE)
      try(rm(temp), silent = TRUE)}
    colnames(vkCities) <- c("Date", "Visitors", "CityID", "CityName")
    vkCities <- vkCities[c(1,4,3,2)]
    vkCities$Date <- as.POSIXct(vkCities$Date, format = "%Y-%m-%d")
    return(vkCities)

}
