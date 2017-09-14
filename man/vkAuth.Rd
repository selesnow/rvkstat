\name{vkAuth}
\alias{vkAuth}
\title{Vkontakte auth}
\description{Function for vk authorisation by Authorization Code Flow schema - https://vk.com/dev/authcode_flow_user}
\usage{
vkAuth(client_id = NULL, client_secret = NULL, apiVersion = "5.68")
}
\arguments{
  \item{client_id}{Your app id from filed "ID приложения" in app settings page vkontakte.}
  \item{client_secret}{Your app secret from filed "Защищённый ключ" in app settings page vkontakte.}
  \item{apiVersion}{Current API version.}
}
\value{Vkontakte credentials list}
\author{
Alexey Seleznev
}

\examples{
##Auth in VK
my_tok <- vkAuth(client_id = 1,client_secret = "H2Pk8htyFD8024mZaPHm")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
