\name{vkGetDbCities}
\alias{vkGetDbCities}
\title{City Dictionary.}
\description{Returns a list of cities and countries.}
\usage{
vkGetDbCities(
    country_id,
    region_id    = NULL,
    q            = NULL,
    need_all     = TRUE,
    username     = getOption("rvkstat.username"),
    api_version  = getOption("rvkstat.api_version"),
    token_path   = vkTokenPath(),
    access_token = getOption("rvkstat.access_token")
)
}
\arguments{
  \item{country_id}{country identifier obtained using the vkGetDbCountries function.}
  \item{region_id}{identifier of the region whose city you want to receive. (this parameter is optional.}
  \item{q}{search query string. For example, "Saint". The maximum string length is 15 characters.}
  \item{need_all}{Boolean TRUE or FALSE, flag — return a list of all countries.}
  \item{username}{Your vkontakte login.}
  \item{api_version}{Vkontakte API version.}
  \item{token_path}{Path to dir with credentials}
  \item{access_token}{API access tokens obtained using vkAuth or vkGetToken functions}
}
\value{Date frame with community statistics with the following values:
\item{cid}{country id.}
\item{title}{country name.}
\item{important }{mark key cities for the current user.}
\item{area}{area.}
\item{region }{region.}
}
\details{
 the q parameter is not specified, then a list of the largest cities in the given country will be returned. If the q parameter is specified, a list of cities that are relevant to the search query will be returned.
}
\author{
Alexey Seleznev
}
\references{
Documentation for API method database.getCities: https://vk.com/dev/database.getCities
}
\examples{
\dontrun{
## Get a list of cities for Ukraine, because Ukraine id = 2
vk_cities <- vkGetDbCities(country_id = 2)

## Get the list of cities for the search query "St."
vk_cities_search <- vkGetDbCities(country_id = 1,
                                  q = "St.")

}
}
