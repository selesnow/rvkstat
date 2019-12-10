\name{vkGetDbRegions}
\alias{vkGetDbRegions}
\title{Regions list.}
\description{Get regions dictionary.}
\usage{
vkGetDbRegions(country_id = NULL, q = NULL, api_version = NULL,
                 access_token = NULL)
}
\arguments{
  \item{country_id}{country identifier obtained using the vkGetDbCountries function.}
  \item{q}{search query string. For example, Len. The maximum string length is 15 characters.}
  \item{access_token}{API access token, obtained using the functions vkAuth or vkGetToken.}
  \item{api_version}{Vkontakte API version for send rquest.}
}
\value{Data frame contains community statistics with the following values:
\item{1. region_id}{region identifier.}
\item{2. title}{name of the region.}
}
\details{
If the q parameter is not specified, then a list of all regions in the given country will be returned. If the q parameter is specified, a list of regions that are relevant to the search query will be returned.
}
\author{
Alexey Seleznev
}

\examples{
\dontrun{
## auth
my_tok <- vkAuth(app_id = 1, 
                 app_secret = "H2Pk8htyFD8024mZaPHm")

## Get a list of regions for Ukraine, because Ukraine id = 2
vk_regions  <- vkGetDbRegions(country_id = 2,
                              access_token = my_tok$access_token)

##get a list of cities of Ukraine on request "Ode"
vk_regions_search  <- vkGetDbRegions(country_id = 2,
                                     q = "Ode",
                                     access_token = my_tok$access_token)


}
}
