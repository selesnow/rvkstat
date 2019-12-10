\name{vkGetAdsLayout}
\alias{vkGetAdsLayout}
\title{Appearance of Advertisements.}
\description{Allows you to get a list of advertisements and a description of their appearance from the advertising office 'Vkontakte'.}
\usage{
vkGetAdsLayout(account_id = NULL, client_id = NULL, include_deleted =
               TRUE, campaign_ids = "null", ad_ids = "null",
               api_version = NULL, status_names = TRUE, access_token
               = NULL)
}
\arguments{
  \item{account_id}{Advertising account ID, a list of all available advertising accounts can be obtained using the function vkGetAdAccounts.}
  \item{client_id}{Client identifier from which advertisements are requested. Available and required for advertising agencies.}
  \item{include_deleted}{Boolean TRUE or FALSE, flag, specifying whether to display archived ads.}
  \item{campaign_ids}{Numeric vector, filter by advertising campaigns.}
  \item{ad_ids}{Numeric vector, ad filter.}
  \item{status_names}{Numeric vector, filter by advertising campaigns.}
  \item{api_version}{Vkontakte API version.}
  \item{access_token}{API access token, obtained using the functions vkAuth or vkGetToken}
}
\details{
If campaign_ids and ad_ids filters are enabled at the same time, the following ads will be displayed:
1. If the ad id is specified in ad_ids, then it is displayed.
2. If the ad belongs to an advertising campaign whose id is specified in campaign_ids, then it is displayed.
3. If there is an ad with the id specified in ad_ids and it belongs to a campaign whose id is specified in campaign_ids, then this ad campaign is ignored, i.e. for her, rule 2 does not work.

No more than 2000 ads are output from no more than 2000 campaigns.

The function is based on the API method ads.getAdsLayout, you can find out all the details of its work at https://vk.com/dev/ads.getAdsLayout.
}
\value{Data frame with next values:
\item{1. id}{ad id.}
\item{2. campaign_id}{campaign id.}
\item{3. ad_format}{ad format.}
\item{4. cost_type}{type of payment.}
\item{5. video}{1 - the ad is a video ad.}
\item{6. title}{ad title.}
\item{7. description}{description of the advertisement.}
\item{8. link_url}{link to the advertised object.}
\item{9. link_domain}{domain of the advertised site..}
\item{10. preview_link}{link by clicking on which you can view the advertisement as it looks on the site. The link is available for 30 minutes after the vkGetAdsLayout function.}
\item{11. image_src}{ad image url.}
}
\author{
Alexey Seleznev
}

\examples{
\dontrun{
## auth
my_tok <- vkAuth(app_id = 1,
                 app_secret = "H2Pk8htyFD8024mZaPHm")
# get Ads Layouts
my_vk_ads <- vkGetAdsLayout(account_id = 11111111, 
                            access_token = my_tok$access_token)
}
}
