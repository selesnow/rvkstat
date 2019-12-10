\name{vkGetGroupStatCity}
\alias{vkGetGroupStatCity}
\title{Statistics of the Vkontakte community visitors by cities.}
\description{The function vkGetGroupStatCity allows you to get data about the city of community visitors by date.}
\usage{
vkGetGroupStatCity(date_from = Sys.Date(), 
                   date_to = Sys.Date(), 
                   group_id = NULL, 
                   access_token = NULL)
}
\arguments{
  \item{date_from}{The starting date of the displayed statistics in the format YYYY-MM-DD.}
  \item{date_to}{The end date of the displayed statistics in the format YYYY-MM-DD.}
  \item{group_id}{Community ID.}
  \item{access_token}{API access token, obtained using the functions vkAuth or vkGetToken}
}
\value{Date frame with statistics on community visitors with the following values:
\item{Date}{date for which statistics is given.}
\item{Visitors}{number of unique visitors.}
\item{CityID}{city identifier or "other" for the "other cities" section.}
\item{CityName}{city name.}
}
\author{Alexey Seleznev}
\examples{
\dontrun{
## auth
my_tok <- vkAuth(app_id = 1,app_secret = "H2Pk8htyFD8024mZaPHm")

## load statistic
communityDataCity <- vkGetGroupStatCity(date_from = "2016-01-01",
										date_to = "2016-04-01",
										group_id = 1,
										access_token = my_tok$access_token)
}
}
