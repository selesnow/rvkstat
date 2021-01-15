\name{vkGetGroupStatGenderAge}
\alias{vkGetGroupStatGenderAge}
\title{Statistics on Age Groups And Gender of The 'VKontakte' Community.}
\description{Provide to load to download statistics on the sex and age group of community visitors by date.}
\usage{
vkGetGroupStatGenderAge(
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
\item{3. Gender}{gender ("m" is male, "f" is female).}
\item{4. AgeGroup}{age interval.}
}
\author{Alexey Seleznev}
\references{
Documentation for API method stats.get: https://vk.com/dev/stats.get
}
\examples{
\dontrun{
## Loading data by users by gender and age group
communityDataGenderAge <- vkGetGroupStatGenderAge(
                            date_from = "2016-01-01",
                            date_to = "2016-04-01",
                            group_id = 1,
                            access_token = my_tok$access_token)
}
}
