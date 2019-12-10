\name{vkGetAdGenderStats}
\alias{vkGetAdGenderStats}
\title{Statistics on Audience Coverage by Gender.}
\description{Returns audience coverage statistics for advertising campaigns and ads by gender.}
\usage{
vkGetAdGenderStats(account_id = NULL, ids_type = "campaign", ids = NULL,
                 period = "day", date_from = Sys.Date() - 30, date_to =
                 Sys.Date(), api_version = NULL, access_token = NULL)
}
\arguments{
  \item{account_id}{Advertising account ID, a list of all available advertising accounts can be obtained using the function vkGetAdAccounts.}
  \item{ids_type}{The type of objects requested, which are listed in the ids parameter. Valid values: ad - are ads, campaigns - are campaigns.}
  \item{ids}{Vector id of the requested ads, campaigns, clients or account, depending on what is specified in the ids_type parameter.}
  \item{period}{The method of grouping data by date. day - statistics by days, month - statistics by months, overall - statistics for all time. Temporary restrictions are given by the arguments date_from and date_to.}
  \item{date_from}{The starting date of the displayed statistics in the format YYYY-MM-DD.}
  \item{date_to}{The end date of the displayed statistics in the format YYYY-MM-DD.}
  \item{access_token}{API access token, obtained using the functions vkAuth or vkGetToken}
  \item{api_version}{Vkontakte API version.}
}
\value{Date frame with community statistics with the following values:
\item{1. id}{id of the object from the ids argument.}
\item{2. day}{(if the period is equal to day) day in the format YYYY-MM-DD.}
\item{3. month}{(if period is equal to month) - day in the format YYYY-MM.}
\item{4. day_from}{(if period is overall) the start date of the reporting period.}
\item{5. day_to}{(if period is overall) end date of the reporting period.}
\item{6. type}{object type from the ids_type parameter.}
\item{7. gender}{gender, f - female, m - male.}
\item{8. impressions_rate}{part of the audience that viewed the ad, from 0 to 1.}
\item{9. clicks_rate}{(the part of the audience that clicked on the ad, from 0 to 1.}
}
\author{
Alexey Seleznev
}

\examples{
\dontrun{
## auth
my_tok <- vkAuth(app_id = 1, app_secret = "H2Pk8htyFD8024mZaPHm")

# 1.Get a stat message on audience coverage by sex, 
# advertising campaigns in the context of days
## 1.1. We get a list of advertising campaigns
camp <- vkGetAdCampaigns(account_id = 1, access_token = my_tok$access_token)
## 1.2. We get statistics on advertising campaigns
vk_ad_gender_stat_day <- vkGetAdGenderStats(account_id = 1,
                                            ids_type = "campaign",
                                            ids = camp$id ,
                                            period = "day",
                                            date_from = "2010-01-01", 
                                            date_to = "2017-09-10",
                                            access_token = my_tok$access_token)
										
										
# 2.Receive a stat message on the ads in the context of months
## 2.1. We get a list of advertising campaigns
ads <- vkGetAds(account_id = account_id, access_token = my_tok$access_token)
## 2.2. Get ad statistics
vk_ad_gender_stat_month <- vkGetAdGenderStats(account_id = 1,
                                              ids_type = "ad",
                                              ids = ads$id ,
                                              period = "month",
                                              date_from = "2010-01-01", 
                                              date_to = "2017-09-10",
                                              access_token = my_tok$access_token)
			
			
# 3.Get a stat message on reaching the audience for 
# advertising campaigns without a temporary breakdown
## 3.1. We get a list of advertising campaigns
camp <- vkGetAdCampaigns(account_id = 1, access_token = my_tok$access_token)
## 3.2. We get statistics on advertising campaigns
vk_ad_gender_stat_total <- vkGetAdGenderStats(account_id = 1,
                                              ids_type = "campaign",
                                              ids = camp$id ,
                                              period = "overall",
                                              date_from = "2010-01-01", 
                                              date_to = "2017-09-10",
                                              access_token = my_tok$access_token)

}
}
