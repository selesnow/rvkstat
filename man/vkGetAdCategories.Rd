\name{vkGetAdCategories}
\alias{vkGetAdCategories}
\title{Список возможных тематики рекламных объявлений из Вконтакте}
\description{Функция vkGetAdCategories загружает таблицу со всеми возможными тематикмми и их подразделов тематик рекламных объявлений из Вконтакте}
\usage{
vkGetAdCategories(account_id = NULL)
}
\arguments{
  \item{access_token}{Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken}
}
\value{Дата фрейм со следующими значениями:
\item{1. id}{идентификатор тематики.}
\item{2. name}{название тематики.}
\item{3. subcategories_id}{идентификатор подраздела.}
\item{4. ubcategories_name}{название подраздела.}
}
\author{
Alexey Seleznev
}

\examples{
##Авторизация в вконтакте
my_tok <- vkAuth(app_id = 1,client_secret = "H2Pk8htyFD8024mZaPHm")
#Получаем список nтематик и их подразделов.
vk_ad_categories <- vkGetAdCategories(access_token = my_tok$access_token)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.