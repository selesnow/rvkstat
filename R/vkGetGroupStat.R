vkGetGroupStat <-
function(date_from = Sys.Date(), date_to = Sys.Date(), group_id = NULL, access_token = NULL){
  # Create query text
  apiQuery <- paste0("https://api.vk.com/method/stats.get?group_id=",group_id,"&date_from=",date_from,"&date_to=",date_to,"&v=5.52&access_token=",access_token)
  
  # Get json data
  vkdatajson <- getURL(apiQuery)
  
  # Transform json to list
  vkdatalist <- fromJSON(vkdatajson)
  
  # Transform list to data frame
  vkdataRaw <- as.data.frame(vkdatalist)
  
  vkData <- data.frame(day = vkdataRaw$response.day,
                       views = vkdataRaw$response.views,
                       visitors = vkdataRaw$response.visitors,
                       total_reach = vkdataRaw$response.reach,
                       subscribers_reach = vkdataRaw$response.reach_subscribers,
                       subscribed = vkdataRaw$response.subscribed,
                       unsubscribed = vkdataRaw$response.unsubscribed)
  colnames(vkData) <- c("Date","Views","Visitors","TotalReach","SubscribersReach","Subscribed","Unsubscribed")
  vkData$Date <- as.POSIXct(vkData$Date, format = "%Y-%m-%d")
  return(vkData)
}
