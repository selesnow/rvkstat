\name{vkGetAdAgeStats}
\alias{vkGetAdAgeStats}
\title{Statistics on Audience Coverage by Age.}
\description{Returns statistics on the reach of advertising campaigns and ads by age.}
\usage{
vkGetAdAgeStats(
    account_id   = getOption("rvkstat.account_id"),
    ids_type     = "campaign",
    ids,
    period       = c("day", "month", "overall"),
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
  \item{ids_type}{The type of objects requested that are listed in the ids parameter. Valid values "ad" - are ads, "campaigns" - are campaigns.}
  \item{ids}{Vector id of the requested ads, campaigns, clients or account, depending on what is specified in the ids_type parameter.}
  \item{period}{The way data is grouped by date is day-by-day statistics, month is month-by-month statistics, overall is all-time statistics. Time limits are specified in the date_from and date_to arguments.}
  \item{date_from}{The start date of the displayed statistics in the format YYYY-MM-DD.}
  \item{date_to}{End date of the displayed statistics in the format YYYY-MM-DD.}
  \item{username}{Your vkontakte login.}
  \item{api_version}{Vkontakte API version.}
  \item{token_path}{Path to dir with credentials}
  \item{access_token}{API access tokens obtained using vkAuth or vkGetToken functions}
}
\value{Date frame with community statistics with the following values:
  \item{id}{id of the object from the ids argument.}
  \item{day}{(if the period is equal to day) day in the format YYYY-MM-DD.}
  \item{month}{(if period is equal to month) - day in the format YYYY-MM.}
  \item{day_from}{(if period is overall) the start date of the reporting period.}
  \item{day_to}{(if period is overall) end date of the reporting period.}
  \item{type}{object type from the ids_type parameter.}
  \item{age}{age.}
  \item{impressions_rate}{part of the audience that viewed the ad, from 0 to 1.}
  \item{clicks_rate}{(the part of the audience that clicked on the ad, from 0 to 1.}
}
\author{
Alexey Seleznev
}
\references{
Documentation for API method ads.getDemographics: https://vk.com/dev/ads.getDemographics
}
\examples{
\dontrun{
## auth
my_tok <- vkAuth(app_id = 1, app_secret = "H2Pk8htyFD8024mZaPHm")

# 1.Get a static message on audience coverage by sex, 
# advertising campaigns in the context of days
## 1.1. We get a list of advertising campaigns
camp <- vkGetAdCampaigns(account_id = 1)
                         
## 1.2. We get statistics on advertising campaigns
vk_ad_age_stat_day <- vkGetAdAgeStats(account_id = 1,
                                      ids_type = "campaign",
                                      ids = camp$id ,
                                      period = "day",
                                      date_from = "2010-01-01", 
                                      date_to = "2017-09-10")
										
										
# 2.Receive a static message on the ads in the context of months
## 2.1. We get a list of advertising campaigns
ads <- vkGetAds(account_id = account_id)

## 2.2. Get ad statistics
vk_ad_age_stat_month <- vkGetAdAgeStats(account_id = 1,
                                        ids_type = "ad",
                                        ids = ads$id ,
                                        period = "month",
                                        date_from = "2010-01-01", 
                                        date_to = "2017-09-10")
			
			
# 3.Get a static message on reaching the audience for advertising campaigns 
# without a temporary breakdown
## 3.1. We get a list of advertising campaigns
camp <- vkGetAdCampaigns(account_id = 1)

## 3.2. We get statistics on advertising campaigns
vk_ad_age_stat_total <- vkGetAdAgeStats(account_id = 1,
                                        ids_type = "campaign",
                                        ids = camp$id ,
                                        period = "overall",
                                        date_from = "2010-01-01", 
                                        date_to = "2017-09-10")

}
}
