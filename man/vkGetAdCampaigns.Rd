\name{vkGetAdCampaigns}
\alias{vkGetAdCampaigns}
\title{Campaign list}
\description{Returns a list of available advertising campaigns from the advertising office Vkontakte.}
\usage{
vkGetAdCampaigns(
  account_id      = vkCurrentAdAccount(),
  client_id       = vkCurrentClientAccount(),
  include_deleted = TRUE,
  campaign_ids    = "null",
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
  \item{campaign_ids}{Campaing ids.}
  \item{username}{Your vkontakte login.}
  \item{api_version}{Vkontakte API version.}
  \item{token_path}{Path to dir with credentials}
  \item{access_token}{API access tokens obtained using vkAuth or vkGetToken functions}
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
\references{
Documentation for API method ads.getCampaigns: https://vk.com/dev/ads.getCampaigns
}
\examples{
\dontrun{
## get campaing list
my_vk_camp <- vkGetAdCampaigns(account_id = 1)
}
}
