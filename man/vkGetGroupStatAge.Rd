\name{vkGetGroupStatAge}
\alias{vkGetGroupStatAge}
\title{Community Statistics by User Age Bucket}
\description{Load data about community visitors by age group (12-18, 18-21, 21-24, 24-27, 27-30, 30-35, 35-45, 45-100) on dates.}
\usage{
vkGetGroupStatAge(
    date_from    = Sys.Date() - 7, 
    date_to      = Sys.Date(), 
    group_id     = NULL, 
    interval     = "day",
    intervals_count = NULL,
    filters      = NULL,
    stats_groups = c("visitors", "reach", "activity"),
    username     = getOption("rvkstat.username"),
    api_version  = getOption("rvkstat.api_version"),
    token_path   = vkTokenPath(),
    access_token = getOption("rvkstat.access_token")
)
}
\arguments{
  \item{date_from}{The starting date of the displayed statistics in the format YYYY-MM-DD.}
  \item{date_to}{The end date of the displayed statistics in the format YYYY-MM-DD.}
  \item{group_id}{Community ID.}
  \item{interval}{Time intervals. Possible values: day, week, month, year, all.}
  \item{intervals_count}{Number of time intervals.}
  \item{filters}{A list of words separated by commas}
  \item{stats_groups}{Filter for getting data on a specific block of community statistics. Possible values: visitors, reach, activity.}
  \item{username}{Your vkontakte login.}
  \item{api_version}{Vkontakte API version.}
  \item{token_path}{Path to dir with credentials}
  \item{access_token}{API access tokens obtained using vkAuth or vkGetToken functions}
}
\value{Date frame with statistics on community visitors with the following values:
\item{1. Date}{the date for which statistics are given.}
\item{2. Visitors}{number of unique visitors.}
\item{3. AgeGroup}{age interval.}
}
\author{Alexey Seleznev}
\references{
Documentation for API method stats.get: https://vk.com/dev/stats.get
}
\examples{
\dontrun{
## auth
my_tok <- vkAuth(app_id = 1,app_secret = "H2Pk8htyFD8024mZaPHm")

## Get statistics on age groups of visitors
communityDataAge <- vkGetGroupStatAge(date_from = "2016-01-01",
                                      date_to = "2016-04-01",
                                      group_id = 1,
                                      access_token = my_tok$access_token)
}
}
