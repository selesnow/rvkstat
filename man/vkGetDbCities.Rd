\name{vkGetDbCities}
\alias{vkGetDbCities}
\title{City Dictionary.}
\description{Returns a list of cities and countries.}
\usage{
vkGetDbCities(country_id = TRUE, region_id = NULL, q = NULL,
                 need_all = TRUE, api_version = NULL, access_token =
                 NULL)
}
\arguments{
  \item{country_id}{country identifier obtained using the vkGetDbCountries function.}
  \item{region_id}{identifier of the region whose city you want to receive. (this parameter is optional.}
  \item{q}{search query string. For example, "Saint". The maximum string length is 15 characters.}
  \item{need_all}{Boolean TRUE or FALSE, flag — return a list of all countries.}
  \item{access_token}{API access token, obtained using the functions vkAuth or vkGetToken}
  \item{api_version}{Vkontakte API version.}
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

\examples{
\dontrun{
## auth
my_tok <- vkAuth(app_id = 1, app_secret = "H2Pk8htyFD8024mZaPHm")

## Get a list of cities for Ukraine, because Ukraine id = 2
vk_cities <- vkGetDbCities(country_id = 2,
                           access_token = my_tok$access_token)

## Get the list of cities for the search query "St."
vk_cities_search <- vkGetDbCities(country_id = 1,
                                  q = "St.",
                                  access_token = my_tok$access_token)

}
}
