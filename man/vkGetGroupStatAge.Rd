\name{vkGetGroupStatAge}
\alias{vkGetGroupStatAge}
\title{Get data about communities by user's age categories}
\description{vkGetGroupStatCity get data about views vk.com communities by date user's age categories (12-18, 18-21, 21-24, 24-27, 27-30, 30-35, 35-45, 45-100)}
\usage{
vkGetGroupStatAge(date_from = Sys.Date(), date_to = Sys.Date(), group_id = NULL, access_token = NULL)
}
\arguments{
  \item{date_from}{Start reporting date as YYYY-MM-DD.}
  \item{date_to}{End reporting date as YYYY-MM-DD.}
  \item{group_id}{Communiti id.}
  \item{access_token}{Your developer token vkontakte api which you get by function vkGetToken}
}
\value{Data frame with daily data about users by age group}
\author{Alexey Seleznev}

\examples{
##---- Get data about visitors by age group
communityDataAge <- vkGetGroupStatAge(date_from = "2016-01-01",
                               date_to = "2016-04-01",
                               group_id = 1,
                               access_token = myToken)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
