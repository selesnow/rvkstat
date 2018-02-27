\name{vkGetDbCountries}
\alias{vkGetDbCountries}
\title{Список стран.}
\description{Функция vkGetDbCountries возвращает список стран.}
\usage{
vkGetDbCountries(need_all = TRUE, code = NULL, access_token = NULL)
}
\arguments{
  \item{need_all}{Логическое TRUE или FALSE, флаг - вернуть список всех стран.}
  \item{code}{Текстовый вектор, двухбуквенные коды стран в стандарте ISO 3166-1 alpha-2, для которых необходимо выдать информацию. Пример c("RU","UA","BY"), список всех кодов можно посмотреть по ссылке - https://vk.com/dev/country_codes.}
  \item{access_token}{Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken}
}
\value{Дата фрейм со статистикой сообщества со следующими значениями:
\item{1. cid}{идентификатор страны.}
\item{2. title}{название страны.}
}
\details{
Если не заданы параметры need_all и code, то возвращается краткий список стран, расположенных наиболее близко к стране текущего пользователя. Если задан параметр need_all, то будет возвращен список всех стран. Если задан параметр code, то будут возвращены только страны с перечисленными ISO 3166-1 alpha-2 кодами.
Список всех кодов стран можно получить по ссылке - https://vk.com/dev/country_codes
}
\author{
Alexey Seleznev
}

\examples{
##Авторизация в вк
my_tok <- vkAuth(app_id = 1, app_secret = "H2Pk8htyFD8024mZaPHm")

##Получаем список стран
vk_countries <- vkGetDbCountries(need_all = T,
                                 code = c("RU","UA","BY"),
                                 access_token = my_tok$access_token)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
