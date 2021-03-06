## 1 
Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas π΄ terhadap kadar saturasi oksigen pada manusia. 
Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas π΄, peneliti mencatat
kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut
diminta melakukan aktivitas π΄. Setelah 15 menit, peneliti tersebut mencatat kembali
kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden
mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas π΄.

Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen dari
responden ke-3 ketika belum melakukan aktivitas π΄ sebanyak 67, dan setelah
melakukan aktivitas π΄ sebanyak 70.

### a. Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel
diatas
Pertama, kita buat tabelnya menggunakan r terlebih dahulu
```
x <- c(78,75,67,77,70,72,78,74,77)
y <- c(100,95,70,90,90,90,89,90,100)
```
Kemudian, kita cari nilai selisih dan standar deviasi
```
selisih <- y-x
standardeviasi <- sd(selisih)
```
Didapatkan hasil sebagai berikut <br>
<img width="323" alt="no1a" src="https://user-images.githubusercontent.com/90702710/170870191-ee347036-89cc-4df0-948f-bff90fcf75b2.png">


### b. Carilah nilai t (p-value)
Pengerjaan menggunakan library BSDA dengan rumus `t.test`
```
library(BSDA)
t.test(selisih, alternative = 'two.sided', mu=15, sigma.x=standardeviasi)
```
Didapatkan hasil sebagai berikut <br>
<img width="434" alt="no1b" src="https://user-images.githubusercontent.com/90702710/170871096-67cc7192-1ec1-49ea-ba27-d65af053e481.png">



### c. Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas π΄ jika diketahui tingkat signifikansi πΌ = 5% serta H0 : βtidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas π΄β Untuk mengetahui kebenaran hipotesis nol, kita perlu menghitung nilai kritikalnya terlebih dahulu
```
qt(p = 0.025, df = 8, lower.tail = FALSE)
```
Didapatkan hasil sebagai berikut <br>
<img width="368" alt="no1c_b" src="https://user-images.githubusercontent.com/90702710/170872726-adf164a2-44b1-4531-be2a-51b1b75add1a.png">
<br>
Karena hasil uji statistik (t) terletak di selang nilai kritikal, maka kita dapat menerima hipotesis nol

## 2
Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun.
Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk
mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata
23.500 kilometer dan standar deviasi 3900 kilometer

### a. Apakah Anda setuju dengan klaim tersebut?
Pengerjaan menggunakan library BSDA dan menggunakan rumus `zsum.test` dengan memasukkan nilai yang sesuai
```
library(BSDA)
zsum.test(mean.x=23500, sigma.x=3900, n.x=100, alternative="greater", mu=20000)
```
Didapatkan hasil sebagai berikut <br>
<img width="455" alt="no2a" src="https://user-images.githubusercontent.com/90702710/170870211-89c558ca-0964-4172-877f-a359f84cc0a0.png">
<br>
Dengan kata lain, kita dapat setuju dengan klaim tersebut karena nilai yang didapatkan sesuai dengan klaim yang dinyatakan (lebih dari 20.000)


### b. Jelaskan maksud dari output yang dihasilkan!
Berdasarkan output, diidapatkan nilai z = 8.9744 dan nilai p-value < 2.2e-16. Dari hasil tersebut, dapat disimpulkan bahwa rata-rata bernilai lebih besar dari 20000. Selain itu, diperoleh juga kepercayaan rata-rata dari sampel adalah 22858.51 dengan selang kepercayaan 95%

#### c. Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!
P-Value yang bernilai rendah berarti data yang dimiliki tidak sesuai dengan hipotesis nol, begitu juga sebaliknya. Maka dari itu, karena pada data ini P-Value bernilai sangat kecil, hipotesis nol atau klaim yang ada pada soal akan ditolak

## 3
Diketahui perusahaan memiliki seorang data analyst ingin memecahkan
permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya
didapatkanlah data berikut dari perusahaan saham tersebut.
Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil
diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada
rata-ratanya (Ξ±= 0.05)

### a. H0 dan H1
H0: ΞΌ Bali = ΞΌ Bandung (nilai rata-rata saham Bali sama dengan nilai rata-rata saham Bandung) <br>
H1: ΞΌ Bali β  ΞΌ Bandung (nilai rata-rata saham Bali tidak sama dengan nilai rata-rata saham Bandung)

### b.  Hitung Sampel Statistik
Pengerjaan menggunakan library BSDA dengan rumus `tsum.test`
```
library(BSDA)
tsum.test(mean.x = 3.64, s.x = 1.67, n.x = 19, mean.y = 2.79, s.y = 1.32, n.y = 27, conf.level = 0.95)
```
Didapatkan hasil sebagai berikut <br>
<img width="537" alt="no3b" src="https://user-images.githubusercontent.com/90702710/170870255-7468d979-35a6-478c-8e36-4a2f4f5d0a9d.png">


