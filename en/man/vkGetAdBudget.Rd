\name{vkGetAdBudget}
\alias{vkGetAdBudget}
\title{Получение текущего бюджета рекламного кабинета Вконтакте.}
\description{Функция vkGetAdBudget возвращает текущий балланс средств рекламного кабинета Вконтакте.}
\usage{
vkGetAdBudget(account_id = NULL, access_token = NULL)
}
\arguments{
  \item{account_id}{Идентификатор рекламного кабинета, список всех доступных рекламных кабинетов можно получить с помщью функции vkGetAdAccounts.}
  \item{access_token}{Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken}
}
\value{Остаток средств рекламного кабинета вконтакте в виде числового значения.}
\author{
Alexey Seleznev
}

\examples{
##Авторизация в вк
my_tok <- vkAuth(app_id = 1, app_secret = "H2Pk8htyFD8024mZaPHm")

#Получаем остаток средст из рекламного кабинета
vk_budget <- vkGetAdBudget(account_id = 1, access_token = my_tok$access_token)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
