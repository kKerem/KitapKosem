# KitapKöşem

KitapKöşem, kitap ekleme, inceleme ve favorileme imkanı sunan modern bir Java web uygulamasıdır.

## 🚀 Hızlı Başlangıç

### Gereksinimler
- Java 21 veya üzeri
- Maven 3.8+
- Apache Tomcat 10+ (veya uyumlu başka bir servlet container)

### Kurulum ve Çalıştırma

1. Projeyi klonlayın:
   ```bash
   git clone <proje-linkiniz>
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

## 📝 Lisans
MIT 