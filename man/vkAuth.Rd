\name{vkAuth}
\alias{vkAuth}
\title{Àâòîðèçàöèÿ â Âêîíòàêòå}
\description{Ôóíêöèÿ vkAuth äà¸ò âîçìîæíîñòü ïîëó÷èòü òîêåí äëÿ äîñòóïà ê API èñïîëüçóÿ ñõåìó Authorization Code Flow - https://vk.com/dev/authcode_flow_user}
\usage{
vkAuth(app_id = NULL, client_secret = NULL, apiVersion = "5.68")
}
\arguments{
  \item{app_id}{ID ïðèëîæåíèÿ, íàéòè åãî ìîæíî íà ñòðàíèöå íàñòðîéêè ïðèëîæåíèÿ.}
  \item{client_secret}{Çàùèù¸ííûé êëþ÷ ïðèëîæåíèÿ, íàéòè åãî ìîæíî íà ñòðàíèöå íàñòðîéêè ïðèëîæåíèÿ.}
  \item{apiVersion}{Âåðñèÿ API.}
}
\value{Ñïèñîê ó÷¸òíûõ äàííûõ äëÿ ðàáîòû ñ API Âêîíòàêòå}
\author{
Alexey Seleznev
}

\examples{
##Auth in VK
my_tok <- vkAuth(app_id = 1,client_secret = "H2Pk8htyFD8024mZaPHm")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
