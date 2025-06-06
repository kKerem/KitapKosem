<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<c:set var="title" value="Kullanım Şartları" scope="request" />


<div class="hero-section text-center mb-5">
    <h1 class="display-4 fw-bold mb-3">
        <i class="bi bi-file-text-fill text-white me-3"></i>
        Kullanım Şartları
    </h1>
    <p class="lead mb-0">Platform kullanım kuralları ve koşulları</p>
</div>

<div class="p-5">
    <div class="mb-4">
        <small class="text-muted">Son güncelleme: 1 Ocak 2024</small>
    </div>
    
    <div class="terms-content">
        <section class="mb-5">
            <h3 class="fw-bold mb-3">1. Genel Hükümler</h3>
            <p class="lh-lg">
                Bu Kullanım Şartları, KitapKöşem platformunu kullanan tüm kullanıcılar için geçerlidir. 
                Platformumuzu kullanarak bu şartları kabul etmiş sayılırsınız. Şartları kabul etmiyorsanız, 
                lütfen platformu kullanmayınız.
            </p>
        </section>

        <section class="mb-5">
            <h3 class="fw-bold mb-3">2. Hesap Oluşturma ve Güvenlik</h3>
            <h5 class="fw-medium mb-3">2.1 Hesap Gereksinimleri</h5>
            <ul class="lh-lg mb-4">
                <li>13 yaşından büyük olmanız gerekmektedir</li>
                <li>Doğru ve güncel bilgiler sağlamalısınız</li>
                <li>Hesap başına bir kayıt yapabilirsiniz</li>
                <li>Sahte kimlik veya bilgi kullanmak yasaktır</li>
            </ul>
            
            <h5 class="fw-medium mb-3">2.2 Hesap Güvenliği</h5>
            <ul class="lh-lg">
                <li>Şifrenizi güvenli tutmakla yükümlüsünüz</li>
                <li>Hesabınızdan yapılan tüm işlemlerden sorumlusunuz</li>
                <li>Şüpheli aktiviteleri derhal bildirmelisiniz</li>
            </ul>
        </section>

        <section class="mb-5">
            <h3 class="fw-bold mb-3">3. İçerik Kuralları</h3>
            <h5 class="fw-medium mb-3">3.1 Kabul Edilebilir İçerik</h5>
            <ul class="lh-lg mb-4">
                <li>Kitap bilgileri doğru ve eksiksiz olmalıdır</li>
                <li>Değerlendirmeler kişisel deneyime dayalı olmalıdır</li>
                <li>Yapıcı ve saygılı yorumlar yazılmalıdır</li>
                <li>Telif hakklarına uygun içerik paylaşılmalıdır</li>
            </ul>
            
            <h5 class="fw-medium mb-3">3.2 Yasak İçerikler</h5>
            <ul class="lh-lg">
                <li>Hakaret, küfür ve ayrımcı dil</li>
                <li>Spam ve reklam içerikleri</li>
                <li>Telif hakkı ihlali yapan materyaller</li>
                <li>Yanıltıcı veya sahte bilgiler</li>
                <li>Pornografik veya uygunsuz içerikler</li>
            </ul>
        </section>

        <section class="mb-5">
            <h3 class="fw-bold mb-3">4. Kullanıcı Davranışları</h3>
            <p class="lh-lg mb-3">Platformumuzda aşağıdaki davranışlar yasaktır:</p>
            <ul class="lh-lg">
                <li>Diğer kullanıcıları rahatsız etmek veya taciz etmek</li>
                <li>Sistemi manipüle etmeye çalışmak</li>
                <li>Otomatik botlar veya scriptler kullanmak</li>
                <li>Başkalarının hesaplarına yetkisiz erişim</li>
                <li>Platform güvenliğini tehdit edecek faaliyetler</li>
            </ul>
        </section>

        <section class="mb-5">
            <h3 class="fw-bold mb-3">5. Fikri Mülkiyet Hakları</h3>
            <h5 class="fw-medium mb-3">5.1 Platform İçeriği</h5>
            <p class="lh-lg mb-3">
                KitapKöşem platformunun tasarımı, logosu, yazılımı ve diğer tüm içerikleri 
                fikri mülkiyet haklarıyla korunmaktadır.
            </p>
            
            <h5 class="fw-medium mb-3">5.2 Kullanıcı İçeriği</h5>
            <p class="lh-lg">
                Paylaştığınız içeriklerin telif haklarından siz sorumlusunuz. Platformda 
                paylaştığınız içerikleri KitapKöşem'in kullanmasına izin vermiş olursunuz.
            </p>
        </section>

        <section class="mb-5">
            <h3 class="fw-bold mb-3">6. Gizlilik ve Veri Koruma</h3>
            <p class="lh-lg">
                Kişisel verilerinizin işlenmesi <a href="${pageContext.request.contextPath}/pages/privacy" 
                class="text-decoration-none">Gizlilik Politikamız</a> kapsamında gerçekleştirilir. 
                KVKK ve diğer veri koruma mevzuatlarına uygun hareket ederiz.
            </p>
        </section>

        <section class="mb-5">
            <h3 class="fw-bold mb-3">7. Hizmet Kesintileri</h3>
            <p class="lh-lg">
                Teknik bakım, güncelleme veya beklenmeyen durumlar nedeniyle hizmetimizde 
                kesintiler yaşanabilir. Bu durumlardan dolayı sorumluluk kabul etmeyiz.
            </p>
        </section>

        <section class="mb-5">
            <h3 class="fw-bold mb-3">8. Hesap Askıya Alma ve Sonlandırma</h3>
            <h5 class="fw-medium mb-3">8.1 Askıya Alma Nedenleri</h5>
            <ul class="lh-lg mb-4">
                <li>Kullanım şartlarının ihlali</li>
                <li>Diğer kullanıcılardan şikayetler</li>
                <li>Şüpheli veya zararlı aktiviteler</li>
            </ul>
            
            <h5 class="fw-medium mb-3">8.2 Hesap Sonlandırma</h5>
            <p class="lh-lg">
                Ciddi ihlaller durumunda hesabınız kalıcı olarak kapatılabilir. 
                Bu durumda verileriniz silinir ve platforma erişiminiz engellenir.
            </p>
        </section>

        <section class="mb-5">
            <h3 class="fw-bold mb-3">9. Sorumluluk Reddi</h3>
            <p class="lh-lg">
                KitapKöşem, kullanıcılar tarafından paylaşılan içeriklerin doğruluğunu garanti etmez. 
                Platform "olduğu gibi" sunulmaktadır ve herhangi bir garanti verilmemektedir.
            </p>
        </section>

        <section class="mb-5">
            <h3 class="fw-bold mb-3">10. Değişiklikler</h3>
            <p class="lh-lg">
                Bu Kullanım Şartları'nda değişiklik yapma hakkımız saklıdır. Önemli değişiklikler 
                kullanıcılara bildirilecek ve yeni şartlar yayınlandıktan sonra geçerli olacaktır.
            </p>
        </section>

        <section class="mb-5">
            <h3 class="fw-bold mb-3">11. Uygulanacak Hukuk</h3>
            <p class="lh-lg">
                Bu şartlar Türkiye Cumhuriyeti hukukuna tabidir. Uyuşmazlıklar İstanbul mahkemelerinde 
                çözümlenecektir.
            </p>
        </section>

        <section>
            <h3 class="fw-bold mb-3">12. İletişim</h3>
            <p class="lh-lg mb-3">
                Kullanım şartları hakkında sorularınız için bizimle iletişime geçebilirsiniz:
            </p>
            <div class="contact-info bg-light rounded-3 p-4">
                <p class="mb-2"><strong>E-posta:</strong> legal@kitapkosem.com</p>
                <p class="mb-2"><strong>Adres:</strong> Samsun, Türkiye</p>
                <p class="mb-0"><strong>Telefon:</strong> +90 (536) 259 93 99</p>
            </div>
        </section>
    </div>
</div>

<style>
.terms-content h3 {
    color: var(--primary-blue);
    border-bottom: 2px solid var(--primary-blue);
    padding-bottom: 0.5rem;
}

.terms-content h5 {
    color: var(--secondary-blue);
}

.terms-content ul {
    padding-left: 1.5rem;
}

.terms-content li {
    margin-bottom: 0.5rem;
}

.contact-info {
    border-left: 4px solid var(--primary-blue);
}

[data-bs-theme="dark"] .contact-info {
    background: #2d3748 !important;
}

[data-bs-theme="dark"] .terms-content h3 {
    color: var(--light-blue);
    border-bottom-color: var(--light-blue);
}
</style>

<%@ include file="/WEB-INF/views/common/footer.jsp" %> 