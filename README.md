<p align="center">
<a href="https://selesnow.github.io/"><img src="https://alexeyseleznev.files.wordpress.com/2017/03/as.png" height="80"></a>
</p>

# rvkstat

## Краткое описание.

Пакет rvkstat является R клиентом для работы с API социальной сети [Вконтакте](url), с помощью функций данного пакета можно получить статистику из рекламного кабинета Вконтакте, а так же данные о посетителях сообществ вконтакте по дням, в разрезе возрастных групп, пола и геолокации посетителей.

Все функции входящие в пакет rvkstat имеюи префикс vk.

Все функции пакета разделены на блоки, определить к какому блоку относится функция можно из её названия, название блока к которому относится функция идёт сразу после префикса vk:

* Блок функция **GetGroupStat** предназначем для загрузки статистики по сообществам Вконтакте.
* Блок функций **GetAd** направлен на загрузку данных из рекламного кабинета Вконтакте.
* Блок функций **GetDb** даёт возможность загрузки справочной информации из Вконтакте.
* Блок функций **GetUser** используется для загрузки данных о конкретном пользователе Вконтакте.

## Как получить подробную справку по функциям пакета rvkstat
Все функции пакета имеют подробное описание на русском языке, получить детальную справку по любой функции пакета rvkstat можно с помощь команды `help`, если вы работаете в RStudio справку так же можно получить указав `?` перед названием комапнды:

`help("vkGetAdStatistics")`	

`?vkGetAdStatistics`

## Установка пакета
Пакет rvkstat может быть установлен непосредственно из репозитория Github с помощью приведённого ниже программного кода.

### Установка на Windows
```
if(!"devtools" %in% installed.packages()[,1]){install.packages("devtools")}
devtools::install_github('selesnow/rvkstat')
```
### Установка на Ubuntu, Linux, Mac
```r
if(!"devtools" %in% installed.packages()[,1]){install.packages("devtools")}
devtools::install_github('selesnow/rvkstat', subdir = "en")
```

### Ссылки
1. [Документация по работе с пакетом rvkstat](https://selesnow.github.io/rvkstat/).
2. Баг репорты, предложения по доработке и улучшению функционала ryandexdirect оставлять [тут](https://github.com/selesnow/rvkstat/issues). 
3. [Список релизов](https://github.com/selesnow/rvkstat/releases).
4. [Группа в Вконтакте](https://vk.com/data_club).

### Автор пакета
Алексей Селезнёв, Head of analytics dept. at [Netpeak](https://netpeak.net)
<Br>email: selesnow@gmail.com
<Br>skype: selesnow
<Br>facebook: [facebook.com/selesnow](https://facebook.com/selesnow)
<Br>linkedin: [linkedin.com/in/selesnow](https://linkedin.com/in/selesnow)
<Br>blog: [alexeyseleznev.wordpress.com](https://alexeyseleznev.wordpress.com/)
