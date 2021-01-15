\name{vkGetAds}
\alias{vkGetAds}
\title{List of Ads From 'Vkontakte'.}
\description{Provide to get a list of advertisements from the advertising office 'Vkontakte'.}
\usage{
vkGetAds(
    account_id      = vkCurrentAdAccount(),
    client_id       = vkCurrentClientAccount(),
    include_deleted = TRUE,
    only_deleted    = FALSE,
    campaign_ids    = "null",
    ad_ids          = "null",
    status_names    = TRUE,
    username        = getOption("rvkstat.username"),
    api_version     = getOption("rvkstat.api_version"),
    token_path      = vkTokenPath(),
    access_token    = getOption("rvkstat.access_token")
)
}
\arguments{
  \item{account_id}{The ID of the advertising account, a list of all available advertising offices can be obtained using the function vkGetAdAccounts.}
  \item{client_id}{Client identifier from which advertisements are requested. Available and required for advertising agencies.}
  \item{include_deleted}{Boolean TRUE or FALSE, flag, specifying the need to display archived ads.}
  \item{only_deleted}{Boolean TRUE or FALSE, flag, get only deleted ads.}
  \item{campaign_ids}{Numeric vector, filter by advertising campaigns.}
  \item{ad_ids}{Numeric vector, ad filter.}
  \item{status_names}{If TRUE you get status names, in FALSE status Ids.}
  \item{username}{Your vkontakte login.}
  \item{api_version}{Vkontakte API version.}
  \item{token_path}{Path to dir with credentials}
  \item{access_token}{API access tokens obtained using vkAuth or vkGetToken functions}
}
\details{
If campaign_ids and ad_ids filters are enabled at the same time, the following ads will be displayed:
1. If the ad id is specified in ad_ids, then it is displayed.
2. If the ad belongs to an advertising campaign whose id is specified in campaign_ids, then it is displayed.
3. If there is an ad with the id specified in ad_ids and it belongs to a campaign whose id is specified in campaign_ids, then this ad campaign is ignored, i.e. for her, rule 2 does not work.

No more than 2000 ads are output from no more than 2000 campaigns.
}
\value{Date frame with the following values:
  \item{id}{ad id.}
  \item{campaign_id}{campaign id.}
  \item{name}{name of the announcement.}
  \item{status}{ad status.}
  \item{ad_format}{ad format.}
  \item{approved}{ad moderation status.}
  \item{all_limit}{total ad limit in rubles. 0 - no limit is set.}
  \item{create_time}{date and time of ad creation.}
  \item{9. update_time}{the date and time of the last ad change.}
  \item{10. age_restriction}{label about ad age limit.}
  \item{11. category1_id}{ID of the subject or subsection of the subject of the announcement, a list of topics can be obtained using the function vkGetAdCategories.}
  \item{12. category2_id}{Subject ID or sub topic of the ad. Additional topics, a list of topics can be obtained using the function vkGetAdCategories.}
  \item{13. cost_type}{type of payment.}
  \item{14. cpc}{price per switch in kopecks.}
  \item{15. cpm}{price per 1000 impressions in kopecks.}
  \item{16. impressions_limit}{limit the number of times this ad is shown per user.}
  \item{17. impressions_limited}{a sign that the number of ad impressions per user is limited.} 
  \item{18. ad_platform}{advertising platforms where the ad will be displayed. (if ad_format is 1, 0 - VKontakte and partner sites, 1 - only VKontakte, (if ad_format is 9) all - all sites, desktop - full version of the site, mobile - mobile site and applications.)}
  \item{19. video}{1 - the ad is a video ad.}
}
\author{
Alexey Seleznev
}
\references{
Documentation for API method ads.getAds: https://vk.com/dev/ads.getAds
}
\examples{
\dontrun{
## auth
my_tok <- vkAuth(app_id = 1,app_secret = "H2Pk8htyFD8024mZaPHm")
# ads list
my_vk_ads <- vkGetAds(account_id = 11111111, 
                      access_token = my_tok$access_token)
}
}
