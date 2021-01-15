vkSetUsername <- function(username) {
  options(rvkstat.username = username)
  lg$info("Set username %s", username)
}

vkSetAccountId <- function(account_id) {
  options(rvkstat.account_id = account_id)
  lg$info("Set account_id %s", account_id)
}

vkSetAgencyId <- function(agency_id) {
  options(rvkstat.agency_id = agency_id)
  lg$info("Set agency_id %s", agency_id)
}

vkSetAccessToken <- function(access_token) {
  options(rvkstat.access_token = access_token)
  lg$info("Set access_token")
}

vkSetTokenPath <- function(token_path) {
  options(rvkstat.token_path = token_path)
  lg$info("Set token_path %s", token_path)
}

vkSetThreshold <- function(level = c("info", "fatal", "error", "warn", "debug", "trace")) {
  lg$set_threshold(level = level)
  lg$info("Set log threshold level to %s", level)
}
