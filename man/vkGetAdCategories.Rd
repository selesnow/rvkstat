\name{vkGetAdCategories}
\alias{vkGetAdCategories}
\title{List of Possible Subjects of Advertisements}
\description{Returns a table with all possible topics and their subsections of the topics of advertisements from 'Vkontakte'}
\usage{
vkGetAdCategories(
  version      = c("v1", "v2"),
  username     = getOption("rvkstat.username"),
  api_version  = getOption("rvkstat.api_version"),
  token_path   = vkTokenPath(),
  access_token = getOption("rvkstat.access_token")
)
}
\arguments{
  \item{version}{Dictionary version, v1 include deprecated themes, v2 exclude deprecated themes.}
  \item{username}{Your vkontakte login.}
  \item{api_version}{Vkontakte API version.}
  \item{token_path}{Path to dir with credentials}
  \item{access_token}{API access tokens obtained using vkAuth or vkGetToken functions}
}
\value{Date frame with the following values:
  \item{id}{subject identifier.}
  \item{name}{subject name.}
  \item{subcategories_id}{identifier of the subsection.}
  \item{ubcategories_name}{subsection name.}
}
\author{
Alexey Seleznev
}
\references{
Documentation for API method ads.getCategories: https://vk.com/dev/ads.getCategories
}
\examples{
\dontrun{
# list of subjects
vk_ad_categories <- vkGetAdCategories()
}
}
