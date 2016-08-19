# rvkstat - loading data from vkontakte api (vk.com) into R 
# rvkstat - загрузка данных из Api вконтакте (vk.com) в R 

## English
### Description
R package for load data about communities vkontakte ([vk.com](url)) visits by users age group, gender and geolocation at social network vkontakte (vk.com)

### Require
For work whith vk.com api you must create Standalone-app, for this go <a href="https://vk.com/editapp?act=create">link</a>, and chose Standalone-app.

<img src="http://picsee.net/upload/2016-04-29/ccbead79d129.png" data-canonical-src="http://picsee.net/upload/2016-04-29/ccbead79d129.png" style="max-width:100%;">

For star work and get api token over `vkGetToken()` function use app ID.
<img src="http://picsee.net/upload/2016-04-29/39ef5f2d1d09.png" data-canonical-src="http://picsee.net/upload/2016-04-29/39ef5f2d1d09.png" style="max-width:100%;">

### Install package
The package can be installed directly from this Github repository with.

First install devtools package

`install.packages("devtools")`

Next instal rvkstat package

`require(devtools)`

`install_github('selesnow/rvkstat')`

### rvkstat Package function

Get start with `vkGetToken()` function in order to get vkontakte api token.

Usage:

`#Get api token` 

`myToken <- vkGetToken(apppId = "YourAppID")`

Change YourAppID to ID of your astandalone app.

After you run this function start browser, you must accept for request data provide and copy value of URL parameter access_token, paste this value into R in request "Your vk token from URL parameter access_token: ".

Further you can load you token without app authorization through `vkLoadToken()` function.

`myToken <- vkLoadToken()`

After you get token you can get data from vkontakte api, use next function.

_Get daily data by number of visit, visitors, subscribed and unsubscribed_

`communityData <- vkGetGroupStat(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

_Get daily data by visitors by users age group._

`communityDataAge <- vkGetGroupStatAge(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

_Get daily data by visitors by users gender._

`communityDataGender <- vkGetGroupStatGender(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

_Get daily data by visitors by users age group and gender._

`communityDataGenderAge <- vkGetGroupStatGenderAge(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

_Get daily data by visitor's geolocation by cities._

`communityDataCity <- vkGetGroupStatCity(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

_Get daily data by visitor's geolocation by countries._

`communityDataCountries <- vkGetGroupStatCountries(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

## Русский
### Описание
Пакет функций для языка R загружающий данные о посетителях сообществ вконтакте ([vk.com](url)) по дням, в разрезе возрастных групп, пола и геолокации посетителей.

### Требование 
Для работы с api вконтакте вам необходимо создать Standalone-приложение, для этого перейдите по этой <a href="https://vk.com/editapp?act=create">ссылке</a>, и выберите Standalone-приложение. 
<img src="http://picsee.net/upload/2016-04-29/ccbead79d129.png" data-canonical-src="http://picsee.net/upload/2016-04-29/ccbead79d129.png" style="max-width:100%;">

Для начала работы и для того, что бы с помощью функции `vkGetToken()` получить токен разработчика используйте ID приложения.
<img src="http://picsee.net/upload/2016-04-29/39ef5f2d1d09.png" data-canonical-src="http://picsee.net/upload/2016-04-29/39ef5f2d1d09.png" style="max-width:100%;">


### Установка пакета
Пакет rvkstat может быть установлен непосредственно из репозитория Github.

Сперва установите пакет devtools, если он ещё не установлен.

`install.packages("devtools")`

Далее установите пакет rvkstat

`require(devtools)`

`install_github('selesnow/rvkstat')`

### Функции доступные в пакете rvkstat

Начните работу с пакетом с функции `vkGetToken()` для того, что бы получить токен разработчика

`#Get api token` 

`myToken <- vkGetToken(apppId = "YourAppID")`

Измените "YourAppID" на ID вашего приложения.

После запуска функции откроется окно браузера, в котором вы должны подтвердить доступ к данным в вконтакте, далее откроется страница в URL адресе которой будет параметр access_token, скопируйте его значение и вставьте в R, в качестве ответа на запрос "Your vk token from URL parameter access_token: ".

Далее вы в любой момент можете загружать ваш токен без прохождения авторизации приложения с помощью функции `vkLoadToken()`.

`myToken <- vkLoadToken()`

После того как вы получите токен разработчика вы можете загружать данные о посетителях сообществ в которых для вас открыт доступ к статистике.

_Получить данные о количестве просмотров, посетителях, подписавшихся и отписавшихся посетителей по дням_

`communityData <- vkGetGroupStat(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

_Получить данные о возрастных группах посетителей по дням._

`communityDataAge <- vkGetGroupStatAge(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

_Получить данные о поле посетителей по дням._

`communityDataGender <- vkGetGroupStatGender(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

_Получить данные о половозрастной структуре ваших посетителей по дням._

`communityDataGenderAge <- vkGetGroupStatGenderAge(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

_Получить данные о городах посетителей._

`communityDataCity <- vkGetGroupStatCity(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

_Получить данные о странах посетителей._

`communityDataCountries <- vkGetGroupStatCountries(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

<p align="center">
<img src="http://s017.radikal.ru/i444/1608/b7/989edcf88741.png" data-canonical-src="http://s017.radikal.ru/i444/1608/b7/989edcf88741.png" style="max-width:100%;">
</p>
