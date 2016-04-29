\name{vkGetGroupStat}
\alias{vkGetGroupStat}
\title{Get data about communities number views and visitors by date}
\description{vkGetGroupStat get data from vk.com about number views, subscribeds, unsubscribes and visitors vk.com communities by date}
\usage{
vkGetGroupStat(date_from = Sys.Date(), date_to = Sys.Date(), group_id = NULL, access_token = NULL)
}
\arguments{
  \item{date_from}{Start reporting date as YYYY-MM-DD.}
  \item{date_to}{End reporting date as YYYY-MM-DD.}
  \item{group_id}{Communiti id.}
  \item{access_token}{Your developer token vkontakte api which you get by function vkGetToken}
}
\value{Data frame with total daily data about by views, visits, subscribeds, unsubscribes}
\author{
Alexey Seleznev
}

\examples{
##Get daily data
communityData <- vkGetGroupStat(date_from = "2016-01-01",
                               date_to = "2016-04-01",
                               group_id = 1,
                               access_token = myToken)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
