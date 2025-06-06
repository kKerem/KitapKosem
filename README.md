<p align="center" width="100%"><img src="https://github.com/user-attachments/assets/d2fc12ff-d714-403b-b836-6ff96cc29ecb"></p>
[![Java CI with Maven](https://github.com/kKerem/KitapKosem/actions/workflows/maven.yml/badge.svg)](https://github.com/kKerem/KitapKosem/actions/workflows/maven.yml)

## 🚀 Hızlı Başlangıç

### Gereksinimler
- Java 21 veya üzeri
- Maven 3.8+
- Apache Tomcat 10+ (veya uyumlu başka bir servlet container)
- SQLlite (Veritabanı: kitapkosem.db C:\Users\<KullaniciAdi>\.kitapkosem içerisinde olmalı)

### Kurulum ve Çalıştırma

1. Projeyi klonlayın:
   ```bash
   git clone https://github.com/kKerem/KitapKosem
   cd kitapkosem
   ```
2. Bağımlılıkları yükleyin ve derleyin:
   ```bash
   mvn clean install
   ```
3. Uygulamayı başlatın:
   ```bash
   mvn tomcat7:run
   ```
   veya oluşan `target/kitapkosem.war` dosyasını Tomcat'e deploy edin.
4. Tarayıcıda açın:
   ```
   http://localhost:8080/kitapkosem
   ```

> Varsayılan kullanıcılar otomatik oluşur:
> - E-posta: `admin@kitapkosem.com` / Şifre: `12345`
> - E-posta: `kerem@kitapkosem.com` / Şifre: `12345`

## Ekran Görüntüsü
<img src="https://github.com/user-attachments/assets/1b31d3e1-1cc9-44db-801d-5987716e1240">

