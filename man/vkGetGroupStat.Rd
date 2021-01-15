\name{vkGetGroupStat}
\alias{vkGetGroupStat}
\title{Statistics on visiting the community in 'Vkontakte'.}
\description{Load data from the 'Vkontakte' communities by the number of views, subscriptions, replies and community visitors by date.}
\usage{
vkGetGroupStat(
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
\references{
Documentation for API method stats.get: https://vk.com/dev/stats.get
}
\examples{
\dontrun{
## Getting community statistics
communityData <- vkGetGroupStat(date_from = "2021-01-01",
                               date_to = "2021-01-12",
                               group_id = 1)
}
}
