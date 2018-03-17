vkGetGroupStatGenderAge <-
function(date_from = Sys.Date(), date_to = Sys.Date(), group_id = NULL, access_token = NULL){
  #Create query text
  apiQuery <- paste0("https://api.vk.com/method/stats.get?group_id=",group_id,"&date_from=",date_from,"&date_to=",date_to,"&v=5.52&access_token=",access_token)
  
  #Get json data
  vkdatajson <- getURL(apiQuery)
  
  #Transform json to list
  vkdatalist <- fromJSON(vkdatajson)
  
  #Transform list to data frame
  vkdataRaw <- as.data.frame(vkdatalist)
  
  #Check stringsAsFactors
  if(getOption("stringsAsFactors")) isFactor <- "Yes" else isFactor <- "No"
  if(isFactor == "Yes") options(stringsAsFactors = FALSE)
  
  vkGenderAge <- data.frame()
  for (i in 1:length(vkdataRaw$response.day)) {
    temp <- data.frame()
    try(temp <- data.frame(date = vkdataRaw$response.day[i],do.call(rbind.data.frame, vkdataRaw$response.sex_age[i])), TRUE)
    try(vkGenderAge <- rbind(vkGenderAge, temp),TRUE)
    try(rm(temp),TRUE)}
  colnames(vkGenderAge) <- c("Date","Visitors","Value")
  vkGenderAge$Gender <- substr(vkGenderAge$Value,1,regexpr(";",vkGenderAge$Value)-1)
  vkGenderAge$AgeGroup <- substr(vkGenderAge$Value,regexpr(";",vkGenderAge$Value)+1,nchar(vkGenderAge$Value))
  vkGenderAge$Value <- NULL
  #vkGenderAge <- data.frame(Date <- vkGenderAge$date,
  #                          Gender <- vkGenderAge$Gender,
  #                          AgeGroup <- vkGenderAge$AgeGroup,
  #                          Visitors <- vkGenderAge$visitors)
  vkGenderAge$Date <- as.POSIXct(vkGenderAge$Date, format = "%Y-%m-%d")
  vkGenderAge$Gender <- as.factor(vkGenderAge$Gender)
  vkGenderAge$AgeGroup <- as.factor(vkGenderAge$AgeGroup)
  
  return(vkGenderAge[c(1,3,4,2)])
  
  if(isFactor == "Yes") options(stringsAsFactors = TRUE)
}
