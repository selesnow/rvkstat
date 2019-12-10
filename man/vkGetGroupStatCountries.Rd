\name{vkGetGroupStatCountries}
\alias{vkGetGroupStatCountries}
\title{Statistics of The Vkontakte Community Visitors By Country.}
\description{Allows you to get data about the city of community visitors by date.}
\usage{
vkGetGroupStatCountries(date_from = Sys.Date(), 
                        date_to = Sys.Date(), 
                        group_id = NULL, 
                        access_token = NULL)
}
\arguments{
  \item{date_from}{The start date of the displayed statistics in the format YYYY-MM-DD.}
  \item{date_to}{The end date of the displayed statistics in the format YYYY-MM-DD.}
  \item{group_id}{Community ID.}
  \item{access_token}{API access token, obtained using the functions vkAuth or vkGetToken}
}
\value{Date frame with statistics on community visitors with the following values:
\item{Date}{date for which statistics is given.}
\item{Visitors}{number of unique visitors.}
\item{CountryID}{country identifier}
\item{CountryCode}{two-letter country code (for example, "RU").}
\item{CountryName}{country name.}
}
\author{Alexey Seleznev}
\examples{
\dontrun{
## auth
my_tok <- vkAuth(app_id = 1,app_secret = "H2Pk8htyFD8024mZaPHm")

## load data
communityDataCountry <- vkGetGroupStatCountries(date_from = "2016-01-01",
											date_to = "2016-04-01",
											group_id = 1,
											access_token = my_tok$access_token)
}
}
