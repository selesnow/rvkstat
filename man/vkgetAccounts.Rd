\name{vkgetAccounts}
\alias{vkgetAccounts}
\title{Get account list from vkontakte ads cabinet}
\description{vkgetAccounts Get account list from vkontakte ads cabinet}
\usage{
vkgetAccounts(access_token = NULL)
}
\arguments{
  \item{access_token}{Your developer token vkontakte api which you get by function vkGetToken}
}
\value{Data frame with your ads accounts}
\author{
Alexey Seleznev
}

\examples{
##Auth in VK
my_tok <- vkAuth(client_id = 1,client_secret = "H2Pk8htyFD8024mZaPHm")

##Get Account list
my_vk_acc <- vkgetAccounts(my_tok$access_token)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
