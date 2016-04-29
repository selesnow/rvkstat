\name{vkGetGroupStatCountries}
\alias{vkGetGroupStatCountries}
\title{Get data about communities by countries}
\description{vkGetGroupStatCountries get data about visitors vk.com communities by date and countries}
\usage{
vkGetGroupStatCountries(date_from = Sys.Date(), date_to = Sys.Date(), group_id = NULL, access_token = NULL)
}
\arguments{
  \item{date_from}{Start reporting date as YYYY-MM-DD.}
  \item{date_to}{End reporting date as YYYY-MM-DD.}
  \item{group_id}{Communiti id.}
  \item{access_token}{Your developer token vkontakte api which you get by function vkGetToken}
}
\value{Data frame with daily data about visits by Country}
\author{Alexey Seleznev}
\examples{
##---- Get data about visits by Country
communityDataCountry <- vkGetGroupStatCountries(date_from = "2016-01-01",
											date_to = "2016-04-01",
											group_id = 1,
											access_token = myToken)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
