\name{vkGetAdCategories}
\alias{vkGetAdCategories}
\title{List of Possible Subjects of Advertisements}
\description{Returns a table with all possible topics and their subsections of the topics of advertisements from 'Vkontakte'}
\usage{
vkGetAdCategories(access_token = NULL, api_version = NULL)
}
\arguments{
  \item{access_token}{API access tokens obtained using vkAuth or vkGetToken functions}
  \item{api_version}{Vkontakte API version for send request.}
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

\examples{
\dontrun{
## auth
my_tok <- vkAuth(app_id = 1,
                 client_secret = "H2Pk8htyFD8024mZaPHm")

# list of subjects
vk_ad_categories <- vkGetAdCategories(access_token = my_tok$access_token)
}
}
