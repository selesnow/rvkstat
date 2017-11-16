\name{vkGetAdCampaigns}
\alias{vkGetAdCampaigns}
\title{Возвращает список рекламных кампаний}
\description{Функция vkGetAdCampaigns возвращает список доступны рекламных кампаний из рекламного кабинета Вконтакте.}
\usage{
vkGetAdCampaigns(account_id = NULL, client_id = NULL, include_deleted = TRUE, campaign_ids = "null", access_token = NULL)
}
\arguments{
  \item{account_id}{Идентификатор рекламного кабинета, список всех доступных рекламных кабинетов можно получить с помщью функции vkGetAdAccounts.}
  \item{client_id}{Идентификатор клиента, у которого запрашиваются рекламные объявления. Доступно и обязательно для рекламных агентств.}
  \item{include_deleted}{Логическое TRUE или FALSE, флаг, задающий необходимость вывода архивных объявлений.}
  \item{campaign_ids}{Числовой вектор, фильтр по рекламным кампаниям.}
  \item{status_names}{Логическое TRUE или FALSE, отвечает за формат вывода статуса кампании, если TRUE статус будет возвращён в виде текстовой строки, если FALSE то будет возвращён номер статуса.}
  \item{access_token}{Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken}
}
\author{
Alexey Seleznev
}
\value{Дата фрейм со списком рекламных кабинетов и их параметров со следующими значениями:
\item{1. id}{идентификатор кампании.}
\item{2. type}{тип кампании.}
\item{3. name}{название кампании.}
\item{4. status}{статус кампании. }
\item{5. day_limit}{дневной лимит кампании в рублях. }
\item{6. all_limit}{общий лимит кампании в рублях. }
\item{7. start_time}{время запуска кампании. }
\item{8. stop_time}{время остановки кампании. }
\item{9. create_time}{время создания кампании. }
\item{10. update_time}{время последнего изменения кампании. }
}
\examples{
##Авторизация в вк
my_tok <- vkAuth(app_id = 1,app_secret = "H2Pk8htyFD8024mZaPHm")

##Запрос списка рекламных кампаний
my_vk_camp <- vkGetAdCampaigns(account_id = 1, 
                               access_token = my_tok$access_token)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
