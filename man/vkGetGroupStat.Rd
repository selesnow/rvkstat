\name{vkGetGroupStat}
\alias{vkGetGroupStat}
\title{Статистика по посещению сообщества в Вконтакте.}
\description{Функция vkGetGroupStat даёт возвозможность загрузить данные из сообществ вконтакте по количеству просмотров, подписок, отписок и поситетелей сообщества в разрезе дат.}
\usage{
vkGetGroupStat(date_from = Sys.Date(), date_to = Sys.Date(), group_id = NULL, access_token = NULL)
}
\arguments{
  \item{date_from}{Начальная дата выводимой статистики в формате YYYY-MM-DD.}
  \item{date_to}{Конечная дата выводимой статистики в формате YYYY-MM-DD.}
  \item{group_id}{Идентификатор сообщества.}
  \item{access_token}{Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken}
}
\value{Дата фрейм со статистикой сообщества со следующими значениями:
\item{1. day}{дата за которую приведена статистика.}
\item{2. views}{количество просмотров.}
\item{3. visitors}{количество уникальных посетителей.}
\item{4. total_reach}{полный охват. }
\item{5. subscribers_reach}{охват подписчиков.}
\item{6. subscribed}{число новых подписчиков.}
\item{7. unsubscribed}{число отписавшихся. }
}
\author{
Alexey Seleznev
}

\examples{
##Авторизация в вк
my_tok <- vkAuth(app_id = 1,app_secret = "H2Pk8htyFD8024mZaPHm")

##Получение статистики сообщества
communityData <- vkGetGroupStat(date_from = "2016-01-01",
                               date_to = "2016-04-01",
                               group_id = 1,
                               access_token = my_tok$access_token)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
