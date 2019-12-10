\name{vkGetGroupStat}
\alias{vkGetGroupStat}
\title{Statistics on visiting the community in 'Vkontakte'.}
\description{Load data from the 'Vkontakte' communities by the number of views, subscriptions, replies and community visitors by date.}
\usage{
vkGetGroupStat(date_from = Sys.Date(), 
               date_to = Sys.Date(), 
               group_id = NULL, access_token = NULL)
}
\arguments{
  \item{date_from}{The starting date of the displayed statistics in the format YYYY-MM-DD.}
  \item{date_to}{The end date of the displayed statistics in the format YYYY-MM-DD.}
  \item{group_id}{Community ID.}
  \item{access_token}{API access token, obtained using the functions vkAuth or vkGetToken}
}
\value{Date frame with community statistics with the following values:
\item{1. day}{date for which statistics is given.}
\item{2. views}{number of views.}
\item{3. visitors}{number of unique visitors.}
\item{4. total_reach}{full coverage.}
\item{5. subscribers_reach}{subscribers reach.}
\item{6. subscribed}{number of new subscribers.}
\item{7. unsubscribed}{number of unsubscribed.}
}
\author{
Alexey Seleznev
}

\examples{
\dontrun{
## auth
my_tok <- vkAuth(app_id = 1,app_secret = "H2Pk8htyFD8024mZaPHm")

## Getting community statistics
communityData <- vkGetGroupStat(date_from = "2016-01-01",
                               date_to = "2016-04-01",
                               group_id = 1,
                               access_token = my_tok$access_token)
}
}
