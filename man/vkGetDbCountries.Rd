\name{vkGetDbCountries}
\alias{vkGetDbCountries}
\title{Country Dictionary.}
\description{Get list of countries.}
\usage{
vkGetDbCountries(need_all = TRUE, code = NULL, api_version = NULL,
                 access_token = NULL)
}
\arguments{
  \item{need_all}{Boolean TRUE or FALSE, flag — return a list of all countries.}
  \item{code}{Text vector, two-letter codes of countries in ISO 3166-1 alpha-2, for which you need to give information. Example c ("RU", "UA", "BY"), a list of all codes can be viewed at the link - https://vk.com/dev/country_codes.}
  \item{access_token}{API access token, obtained using the functions vkAuth or vkGetToken}
  \item{api_version}{Vkontakte API version for send rquest.}
}
\value{Date frame with community statistics with the following values:
\item{1. cid}{country id.}
\item{2. title}{country name.}
}
\details{
If the need_all and code parameters are not specified, then a short list of countries located closest to the current user's country is returned. If the need_all parameter is specified, a list of all countries will be returned. If the code parameter is specified, only countries with the listed ISO 3166-1 alpha-2 codes will be returned.
A list of all country codes can be obtained at the link - https://vk.com/dev/country_codes
}
\author{
Alexey Seleznev
}

\examples{
\dontrun{
## auth
my_tok <- vkAuth(app_id = 1, app_secret = "H2Pk8htyFD8024mZaPHm")

## get dictionary
vk_countries <- vkGetDbCountries(need_all = T,
                                 code = c("RU","UA","BY"),
                                 access_token = my_tok$access_token)

}
}
