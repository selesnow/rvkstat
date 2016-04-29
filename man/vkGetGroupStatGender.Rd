\name{vkGetGroupStatGender}
\alias{vkGetGroupStatGender}
\title{Get data about communities by user's gender}
\description{vkGetGroupStatGende get data about views vk.com communities by date and user's gender}
\usage{
vkGetGroupStatGender(date_from = Sys.Date(), date_to = Sys.Date(), group_id = NULL, access_token = NULL)
}

\arguments{
  \item{date_from}{Start reporting date as YYYY-MM-DD.}
  \item{date_to}{End reporting date as YYYY-MM-DD.}
  \item{group_id}{Communiti id.}
  \item{access_token}{Your developer token vkontakte api which you get by function vkGetToken}
}
\value{Data frame with daily data about users by gender}
\author{Alexey Seleznev}
\examples{
##---- Get data about users by gender
communityDataGender <- vkGetGroupStatGender(date_from = "2016-01-01",
											date_to = "2016-04-01",
											group_id = 1,
											access_token = myToken)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
