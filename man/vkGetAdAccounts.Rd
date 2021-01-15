\name{vkGetAdAccounts}
\alias{vkGetAdAccounts}
\title{List of Advertising Account}
\description{Returns a list of available advertising spaces.}
\usage{
vkGetAdAccounts(
  username     = getOption("rvkstat.username"),
  api_version  = getOption("rvkstat.api_version"),
  token_path   = vkTokenPath(),
  access_token = getOption("rvkstat.access_token")
)
}
\arguments{
  \item{username}{Your vkontakte login.}
  \item{api_version}{Vkontakte API version.}
  \item{token_path}{Path to dir with credentials}
  \item{access_token}{API access tokens obtained using vkAuth or vkGetToken functions}
}
\author{
Alexey Seleznev
}
\value{Date frame with a list of advertising offices and their parameters with the following values:
  \item{account_id}{ID of the advertising account.}
  \item{account_type}{Type of advertising office.}
  \item{account_status}{The status of the advertising office. (1 - active, 0 - inactive)}
  \item{access_role}{User privileges in the advertising office.}
}
\references{
Documentation for API method ads.getAccounts: https://vk.com/dev/ads.getAccounts 
}
\examples{
\dontrun{
my_vk_acc <- vkGetAdAccounts()
}
}