### c.  Lakukan Uji Statistik (df =2)
Uji statistik dilakukan menggunakan rumus
```
sp2 <- (((27 - 1) * (1.32)^2) + ((19 - 1) * (1.67)^2))/(27 + 19 - 2)
sp <- sqrt(sp2)
x2 <- (1/27) + (1/19)
x <- sqrt(x2)
t <- (2.79 - 3.64)/(sp*x)

```
Didapatkan hasil sebagai berikut <br>
<img width="355" alt="no3c" src="https://user-images.githubusercontent.com/90702710/170870261-65ad08ce-d9e4-4051-bb7e-5cf7c7266e64.png">


### d.  Nilai Kritikal
Nilai kritikal dicari dengan menggunakan rumus
```
qt(p = 0.025, df = 2, lower.tail = FALSE)
```
Didapatkan hasil sebagai berikut <br>
<img width="362" alt="no3d" src="https://user-images.githubusercontent.com/90702710/170870270-b7d24f67-75f9-4384-ba18-1e80332f6884.png">


### e. Keputusan
Hasil uji statistik (t) terletak di selang nilai kritikal, maka kita dapat menerima hipotesis nol

### f. Kesimpulan
Berdasarkan hasil pengujian, dapat disimpulkan bahwa rata-rata saham Bali dan Bandung bernilai sama


## 4
Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya ia mengumpulkan data tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing-masing.
<br>
Jika : Diketahui dataset https://intip.in/datasetprobstat1 <br>
#H0 : Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama

### a. Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.
```
kucing <- read.delim("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt")

library(ggpubr)

ggboxplot(kucing, x = "Group", y = "Length", 
          color = "Group",
            ylab = "Length", xlab = "Group")
```
Hasil plot <br>
<img width="938" alt="no4a" src="https://user-images.githubusercontent.com/90702710/170875494-efa86e58-5658-4ba6-8332-95a5fb9cd40b.png">
<br>
(Tidak memiliki outlier)

### b. Carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?
Pengerjaan dilakukan dengan menggunakan rumus
```
library(onewaytests)
bartlett.test(Length ~ Group, data = kucing)
```
Didapatkan hasil sebagai berikut <br>
<img width="357" alt="no4b" src="https://user-images.githubusercontent.com/90702710/170875549-731c9283-076a-46dc-a888-a37f4cf296e1.png">
<br>

### c. Untuk uji ANOVA (satu arah), buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.
Uji ANOVA dilakukan dengan menggunakan rumus
```
model1 <- lm(formula = Group ~ Length, data = kucing)
print(model1)
```
Model <br>
<img width="374" alt="no4c" src="https://user-images.githubusercontent.com/90702710/170875616-4b69cf8d-dabd-4473-ba43-2375a2ab4126.png">
<br>

### d. Dari Hasil Poin C, Berapakah nilai-p ? , Apa yang dapat Anda simpulkan dari H0?


### e. Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.


### f. Visualisasikan data dengan ggplot2



## 5
Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk
mengetahui pengaruh suhu operasi (100ΛC, 125ΛC dan 150ΛC) dan tiga jenis kaca
pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan
dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil
Eksperimen. Dengan data tersebut:

### a. Buatlah plot sederhana untuk visualisasi data
```
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

GTL <- read_csv("https://drive.google.com/u/0/uc?id=1aLUOdw_LVJq6VQrQEkuQhZ8FW43FemTJ&export=download")
qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)
```
Hasil plot sederhana <br>
<img width="959" alt="no5a" src="https://user-images.githubusercontent.com/90702710/170874214-cc6aaf69-b433-45f3-9f4c-25d79f6ab2f6.png">
<br>

### b. Lakukan uji ANOVA dua arah
Uji ANOVA dilakukan dengan cara
```
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
print(anova)
summary(anova)
```
Hasil uji <br>
<img width="500" alt="no5b_a" src="https://user-images.githubusercontent.com/90702710/170874265-dd64943f-278b-4bca-adc4-c2bb883397d6.png">
<br>
<img width="471" alt="no5b" src="https://user-images.githubusercontent.com/90702710/170874282-08240d57-8e1e-4353-8ace-9aa33e015236.png">
<br>

### c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)
Tabel ditampilkan dengan menggunakan `group_by`
```
data_sum <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_sum)
```
Tabel <br>
<img width="318" alt="no5c" src="https://user-images.githubusercontent.com/90702710/170874363-8ba0920a-c65e-4f54-b17c-414fd883e1c1.png">
<br>

### d. Lakukan uji Tukey
Uji Tukey dilakukan dengan cara
```
tukey <- TukeyHSD(anova)
print(tukey)
```
Hasil uji <br>
<img width="552" alt="no5d_a" src="https://user-images.githubusercontent.com/90702710/170874426-fae17611-2aa2-434e-9949-28f98430f9cc.png">
<br>
<img width="265" alt="no5d_b" src="https://user-images.githubusercontent.com/90702710/170874445-b44b1b41-fdfe-4026-b2ae-758550b73254.png">
<br>

### e. Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey
