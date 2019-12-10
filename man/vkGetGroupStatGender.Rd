\name{vkGetGroupStatGender}
\alias{vkGetGroupStatGender}
\title{Loading data by gender of the community visitors}
\description{Allows you to download data on the gender of community visitors by date.}
\usage{
vkGetGroupStatGender(date_from = Sys.Date(), 
                     date_to = Sys.Date(), 
                     group_id = NULL, 
                     access_token = NULL)
}

\arguments{
  \item{date_from}{The start date of the displayed statistics in the format YYYY-MM-DD.}
  \item{date_to}{End date of the displayed statistics in the format YYYY-MM-DD.}
  \item{group_id}{Community ID.}
  \item{access_token}{API access token, obtained using the functions vkAuth or vkGetToken}
}
\value{Date frame with statistics on community visitors with the following values:
\item{1. Date}{the date for which statistics are given.}
\item{2. Visitors}{number of unique visitors.}
\item{3. Gender}{gender ("m" is male, "f" is female).}
}
\author{Alexey Seleznev}
\examples{
\dontrun{
## auth
my_tok <- vkAuth(app_id = 1,app_secret = "H2Pk8htyFD8024mZaPHm")

## load data about users by gender
communityDataGender <- vkGetGroupStatGender(date_from = "2016-01-01",
                                            date_to = "2016-04-01",
											group_id = 1,
											access_token = my_tok$access_token)
}
}
