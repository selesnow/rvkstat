\name{vkGetDbCountries}
\alias{vkGetDbCountries}
\title{Country Dictionary.}
\description{Get list of countries.}
\usage{
vkGetDbCountries(
    need_all     = TRUE,
    code         = NULL,
    username     = getOption("rvkstat.username"),
    api_version  = getOption("rvkstat.api_version"),
    token_path   = vkTokenPath(),
    access_token = getOption("rvkstat.access_token")
)
}
\arguments{
  \item{need_all}{Boolean TRUE or FALSE, flag — return a list of all countries.}
  \item{code}{Text vector, two-letter codes of countries in ISO 3166-1 alpha-2, for which you need to give information. Example c ("RU", "UA", "BY"), a list of all codes can be viewed at the link - https://vk.com/dev/country_codes.}
  \item{username}{Your vkontakte login.}
  \item{api_version}{Vkontakte API version.}
  \item{token_path}{Path to dir with credentials}
  \item{access_token}{API access tokens obtained using vkAuth or vkGetToken functions}
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
\references{
Documentation for API method database.getCountries: https://vk.com/dev/database.getCountries
}
\examples{
\dontrun{
## get dictionary
vk_countries <- vkGetDbCountries(need_all = T,
                                 code = c("RU","UA","BY"))

}
}
