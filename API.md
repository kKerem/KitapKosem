# 📖 KitapKöşem API Dokümantasyonu

## 🌐 Base URL
```
http://localhost:8080/kitapkosem
```

## 🔐 Kimlik Doğrulama
KitapKöşem session tabanlı kimlik doğrulama kullanır. Bazı işlemler için giriş yapmış olmanız gerekir.

---

## 📚 Kitap İşlemleri

### GET /books/
**Açıklama:** Tüm kitapları listeler
**Kimlik Doğrulama:** Gerekli değil
**Parametreler:**
- `q` (isteğe bağlı): Arama terimi

**Örnek İstek:**
```http
GET /books/
GET /books/?q=dostoyevski
```

**Yanıt:** Kitap listesi sayfası (JSP)

---

### GET /books/add
**Açıklama:** Kitap ekleme formunu gösterir
**Kimlik Doğrulama:** Gerekli
**Yanıt:** Kitap ekleme formu sayfası

---

### POST /books/add
**Açıklama:** Yeni kitap ekler
**Kimlik Doğrulama:** Gerekli
**Content-Type:** `multipart/form-data`

**Parametreler:**
- `title` (zorunlu): Kitap başlığı
- `author` (zorunlu): Yazar adı  
- `publicationYear` (zorunlu): Yayın yılı (1800-2024)
- `description` (zorunlu): Kitap açıklaması
- `coverImage` (isteğe bağlı): Kapak resmi dosyası

**Örnek İstek:**
```http
POST /books/add
Content-Type: multipart/form-data

title=Suç ve Ceza
author=Fyodor Dostoyevski
publicationYear=1866
description=Psikolojik roman...
coverImage=[dosya]
```

**Başarılı Yanıt:** 
- Durum: 302 (Redirect)
- Konum: `/books/`
- Session mesajı: "Kitap başarıyla eklendi."

**Hata Yanıtları:**
- 401: Giriş yapmamış kullanıcı
- 400: Eksik veya hatalı parametreler

---

### GET /books/view/{id}
**Açıklama:** Kitap detaylarını ve yorumlarını gösterir
**Kimlik Doğrulama:** Gerekli değil

**Parametreler:**
- `{id}`: Kitap ID'si

**Örnek İstek:**
```http
GET /books/view/1
```

**Yanıt:** Kitap detay sayfası (JSP)
**Hata:** 404 - Kitap bulunamadı

---

## 👤 Kullanıcı İşlemleri

### GET /login
**Açıklama:** Giriş formunu gösterir
**Yanıt:** Giriş formu sayfası

---

### POST /login
**Açıklama:** Kullanıcı girişi yapar
**Content-Type:** `application/x-www-form-urlencoded`

**Parametreler:**
- `username`: Kullanıcı adı
- `password`: Şifre

**Örnek İstek:**
```http
POST /login
Content-Type: application/x-www-form-urlencoded

username=mert&password=123456
```

**Başarılı Yanıt:**
- Durum: 302 (Redirect)
- Konum: Ana sayfa
- Session: Kullanıcı bilgileri set edilir

**Hata Yanıtları:**
- 401: Hatalı kullanıcı adı/şifre

---

### GET /register
**Açıklama:** Kayıt formunu gösterir
**Yanıt:** Kayıt formu sayfası

---

### POST /register
**Açıklama:** Yeni kullanıcı kaydı oluşturur
**Content-Type:** `application/x-www-form-urlencoded`

**Parametreler:**
- `username`: Kullanıcı adı (benzersiz)
- `email`: E-posta adresi (benzersiz)
- `password`: Şifre
- `confirmPassword`: Şifre tekrarı

**Örnek İstek:**
```http
POST /register
Content-Type: application/x-www-form-urlencoded

username=yenikullanici&email=test@example.com&password=123456&confirmPassword=123456
```

**Başarılı Yanıt:**
- Durum: 302 (Redirect)
- Konum: `/login`
- Mesaj: "Kayıt başarılı"

**Hata Yanıtları:**
- 400: Eksik bilgiler
- 409: Kullanıcı adı/e-posta zaten mevcut

---

### GET /logout
**Açıklama:** Kullanıcı çıkışı yapar
**Kimlik Doğrulama:** Gerekli

**Yanıt:**
- Durum: 302 (Redirect)
- Konum: Ana sayfa
- Session: Temizlenir

---

## ⭐ Değerlendirme İşlemleri

