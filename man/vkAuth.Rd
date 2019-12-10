\name{vkAuth}
\alias{vkAuth}
\title{Authorization in 'Vkontakte'}
\description{Allows you to get a token to access the API using the scheme Authorization Code Flow - https://vk.com/dev/authcode_flow_user}
\usage{
vkAuth(app_id = NULL, app_secret = NULL, apiVersion = "5.68")
}
\arguments{
  \item{app_id}{Application ID, you can find it on the application settings page.}
  \item{app_secret}{Secure application key, you can find it on the application settings page.}
  \item{apiVersion}{API version.}
}
\value{The list of credentials to work with the API Vkontakte}
\author{
Alexey Seleznev
}

\examples{
\dontrun{
## Auth in VK
my_tok <- vkAuth(app_id = 1,app_secret = "H2Pk8htyFD8024mZaPHm")
}
}
