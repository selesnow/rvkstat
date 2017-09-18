# Содержание ReadMe пакета rvkstat
- **[Краткое описание пакета rvkstat](https://github.com/selesnow/rvkstat/blob/master/README.md#Краткое-описание-пакета-rvkstat)**
- **[Как получить подробную справку по функциям пакета](https://github.com/selesnow/rvkstat/blob/master/README.md#Как-получить-подробную-справку-по-функциям-пакета-rvkstat)**
- **[Что необходимо для начала работы с API Вктонтакте с помощью пакета rvkstat](https://github.com/selesnow/rvkstat/blob/master/README.md#Требование)**
- **[Как обойти блокировку API сервиса Вконтакте на Украине](https://github.com/selesnow/rvkstat/blob/master/README.md#Как-работать-с-api-сервиса-Вконтакте-на-Украине)**
- **[Установка пакета rvkstat](https://github.com/selesnow/rvkstat/blob/master/README.md#Установка-пакета)**
- **[Как пройти аутентификацию для работы с API Вконтакте с помощью пакета rvkstat](https://github.com/selesnow/rvkstat#Авторизация-вконтакте-для-работы-с-api)**
  - [vkGetToken](https://github.com/selesnow/rvkstat#Пример-прохождения-авторизации-с-помощью-функции-vkgettoken) - Авторизация в Вконтакте с помощью метода [Implicit Flow](https://github.com/selesnow/rvkstat#Пример-прохождения-авторизации-с-помощью-функции-vkgettoken)
  - [vkAuth](https://github.com/selesnow/rvkstat#Пример-прохождения-авторизации-с-помощью-функции-vkauth) - Авторизация в Вконтакте с помощью метода [Authorization Code Flow](https://vk.com/dev/authcode_flow_user)
- **[Функции доступные в пакете rvkstat](https://github.com/selesnow/rvkstat/blob/master/README.md#Функции-доступные-в-пакете-rvkstat)**
  - [Функции для загрузки данных из рекламного кабинета Вконтакте](https://github.com/selesnow/rvkstat#Функции-для-загрузки-данных-из-рекламного-кабинета-Вконтакте)
    - [vkGetAdCategories](https://github.com/selesnow/rvkstat#Получить-список-возможных-тематик-рекламных-объявлений-и-их-подразделов) - Получить возможные тематики рекламных объявлений и их подразделы.
    - [vkGetAdAccounts](https://github.com/selesnow/rvkstat#Получить-список-досупных-рекламных-кабинетов-Вконтакте) - Получить список доступных рекламных кабинетов
    - [vkGetAdClients](https://github.com/selesnow/rvkstat/blob/master/README.md#Получить-список-клиентов-из-агентского-аккаунта-Вконтакте) - Получить список клиентов из агентского аккаунта
    - [vkGetAds](https://github.com/selesnow/rvkstat#Получить-список-объявлений-из-рекламного-кабинета-вконтакте) - Получить список объявлений
    - [vkGetAdCampaigns](https://github.com/selesnow/rvkstat/blob/master/README.md#Получить-список-рекламных-кампаний-из-рекламного-кабинета-вконтакте) - Получить список рекламных кампаний
    - [vkGetAdStatistics](https://github.com/selesnow/rvkstat/blob/master/README.md#Получить-статистику-показателей-эффективности-по-рекламным-объявлениям-кампаниям-клиентам-или-всему-кабинету) - Получить статистику показателей эффективности по рекламным объявлениям, кампаниям, клиентам или всему кабинету
    - [vkGetAdCityStats](https://github.com/selesnow/rvkstat/blob/master/README.md#Получить-статистику-по-охвату-аудитории-по-рекламным-кампаним-или-объявления-в-разрезе-городов) - Получить статистику по охвату аудитории по рекламным кампаним или объявления в разрезе городов
    - [vkGetAdGenderStats](https://github.com/selesnow/rvkstat/blob/master/README.md#Получить-статистику-по-охвату-аудитории-по-рекламным-кампаним-или-объявления-в-разрезе-пола) - Получить статистику по охвату аудитории по рекламным кампаним или объявления в разрезе пола
    - [vkGetAdAgeStats](https://github.com/selesnow/rvkstat/blob/master/README.md#Получить-статистику-по-охвату-аудитории-по-рекламным-кампаним-или-объявления-в-разрезе-возраста) - Получить статистику по охвату аудитории по рекламным кампаним или объявления в разрезе возраста
    - [vkGetAdGenderAgeStats](https://github.com/selesnow/rvkstat/blob/master/README.md#Получить-статистику-по-охвату-аудитории-по-рекламным-кампаним-или-объявления-в-разрезе-пола-и-возраста) - Получить статистику по охвату аудитории по рекламным кампаним или объявления в разрезе пола и возраста
    - [vkGetAdBudget](https://github.com/selesnow/rvkstat/blob/master/README.md#Получить-остаток-средств-из-рекламного-кабинета) - Получить остаток средств из рекламного кабинета
  - [Функции для загрузки данных из сообществ Вконтакте](https://github.com/selesnow/rvkstat#Функции-для-загрузки-данных-из-сообществ-Вконтакте)
    - [vkGetGroupStat](https://github.com/selesnow/rvkstat#Получить-данные-о-количестве-просмотров-посетителях-подписавшихся-и-отписавшихся-посетителей-по-дням) - Получить общую статистику по сообществу
    - [vkGetGroupStatAge](https://github.com/selesnow/rvkstat#Получить-данные-о-возрастных-группах-посетителей-по-дням) - Получить данные о посетителях сообщества по возрасту
    - [vkGetGroupStatCity](https://github.com/selesnow/rvkstat#Получить-данные-о-городах-посетителей) -Получить данные о посетителях сообщества по городам
    - [vkGetGroupStatCountries](https://github.com/selesnow/rvkstat#Получить-данные-о-странах-посетителей) - Получить данные о посетителях сообщества по странам
    - [vkGetGroupStatGender](https://github.com/selesnow/rvkstat#Получить-данные-о-поле-посетителей-по-дням) - Получить данные о посетителях сообщества по полу
    - [vkGetGroupStatGenderAge](https://github.com/selesnow/rvkstat#Получить-данные-о-половозрастной-структуре-ваших-посетителей-по-дням) - Получить данные о посетителях сообщества по полу и возрасту
  - [Функции для загрузки справочной инормации из Вконтакте](https://github.com/selesnow/rvkstat/blob/master/README.md#Функции-для-загрузки-справочной-информации-из-Вконтакте)
    - [vkGetDbCountries](https://github.com/selesnow/rvkstat#Получить-id-и-название-стран) - Получить id и название стран
    - [vkGetDbCities](https://github.com/selesnow/rvkstat#Получить-id-и-название-стран) - Получить справочник городов
- **[Примеры работы с пакетом rvkstat]()**
- **[Информация об авторе пакета](https://github.com/selesnow/rvkstat/blob/master/README.md#Автор-пакета-Алексей-Селезнёв-head-of-analytics-dept-at-netpeak)**

## Краткое описание пакета rvkstat
Пакет rvkstat является R клиентом для работы с API социальной сети [Вконтакте](url), с помощью функций данного пакета можно получить статистику из рекламного кабинета Вконтакте, а так же данные о посетителях сообществ вконтакте по дням, в разрезе возрастных групп, пола и геолокации посетителей.

Все функции входящие в пакет rvkstat имеюи префикс vk.

Все функции пакета разделены на блоки, определить к какому блоку относится функция можно из её названия, название блока к которому относится функция идёт сразу после префикса vk:

* Блок функция **GetGroupStat** предназначем для загрузки статистики по сообществам Вконтакте.
* Блок функций **GetAd** направлен на загрузку данных из рекламного кабинета Вконтакте.
* Блок функций **GetDb** даёт возможность загрузки справочной информации из Вконтакте.

## Как получить подробную справку по функциям пакета rvkstat
Все функции пакета имеют подробное описание на русском языке, получить детальную справку по любой функции пакета rvkstat можно с помощь команды `help`, если вы работаете в RStudio справку так же можно получить указав `?` перед названием комапнды:

`help("vkGetAdStatistics")`	

`?vkGetAdStatistics`

## Что необходимо для начала работы с API Вктонтакте с помощью пакета rvkstat
Для работы с api вконтакте вам необходимо создать Standalone-приложение, для этого перейдите по этой <a href="https://vk.com/editapp?act=create">ссылке</a>, и выберите Standalone-приложение. 
 <p align="center"><img src="http://picsee.net/upload/2016-04-29/ccbead79d129.png" data-canonical-src="http://picsee.net/upload/2016-04-29/ccbead79d129.png" style="max-width:100%;"></p>

Для начала работы и для того, что бы с помощью функции авторизации в Вконтакте получить токен разработчика используйте ID и Защищённый ключ приложения.
 <p align="center"><img src="http://img.netpeak.ua/alsey/150540127636_kiss_56kb.png" data-canonical-src="http://picsee.net/upload/2016-04-29/39ef5f2d1d09.png" style="max-width:100%;"></p>

## Как работать с API сервисом Вконтакте на Украине
Обойти блокировку API Вконтакте на Украине можно с помощью пакета [getProxy](https://github.com/selesnow/getProxy).
Процесс обхода блокировки с помозью пакета getProxy:

1. Устанавливаем пакет getProxy с помощью приведённого ниже кода:
```
if(!"devtools"" %in% installed.packages()[,1]){install.packages("devtools")}
library(devtools)
install_github("selesnow/getProxy")
```
2. Подключаем пакет getProxy с помощью комманды `library(getProxy)`.
3. Далее с помощью функции `getProy` обходим блокировку через прокси сервер, пример кода ниже:
```
#Направляем интернет соединение через прокси сервер
getProxy(port = "3128", country = "RU", supportsHttps = TRUE, action = "start")

#Пишем код для работы с API Вконтакте с помощью функций пакета rvkstat

#Отключаемся от прокси сервера
getProxy9action = "stop")
```

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
`myToken <- vkAuth(app_id = <ID Вашего Приложения>, app_secret = <Защищённый Ключ Вашего Приложения>)`

Вместо <ID Вашего Приложения> укажите ID вашего приложения, вместо <Защищённый Ключ Вашего Приложения> укажите защищёный ключ вашего приложения, оба аргумента можно посмотреть на странице настройки приложения как описано в разделе "[Что необходимо для начала работы с API Вктонтакте с помощью пакета rvkstat](https://github.com/selesnow/rvkstat/blob/master/README.md#Требование)". 

После запуска функции откроется окно браузера, в котором вы должны подтвердить доступ к данным в вконтакте, далее откроется страница в URL адресе которой будет параметр code, скопируйте его значение и вставьте в R, в качестве ответа на запрос "Enter code from URL: ".

## Функции доступные в пакете rvkstat

### Функции для загрузки данных из рекламного кабинета Вконтакте

#### Получить список возможных тематик рекламных объявлений и их подразделов.
```
##Авторизация в вк
my_tok <- vkAuth(app_id = 11111111,app_secret = "H2Pk8htyFD8024mZaPHm")
##Получение списка возможных тематик рекламных объявлений
vk_ad_categories <- vkGetAdCategories(access_token = my_tok$access_token)
```
##### Аргументы
* <b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken

#### Получить список досупных рекламных кабинетов Вконтакте
```
##Авторизация в вк
my_tok <- vkAuth(app_id = 11111111,app_secret = "H2Pk8htyFD8024mZaPHm")
##Запрос списка доступных рекламных кабинетов
my_vk_acc <- vkGetAccounts(my_tok$access_token)
```
##### Аргументы
* <b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken

#### Получить список клиентов из агентского аккаунта Вконтакте
```
##Авторизация в вк
my_tok <- vkAuth(app_id = 11111111,app_secret = "H2Pk8htyFD8024mZaPHm")
##Запрос списка доступных рекламных кабинетов
my_vk_clients <- vkGetAdClients(account_id = 11111111, access_token = my_tok$access_token)
```
##### Аргументы
* <b>account_id</b> - Идентификатор рекламного кабинета, список всех доступных рекламных кабинетов можно получить с помщью функции vkGetAdAccounts.
* <b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken

#### Получить список объявлений из рекламного кабинета вконтакте
```
##Авторизация в вконтакте
my_tok <- vkAuth(app_id = 11111111,app_secret = "H2Pk8htyFD8024mZaPHm")
#Получаем список объявлений
my_vk_ads <- vkGetAds(account_id = 11111111, 
                      access_token = my_tok$access_token)
```
##### Аргументы
* <b>account_id</b> - Идентификатор рекламного кабинета, список всех доступных рекламных кабинетов можно получить с помщью функции vkGetAdAccounts.
* <b>client_id</b> - Идентификатор клиента, у которого запрашиваются рекламные объявления. Доступно и обязательно для рекламных агентств.
* <b>include_deleted</b> - Логическое TRUE или FALSE, флаг, задающий необходимость вывода архивных объявлений.
* <b>campaign_ids</b> - Числовой вектор, фильтр по рекламным кампаниям.
* <b>ad_ids</b> - Числовой вектор, фильтр по рекламным объявлениям.
* <b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken

#### Получить список рекламных кампаний из рекламного кабинета вконтакте
```
##Авторизация в вконтакте
my_tok <- vkAuth(app_id = 11111111,app_secret = "H2Pk8htyFD8024mZaPHm")
#Получаем список рекламных кампаний
my_vk_campaigns <- vkGetAdCampaigns(account_id = 11111111, 
                                    access_token = my_tok$access_token)
```
##### Аргументы
* <b>account_id</b> - Идентификатор рекламного кабинета, список всех доступных рекламных кабинетов можно получить с помщью функции vkGetAdAccounts.
* <b>client_id</b> - Идентификатор клиента, у которого запрашиваются рекламные объявления. Доступно и обязательно для рекламных агентств.
* <b>include_deleted</b> - Логическое TRUE или FALSE, флаг, задающий необходимость вывода архивных объявлений.
* <b>campaign_ids</b> - Числовой вектор, фильтр по рекламным кампаниям.
* <b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken

#### Получить статистику показателей эффективности по рекламным объявлениям, кампаниям, клиентам или всему кабинету.
```
##Авторизация в вконтакте
my_tok <- vkAuth(app_id = 11111111,app_secret = "H2Pk8htyFD8024mZaPHm")

##Получаем список рекламных кампаний
camp <- vkGetAdCampaigns(account_id = 11111111, access_token = my_tok$access_token)

##Получаем статистику по рекламным кампаниям по дням
vk_stat_by_campaign <- vkGetAdStatistics(account_id = 11111111,
                                         ids_type = "campaign",
                                         ids = camp$id ,
                                         period = "day",
                                         date_from = "2010-01-01", 
                                         date_to = "2017-09-10",
                                         access_token = my_tok$access_token)
										
```
##### Аргументы
* <b>account_id</b> - Идентификатор рекламного кабинета, список всех доступных рекламных кабинетов можно получить с помщью функции vkGetAdAccounts.
* <b>ids_type</b> - Тип запрашиваемых объектов, которые перечислены в параметре ids, допустимые значения:
  * ad — объявления
  * campaign — кампании
  * client — клиенты
  * office — кабинет
* <b>ids</b> - Перечисленные через запятую id запрашиваемых объявлений, кампаний, клиентов или кабинета, в зависимости от того, что указано в параметре ids_type. 
* <b>period</b> - Способ группировки данных по датам, допустимые значения:
  * day — статистика по дням
  * month — статистика по месяцам
  * overall — статистика за всё время
* <b>date_from</b> - Начальная дата выводимой статистики. Используется разный формат дат для разного значения параметра period
  * day: YYYY-MM-DD, пример: 2011-09-27 - 27 сентября 2011
  * month: YYYY-MM, пример: 2011-09 - сентябрь 2011
  * overall: 0
* <b>date_to</b> - Конечная дата выводимой статистики. Используется разный формат дат для разного значения параметра period:
  * day: YYYY-MM-DD, пример: 2011-09-27 - 27 сентября 2011
  * month: YYYY-MM, пример: 2011-09 - сентябрь 2011
  * overall: 0
* <b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken

##### Возвращаемые значения
* id — id объекта из параметра ids
* type — тип объекта из параметра ids_type
* day (если period равен day) — день в формате YYYY-MM-DD
* month (если period равен month) — день в формате YYYY-MM
* overall (если period равен overall) — 1
* spent — потраченные средства
* impressions — просмотры
* clicks — клики
* reach (если ids_type равен ad или campaign и period равен day или month) — охват
* video_views (если ids_type равен ad) — просмотры видеоролика (для видеорекламы)
* video_views_half (если ids_type равен ad) — просмотры половины видеоролика (для видеорекламы)
* video_views_full (если ids_type равен ad) — просмотры целого видеоролика (для видеорекламы)
* video_clicks_site (если ids_type равен ad) — переходы на сайт рекламодателя из видеорекламы (для видеорекламы)
* join_rate (если ids_type равен ad или campaign) — вступления в группу, событие, подписки на публичную страницу или установки приложения (только если в объявлении указана прямая ссылка на соответствующую страницу ВКонтакте)

#### Получить остаток средств из рекламного кабинета
```
##Авторизация в вконтакте
my_tok <- vkAuth(app_id = 11111111,app_secret = "H2Pk8htyFD8024mZaPHm")
#Получаем остаток средств из рекламного кабинета
vk_budget <- vkGetAdBudget(account_id = 11111111, 
                           access_token = my_tok$access_token)
```
##### Аргументы
* <b>account_id</b> - Идентификатор рекламного кабинета, список всех доступных рекламных кабинетов можно получить с помщью функции vkGetAdAccounts.
* <b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken

#### Получить статистику по охвату аудитории по рекламным кампаним или объявления в разрезе городов
```
##Авторизация в вконтакте
my_tok <- vkAuth(app_id = 11111111,app_secret = "H2Pk8htyFD8024mZaPHm")

##Получаем список рекламных кампаний
camp <- vkGetAdCampaigns(account_id = 11111111, access_token = my_tok$access_token)

##Получаем статистику по рекламным кампаниям по дням
vk_ad_city_stat_day <- vkGetAdCityStats(account_id = 11111111,
                                        ids_type = "campaign",
                                        ids = camp$id ,
                                        period = "day",
                                        date_from = "2010-01-01", 
                                        date_to = "2017-09-10",
                                        access_token = my_tok$access_token)
										
```
##### Аргументы
* <b>account_id</b> - Идентификатор рекламного кабинета, список всех доступных рекламных кабинетов можно получить с помщью функции vkGetAdAccounts.
* <b>ids_type</b> - Тип запрашиваемых объектов, которые перечислены в параметре ids, допустимые значения:
  * ad — объявления
  * campaign — кампании
* <b>ids</b> - Перечисленные через запятую id запрашиваемых объявлений, кампаний, клиентов или кабинета, в зависимости от того, что указано в параметре ids_type. 
* <b>period</b> - Способ группировки данных по датам, допустимые значения:
  * day — статистика по дням
  * month — статистика по месяцам
  * overall — статистика за всё время
* <b>date_from</b> - Начальная дата выводимой статистики. Используется разный формат дат для разного значения параметра period
  * day: YYYY-MM-DD, пример: 2011-09-27 - 27 сентября 2011
  * month: YYYY-MM, пример: 2011-09 - сентябрь 2011
  * overall: 0
* <b>date_to</b> - Конечная дата выводимой статистики. Используется разный формат дат для разного значения параметра period:
  * day: YYYY-MM-DD, пример: 2011-09-27 - 27 сентября 2011
  * month: YYYY-MM, пример: 2011-09 - сентябрь 2011
  * overall: 0
* <b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken

##### Возвращаемые значения
* id — id объекта из параметра ids
* type — тип объекта из параметра ids_type
* day (если period равен day) — день в формате YYYY-MM-DD
* month (если period равен month) — день в формате YYYY-MM
* overall (если period равен overall) — 1
* city_id — id города или other для остальных городов
* city_name — id города или other для остальных городов
* impressions_rate — часть аудитории, просмотревшая объявление, от 0 до 1.
* clicks_rate — часть аудитории, кликнувшая по объявлению, от 0 до 1.

#### Получить статистику по охвату аудитории по рекламным кампаним или объявления в разрезе пола
```
##Авторизация в вконтакте
my_tok <- vkAuth(app_id = 11111111,app_secret = "H2Pk8htyFD8024mZaPHm")

##Получаем список рекламных кампаний
camp <- vkGetAdCampaigns(account_id = 11111111, access_token = my_tok$access_token)

##Получаем статистику по рекламным кампаниям по дням
vk_ad_gender_stat_day <- vkGetAdGenderStats(account_id = 11111111,
                                            ids_type = "campaign",
                                            ids = camp$id ,
                                            period = "day",
                                            date_from = "2010-01-01", 
                                            date_to = "2017-09-10",
                                            access_token = my_tok$access_token)
```
##### Аргументы
* <b>account_id</b> - Идентификатор рекламного кабинета, список всех доступных рекламных кабинетов можно получить с помщью функции vkGetAdAccounts.
* <b>ids_type</b> - Тип запрашиваемых объектов, которые перечислены в параметре ids, допустимые значения:
  * ad — объявления
  * campaign — кампании
* <b>ids</b> - Перечисленные через запятую id запрашиваемых объявлений, кампаний, клиентов или кабинета, в зависимости от того, что указано в параметре ids_type. 
* <b>period</b> - Способ группировки данных по датам, допустимые значения:
  * day — статистика по дням
  * month — статистика по месяцам
  * overall — статистика за всё время
* <b>date_from</b> - Начальная дата выводимой статистики. Используется разный формат дат для разного значения параметра period
  * day: YYYY-MM-DD, пример: 2011-09-27 - 27 сентября 2011
  * month: YYYY-MM, пример: 2011-09 - сентябрь 2011
  * overall: 0
* <b>date_to</b> - Конечная дата выводимой статистики. Используется разный формат дат для разного значения параметра period:
  * day: YYYY-MM-DD, пример: 2011-09-27 - 27 сентября 2011
  * month: YYYY-MM, пример: 2011-09 - сентябрь 2011
  * overall: 0
* <b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken

##### Возвращаемые значения
* id — id объекта из параметра ids
* type — тип объекта из параметра ids_type
* day (если period равен day) — день в формате YYYY-MM-DD
* month (если period равен month) — день в формате YYYY-MM
* overall (если period равен overall) — 1
* gender — пол, f - женский, m - мужской
* impressions_rate — часть аудитории, просмотревшая объявление, от 0 до 1.
* clicks_rate — часть аудитории, кликнувшая по объявлению, от 0 до 1.

#### Получить статистику по охвату аудитории по рекламным кампаним или объявления в разрезе возраста
```
##Авторизация в вконтакте
my_tok <- vkAuth(app_id = 11111111,app_secret = "H2Pk8htyFD8024mZaPHm")

##Получаем список рекламных кампаний
camp <- vkGetAdCampaigns(account_id = 11111111, access_token = my_tok$access_token)

##Получаем статистику по рекламным кампаниям по дням
vk_ad_age_stat_day <- vkGetAdAgeStats(account_id = 1,
                                      ids_type = "campaign",
                                      ids = camp$id ,
                                      period = "day",
                                      date_from = "2010-01-01", 
                                      date_to = "2017-09-10",
                                      access_token = my_tok$access_token)
```
##### Аргументы
* <b>account_id</b> - Идентификатор рекламного кабинета, список всех доступных рекламных кабинетов можно получить с помщью функции vkGetAdAccounts.
* <b>ids_type</b> - Тип запрашиваемых объектов, которые перечислены в параметре ids, допустимые значения:
  * ad — объявления
  * campaign — кампании
* <b>ids</b> - Перечисленные через запятую id запрашиваемых объявлений, кампаний, клиентов или кабинета, в зависимости от того, что указано в параметре ids_type. 
* <b>period</b> - Способ группировки данных по датам, допустимые значения:
  * day — статистика по дням
  * month — статистика по месяцам
  * overall — статистика за всё время
* <b>date_from</b> - Начальная дата выводимой статистики. Используется разный формат дат для разного значения параметра period
  * day: YYYY-MM-DD, пример: 2011-09-27 - 27 сентября 2011
  * month: YYYY-MM, пример: 2011-09 - сентябрь 2011
  * overall: 0
* <b>date_to</b> - Конечная дата выводимой статистики. Используется разный формат дат для разного значения параметра period:
  * day: YYYY-MM-DD, пример: 2011-09-27 - 27 сентября 2011
  * month: YYYY-MM, пример: 2011-09 - сентябрь 2011
  * overall: 0
* <b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken

##### Возвращаемые значения
* id — id объекта из параметра ids
* type — тип объекта из параметра ids_type
* day (если period равен day) — день в формате YYYY-MM-DD
* month (если period равен month) — день в формате YYYY-MM
* overall (если period равен overall) — 1
* age — возрастная группа (12-18, 18-21, 21-24, 24-27, 27-30, 30-35, 35-45, 45-100)
* impressions_rate — часть аудитории, просмотревшая объявление, от 0 до 1.
* clicks_rate — часть аудитории, кликнувшая по объявлению, от 0 до 1.

#### Получить статистику по охвату аудитории по рекламным кампаним или объявления в разрезе пола и возраста
```
##Авторизация в вконтакте
my_tok <- vkAuth(app_id = 11111111,app_secret = "H2Pk8htyFD8024mZaPHm")

##Получаем список рекламных кампаний
camp <- vkGetAdCampaigns(account_id = 11111111, access_token = my_tok$access_token)

##Получаем статистику по рекламным кампаниям по дням
vk_ad_gender_age_stat_day <- vkGetAdGenderAgeStats(account_id = 11111111,
                                                   ids_type = "campaign",
                                                   ids = camp$id ,
                                                   period = "day",
                                                   date_from = "2010-01-01", 
                                                   date_to = "2017-09-10",
                                                   access_token = my_tok$access_token)
```
##### Аргументы
* <b>account_id</b> - Идентификатор рекламного кабинета, список всех доступных рекламных кабинетов можно получить с помщью функции vkGetAdAccounts.
* <b>ids_type</b> - Тип запрашиваемых объектов, которые перечислены в параметре ids, допустимые значения:
  * ad — объявления
  * campaign — кампании
* <b>ids</b> - Перечисленные через запятую id запрашиваемых объявлений, кампаний, клиентов или кабинета, в зависимости от того, что указано в параметре ids_type. 
* <b>period</b> - Способ группировки данных по датам, допустимые значения:
  * day — статистика по дням
  * month — статистика по месяцам
  * overall — статистика за всё время
* <b>date_from</b> - Начальная дата выводимой статистики. Используется разный формат дат для разного значения параметра period
  * day: YYYY-MM-DD, пример: 2011-09-27 - 27 сентября 2011
  * month: YYYY-MM, пример: 2011-09 - сентябрь 2011
  * overall: 0
* <b>date_to</b> - Конечная дата выводимой статистики. Используется разный формат дат для разного значения параметра period:
  * day: YYYY-MM-DD, пример: 2011-09-27 - 27 сентября 2011
  * month: YYYY-MM, пример: 2011-09 - сентябрь 2011
  * overall: 0
* <b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken

##### Возвращаемые значения
* id — id объекта из параметра ids
* type — тип объекта из параметра ids_type
* day (если period равен day) — день в формате YYYY-MM-DD
* month (если period равен month) — день в формате YYYY-MM
* overall (если period равен overall) — 1
* gender - пол (f — женщины, m — мужчины)
* age — возрастная группа (12-18, 18-21, 21-24, 24-27, 27-30, 30-35, 35-45, 45-100)
* impressions_rate — часть аудитории, просмотревшая объявление, от 0 до 1.
* clicks_rate — часть аудитории, кликнувшая по объявлению, от 0 до 1.

### Функции для загрузки данных из сообществ Вконтакте
Во всех примерах этого раздела подразумевается что вы сначала прошли процесс авторизации с помощью функции vkAuth, пример кода ниже:

```
##Авторизация в вконтакте
my_tok <- vkAuth(app_id = 1,app_secret = "H2Pk8htyFD8024mZaPHm")
```

#### Получить данные о количестве просмотров, посетителях, подписавшихся и отписавшихся посетителей по дням

```
communityData <- vkGetGroupStat(date_from = "2016-01-01", 
                                date_to = "2016-04-01", 
                                group_id = 1, 
                                access_token = my_tok$access_token)
``` 
##### Аргументы
* <b>date_from</b> - Начальная дата выводимой статистики в формате YYYY-MM-DD.
* <b>date_to</b> - Конечная дата выводимой статистики в формате YYYY-MM-DD.
* <b>group_id</b> - Идентификатор сообщества.
* <b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken

#### Получить данные о возрастных группах посетителей по дням.

```
communityDataAge <- vkGetGroupStatAge(date_from = "2016-01-01", 
                                      date_to = "2016-04-01", 
                                      group_id = 1, 
                                      access_token = my_tok$access_token)
```
##### Аргументы
* <b>date_from</b> - Начальная дата выводимой статистики в формате YYYY-MM-DD.
* <b>date_to</b> - Конечная дата выводимой статистики в формате YYYY-MM-DD.
* <b>group_id</b> - Идентификатор сообщества.
* <b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken

#### Получить данные о поле посетителей по дням.

```
communityDataGender <- vkGetGroupStatGender(date_from = "2016-01-01", 
                                            date_to = "2016-04-01", 
                                            group_id = 1, 
                                            access_token = my_tok$access_token)
```
##### Аргументы
* <b>date_from</b> - Начальная дата выводимой статистики в формате YYYY-MM-DD.
* <b>date_to</b> - Конечная дата выводимой статистики в формате YYYY-MM-DD.
* <b>group_id</b> - Идентификатор сообщества.
* <b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken

#### Получить данные о половозрастной структуре ваших посетителей по дням.

```
communityDataGenderAge <- vkGetGroupStatGenderAge(date_from = "2016-01-01", 
                                                  date_to = "2016-04-01", 
                                                  group_id = 1, 
                                                  access_token = my_tok$access_token)
```
##### Аргументы
* <b>date_from</b> - Начальная дата выводимой статистики в формате YYYY-MM-DD.
* <b>date_to</b> - Конечная дата выводимой статистики в формате YYYY-MM-DD.
* <b>group_id</b> - Идентификатор сообщества.
* <b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken

#### Получить данные о городах посетителей.

```
communityDataCity <- vkGetGroupStatCity(date_from = "2016-01-01", 
                                        date_to = "2016-04-01", 
                                        group_id = 1, 
                                        access_token = my_tok$access_token)
```
##### Аргументы
* <b>date_from</b> - Начальная дата выводимой статистики в формате YYYY-MM-DD.
* <b>date_to</b> - Конечная дата выводимой статистики в формате YYYY-MM-DD.
* <b>group_id</b> - Идентификатор сообщества.
* <b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken

#### Получить данные о странах посетителей.

```
communityDataCountries <- vkGetGroupStatCountries(date_from = "2016-01-01", 
                                                  date_to = "2016-04-01", 
                                                  group_id = 1, 
                                                  access_token = my_tok$access_token)
```
##### Аргументы
* <b>date_from</b> - Начальная дата выводимой статистики в формате YYYY-MM-DD.
* <b>date_to</b> - Конечная дата выводимой статистики в формате YYYY-MM-DD.
* <b>group_id</b> - Идентификатор сообщества.
* <b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken

### Функции для загрузки справочной информации из Вконтакте
Во всех примерах этого раздела подразумевается что вы сначала прошли процесс авторизации с помощью функции vkAuth, пример кода ниже:

```
##Авторизация в вконтакте
my_tok <- vkAuth(app_id = 1,app_secret = "H2Pk8htyFD8024mZaPHm")
```

#### Получить id и название стран
```
##Получаем список стран
vk_countries <- vkGetDbCountries(need_all = T,
                                 code = c("RU","UA","BY"),
                                 access_token = my_tok$access_token)
```
##### Аргументы
* <b>need_all</b> - Логическое TRUE или FALSE, флаг - вернуть список всех стран.
* <b>code</b> - Текстовый вектор, двухбуквенные коды стран в стандарте ISO 3166-1 alpha-2, для которых необходимо выдать информацию. Пример c("RU","UA","BY"), список всех кодов можно посмотреть по ссылке - https://vk.com/dev/country_codes. Не обязательный аргумент.
* <b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken

#### Получить справочник городов
```
##Получаем справочник городов Украины, т.к. id Украины = 2
vk_cities <- vkGetDbCities(country_id = 2,
                           access_token = my_tok$access_token)
```
##### Аргументы
* <b>country_id</b> - Идентификатор страны, полученный с помощью функции vkGetDbCountries.
* <b>region_id</b> - Идентификатор региона, города которого необходимо получить. (параметр не обязателен).}
* <b>q</b> - Строка поискового запроса. Например, "Санкт". Максимальная длина строки — 15 символов.
* <b>need_all</b> - Логическое TRUE или FALSE, флаг - вернуть список всех городов страны указанной в аргументе country_id.
* <b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken


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
