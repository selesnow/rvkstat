\name{vkgetAccounts}
\alias{vkgetAccounts}
\title{Возвращает список рекламных кабинетов}
\description{Функция vkgetAccounts возвращает список доступны рекламных кабинетов.}
\usage{
vkgetAccounts(access_token = NULL)
}
\arguments{
  \item{access_token}{Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken}
}
\value{Дата фрейм со списком рекламных кабинетов и их параметров}
\author{
Alexey Seleznev
}

\examples{
##Авторизация в вк
my_tok <- vkAuth(client_id = 1,client_secret = "H2Pk8htyFD8024mZaPHm")

##Запрос списка доступных рекламных кабинетов
my_vk_acc <- vkgetAccounts(my_tok$access_token)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
