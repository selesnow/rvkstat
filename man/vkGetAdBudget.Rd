\name{vkGetAdBudget}
\alias{vkGetAdBudget}
\title{Budget of Advertising Cabinet 'Vkontakte'.}
\description{Returns the current balance of the advertising account Vkontakte.}
\usage{
vkGetAdBudget(
    account_id   = getOption("rvkstat.account_id"), 
    username     = getOption("rvkstat.username"),
    api_version  = getOption("rvkstat.api_version"),
    token_path   = vkTokenPath(),
    access_token = getOption("rvkstat.access_token")
)
}
\arguments{
  \item{account_id}{Advertising account ID, a list of all available advertising accounts can be obtained using the function vkGetAdAccounts.}
  \item{username}{Your vkontakte login.}
  \item{api_version}{Vkontakte API version.}
  \item{token_path}{Path to dir with credentials}
  \item{access_token}{API access tokens obtained using vkAuth or vkGetToken functions}
}
\author{
Alexey Seleznev
}
\references{
Documentation for API method ads.getBudget: https://vk.com/dev/ads.getBudget
}
\examples{
\dontrun{
## auth
my_tok <- vkAuth(app_id = 1, 
                 app_secret = "H2Pk8htyFD8024mZaPHm")

# Receive the rest of means from an advertising office
vk_budget <- vkGetAdBudget(account_id = 1, 
                           access_token = my_tok$access_token)
}
}
