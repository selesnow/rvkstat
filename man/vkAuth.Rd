\name{vkAuth}
\alias{vkAuth}
\title{Authorization in 'Vkontakte'}
\description{Allows you to get a token to access the API using the scheme Authorization Code Flow - https://vk.com/dev/authcode_flow_user}
\usage{
vkAuth(
    username    = getOption("rvkstat.username"),
    app_id      = getOption("rvkstat.app_id"), 
    app_secret  = getOption("rvkstat.app_secret"), 
    api_version = getOption("rvkstat.api_version"),
    token_path  = vkTokenPath(),
    reauth      = FALSE,
    skip_option = FALSE
    )
}
\arguments{
  \item{username}{Your vkontakte login.}
  \item{app_id}{Application ID, you can find it on the application settings page.}
  \item{app_secret}{Secure application key, you can find it on the application settings page.}
  \item{api_version}{API version.}
  \item{token_path}{Path to dir with credentials}
  \item{reauth}{boolean, do reauthorization if TRUE}
  \item{skip_option}{boolean, skip access token from options and environ variables if TRUE.}
}
\value{The list of credentials to work with the API Vkontakte}
\author{
Alexey Seleznev
}

\examples{
\dontrun{
## Auth in VK
vkAuth(
    username = 'your_login'
)
}
}
