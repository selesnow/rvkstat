\name{vkGetDbRegions}
\alias{vkGetDbRegions}
\title{Список стран.}
\description{Функция vkGetDbRegions возвращает список стран.}
\usage{
vkGetDbRegions(country_id = NULL, q = NULL, access_token = NULL)
}
\arguments{
  \item{country_id}{идентификатор страны, полученный с помощью функции vkGetDbCountries.}
  \item{q}{строка поискового запроса. Например, Лен. Максимальная длина строки — 15 символов.}
  \item{access_token}{Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken}
}
\value{Дата фрейм со статистикой сообщества со следующими значениями:
\item{1. region_id}{идентификатор региона.}
\item{2. title}{название региона.}
}
\details{
Если не задан параметр q, то будет возвращен список всех регионов в заданной стране. Если задан параметр q, то будет возвращен список регионов, которые релевантны поисковому запросу.
}
\author{
Alexey Seleznev
}

\examples{
##Авторизация в вк
my_tok <- vkAuth(app_id = 1, app_secret = "H2Pk8htyFD8024mZaPHm")

##Получаем список городов для Украины, т.к. id Украины = 2
vk_regions  <- vkGetDbRegions(country_id = 2,
                              access_token = my_tok$access_token)

##Получаем список городов Украины по запросу "Оде"
vk_regions_search  <- vkGetDbRegions(country_id = 2,
                                     q = "Оде",
                                     access_token = my_tok$access_token)


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
