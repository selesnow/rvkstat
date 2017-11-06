.onAttach <- function(lib, pkg,...){
  packageStartupMessage(rvkstatWelcomeMessage())
}

#
#

rvkstatWelcomeMessage <- function(){
  # library(utils)
  
  paste0("\n",
         "---------------------\n",
         "Добро паловать в rvkstat версии ", utils::packageDescription("rvkstat")$Version, "\n",
         "\n",
		 "Описание: \n",
		 "rvkstat - R клиент для упрощённой работы с API социальной сети ВКонтакте, и загрузки данных в R. \n",
		 "\n",
         "Автор пакета: \n",
		 "Алексей Селезнёв / Alexey Seleznev (Head of analytics dept at Netpeak).\n",
         "Email:        selesnow@gmail.com\n",
         "Блог:         https://alexeyseleznev.wordpress.com \n",
         "Facebook:     https://facebook.com/selesnown \n",
         "Linkedin:     https://www.linkedin.com/in/selesnow \n",
         "\n",
         "Используйте ?rvkstat для получения справки по всем доступным в пакете rvkstat функциям.\n",
         "Страница пакета на github: https://github.com/selesnow/rvkstat/\n",
         "\n",
         "Предлоджения по улучшению пакета, а так же отчёты об ошибках можно оставлять тут: https://github.com/selesnow/rvkstat/issues\n",
         "\n",
         "\tЧто бы это сообщение больше не выводилось используйте команду:  ", "suppressPackageStartupMessages(library(rvkstat))\n",
         "---------------------\n"
  )
}
