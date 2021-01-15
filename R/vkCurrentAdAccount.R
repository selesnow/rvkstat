# function for detect account_id and client_id ----------------------------
vkCurrentAdAccount <- function() {
  
  if ( is.null(getOption("rvkstat.agency_id")) ) {
    
    return(getOption("rvkstat.account_id"))
    
  } else {
    
    return(getOption("rvkstat.agency_id"))
    
  }
  
}

vkCurrentClientAccount <- function() {
  
  if ( !is.null(getOption("rvkstat.agency_id")) ) {
    
    return(getOption("rvkstat.account_id"))
    
  } else {
    
    return(NULL)
    
  }
  
}