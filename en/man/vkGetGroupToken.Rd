\name{vkGetGroupToken}
\alias{vkGetGroupToken}
\title{Получить получения ключа доступа сообщества Вконтакте}
\description{Такой ключ позволяет работать с API от имени группы, встречи или публичной страницы. Например, с его помощью Вы можете отвечать подписчикам сообщества на сообщения, поступившие в его адрес. 
С ключом доступа сообщества можно вызывать те методы, которые имеют специальную пометку в общем списке (https://vk.com/dev/methods). 
Функция vkGetGroupToken получает ключ досупа к сообществу по схеме Implicit flow (https://vk.com/dev/implicit_flow_group).}
\usage{
vkGetGroupToken(appId = NULL, group_ids = NULL)
}
\arguments{
  \item{appId}{ID вашего приложения Вконтакте, которое находится в поле "ID приложения" в настройках приложения.}
  \item{group_ids}{Вектор содержащий ID групп к которым вы хотите получить код доступа.}
}
\value{Объект содержаший токен доступа к группам}
\author{Alexey Seleznev}
\examples{
##---- Get vk api token, где 1 это ID приложения, а 11,22,33 это ID групп.
myToken <- vkGetGroupToken(appId = 1, group_ids = c(11,22,33))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
