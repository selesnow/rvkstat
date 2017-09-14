\name{vkGetGroupStatCity}
\alias{vkGetGroupStatCity}
\title{—татистика посетителей сообщества вконтакте в разрезе городов.}
\description{‘ункци€ vkGetGroupStatCity позвол€ет получить данные о городе посетителей сообщества в разрезе дат.}
\usage{
vkGetGroupStatCity(date_from = Sys.Date(), date_to = Sys.Date(), group_id = NULL, access_token = NULL)
}
\value{ƒата фрейм со статистикой по посетител€м сообщества со следующими значени€ми:
\item{1. Date}{дата за которую приведена статистика.}
\item{2. Visitors}{количество уникальных посетителей.}
\item{3. CityID}{идентификатор города или "other" дл€ раздела Ђпрочие городаї.}
\item{4. CityName}{название города.}
}
\value{Data frame with daily data about visits by City}
\author{Alexey Seleznev}
\examples{
##јвторизаци€ в вк
my_tok <- vkAuth(app_id = 1,app_secret = "H2Pk8htyFD8024mZaPHm")

##«агрузка данных по пользовател€м в разрезе городов
communityDataCity <- vkGetGroupStatCity(date_from = "2016-01-01",
										date_to = "2016-04-01",
										group_id = 1,
										access_token = my_tok$access_token)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
