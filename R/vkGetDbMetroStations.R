#' Returns a List of Metro Stations
#' 
#' @param city_id City ID, \code{\link{vkGetDbCities}}
#' @param username Your vkontakte login.
#' @param api_version Vkontakte API version.
#' @param token_path Path to dir with credentials
#' @param access_token API access tokens obtained using vkAuth or vkGetToken functions
#'
#' @return tibble with Metro Stations list
#' @export
vkGetDbMetroStations <- function(
  city_id,
  username     = getOption("rvkstat.username"),
  api_version  = getOption("rvkstat.api_version"),
  token_path   = vkTokenPath(),
  access_token = getOption("rvkstat.access_token")
)
{
  
  # auth
  if ( is.null(access_token) ) {    
    
    if ( Sys.getenv("RVK_API_TOKEN") != "" )  {
      access_token <- Sys.getenv("RVK_API_TOKEN")    
    } else {
      access_token <- vkAuth(username   = username, 
                             token_path = token_path)$access_token
    }
  }
  
  if ( class(access_token) == "vk_auth" ) {
    
    access_token <- access_token$access_token
    
  }
  
  # paging
  offset <- 0
  count  <- 500
  last_iteration <- FALSE
  result <- list()
  
  while ( last_iteration == FALSE ) {
    
    # query
    answer <- GET("https://api.vk.com/method/database.getMetroStations", 
                  query = list(
                    city_id      = city_id,
                    offset       = offset,
                    count        = count,
                    extended     = 1,
                    access_token = access_token,
                    v            = api_version)
    )
    
    # check status
    stop_for_status(answer)
    # get query body
    dataRaw <- content(answer, "parsed", "application/json")
    
    # check for error
    if(!is.null(dataRaw$error)){
      stop(paste0("Error ", dataRaw$error$error_code," - ", dataRaw$error$error_msg))
    }
    
    # add ti result
    result <- append(result, dataRaw$response$items)
    
    # check iteraction
    if ( length( dataRaw$response$items ) < count ) {
      
      last_iteration <- TRUE
      
    }
    
    # offet
    offset <- offset + count
    
    # sleep
    Sys.sleep(0.5)
    
  }
  
  # collect result
  result <- bind_rows(result)
  
  # end
  return(result)
  
}
