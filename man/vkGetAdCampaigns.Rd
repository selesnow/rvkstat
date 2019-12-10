\name{vkGetAdCampaigns}
\alias{vkGetAdCampaigns}
\title{Campaign list}
\description{Returns a list of available advertising campaigns from the advertising office Vkontakte.}
\usage{
vkGetAdCampaigns(account_id = NULL, client_id = NULL, include_deleted =
                 TRUE, campaign_ids = "null", api_version = NULL,
                 access_token = NULL)
}
\arguments{
  \item{account_id}{The ID of the advertising account, a list of all available advertising offices can be obtained using the function vkGetAdAccounts.}
  \item{client_id}{Client identifier from which advertisements are requested. Available and required for advertising agencies.}
  \item{include_deleted}{Boolean TRUE or FALSE, flag, specifying the need to display archived ads.}
  \item{campaign_ids}{Campaing ids.}
  \item{access_token}{API access token, obtained using the functions vkAuth or vkGetToken.}
  \item{api_version}{Vkontakte API version for send request.}
}
\author{
Alexey Seleznev
}
\value{Date frame with a list of advertising offices and their parameters with the following values:
  \item{id}{campaign ID.}
  \item{type}{campaign type.}
  \item{name}{campaign name.}
  \item{status}{campaign status.}
  \item{day_limit}{daily campaign limit in rubles.}
  \item{all_limit}{total campaign limit in rubles. }
  \item{start_time}{campaign start time.}
  \item{stop_time}{campaign stop time.}
  \item{create_time}{campaign creation time.}
  \item{update_time}{the last time the campaign was modified.}
}
\examples{
\dontrun{
## auth
my_tok <- vkAuth(app_id = 1,
                 app_secret = "H2Pk8htyFD8024mZaPHm")

## get campaing list
my_vk_camp <- vkGetAdCampaigns(account_id = 1, 
                               access_token = my_tok$access_token)
}
}
