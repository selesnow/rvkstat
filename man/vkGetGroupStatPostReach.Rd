\name{vkGetGroupStatPostReach}
\alias{vkGetGroupStatPostReach}
\title{Статистика записей на стене сообщества.}
\description{Функция vkGetGroupStatPostReach возвращает статистику для записи на стене..}
\usage{
vkGetGroupStatPostReach(owner_id = NULL, post_ids = NULL, api_version = NULL, access_token = NULL)
}
\arguments{
  \item{owner_id}{идентификатор сообщества — владельца записи. Указывается со знаком «минус».}
  \item{post_ids}{векор содержащий идентификаторы записей, обратите внимание — данные по статистике доступны только для 300 последних (самых свежих) записей на стене сообщества.}
  \item{api_version}{Необзательный аргумент, номер версии API к которой будет выполнен запрос.}
  \item{access_token}{Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken}
}
\value{Дата фрейм со следующими значениями:
\item{1. reach_viral}{виральный охват (если запись продвигалась с помощью таргетированной рекламы)}
\item{2. reach_ads}{рекламный охват (если запись продвигалась с помощью таргетированной рекламы).}
\item{3. reach_subscribers}{охват подписчиков.}
\item{4. reach_total}{суммарный охват.}
\item{5. links}{переходы по ссылке.}
\item{6. to_group}{переходы в сообщество.}
\item{7. join_group}{вступления в сообщество.}
\item{8. report}{количество жалоб на запись.}
\item{9. hide}{количество скрывших запись.}
\item{10. unsubscribe}{количество отписавшихся участников.}
\item{11. post_id}{идентификатор записи.}
}
\details{
Статистика записей в настоящий момент доступна только для сообществ с количеством участников от 5000 и выше, а также официальных сообществ. 

Обратите внимание — данные по статистике доступны только для 300 последних (самых свежих) записей на стене сообщества. 
В ходе выполнения могут произойти общие ошибки. Их описание находится на отдельной странице - https://vk.com/dev/errors.
}
\author{
Alexey Seleznev
}
\examples{
## Авторизация в вк
my_tok <- vkAuth(app_id = 1, app_secret = "H2Pk8htyFD8024mZaPHm")

## Получаем список сообщений сообщества
my_vk_wall  <- vkGetUserWall(user_id = -111111,
                             access_token = my_tok$access_token) 
							 
## Получаем подрубную статистику по последним 300 записям сообщества							 
post_reach <- vkGetGroupStatPostReach(owner_id = -8149447,
                                      post_ids = my_vk_wall$id,
                                      access_token = my_tok$access_token)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
