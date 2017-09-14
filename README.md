# Содержание ReadMe пакета rvkstat
- [Краткое описание пакета rvkstat](https://github.com/selesnow/rvkstat/blob/master/README.md#Краткое-описание-пакета-rvkstat)
- [Что необходимо для начала работы с API Вктонтакте с помощью пакета rvkstat](https://github.com/selesnow/rvkstat/blob/master/README.md#Требование)
- [Установка пакета rvkstat](https://github.com/selesnow/rvkstat/blob/master/README.md#Установка-пакета)
- [Как пройти аутентификацию для работы с API Вконтакте с помощью пакета rvkstat](https://github.com/selesnow/rvkstat#Авторизация-вконтакте-для-работы-с-api)
    - [vkGetToken](https://github.com/selesnow/rvkstat#Пример-прохождения-авторизации-с-помощью-функции-vkgettoken) - Авторизация в Вконтакте с помощью метода [Implicit Flow](https://github.com/selesnow/rvkstat#Пример-прохождения-авторизации-с-помощью-функции-vkgettoken)
    - [vkAuth](https://github.com/selesnow/rvkstat#Пример-прохождения-авторизации-с-помощью-функции-vkauth) - Авторизация в Вконтакте с помощью метода [Authorization Code Flow](https://vk.com/dev/authcode_flow_user)
- [Функции доступные в пакете rvkstat](https://github.com/selesnow/rvkstat/blob/master/README.md#Функции-доступные-в-пакете-rvkstat)
  - [Функции для загрузки данных из рекламного кабинета Вконтакте](https://github.com/selesnow/rvkstat#Функции-для-загрузки-данных-из-рекламного-кабинета-Вконтакте)
    - [vkGetAdAccounts](https://github.com/selesnow/rvkstat#Получить-список-досупных-рекламных-кабинетов-Вконтакте) - Получить список доступных рекламных кабинетов
    - [vkGetAds](https://github.com/selesnow/rvkstat#Получить-список-объявлений-из-рекламного-кабинета-вконтакте) - Получить список объявлений
    - [vkGetAdCampaigns](https://github.com/selesnow/rvkstat/blob/master/README.md#Получить-список-рекламных-кампаний-из-рекламного-кабинета-вконтакте) - Получить список рекламных кампаний
  - [Функции для загрузки данных из сообществ Вконтакте](https://github.com/selesnow/rvkstat#Функции-для-загрузки-данных-из-сообществ-Вконтакте)
    - [vkGetGroupStat](https://github.com/selesnow/rvkstat#Получить-данные-о-количестве-просмотров-посетителях-подписавшихся-и-отписавшихся-посетителей-по-дням) - Получить общую статистику по сообществу
    - [vkGetGroupStatAge](https://github.com/selesnow/rvkstat#Получить-данные-о-возрастных-группах-посетителей-по-дням) - Получить данные о посетителях сообщества по возрасту
    - [vkGetGroupStatCity](https://github.com/selesnow/rvkstat#Получить-данные-о-городах-посетителей) -Получить данные о посетителях сообщества по городам
    - [vkGetGroupStatCountries](https://github.com/selesnow/rvkstat#Получить-данные-о-странах-посетителей) - Получить данные о посетителях сообщества по странам
    - [vkGetGroupStatGender](https://github.com/selesnow/rvkstat#Получить-данные-о-поле-посетителей-по-дням) - Получить данные о посетителях сообщества по полу
    - [vkGetGroupStatGenderAge](https://github.com/selesnow/rvkstat#Получить-данные-о-половозрастной-структуре-ваших-посетителей-по-дням) - Получить данные о посетителях сообщества по полу и возрасту
- [Примеры работы с пакетом rvkstat]()
- [Информация об авторе пакета](https://github.com/selesnow/rvkstat/blob/master/README.md#Автор-пакета-Алексей-Селезнёв-head-of-analytics-dept-at-netpeak)

## Краткое описание пакета rvkstat
Пакет rvkstat является R клиентом для работы с API социальной сети [Вконтакте](url), с помощью функций данного пакета можно получить статистику из рекламного кабинета Вконтакте, а так же данные о посетителях сообществ вконтакте по дням, в разрезе возрастных групп, пола и геолокации посетителей.

## Что необходимо для начала работы с API Вктонтакте с помощью пакета rvkstat
Для работы с api вконтакте вам необходимо создать Standalone-приложение, для этого перейдите по этой <a href="https://vk.com/editapp?act=create">ссылке</a>, и выберите Standalone-приложение. 
 <p align="center"><img src="http://picsee.net/upload/2016-04-29/ccbead79d129.png" data-canonical-src="http://picsee.net/upload/2016-04-29/ccbead79d129.png" style="max-width:100%;"></p>

Для начала работы и для того, что бы с помощью функции авторизации в Вконтакте получить токен разработчика используйте ID и Защищённый ключ приложения.
 <p align="center"><img src="http://img.netpeak.ua/alsey/150540127636_kiss_56kb.png" data-canonical-src="http://picsee.net/upload/2016-04-29/39ef5f2d1d09.png" style="max-width:100%;"></p>


## Установка пакета
Пакет rvkstat может быть установлен непосредственно из репозитория Github с помощью приведённого ниже программного кода.

```
if(!"devtools" %in% installed.packages()[,1]){install.packages("devtools")}
devtools::install_github('selesnow/rvkstat')
```
## Авторизация вконтакте для работы с API.
Для прохождения процесса авторизации в пакете rvkstat есть две функции:

+ vkGetToken - Упрощённая авторизация по методу [Implicit Flow](https://vk.com/dev/implicit_flow_user), токен доступа выдаётся с привязкой к IP адресу, в связи с чем при смене IP адреса прийдётся проходить процедуру авторизации.
+ vkAuth - Для прохождение процесса авторизации с помощью метода [Authorization Code Flow](https://vk.com/dev/authcode_flow_user), токен полученный с помощью данной функции будет работать с любого IP.

#### Пример прохождения авторизации с помощью функции vkGetToken
Для авторизации по схеме [Implicit Flow](https://vk.com/dev/implicit_flow_user) воспользуйтесь следующим кодом:

`myToken <- vkGetToken(app_id = <ID Вашего Приложения>)`

Измените <ID Вашего Приложения> на ID вашего приложения, ID приложения можно получить на странице настройки приложения, как показано в разделе "[Что необходимо для начала работы с API Вктонтакте с помощью пакета rvkstat](https://github.com/selesnow/rvkstat/blob/master/README.md#Требование)".

После запуска функции откроется окно браузера, в котором вы должны подтвердить доступ к данным в вконтакте, далее откроется страница в URL адресе которой будет параметр access_token, скопируйте его значение и вставьте в R, в качестве ответа на запрос "Your vk token from URL parameter access_token: ".

#### Пример прохождения авторизации с помощью функции vkAuth
`myToken <- vkAuth(app_id = <ID Вашего Приложения>, client_secret = <Защищённый Ключ Вашего Приложения>)`

Вместо <ID Вашего Приложения> укажите ID вашего приложения, вместо <Защищённый Ключ Вашего Приложения> укажите защищёный ключ вашего приложения, оба аргумента можно посмотреть на странице настройки приложения как описано в разделе "[Что необходимо для начала работы с API Вктонтакте с помощью пакета rvkstat](https://github.com/selesnow/rvkstat/blob/master/README.md#Требование)". 

После запуска функции откроется окно браузера, в котором вы должны подтвердить доступ к данным в вконтакте, далее откроется страница в URL адресе которой будет параметр code, скопируйте его значение и вставьте в R, в качестве ответа на запрос "Enter code from URL: ".

## Функции доступные в пакете rvkstat

### Функции для загрузки данных из рекламного кабинета Вконтакте

#### Получить список досупных рекламных кабинетов Вконтакте
```
##Авторизация в вк
my_tok <- vkAuth(app_id = 1,client_secret = "H2Pk8htyFD8024mZaPHm")
##Запрос списка доступных рекламных кабинетов
my_vk_acc <- vkGetAccounts(my_tok$access_token)
```
##### Аргументы
* <b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken


#### Получить список объявлений из рекламного кабинета вконтакте
```
##Авторизация в вконтакте
my_tok <- vkAuth(app_id = 1,client_secret = "H2Pk8htyFD8024mZaPHm")
#Получаем список объявлений
my_vk_ads <- vkGetAds(account_id = 11111111, 
                      access_token = my_tok$access_token)
```
##### Аргументы
* <b>account_id</b> - Идентификатор рекламного кабинета, список всех доступных рекламных кабинетов можно получить с помщью функции vkgetAccounts.
* <b>client_id</b> - Идентификатор клиента, у которого запрашиваются рекламные объявления. Доступно и обязательно для рекламных агентств.
* <b>include_deleted</b> - Логическое TRUE или FALSE, флаг, задающий необходимость вывода архивных объявлений.
* <b>campaign_ids</b> - Числовой вектор, фильтр по рекламным кампаниям.
* <b>ad_ids</b> - Числовой вектор, фильтр по рекламным объявлениям.
* <b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken

#### Получить список рекламных кампаний из рекламного кабинета вконтакте
```
##Авторизация в вконтакте
my_tok <- vkAuth(app_id = 1,client_secret = "H2Pk8htyFD8024mZaPHm")
#Получаем список рекламных кампаний
my_vk_campaigns <- vkGetAdCampaigns(account_id = 11111111, 
                                    access_token = my_tok$access_token)
```
##### Аргументы
* <b>account_id</b> - Идентификатор рекламного кабинета, список всех доступных рекламных кабинетов можно получить с помщью функции vkgetAccounts.
* <b>client_id</b> - Идентификатор клиента, у которого запрашиваются рекламные объявления. Доступно и обязательно для рекламных агентств.
* <b>include_deleted</b> - Логическое TRUE или FALSE, флаг, задающий необходимость вывода архивных объявлений.
* <b>campaign_ids</b> - Числовой вектор, фильтр по рекламным кампаниям.
* <b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken

### Функции для загрузки данных из сообществ Вконтакте

#### Получить данные о количестве просмотров, посетителях, подписавшихся и отписавшихся посетителей по дням

`communityData <- vkGetGroupStat(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

#### Получить данные о возрастных группах посетителей по дням.

`communityDataAge <- vkGetGroupStatAge(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

#### Получить данные о поле посетителей по дням.

`communityDataGender <- vkGetGroupStatGender(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

#### Получить данные о половозрастной структуре ваших посетителей по дням.

`communityDataGenderAge <- vkGetGroupStatGenderAge(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

#### Получить данные о городах посетителей.

`communityDataCity <- vkGetGroupStatCity(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

#### Получить данные о странах посетителей.

`communityDataCountries <- vkGetGroupStatCountries(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

 ## *Автор пакета: Алексей Селезнёв, Head of Analytics Dept. at Netpeak*
 <p align="center">
<img src="https://lh3.googleusercontent.com/R-0jgJSxIIhpag2L6YCIhJVIcIWx6-Jt5UCTRJjWzJewo47u2QBnik5CRF2dNB79jmsN_BFRjVOAYfvCqFcn3UNS_thGbbxF-99c9lwBWWlFI7JCWE43K5Yk9HnIW8i8YpTDx3l28IuYswaI-qc9QosHT1lPCsVilTfXTyV2empF4S74daOJ6x5QHYRWumT_2MhUS0hPqUsKVtOoveqDnGf3cF_VsN-RfOAwG9uCeGOgNRgv_fhSr41rw4LBND4gf05nO8zMp4TZMrrcUjKvvx6qNgYDor5LFOHiRmfKISYRVkWYe4wLyGO1FgkgTDjg0300lcur2t3txVwZUgROLZdaxOLx4owa8Rc8B8VKwd3vHxjov_aVfNPT4xf9jSFBBEOI-mfYpa55ejKDw-rqTQ6miFRFWpp_hjrk9KbGyB-Z6iZvYL-2dZ6mzgpUfs2I0tEAGsV07yTzboJ0RNCByC2-U-ZVjWdp2_9Au3FFoUcdQUAmPYOVqOv4r3oLbkkJKLj2A5jp7vf4IAoExLIfJuqEf7XN7fFcv4geib029qJjBt28wnqSO6TKEwB2fesR3uPHvGB6_6NHD70UDH-aCRCK4UBeoajtU0Y8Ks8Vwxo0oZBwmoEu8gudTFBF6mDT7GjLoGLDeNxE-TG7OtWUdxsJk7yzXGW3hE-VxsMD9g=s351-no?w=300" data-canonical-src="https://alexeyseleznev.files.wordpress.com/2017/03/as.png?w=300" style="max-width:100%;">
</p>

### Контакты:
<nav class="jetpack-social-navigation jetpack-social-navigation-svg">
<div class="menu-%d1%81%d0%be%d1%86%d0%b8%d0%b0%d0%bb%d1%8c%d0%bd%d1%8b%d0%b5-%d1%81%d0%b5%d1%82%d0%b8-container">
<ul id="menu-%d1%81%d0%be%d1%86%d0%b8%d0%b0%d0%bb%d1%8c%d0%bd%d1%8b%d0%b5-%d1%81%d0%b5%d1%82%d0%b8" class="menu">
<li id="menu-item-13" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-13"><a href="http://www.facebook.com/selesnow" target="_blank"><span class="screen-reader-text">Facebook</span></a></li>
<li id="menu-item-14" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14"><a href="https://www.linkedin.com/in/selesnow/" target="_blank"><span class="screen-reader-text">LinkedIn</span></a></li>
<li id="menu-item-15" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-15"><a href="http://www.vk.com/selesnow" target="_blank"><span class="screen-reader-text">Vkontakte</span></a></li>
<li id="menu-item-16" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-16"><a href="https://github.com/selesnow"><span class="screen-reader-text">GitHub</span></a></li>
<li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-16"><a href="https://alexeyseleznev.wordpress.com/">Blog</a></li>
</ul>
</div>
</nav>
  
<p align="center">
<img src="https://alexeyseleznev.files.wordpress.com/2017/03/as.png?w=300" data-canonical-src="https://alexeyseleznev.files.wordpress.com/2017/03/as.png?w=300" style="max-width:100%;">
</p>
