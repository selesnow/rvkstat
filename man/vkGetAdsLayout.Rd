\name{vkGetAdsLayout}
\alias{vkGetAdsLayout}
\title{Возвращает описания внешнего вида рекламных объявлений.}
\description{Функция vkGetAdsLayout даёт возможность получить список рекламных объявлений и описание их внешнего вида из рекламного кабинета Вконтакте}
\usage{
vkGetAds(account_id = NULL, client_id = NULL, include_deleted = TRUE, campaign_ids = "null", ad_ids = "null", status_names = TRUE, api_version = NULL, access_token = NULL))
}
\arguments{
  \item{account_id}{Идентификатор рекламного кабинета, список всех доступных рекламных кабинетов можно получить с помщью функции vkGetAdAccounts.}
  \item{client_id}{Идентификатор клиента, у которого запрашиваются рекламные объявления. Доступно и обязательно для рекламных агентств.}
  \item{include_deleted}{Логическое TRUE или FALSE, флаг, задающий необходимость вывода архивных объявлений.}
  \item{campaign_ids}{Числовой вектор, фильтр по рекламным кампаниям.}
  \item{ad_ids}{Числовой вектор, фильтр по рекламным объявлениям.}
  \item{status_names}{Логическое TRUE или FALSE, если значение TRUE то формат объявления и тип оплаты будут возвращены в виде строковых значений, если передать в аргумент status_names значение FALSE то перечисленные значения будут возвращены в виде их ID.}
  \item{api_version}{Версия API к которой вы отправляете запрос, необзательный аргумент.}
  \item{access_token}{Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken}
}
\details{
Если одновременно включены фильтры campaign_ids и ad_ids, то выведены будут следующие объявления:
1. Если id объявления указано в ad_ids, то оно выводится.
2. Если объявление принадлежит рекламной кампании, чей id указан в campaign_ids, то оно выводится.
3. Если существет объявление с id, указанным в ad_ids и оно принадлежит кампании, чей id указан в campaign_ids, то эта рекламная кампания игнорируется, т.е. для нее правило 2 не работает.

Выводится не более 2000 объявлений из не более чем 2000 кампаний. 

В основе работы функции лежит метод API ads.getAdsLayout, узнать все подробности его работы можно по ссылке https://vk.com/dev/ads.getAdsLayout. 
}
\value{Дата фрейм со следующими значениями:
\item{1. id}{идентификатор объявления.}
\item{2. campaign_id}{идентификатор кампании.}
\item{3. ad_format}{формат объявления.}
\item{4. cost_type}{тип оплаты.}
\item{5. video}{1 — объявление является видеорекламой..}
\item{6. title}{заголовок объявления.}
\item{7. description}{описание объявления.}
\item{8. link_url}{ссылка на рекламируемый объект.}
\item{9. link_domain}{домен рекламируемого сайта.}
\item{10. preview_link}{ссылка, перейдя по которой можно просмотреть рекламное объявление так, как оно выглядит на сайте. Ссылка доступна в течение 30 минут после выполнения функции vkGetAdsLayout.}
\item{11. image_src}{url изображения объявления.}
}
\author{
Alexey Seleznev
}

\examples{
##Авторизация в вконтакте
my_tok <- vkAuth(app_id = 1,app_secret = "H2Pk8htyFD8024mZaPHm")
#Получаем список объявлений
my_vk_ads <- vkGetAdsLayout(account_id = 11111111, 
                            access_token = my_tok$access_token)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.