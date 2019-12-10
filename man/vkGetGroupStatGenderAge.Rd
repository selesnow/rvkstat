\name{vkGetGroupStatGenderAge}
\alias{vkGetGroupStatGenderAge}
\title{Statistics on Age Groups And Gender of The 'VKontakte' Community.}
\description{Provide to load to download statistics on the sex and age group of community visitors by date.}
\usage{
vkGetGroupStatGenderAge(date_from = Sys.Date(), 
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
\item{1. Date}{the date for which statistics are given.}
\item{2. Visitors}{number of unique visitors.}
\item{3. Gender}{gender ("m" is male, "f" is female).}
\item{4. AgeGroup}{age interval.}
}
\author{Alexey Seleznev}
\examples{
\dontrun{
## auth
my_tok <- vkAuth(app_id = 1,app_secret = "H2Pk8htyFD8024mZaPHm")

## Loading data by users by gender and age group
communityDataGenderAge <- vkGetGroupStatGenderAge(
                            date_from = "2016-01-01",
												    date_to = "2016-04-01",
												    group_id = 1,
												    access_token = my_tok$access_token)
}
}
