# BIL524 Ödev 2

# Örnek veri seti oluşturma
set.seed(123)
n = 20
data_ham <- data.frame(A = c(1:15, 999, 17, NA, 1, 20),  
                   B = c(rnorm(15, mean=10, sd=3), 1, "NA", 1, 1, 0),
                   C = c(letters[c(1:15)], "",  "defne", "   m    i ne", NA, 10))

# Oluşturulan veri setini inceleme                   
head(data_ham)
data_ham 
colnames(data_ham)

# Kolon isimlerini dönüştürme
colnames(data_ham) <- c("Yanlislar", "Netler", "Ogrenci_Adi")
colnames(data_ham)

# Eksik veri tespiti
is_na_data_ham <- is.na(data_ham)
is_na_data_ham

# Veride az sayıda eksik veri var. Ortalama değerlere bakalım
mean(data_ham$Yanlislar, na.rm=TRUE)
mean(data_ham$Netler, na.rm=TRUE)

# Netler kolonunun data tipi ortalama almaya uygun değil -hata verdi. Kolonların data tiplerini inceleyelim
str(data_ham)

# Netler kolonu chr atanmış. Data tiplerini içeriğe uygun şekilde atayalım ve bu şekilde yeni bir data frame yaratalım
data_edit <- type.convert(data_ham, as.is = TRUE)
str(data_edit)
data_edit

# Ortalama değerlere tekrar bakalım
mean(data_edit$Yanlislar, na.rm=TRUE)
mean(data_edit$Netler, na.rm=TRUE)

# Yanlislar kolonunda ortalama çok yüksek çıkıyor. Outlier veriler olabilir. Plot grafiğiyle veriye bakalım
plot(data_edit$Yanlislar)

# Ortalamayı yükselten iki adet aşırı uç değer olduğu görülüyor. Bu satırlar yanlış olabilir. Outlier içeren satırları veriden çıkaralım
data_edit$Yanlislar[data_edit$Yanlislar %in% boxplot.stats(data_edit$Yanlislar)$out]
data_out_edit <- data_edit[! data_edit$Yanlislar %in% boxplot.stats(data_edit$Yanlislar)$out, ]
data_out_edit
mean(data_out_edit$Yanlislar, na.rm=TRUE)

# Veri girilirken sıfır yerine NA olarak girilmiş değerleri sıfıra düzeltme. Tekrar ortalama hesaplayıp datanın son halini inceleme
data_out_edit["Yanlislar"][is.na(data_out_edit["Yanlislar"])] <- 0
data_out_edit["Netler"][is.na(data_out_edit["Netler"])] <- 0
mean(data_out_edit$Yanlislar, na.rm=TRUE)
mean(data_out_edit$Netler, na.rm=TRUE)
data_out_edit

# 18 nolu satırdaki öğrencinin adı yazılırken gereksiz boşluk girilmiş. Kolonda normalizasyon.
data_out_edit$Ogrenci_Adi <- gsub(" ", "", data_out_edit$Ogrenci_Adi)
data_out_edit

# Veri artık düzgün görünüyor. Son bir df olarak kaydetme ve detaylı inceleme
sinav_sonuc <- data_out_edit
plot(sinav_sonuc$Yanlislar)
hist(sinav_sonuc$Netler)
korelasyon <- cor(sinav_sonuc$Yanlislar, sinav_sonuc$Netler)
print(correlation)
plot(sinav_sonuc$Yanlislar, sinav_sonuc$Netler)
