\name{vkGetAdCityStats}
\alias{vkGetAdCityStats}
\title{Статистика по охвату аудитории в разрезе городов.}
\description{Функция vkGetAdCityStats возвращает статистику по охвату аудитории по разрезе рекламным кампания и объявлениям в разрезе городов.}
\usage{
vkGetAdStatistics(account_id = NULL, ids_type = "campaign", ids = NULL, period = "day", date_from = Sys.Date() - 30, date_to = Sys.Date(), access_token = NULL)
}
\arguments{
  \item{account_id}{Идентификатор рекламного кабинета, список всех доступных рекламных кабинетов можно получить с помщью функции vkGetAdAccounts.}
  \item{ids_type}{Тип запрашиваемых объектов, которые перечислены в параметре ids. Допустимые значения ad — объявления, campaign — кампании.}
  \item{ids}{Вектор id запрашиваемых объявлений, кампаний, клиентов или кабинета, в зависимости от того, что указано в параметре ids_type.}
  \item{period}{Способ группировки данных по датам day — статистика по дням, month — статистика по месяцам, overall — статистика за всё время.Временные ограничения задаются аргументами date_from и date_to.}
  \item{date_from}{Начальная дата выводимой статистики в формате YYYY-MM-DD.}
  \item{date_to}{Конечная дата выводимой статистики в формате YYYY-MM-DD.}
  \item{access_token}{Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken}
}
\value{Дата фрейм со статистикой сообщества со следующими значениями:
\item{1. id}{id объекта из аргумента ids.}
\item{2. day}{(если period равен day) день в формате YYYY-MM-DD.}
\item{3. month}{(если period равен month) — день в формате YYYY-MM.}
\item{4. day_from}{(если period равен overall) начальная дата отчётного периода.}
\item{5. day_to}{(если period равен overall) конечная дата отчётного периода.}
\item{6. type}{тип объекта из параметра ids_type.}
\item{7. city_id}{id города или other для остальных городов.}
\item{8. city_name}{название города.}
\item{9. impressions_rate}{часть аудитории, просмотревшая объявление, от 0 до 1.}
\item{10. clicks_rate}{(часть аудитории, кликнувшая по объявлению, от 0 до 1.}
}
\author{
Alexey Seleznev
}

\examples{
##Авторизация в вк
my_tok <- vkAuth(app_id = 1, app_secret = "H2Pk8htyFD8024mZaPHm")

#1.Получаем статиатику по охвату аудитории в разрезе городов по рекламным кампаниям по дням
##1.1. Получаем список рекламных кампаний
camp <- vkGetAdCampaigns(account_id = 1, access_token = my_tok$access_token)
##1.2. Получаем статистику по рекламным кампаниям
vk_ad_city_stat_day <- vkGetAdCityStats(account_id = 1,
                                        ids_type = "campaign",
                                        ids = camp$id ,
                                        period = "day",
                                        date_from = "2010-01-01", 
                                        date_to = "2017-09-10",
                                        access_token = my_tok$access_token)
										
										
#2.Получаем статиатику по объявлениям в разрезе месяцев
##2.1. Получаем список рекламных кампаний
ads <- vkGetAds(account_id = account_id, access_token = my_tok$access_token)
##2.2. Получаем статистику по объявлениям
vk_ad_city_stat_month <- vkGetAdCityStats(account_id = 1,
                                          ids_type = "ad",
                                          ids = ads$id ,
                                          period = "month",
                                          date_from = "2010-01-01", 
                                          date_to = "2017-09-10",
                                          access_token = my_tok$access_token)
			
			
#3.Получаем статиатику по охвату аудитории в разрезе городов по рекламным кампаниям без временной разбивки
##3.1. Получаем список рекламных кампаний
camp <- vkGetAdCampaigns(account_id = 1, access_token = my_tok$access_token)
##3.2. Получаем статистику по рекламным кампаниям
vk_ad_city_stat_total <- vkGetAdCityStats(account_id = 1,
                                          ids_type = "campaign",
                                          ids = camp$id ,
                                          period = "overall",
                                          date_from = "2010-01-01", 
                                          date_to = "2017-09-10",
                                          access_token = my_tok$access_token)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
