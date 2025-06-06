<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<c:set var="title" value="Sık Sorulan Sorular" scope="request" />

<!-- Hero Section -->
<div class="hero-section text-center mb-5">
    <h1 class="display-4 fw-bold mb-3">
        <i class="bi bi-patch-question-fill text-white me-3"></i>
        Sık Sorulan Sorular
    </h1>
    <p class="lead mb-0">En çok merak edilen sorular ve cevapları</p>
</div>

<!-- FAQ Categories -->
<div class="row g-4 mb-5">
    <div class="col-lg-3 col-md-6">
        <div class="modern-card p-3 text-center faq-category" data-category="general">
            <i class="bi bi-info-circle-fill fs-2 text-primary mb-2"></i>
            <h6 class="fw-bold">Genel Sorular</h6>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="modern-card p-3 text-center faq-category" data-category="account">
            <i class="bi bi-person-circle fs-2 text-primary mb-2"></i>
            <h6 class="fw-bold">Hesap İşlemleri</h6>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="modern-card p-3 text-center faq-category" data-category="books">
            <i class="bi bi-book-fill fs-2 text-primary mb-2"></i>
            <h6 class="fw-bold">Kitap İşlemleri</h6>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="modern-card p-3 text-center faq-category" data-category="technical">
            <i class="bi bi-gear-fill fs-2 text-primary mb-2"></i>
            <h6 class="fw-bold">Teknik Sorular</h6>
        </div>
    </div>
</div>

<!-- FAQ Content -->
<div class="modern-card p-5">
    <div class="accordion" id="faqAccordion">
        <!-- General Questions -->
        <div class="faq-section" data-category="general">
            <h4 class="fw-bold mb-4 text-primary">Genel Sorular</h4>
            
            <div class="accordion-item border-0 mb-3">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed rounded-3" type="button" data-bs-toggle="collapse" data-bs-target="#general1">
                        KitapKöşem nedir?
                    </button>
                </h2>
                <div id="general1" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        KitapKöşem, kitapseverlerin bir araya geldiği, kitapları keşfedebileceğiniz, değerlendirebileceğiniz ve deneyimlerinizi paylaşabileceğiniz ücretsiz bir platformdur.
                    </div>
                </div>
            </div>
            
            <div class="accordion-item border-0 mb-3">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed rounded-3" type="button" data-bs-toggle="collapse" data-bs-target="#general2">
                        Platform tamamen ücretsiz mi?
                    </button>
                </h2>
                <div id="general2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        Evet! KitapKöşem tamamen ücretsizdir. Kayıt olmak, kitap eklemek, değerlendirme yapmak ve tüm özellikleri kullanmak için herhangi bir ücret ödemeniz gerekmez.
                    </div>
                </div>
            </div>
        </div>

        <!-- Account Questions -->
        <div class="faq-section" data-category="account">
            <h4 class="fw-bold mb-4 text-primary">Hesap İşlemleri</h4>
            
            <div class="accordion-item border-0 mb-3">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed rounded-3" type="button" data-bs-toggle="collapse" data-bs-target="#account1">
                        Nasıl kayıt olabilirim?
                    </button>
                </h2>
                <div id="account1" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        Sağ üst köşedeki "Kayıt Ol" butonuna tıklayarak, gerekli bilgileri doldurarak kolayca hesap oluşturabilirsiniz. Sadece kullanıcı adı, e-posta ve şifre yeterlidir.
                    </div>
                </div>
            </div>
            
            <div class="accordion-item border-0 mb-3">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed rounded-3" type="button" data-bs-toggle="collapse" data-bs-target="#account2">
                        Şifremi unuttum, ne yapmalıyım?
                    </button>
                </h2>
                <div id="account2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        Giriş sayfasındaki "Şifremi Unuttum" linkine tıklayarak e-posta adresinizi girin. Size şifre sıfırlama bağlantısı gönderilecektir.
                    </div>
                </div>
            </div>
        </div>

        <!-- Book Questions -->
        <div class="faq-section" data-category="books">
            <h4 class="fw-bold mb-4 text-primary">Kitap İşlemleri</h4>
            
            <div class="accordion-item border-0 mb-3">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed rounded-3" type="button" data-bs-toggle="collapse" data-bs-target="#books1">
                        Kitap nasıl eklerim?
                    </button>
                </h2>
                <div id="books1" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        Giriş yaptıktan sonra "Kitap Ekle" butonuna tıklayın. Kitap bilgilerini adım adım doldurun ve kapak resmi yükleyin. Tüm alanları doldurduktan sonra "Kaydet" butonuna tıklayın.
                    </div>
                </div>
            </div>
            
            <div class="accordion-item border-0 mb-3">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed rounded-3" type="button" data-bs-toggle="collapse" data-bs-target="#books2">
                        Değerlendirme nasıl yaparım?
                    </button>
                </h2>
                <div id="books2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        Kitap detay sayfasında "Değerlendirme Yap" butonuna tıklayın. Yıldız puanı verin, tavsiye yüzdenizi belirleyin ve yorumunuzu yazın.
                    </div>
                </div>
            </div>
        </div>

        <!-- Technical Questions -->
        <div class="faq-section" data-category="technical">
            <h4 class="fw-bold mb-4 text-primary">Teknik Sorular</h4>
            
            <div class="accordion-item border-0 mb-3">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed rounded-3" type="button" data-bs-toggle="collapse" data-bs-target="#tech1">
                        Hangi tarayıcıları destekliyorsunuz?
                    </button>
                </h2>
                <div id="tech1" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        Chrome, Firefox, Safari, Edge gibi modern tarayıcıların güncel sürümlerini destekliyoruz. En iyi deneyim için tarayıcınızı güncel tutmanızı öneririz.
                    </div>
                </div>
            </div>
            
            <div class="accordion-item border-0 mb-3">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed rounded-3" type="button" data-bs-toggle="collapse" data-bs-target="#tech2">
                        Mobil uygulamanız var mı?
                    </button>
                </h2>
                <div id="tech2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        Henüz mobil uygulamamız bulunmuyor, ancak web sitemiz mobil cihazlarda mükemmel çalışacak şekilde tasarlanmıştır.
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
.faq-category {
    cursor: pointer;
    transition: all 0.3s ease;
}

.faq-category:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 20px rgba(59, 130, 246, 0.15);
}

.faq-category.active {
    background: linear-gradient(135deg, var(--primary-blue), var(--secondary-blue));
    color: white;
}

.faq-section {
    margin-bottom: 3rem;
}

.accordion-button {
    background: #f8f9fa;
    border: 1px solid #e9ecef;
    font-weight: 600;
}

.accordion-button:not(.collapsed) {
    background: var(--primary-blue);
    color: white;
    border-color: var(--primary-blue);
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const categories = document.querySelectorAll('.faq-category');
    const sections = document.querySelectorAll('.faq-section');
    
    // Show all sections by default
    sections.forEach(section => section.style.display = 'block');
    
    categories.forEach(category => {
        category.addEventListener('click', function() {
            const targetCategory = this.dataset.category;
            
            // Remove active class from all categories
            categories.forEach(cat => cat.classList.remove('active'));
            
            // Add active class to clicked category
            this.classList.add('active');
            
            // Show/hide sections
            sections.forEach(section => {
                if (section.dataset.category === targetCategory) {
                    section.style.display = 'block';
                } else {
                    section.style.display = 'none';
                }
            });
            
            // If general category, show all
            if (targetCategory === 'general') {
                sections.forEach(section => section.style.display = 'block');
                categories.forEach(cat => cat.classList.remove('active'));
            }
        });
    });
});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %> 