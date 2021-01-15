\name{vkSetters}
\alias{vkSetters}
\alias{vkSetUsername}
\alias{vkSetAccountId}
\alias{vkSetAgencyId}
\alias{vkSetAccessToken}
\alias{vkSetTokenPath}
\alias{vkSetThreshold}
\title{
Set rvkstat options
}
\description{
Helper function for settings options: username, account_id, agency_id, access_token, token_path and console log level
}
\usage{
vkSetUsername(username)
vkSetAccountId(account_id)
vkSetAgencyId(agency_id)
vkSetAccessToken(access_token)
vkSetTokenPath(token_path)
vkSetThreshold(
   level = c("info", "fatal", 
             "error", "warn", 
             "debug", "trace")
)
}
\arguments{
  \item{username}{Your vkontakte login.}
  \item{account_id}{Ads account Id.}
  \item{agency_id}{Agency account Id.}
  \item{token_path}{Path to dir with credentials}
  \item{access_token}{API access tokens obtained using vkAuth or vkGetToken functions}
  \item{level}{Console log information level, one of: "info", "fatal", "error", "warn", "debug", "trace"}
}
\author{
Alexey Seleznev
}
