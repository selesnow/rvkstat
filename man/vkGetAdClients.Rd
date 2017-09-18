\name{vkGetAdClients}
\alias{vkGetAdClients}
\title{Список клиентов Вконтакте.}
\description{Функция vkGetAdClients Возвращает список клиентов рекламного агентства.}
\usage{
vkGetAdClients(account_id = NULL, access_token = NULL)
}
\arguments{
  \item{account_id}{Идентификатор рекламного кабинета, список всех доступных рекламных кабинетов можно получить с помщью функции vkGetAdAccounts.}
  \item{access_token}{Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken}
}
\value{Дата фрейм со статистикой сообщества со следующими значениями:
\item{1. id}{идентификатор клиента.}
\item{2. name}{название клиента.}
\item{3. day_limit}{дневной лимит клиента в рублях.}
\item{4. all_limit}{общий лимит клиента в рублях.}
}
\author{
Alexey Seleznev
}

\examples{
##Авторизация в вк
my_tok <- vkAuth(app_id = 1, app_secret = "H2Pk8htyFD8024mZaPHm")

##Получаем список клиентов из агентского аккаунта
vk_clients <- vkGetAdClients(account_id = 1, access_token = my_tok$access_token)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
