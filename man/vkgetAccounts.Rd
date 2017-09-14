\name{vkgetAccounts}
\alias{vkgetAccounts}
\title{Âîçâðàùàåò ñïèñîê ðåêëàìíûõ êàáèíåòîâ}
\description{Ôóíêöèÿ vkgetAccounts âîçâðàùàåò ñïèñîê äîñòóïíû ðåêëàìíûõ êàáèíåòîâ.}
\usage{
vkgetAccounts(access_token = NULL)
}
\arguments{
  \item{access_token}{Òîêåí äîñòóïà ê API, ïîëó÷åííûé ñ ïîìîùüþ ôóíêöèé vkAuth èëè vkGetToken}
}
\value{Äàòà ôðåéì ñî ñïèñêîì ðåêëàìíûõ êàáèíåòîâ è èõ ïàðàìåòðîâ}
\author{
Alexey Seleznev
}

\examples{
##Àâòîðèçàöèÿ â âê
my_tok <- vkAuth(app_id = 1,client_secret = "H2Pk8htyFD8024mZaPHm")

##Çàïðîñ ñïèñêà äîñòóïíûõ ðåêëàìíûõ êàáèíåòîâ
my_vk_acc <- vkgetAccounts(my_tok$access_token)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
