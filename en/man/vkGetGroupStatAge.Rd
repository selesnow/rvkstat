\name{vkGetGroupStatAge}
\alias{vkGetGroupStatAge}
\title{Статистика по возрастным группам посетителей сообщества вконтакте}
\description{Функция vkGetGroupStatAge предназначена для загрузки данных о посетителях сообщества в разрезе возрастных групп (12-18, 18-21, 21-24, 24-27, 27-30, 30-35, 35-45, 45-100) по датам.}
\usage{
vkGetGroupStatAge(date_from = Sys.Date(), date_to = Sys.Date(), group_id = NULL, access_token = NULL)
}
\arguments{
  \item{date_from}{Начальная дата выводимой статистики в формате YYYY-MM-DD.}
  \item{date_to}{Конечная дата выводимой статистики в формате YYYY-MM-DD.}
  \item{group_id}{Идентификатор сообщества.}
  \item{access_token}{Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken}
}
\value{Дата фрейм со статистикой по посетителям сообщества со следующими значениями:
\item{1. Date}{дата за которую приведена статистика.}
\item{2. Visitors}{количество уникальных посетителей.}
\item{3. AgeGroup}{возрастной интервал.}
}
\author{Alexey Seleznev}

\examples{
##Авторизация в вк
my_tok <- vkAuth(app_id = 1,app_secret = "H2Pk8htyFD8024mZaPHm")

##Получить статистику по возрастным группам посетителеф
communityDataAge <- vkGetGroupStatAge(date_from = "2016-01-01",
                                      date_to = "2016-04-01",
                                      group_id = 1,
                                      access_token = my_tok$access_token)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
