\name{vkGetAdPostsReach}
\alias{vkGetAdPostsReach}
\title{Statistics on The Coverage of Advertising Entries 'Vkontakte'.}
\description{Returns detailed statistics on the reach of advertisements from ads and campaigns to promote community entries.}
\usage{
vkGetAdPostsReach(
    account_id   = vkCurrentAdAccount(),
    ids_type     = "campaign",
    ids          = NULL,
    username     = getOption("rvkstat.username"),
    api_version  = getOption("rvkstat.api_version"),
    token_path   = vkTokenPath(),
    access_token = getOption("rvkstat.access_token")
)
}
\arguments{
  \item{account_id}{Advertising account ID, a list of all available advertising accounts can be obtained using the function vkGetAdAccounts.}
  \item{ids_type}{The type of objects requested, which are listed in the ids parameter. Valid ad values are ads, campaigns are campaigns.}
  \item{ids}{Vector of id of the requested ads, campaigns, clients or account, depending on what is specified in the ids_type parameter.}
  \item{username}{Your vkontakte login.}
  \item{api_version}{Vkontakte API version.}
  \item{token_path}{Path to dir with credentials}
  \item{access_token}{API access tokens obtained using vkAuth or vkGetToken functions}
}
\value{Date frame with community statistics with the following values:
\item{1. id}{object ID from the ids parameter.}
\item{2. reach_subscribers}{reach subscribers.}
\item{3. reach_total}{total coverage.}
\item{4. links}{follow the link.}
\item{5. to_group}{transitions to the community.}
\item{6. join_group}{entry into the community.}
\item{7. report}{number of complaints about the record.}
\item{8. hide}{number of entries hidden.}
\item{9. unsubscribe}{number of unsubscribe members.}
\item{10. video_views_start}{number of starts to watch a video.}
\item{11. video_views_3s}{number of video inspections up to 3 seconds.}
\item{12. video_views_25p}{number of video inspections up to 25 percent.}
\item{13. video_views_50p}{number of video inspections up to 50 percent.}
\item{14. video_views_75p}{number of video inspections up to 75 percent.}
\item{15. video_views_100p}{The number of video inspections is up to 100 percent.}
}
\details{
Campaign statistics are only available for campaigns created since December 20, 2016.
The video_views_start, video_views_3s, video_views_25p, video_views_50p, video_views_75p, video_views_100p fields with video statistics data are returned only for ads or campaigns from videos created after January 26, 2017.
}
\author{
Alexey Seleznev
}
\references{
Documentation for API method ads.getPostsReach: https://vk.com/dev/ads.getPostsReach
}
\examples{
\dontrun{
## auth
my_tok <- vkAuth(app_id = 1, app_secret = "H2Pk8htyFD8024mZaPHm")

## camp list
camp <- vkGetAdCampaigns(account_id = 1, 
                         access_token = my_tok$access_token)

## Get statistics on advertising campaigns
post_reach <- vkGetAdPostsReach(account_id = 1600134264,
                                ids_type = "campaign",
                                ids = camp$id,
                                access_token = my_tok$access_token)

}
}
