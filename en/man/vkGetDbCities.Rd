\name{vkGetDbCities}
\alias{vkGetDbCities}
\title{Список стран.}
\description{Функция vkGetDbCities возвращает список стран.}
\usage{
vkGetDbCities(country_id = NULL, region_id = NULL, q = NULL, need_all = TRUE, access_token = NULL)
}
\arguments{
  \item{country_id}{идентификатор страны, полученный с помощью функции vkGetDbCountries.}
  \item{region_id}{идентификатор региона, города которого необходимо получить. (параметр не обязателен).}
  \item{q}{строка поискового запроса. Например, "Санкт". Максимальная длина строки — 15 символов.}
  \item{need_all}{Логическое TRUE или FALSE, флаг - вернуть список всех стран.}
  \item{access_token}{Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken}
}
\value{Дата фрейм со статистикой сообщества со следующими значениями:
\item{1. cid}{идентификатор страны.}
\item{2. title}{название страны.}
\item{3. important }{отметка ключевых городов для текущего пользователя.}
\item{4. area}{область.}
\item{5. region }{регион.}
}
\details{
Если не задан параметр q, то будет возвращен список самых крупных городов в заданной стране. Если задан параметр q, то будет возвращен список городов, которые релевантны поисковому запросу. 
}
\author{
Alexey Seleznev
}

\examples{
##Авторизация в вк
my_tok <- vkAuth(app_id = 1, app_secret = "H2Pk8htyFD8024mZaPHm")

##Получаем список городов для Украины, т.к. id Украины = 2
vk_cities <- vkGetDbCities(country_id = 2,
                           access_token = my_tok$access_token)

##Получаем список городов по поисковому запросу "Санкт"
vk_cities_search <- vkGetDbCities(country_id = 1,
                                  q = "Санкт",
                                  access_token = my_tok$access_token)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
