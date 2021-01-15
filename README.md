# rvkstat - R акет для работы с API Вконтакте<a href='https://selesnow.github.io/rvkstat/'><img src='https://raw.githubusercontent.com/selesnow/rvkstat/master/inst/logo/rvkstat.png' align="right" height="139" /></a>

## Краткое описание.

Пакет rvkstat является R клиентом для работы с API социальной сети [Вконтакте](https://vk.com/), с помощью функций данного пакета можно получить статистику из рекламного кабинета Вконтакте, а так же данные о посетителях сообществ вконтакте по дням, в разрезе возрастных групп, пола и геолокации посетителей.

Все функции входящие в пакет rvkstat имеюи префикс vk.

Все функции пакета разделены на блоки, определить к какому блоку относится функция можно из её названия, название блока к которому относится функция идёт сразу после префикса vk:

* Блок функция **GetGroupStat** предназначем для загрузки статистики по сообществам Вконтакте.
* Блок функций **GetAd** направлен на загрузку данных из рекламного кабинета Вконтакте.
* Блок функций **GetDb** даёт возможность загрузки справочной информации из Вконтакте.
* Блок функций **GetUser** используется для загрузки данных о конкретном пользователе Вконтакте.
* Блок Функций **Set** позволяет управлять опциями пакета.

## Как получить подробную справку по функциям пакета rvkstat
Все функции пакета имеют подробное описание на русском языке, получить детальную справку по любой функции пакета rvkstat можно с помощь команды `help`, если вы работаете в RStudio справку так же можно получить указав `?` перед названием комапнды:

`help("vkGetAdStatistics")`	

`?vkGetAdStatistics`

## Установка пакета
Пакет rvkstat может быть установлен непосредственно из CRAN или репозитория Github с помощью приведённого ниже программного кода.

### Установка с CRAN
```r
install.packages('rvkstat')
```
### Установка с Github
```r
if(!"devtools" %in% installed.packages()[,1]){install.packages("devtools")}
devtools::install_github('selesnow/rvkstat', subdir = "en")
```

### Ссылки
1. [Документация по работе с пакетом rvkstat](https://selesnow.github.io/rvkstat/).
2. Баг репорты, предложения по доработке и улучшению функционала ryandexdirect оставлять [тут](https://github.com/selesnow/rvkstat/issues). 
3. [Список релизов](https://github.com/selesnow/rvkstat/releases).

### Автор пакета
Алексей Селезнёв, Head of analytics dept. at [Netpeak](https://netpeak.net)
<Br>email: selesnow@gmail.com
<Br>skype: selesnow
<Br>Telegram Channel: http://t.me/R4marketing
<Br>YouTube channel: [R4marketing](https://www.youtube.com/R4marketing?sub_confirmation=1)
<Br>facebook: facebook.com/selesnow
<Br>linkedin: linkedin.com/in/selesnow
<Br>blog: alexeyseleznev.wordpress.com
<Br>site: selesnow.github.io
<Br>Группа в Вконтакте: vk.com/data_club
