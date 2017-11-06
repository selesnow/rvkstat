\name{vkGetUserWall}
\alias{vkGetUserWall}
\title{Список сообществ Вконтакте.}
\description{Функция vkGetUserWall Возвращает список сообществ указанного пользователя.}
\usage{
vkGetUserWall(user_id = NULL, domain = NULL, filter = NULL, access_token = NULL)
}
\arguments{
  \item{user_id}{идентификатор пользователя, для которого необходимо получить список друзей. Если параметр не задан, то считается, что он равен идентификатору текущего пользователя.}
  \item{domain}{короткий адрес пользователя или сообщества.}
  \item{filter}{определяет, какие типы записей на стене необходимо получить. Возможные значения: suggests — предложенные записи на стене сообщества , postponed — отложенные записи , owner — записи владельца стены, others — записи не от владельца стены, all — все записи на стене (owner + others), По умолчанию: all. }
  \item{access_token}{Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken}
}
\value{Дата фрейм со следующими значениями:
\item{1. id}{идентификатор записи.}
\item{2. from_id}{идентификатор автора записи.}
\item{3. to_id}{идентификатор владельца стены, на которой размещена запись.}
\item{4. date}{время публикации записи}
\item{5. post_type}{тип записи, может принимать следующие значения: post, copy, reply, postpone, suggest.}
\item{6. text}{текст записи.}
\item{7. can_delete}{информация о том, может ли текущий пользователь удалить запись (1 — может, 0 — не может).}
\item{8. comments_count}{количество комментариев.}
\item{9. likes_count}{ число пользователей, которым понравилась запись.}
\item{10. reposts_count}{число пользователей, скопировавших запись.}
\item{11. attachment_type}{тип медиавложения записи (фотографии, ссылки и т.п.)}
}
\author{
Alexey Seleznev
}

\examples{
##Авторизация в вк
my_tok <- vkAuth(app_id = 1, app_secret = "H2Pk8htyFD8024mZaPHm")

##Получаем получаем сообщения со стены пользователя Вконтакте.
my_vk_wall <- vkGetUserWall(user_id = 7437995,
                            access_token = my_tok$access_token)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
