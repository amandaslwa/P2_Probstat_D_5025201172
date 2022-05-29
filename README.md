## 1 
Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. 
Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat
kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut
diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali
kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden
mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴.

Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen dari
responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah
melakukan aktivitas 𝐴 sebanyak 70.

### a. Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel
diatas
Pertama, kita buat tabelnya menggunakan r terlebih dahulu
```
tabel <- data.frame(x = c(78,75,67,77,70,72,78,74,77),
y = c(100,95,70,90,90,90,89,90,100))
```
Kemudian, kita cari nilai selisih dan standar deviasi
```
selisih <- y-x
standardeviasi <- sd(selisih)
```
Didapatkan hasil sebagai berikut
<img width="323" alt="no1a" src="https://user-images.githubusercontent.com/90702710/170870191-ee347036-89cc-4df0-948f-bff90fcf75b2.png">


### b. Carilah nilai t (p-value)
Pengerjaan menggunakan library BSDA dengan rumus `z.test`
```
library(BSDA)
z.test(selisih, mu=15, sigma.x=standardeviasi)
```
Didapatkan hasil sebagai berikut
<img width="429" alt="no1b" src="https://user-images.githubusercontent.com/90702710/170870197-6872de5e-9527-4b4b-a59f-9bf34b538a94.png">


### c. Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika
dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan
aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada
pengaruh yang signifikan secara statistika dalam hal kadar saturasi
oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”


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
Didapatkan hasil sebagai berikut
<img width="455" alt="no2a" src="https://user-images.githubusercontent.com/90702710/170870211-89c558ca-0964-4172-877f-a359f84cc0a0.png">


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
rata-ratanya (α= 0.05)

### a. H0 dan H1
H0: μ Bali = μ Bandung (nilai rata-rata saham Bali sama dengan nilai rata-rata saham Bandung) <br>
H1: μ Bali ≠ μ Bandung (nilai rata-rata saham Bali tidak sama dengan nilai rata-rata saham Bandung)

### b.  Hitung Sampel Statistik
Pengerjaan menggunakan library BSDA dengan rumus `tsum.test`
```
library(BSDA)
tsum.test(mean.x = 3.64, s.x = 1.67, n.x = 19, mean.y = 2.79, s.y = 1.32, n.y = 27, conf.level = 0.95)
```
Didapatkan hasil sebagai berikut
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
Didapatkan hasil sebagai berikut
<img width="355" alt="no3c" src="https://user-images.githubusercontent.com/90702710/170870261-65ad08ce-d9e4-4051-bb7e-5cf7c7266e64.png">


### d.  Nilai Kritikal
Nilai kritikal dicari dengan menggunakan rumus
```
qt(p = 0.025, df = 2, lower.tail = FALSE)
```
Didapatkan hasil sebagai berikut
<img width="362" alt="no3d" src="https://user-images.githubusercontent.com/90702710/170870270-b7d24f67-75f9-4384-ba18-1e80332f6884.png">


### e. Keputusan
Hasil uji statistik terletak di selang nilai kritikal, maka kita dapat menolak hipotesis nol atau sampel tidak memiliki cukup bukti yang bertentangan dengan hipotesis nol

### f. Kesimpulan
Berdasarkan hasil pengujian, dapat disimpulkan bahwa rata-rata saham Bali dan Bandung bernilai sama
