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

Next instal rvkstat pacage

`require(devtools)`

`install_github('selesnow/rvkstat')`


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