### POST /books/view/{id}/review
**Açıklama:** Kitaba yeni değerlendirme ekler
**Kimlik Doğrulama:** Gerekli
**Content-Type:** `application/x-www-form-urlencoded`

**Parametreler:**
- `{id}`: Kitap ID'si
- `rating`: Puan (1-5 arası)
- `comment`: Yorum metni

**Örnek İstek:**
```http
POST /books/view/1/review
Content-Type: application/x-www-form-urlencoded

rating=5&comment=Harika bir kitap!
```

**Başarılı Yanıt:**
- Durum: 302 (Redirect)
- Konum: `/books/view/{id}`
- Session mesajı: "Değerlendirmeniz başarıyla eklendi."

**Hata Yanıtları:**
- 401: Giriş yapmamış kullanıcı
- 400: Geçersiz puan (1-5 dışı)
- 404: Kitap bulunamadı

---

## 📊 HTTP Durum Kodları

| Kod | Açıklama |
|-----|----------|
| 200 | Başarılı - Sayfa gösterildi |
| 302 | Yönlendirme - İşlem başarılı |
| 400 | Hatalı İstek - Parametre hatası |
| 401 | Yetkisiz - Giriş gerekli |
| 404 | Bulunamadı - Kaynak mevcut değil |
| 409 | Çakışma - Benzersizlik ihlali |
| 500 | Sunucu Hatası - İç hata |

---

## 📝 Veri Formatları

### Kitap Objesi
```json
{
  "id": 1,
  "title": "Suç ve Ceza",
  "author": "Fyodor Dostoyevski",
  "description": "Psikolojik roman...",
  "publicationYear": 1866,
  "rating": 4.8,
  "reviewCount": 4,
  "userId": 1,
  "coverImage": "covers/cover_uuid.jpg",
  "createdAt": "2025-01-01T10:00:00"
}
```

### Kullanıcı Objesi
```json
{
  "id": 1,
  "username": "mert",
  "email": "mert@example.com",
  "createdAt": "2025-01-01T10:00:00"
}
```

### Değerlendirme Objesi
```json
{
  "id": 1,
  "bookId": 1,
  "userId": 1,
  "username": "mert",
  "rating": 5,
  "comment": "Harika bir kitap!",
  "createdAt": "2025-01-01T10:00:00"
}
```

---

## 🔒 Güvenlik

### Session Yönetimi
- Session tabanlı kimlik doğrulama
- Otomatik session timeout (30 dakika)
- Güvenli cookie ayarları

### Şifre Güvenliği
- BCrypt ile hash'leme
- Salt kullanımı
- Minimum şifre gereksinimleri

### SQL Injection Koruması
- Prepared statements kullanımı
- Parametre validation
- Input sanitization

### File Upload Güvenliği
- Dosya tipi kontrolü (sadece resim)
- Dosya boyutu sınırı (5MB)
- Güvenli dosya adı oluşturma

---

## 📋 Örnek Senaryolar

### 1. Yeni Kullanıcı Kaydı ve Kitap Ekleme
```http
# 1. Kayıt ol
POST /register
username=yenikullanici&email=test@example.com&password=123456&confirmPassword=123456

# 2. Giriş yap
POST /login
username=yenikullanici&password=123456

# 3. Kitap ekle
POST /books/add
title=Yeni Kitap&author=Yazar Adı&publicationYear=2024&description=Açıklama...
```

### 2. Kitap Arama ve Değerlendirme
```http
# 1. Kitap ara
GET /books/?q=dostoyevski

# 2. Kitap detayına git
GET /books/view/1

# 3. Değerlendirme ekle
POST /books/view/1/review
rating=5&comment=Muhteşem bir eser!
```

---

## ⚠️ Sınırlamalar

- **Dosya Yükleme**: Maksimum 5MB
- **Resim Formatları**: JPG, PNG, GIF
- **Session Timeout**: 30 dakika
- **Rating Aralığı**: 1-5
- **Yayın Yılı**: 1800-2024

---

## 🆘 Hata Yönetimi

Tüm hatalar kullanıcı dostu mesajlarla döndürülür:

```javascript
// Örnek hata yanıtları
{
  "error": "Tüm alanları doldurunuz.",
  "error": "Kullanıcı adı zaten kullanımda.",
  "error": "Geçersiz dosya formatı.",
  "error": "Puan 1-5 arasında olmalıdır."
}
``` 