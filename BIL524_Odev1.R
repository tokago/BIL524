#çalışma klasörünü görme
getwd ()

#csv import edebilmek için readr paketini aktifleştiriyorum
install.packages("readr")
library(readr)

#örnek bir veri setini üzerinde çalışmak üzere online kaynaktan import etme
titanic <- read_csv("https://gist.githubusercontent.com/fyyying/4aa5b471860321d7b47fd881898162b7/raw/6907bb3a38bfbb6fccf3a8b1edfb90e39714d14f/titanic_dataset.csv")

#veri setini inceleme
view(titanic)
head(titanic)
dim(titanic)
nrow(titanic)
ncol(titanic)
colnames(titanic)

#tidyverse ve dplyr paketlerini etkinleştirme
install.packages("tidyverse")
library(tidyverse)
install.packages("dplyr")
library(dplyr)

#bazı kolon isimlerini türkçeleştirip yeni bir data frame olarak kaydedeceğim
titanic_TR = rename(titanic, Yolcu_No = PassengerId, Yolcu_Sinifi = Pclass, Yolcu_Adi = Name)
head(titanic_TR)