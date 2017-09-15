\name{vkGetAdStatistics}
\alias{vkGetAdStatistics}
\title{Статистика по посещению сообщества в Вконтакте.}
\description{Функция vkGetAdStatistics возвращает статистику показателей эффективности по рекламным объявлениям, кампаниям, клиентам или всему кабинету.}
\usage{
vkGetGroupStat(account_id = NULL, ids_type = "office", ids = NULL, period = "overall", date_from = Sys.Date() - 30, date_to = Sys.Date(), access_token = NULL)
}
\arguments{
  \item{account_id}{Идентификатор рекламного кабинета, список всех доступных рекламных кабинетов можно получить с помщью функции vkGetAdAccounts.}
  \item{ids_type}{Тип запрашиваемых объектов, которые перечислены в параметре ids. Допустимые значения ad — объявления, campaign — кампании, client — клиенты, office — кабинет.}
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
\item{7. spent}{потраченные средства.}
\item{8. impressions}{количество просмотров.}
\item{9. clicks}{количество уникальных посетителей.}
\item{10. reach}{(если ids_type равен ad или campaign и period равен day или month) — охват.}
\item{11. video_views}{(если ids_type равен ad) — просмотры видеоролика (для видеорекламы).}
\item{12. video_views_half}{(если ids_type равен ad) — просмотры половины видеоролика (для видеорекламы)}
\item{13. video_views_full}{(если ids_type равен ad) — просмотры целого видеоролика (для видеорекламы).}
\item{14. video_clicks_site(если ids_type равен ad) — переходы на сайт рекламодателя из видеорекламы (для видеорекламы).}
\item{15. join_rate}{(если ids_type равен ad или campaign) — вступления в группу, событие, подписки на публичную страницу или установки приложения (только если в объявлении указана прямая ссылка на соответствующую страницу ВКонтакте).}
}
\author{
Alexey Seleznev
}

\examples{
##Авторизация в вк
my_tok <- vkAuth(app_id = 1, app_secret = "H2Pk8htyFD8024mZaPHm")

#1.Получаем статиатику по рекламным кампаниям в разрезе дней
##1.1. Получаем список рекламных кампаний
camp <- vkGetAdCampaigns(account_id = 1, access_token = my_tok$access_token)
##1.2. Получаем статистику по рекламным кампаниям
vk_stat_by_campaign <- vkGetAdStatistics(account_id = 1,
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
vk_stat_by_ads <- vkGetAdStatistics(account_id = 1,
                                    ids_type = "ad",
                                    ids = ads$id ,
                                    period = "month",
                                    date_from = "2010-01-01", 
                                    date_to = "2017-09-10",
                                    access_token = my_tok$access_token)
			
			
#3.Получаем общую статиатику по рекламному кабинету, в данном примере подразумевается что id рекламного кабинета равно 1
vk_stat_by_account <- vkGetAdStatistics(account_id = 1,
                                        ids_type = "office",
                                        ids = 1,
                                        period = "overall",
                                        date_from = "2010-01-01", 
                                        date_to = "2017-09-10",
                                        access_token = my_tok$access_token)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
