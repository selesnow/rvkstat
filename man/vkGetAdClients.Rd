\name{vkGetAdClients}
\alias{vkGetAdClients}
\title{Client list.}
\description{Returns a list of advertising agency clients.}
\usage{
vkGetAdClients(
  account_id   = getOption("rvkstat.agency_id"),
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
\value{Date frame with community statistics with the following values:
\item{id}{client id.}
\item{name}{customer name.}
\item{day_limit}{client's daily limit in rubles.}
\item{all_limit}{total customer limit in rubles.}
}
\author{
Alexey Seleznev
}
\references{
Documentation for API method ads.getClients: https://vk.com/dev/ads.getClients
}
\examples{
\dontrun{
## auth
my_tok <- vkAuth(app_id = 1, 
                 app_secret = "H2Pk8htyFD8024mZaPHm")

## We get a list of clients from the agent account
vk_clients <- vkGetAdClients(account_id = 1, 
                             access_token = my_tok$access_token)

}
}
