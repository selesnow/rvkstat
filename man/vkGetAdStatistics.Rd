\name{vkGetAdStatistics}
\alias{vkGetAdStatistics}
\title{Statistics of advertising in 'VKontakte'.}
\description{returns performance statistics for advertisements, campaigns, customers, or the entire account.}
\usage{
vkGetAdStatistics(
    account_id   = vkCurrentAdAccount(),
    ids_type     = c("office", "client", "campaign", "ad"),
    ids,
    period       = c("day", "week", "month", "year", "overall"),
    date_from    = Sys.Date() - 30,
    date_to      = Sys.Date(),
    username     = getOption("rvkstat.username"),
    api_version  = getOption("rvkstat.api_version"),
    token_path   = vkTokenPath(),
    access_token = getOption("rvkstat.access_token")
)
}
\arguments{
  \item{account_id}{The ID of the advertising account, a list of all available advertising offices can be obtained using the function vkGetAdAccounts.}
  \item{ids_type}{The type of objects requested that are listed in the ids parameter. Valid ad values are ads, campaign campaigns, client clients, office office.}
  \item{ids}{Vector id of the requested ads, campaigns, clients or account, depending on what is specified in the ids_type parameter.}
  \item{period}{The method of grouping data by date. day - statistics by days, month - statistics by months, overall - statistics for all time. Temporary restrictions are given by the arguments date_from and date_to.}
  \item{date_from}{The starting date of the displayed statistics in the format YYYY-MM-DD.}
  \item{date_to}{The end date of the displayed statistics in the format YYYY-MM-DD.}
  \item{username}{Your vkontakte login.}
  \item{api_version}{Vkontakte API version.}
  \item{token_path}{Path to dir with credentials}
  \item{access_token}{API access tokens obtained using vkAuth or vkGetToken functions}
}
\value{Date frame with advertising statistics with the following values:
\item{1. id}{id of the object from the ids argument.}
\item{2. day}{(if the period is equal to day) day in the format YYYY-MM-DD.}
\item{3. month}{(if period is equal to month) - day in the format YYYY-MM.}
\item{4. day_from}{(if period is overall) the start date of the reporting period.}
\item{5. day_to}{(if period is overall) end date of the reporting period.}
\item{6. type}{object type from the ids_type parameter.}
\item{7. spent}{money spent.}
\item{8. impressions}{number of views.}
\item{9. clicks}{number of unique visitors.}
\item{10. reach}{(if ids_type is ad or campaign and period is equal to day or month) - coverage.}
\item{11. video_views}{(if ids_type is ad) - video views (for video ads).}
\item{12. video_views_half}{(if ids_type is ad) - half the video views (for video ads)}
\item{13. video_views_full}{(if ids_type is ad) - views of the whole video (for video ads).}
\item{14. video_clicks_site}{(if ids_type is equal to ad) - transitions to the advertiser’s website from video ads (for video ads).}
\item{15. join_rate}{(if ids_type is ad or campaign) - group membership, event, subscriptions to a public page or application settings (only if the ad contains a direct link to the corresponding VK page).}
\item{16. lead_form_sends}{ount of sended lead forms from your ads.}
}
\author{
Alexey Seleznev
}
\references{
Documentation for API method ads.getStatistics: https://vk.com/dev/ads.getStatistics
}
\examples{
\dontrun{
# 1.Get a static message on advertising 
# campaigns in the context of days
## 1.1. We get a list of advertising campaigns
camp <- vkGetAdCampaigns(account_id = 1, access_token = my_tok$access_token)
## 1.2. We get statistics on advertising campaigns
vk_stat_by_campaign <- vkGetAdStatistics(account_id = 1,
                                         ids_type = "campaign",
                                         ids = camp$id ,
                                         period = "day",
                                         date_from = "2010-01-01", 
                                         date_to = "2017-09-10")
										
										
# 2.Receive a static message on the ads in the context of months
## 2.1. We get a list of advertising campaigns
ads <- vkGetAds(account_id = account_id)
## 2.2. Get ad statistics
vk_stat_by_ads <- vkGetAdStatistics(account_id = 1,
                                    ids_type = "ad",
                                    ids = ads$id ,
                                    period = "month",
                                    date_from = "2010-01-01", 
                                    date_to = "2017-09-10")
			
			
# 3.Receive the general static of the advertising cabinet, in this example 
# it is assumed that the id of the advertising cabinet is 1
vk_stat_by_account <- vkGetAdStatistics(account_id = 1,
                                        ids_type = "office",
                                        ids = 1,
                                        period = "overall",
                                        date_from = "2010-01-01", 
                                        date_to = "2017-09-10")

}
}
