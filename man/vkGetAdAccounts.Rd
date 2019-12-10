\name{vkGetAdAccounts}
\alias{vkGetAdAccounts}
\title{List of Advertising Account}
\description{Returns a list of available advertising spaces.}
\usage{
vkGetAdAccounts(access_token = NULL, api_version = NULL)
}
\arguments{
  \item{access_token}{API access tokens obtained using vkAuth or vkGetToken functions}
  \item{api_version}{Vkontakte API version.}
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
\examples{
\dontrun{
## Auth in VK
my_tok <- vkAuth(app_id = 1,
                 app_secret = "H2Pk8htyFD8024mZaPHm")

my_vk_acc <- vkGetAdAccounts(my_tok$access_token)
}
}
