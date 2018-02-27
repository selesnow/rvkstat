\name{vkGetAdPostsReach}
\alias{vkGetAdPostsReach}
\title{Статистика по охваты рекламных записей Вконтакте.}
\description{Функция vkGetAdPostsReach возвращает подробную статистику по охвату рекламных записей из объявлений и кампаний для продвижения записей сообщества.}
\usage{
vkGetAdPostsReach(account_id = NULL, ids_type = "campaign", ids = NULL, access_token = NULL)
}
\arguments{
  \item{account_id}{Идентификатор рекламного кабинета, список всех доступных рекламных кабинетов можно получить с помщью функции vkGetAdAccounts.}
  \item{ids_type}{Тип запрашиваемых объектов, которые перечислены в параметре ids. Допустимые значения ad — объявления, campaign — кампании.}
  \item{ids}{Вектор id запрашиваемых объявлений, кампаний, клиентов или кабинета, в зависимости от того, что указано в параметре ids_type.}
  \item{access_token}{Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken}
}
\value{Дата фрейм со статистикой сообщества со следующими значениями:
\item{1. id}{ID объекта из параметра ids.}
\item{2. reach_subscribers}{охват подписчиков.}
\item{3. reach_total}{суммарный охват.}
\item{4. links}{переходы по ссылке.}
\item{5. to_group}{переходы в сообщество.}
\item{6. join_group}{вступления в сообщество.}
\item{7. report}{количество жалоб на запись.}
\item{8. hide}{количество скрытий записи.}
\item{9. unsubscribe}{количество отписавшихся участников.}
\item{10. video_views_start}{количество стартов просмотра видео.}
\item{11. video_views_3s}{количество досмотров видео до 3 секунд.}
\item{12. video_views_25p}{количество досмотров видео до 25 процентов.}
\item{13. video_views_50p}{количество досмотров видео до 50 процентов.}
\item{14. video_views_75p}{количество досмотров видео до 75 процентов.}
\item{15. video_views_100p}{количество досмотров видео до 100 процентов.}
}
\details{
Статистику по кампаниям можно получить только для кампаний, созданных начиная с 20 декабря 2016 года.
Поля video_views_start, video_views_3s, video_views_25p, video_views_50p, video_views_75p, video_views_100p с данными по статистике видео возвращаются только для объявлений или кампаний с видео, созданных после 26 января 2017 года.
}
\author{
Alexey Seleznev
}

\examples{
##Авторизация в вк
my_tok <- vkAuth(app_id = 1, app_secret = "H2Pk8htyFD8024mZaPHm")

##Получаем список рекламных кампаний
camp <- vkGetAdCampaigns(account_id = 1, access_token = my_tok$access_token)

##Получаем статистику по рекламным кампаниям
post_reach <- vkGetAdPostsReach(account_id = 1600134264,
                                ids_type = "campaign",
                                ids = camp$id,
                                access_token = my_tok$access_token)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
