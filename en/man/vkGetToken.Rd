\name{vkGetToken}
\alias{vkGetToken}
\title{Get vkontakte developer token}
\description{vkGetToken open web link in browser and generate developer token, which you need for work with vk.com api}
\usage{
vkGetToken(apppId = NULL)
}
\arguments{
  \item{apppId}{Your app id from filed "ID приложения" in app page vkontakte.}
}
\value{R object with vk.com token}
\author{Alexey Seleznev}
\examples{
##---- Get vk api token
myToken <- vkGetToken(apppId = "1")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
