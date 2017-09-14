\name{vkAuth}
\alias{vkAuth}
\title{Авторизация в Вконтакте}
\description{Функция vkAuth даёт возможность получить токен для доступа к API используя схему Authorization Code Flow - https://vk.com/dev/authcode_flow_user}
\usage{
vkAuth(app_id = NULL, app_secret = NULL, apiVersion = "5.68")
}
\arguments{
  \item{app_id}{ID приложения, найти его можно на странице настройки приложения.}
  \item{app_secret}{Защищённый ключ приложения, найти его можно на странице настройки приложения.}
  \item{apiVersion}{Версия API.}
}
\value{Список учётных данных для работы с API Вконтакте}
\author{
Alexey Seleznev
}

\examples{
##Auth in VK
my_tok <- vkAuth(app_id = 1,client_secret = "H2Pk8htyFD8024mZaPHm")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.