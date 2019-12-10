\name{vkGetAdBudget}
\alias{vkGetAdBudget}
\title{Budget of Advertising Cabinet 'Vkontakte'.}
\description{Returns the current balance of the advertising account Vkontakte.}
\usage{
vkGetAdBudget(account_id = NULL, access_token = NULL, 
              api_version = NULL)
}
\arguments{
  \item{account_id}{Advertising account ID, a list of all available advertising accounts can be obtained using the function vkGetAdAccounts.}
  \item{access_token}{API access token, obtained using the functions vkAuth or vkGetToken}
  \item{api_version}{Vkontakte API version.}
}
\author{
Alexey Seleznev
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
