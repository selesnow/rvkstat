<p align="center">
<a href="https://selesnow.github.io/"><img src="https://alexeyseleznev.files.wordpress.com/2017/03/as.png" height="80"></a>
</p>

# rvkstat - R пакет для работы с API Вконтакте<a href='https:/selesnow.github.io/rvkstat'><img src='https://raw.githubusercontent.com/selesnow/rvkstat/master/inst/logo/rvkstat.png' align="right" height="139" /></a>
[![Rdoc](http://www.rdocumentation.org/badges/version/rvkstat)](http://www.rdocumentation.org/packages/rvkstat)
[![rpackages.io rank](http://www.rpackages.io/badge/rvkstat.svg)](http://www.rpackages.io/package/rvkstat)
[![](https://cranlogs.r-pkg.org/badges/rvkstat)](https://cran.r-project.org/package=rvkstat)

## Краткое описание.

Пакет `rvkstat` является R клиентом для работы с API социальной сети [Вконтакте](https://vk.com). С помощью функций данного пакета можно получить статистику из рекламного кабинета Вконтакте, а так же данные о посетителях сообществ вконтакте по дням, в разрезе возрастных групп, пола и геолокации посетителей.

Все функции входящие в пакет rvkstat имеюи префикс vk.

Все функции пакета разделены на блоки, определить к какому блоку относится функция можно из её названия, название блока к которому относится функция идёт сразу после префикса vk:

* Блок функция **GetGroupStat** предназначем для загрузки статистики по сообществам Вконтакте.
* Блок функций **GetAd** направлен на загрузку данных из рекламного кабинета Вконтакте.
* Блок функций **GetDb** даёт возможность загрузки справочной информации из Вконтакте.
* Блок функций **GetUser** используется для загрузки данных о конкретном пользователе Вконтакте.

## Поддержать проект
Вы можете поддержать проект любой произвольной суммой перейдя по этой [ссылке](https://secure.wayforpay.com/button/b6dd4a7083fe0).

## Как получить подробную справку по функциям пакета rvkstat
Все функции пакета имеют подробное описание на русском языке, получить детальную справку по любой функции пакета rvkstat можно с помощь команды `help`, если вы работаете в RStudio справку так же можно получить указав `?` перед названием комапнды:

`help("vkGetAdStatistics")`	

`?vkGetAdStatistics`

## Установка пакета
Пакет `rvkstat` можно установить из CRAN с помощью команды `install.packages("rvkstat")`.

Либо dev версию пакета с GitHub с помощью `devtools::install_github("selesnow/rvkstat")`.

### Ссылки
1. [Документация по работе с пакетом rvkstat](https://selesnow.github.io/rvkstat/).
2. Баг репорты, предложения по доработке и улучшению функционала ryandexdirect оставлять [тут](https://github.com/selesnow/rvkstat/issues). 
3. [Список релизов](https://github.com/selesnow/rvkstat/releases).
4. [Telegram канал](https://t.me/R4marketing)
5. [Группа в Вконтакте](https://vk.com/data_club).

### Автор пакета
Алексей Селезнёв, Head of analytics dept. at [Netpeak](https://netpeak.net)
<Br>email: selesnow@gmail.com
<Br>skype: selesnow
<Br>facebook: [facebook.com/selesnow](https://facebook.com/selesnow)
<Br>linkedin: [linkedin.com/in/selesnow](https://linkedin.com/in/selesnow)
<Br>blog: [alexeyseleznev.wordpress.com](https://alexeyseleznev.wordpress.com/)
