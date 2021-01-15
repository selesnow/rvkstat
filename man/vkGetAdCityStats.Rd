\name{vkGetAdCityStats}
\alias{vkGetAdCityStats}
\title{Statistics on Audience Coverage in The Context of Cities.}
\description{Returns statistics on audience reach by advertising campaign and ads by city.}
\usage{
vkGetAdCityStats(
    account_id   = vkCurrentAdAccount(),
    ids_type     = c("campaign", "ad"),
    ids          = NULL,
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
  \item{account_id}{Advertising account ID, a list of all available advertising accounts can be obtained using the function vkGetAdAccounts.}
  \item{ids_type}{The type of objects requested, which are listed in the ids parameter. Valid ad values are ads, campaigns are campaigns.}
  \item{ids}{Vector id of the requested ads, campaigns, clients or account, depending on what is specified in the ids_type parameter.}
  \item{period}{The method of grouping data by date. day - statistics by days, month - statistics by months, overall - statistics for all time. Temporary restrictions are given by the arguments date_from and date_to.}
  \item{date_from}{The starting date of the displayed statistics in the format YYYY-MM-DD.}
  \item{date_to}{The end date of the displayed statistics in the format YYYY-MM-DD.}
  \item{username}{Your vkontakte login.}
  \item{api_version}{Vkontakte API version.}
  \item{token_path}{Path to dir with credentials}
  \item{access_token}{API access tokens obtained using vkAuth or vkGetToken functions}
}
\value{Date frame with the following values:
  \item{id}{id of the object from the ids argument.}
  \item{day}{(if the period is equal to day) day in the format YYYY-MM-DD.}
  \item{month}{(if period is equal to month) - day in the format YYYY-MM.}
  \item{day_from}{(if period is overall) the start date of the reporting period.}
  \item{day_to}{(if period is overall) the finish date of the reporting period.}
  \item{type}{the type of the object from the ids_type parameter.}
  \item{city_id}{city id or other for other cities.}
  \item{city_name}{city name.}
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

# 1.Get a static report on audience coverage in the context 
# of cities by advertising campaigns by day
## 1.1. We get a list of advertising campaigns
camp <- vkGetAdCampaigns(account_id = 1)
## 1.2. We get statistics on advertising campaigns
vk_ad_city_stat_day <- vkGetAdCityStats(account_id = 1,
                                        ids_type = "campaign",
                                        ids = camp$id ,
                                        period = "day",
                                        date_from = "2010-01-01", 
                                        date_to = "2017-09-10")
										
										
# 2.Receive a static message on the ads in the context of months
## 2.1. We get a list of advertising campaigns
ads <- vkGetAds(account_id = account_id, access_token = my_tok$access_token)
## 2.2. Get ad statistics
vk_ad_city_stat_month <- vkGetAdCityStats(account_id = 1,
                                          ids_type = "ad",
                                          ids = ads$id ,
                                          period = "month",
                                          date_from = "2010-01-01", 
                                          date_to = "2017-09-10")
			
			
# 3.Receive a static report on audience coverage in the context 
# of cities by advertising campaigns without a temporary breakdown
## 3.1. We get a list of advertising campaigns
camp <- vkGetAdCampaigns(account_id = 1)
##3.2. Get statistics on advertising campaigns
vk_ad_city_stat_total <- vkGetAdCityStats(account_id = 1,
                                          ids_type = "campaign",
                                          ids = camp$id ,
                                          period = "overall",
                                          date_from = "2010-01-01", 
                                          date_to = "2017-09-10")

}
}
