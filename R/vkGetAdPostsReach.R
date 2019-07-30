vkGetAdPostsReach <- function(account_id = NULL,
                              ids_type = "campaign",
                              ids = NULL,
							                api_version = NULL,
                              access_token = NULL){
  if(is.null(access_token)){
    stop("Set access_token in options, is require.")
  }
  
  if(!(ids_type %in% c("ad","campaign"))){
    stop("Set correctly ids_type, one of ad or campaign!")
  }
	
  # set api_version
  api_version <- api_version_checker(api_version)
  
  # sep ids
  ids <- paste0(ids, collapse = ",")
  
  # result frame
  result <- data.frame()  
  
  # query
  query <- paste0("https://api.vk.com/method/ads.getPostsReach?account_id=",account_id,"&ids_type=",ids_type,"&ids=",ids,"&access_token=",access_token,"&v=",api_version)
  answer <- GET(query)
  stop_for_status(answer)
  dataRaw <- content(answer, "parsed", "application/json")
  
  # check for error
  if(!is.null(dataRaw$error)){
    stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
  }
  
  for(i in 1:length(dataRaw$response)){
    
          result  <- rbind(result,
                         data.frame(id                  = ifelse(is.null(dataRaw$response[[i]]$id), NA,dataRaw$response[[i]]$id),
                                    reach_subscribers   = ifelse(is.null(dataRaw$response[[i]]$reach_subscribers), NA,dataRaw$response[[i]]$reach_subscribers),
                                    reach_total         = ifelse(is.null(dataRaw$response[[i]]$reach_total), NA,dataRaw$response[[i]]$reach_total),
                                    links               = ifelse(is.null(dataRaw$response[[i]]$links), NA,dataRaw$response[[i]]$links),
                                    to_group            = ifelse(is.null(dataRaw$response[[i]]$to_group ), NA,dataRaw$response[[i]]$to_group),
                                    join_group          = ifelse(is.null(dataRaw$response[[i]]$join_group), NA,dataRaw$response[[i]]$join_group),
                                    report              = ifelse(is.null(dataRaw$response[[i]]$report), NA,dataRaw$response[[i]]$report),
                                    hide                = ifelse(is.null(dataRaw$response[[i]]$hide), NA,dataRaw$response[[i]]$hide),
                                    unsubscribe         = ifelse(is.null(dataRaw$response[[i]]$unsubscribe), NA,dataRaw$response[[i]]$unsubscribe),
                                    video_views_start   = ifelse(is.null(dataRaw$response[[i]]$video_views_start), NA,dataRaw$response[[i]]$video_views_start),
                                    video_views_3s      = ifelse(is.null(dataRaw$response[[i]]$video_views_3s), NA,dataRaw$response[[i]]$video_views_3s),
                                    video_views_25p     = ifelse(is.null(dataRaw$response[[i]]$video_views_25p), NA,dataRaw$response[[i]]$video_views_25p),
                                    video_views_50p     = ifelse(is.null(dataRaw$response[[i]]$video_views_50p), NA,dataRaw$response[[i]]$video_views_50p),
                                    video_views_75p     = ifelse(is.null(dataRaw$response[[i]]$video_views_75p), NA,dataRaw$response[[i]]$video_views_75p),
                                    video_views_100p    = ifelse(is.null(dataRaw$response[[i]]$video_views_100p), NA,dataRaw$response[[i]]$video_views_100p),
                                    stringsAsFactors = F))}
  
  # return result
  return(result)
}
