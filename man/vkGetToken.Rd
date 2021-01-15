\name{vkGetToken}
\alias{vkGetToken}
\title{Get vkontakte developer token}
\description{vkGetToken open web link in browser and generate developer token, which you need for work with vk.com api}
\usage{
vkGetToken(app_id = getOption("rvkstat.app_id"))
}
\arguments{
  \item{app_id}{Your app id from filed in app page vkontakte.}
}
\value{R object with vk.com token}
\author{Alexey Seleznev}
\examples{
\dontrun{
## Get vk api token
myToken <- vkGetToken(app_id = "1")
}
}

