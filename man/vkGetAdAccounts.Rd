\name{vkGetAccounts}
\alias{vkGetAccounts}
\title{Возвращает список рекламных кабинетов}
\description{Функция vkgetAccounts возвращает список доступны рекламных кабинетов.}
\usage{
vkGetAccounts(access_token = NULL)
}
\arguments{
  \item{access_token}{Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken}
}
\author{
Alexey Seleznev
}
\value{Дата фрейм со списком рекламных кабинетов и их параметров со следующими значениями:
\item{1. account_id}{идентификатор рекламного кабинета.}
\item{2. account_type}{тип рекламного кабинета.}
\item{3. account_status}{статус рекламного кабинета. (1 — активен, 0 — неактивен)}
\item{4. access_role}{права пользователя в рекламном кабинете. }
}
\examples{
##Авторизация в вк
my_tok <- vkAuth(app_id = 1,client_secret = "H2Pk8htyFD8024mZaPHm")

##Запрос списка доступных рекламных кабинетов
my_vk_acc <- vkGetAccounts(my_tok$access_token)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
