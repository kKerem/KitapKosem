<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<c:set var="title" value="Yardım Merkezi" scope="request" />


<div class="hero-section text-center mb-5 mt-md-5">
    <h1 class="display-4 fw-bold mb-3">
        <i class="bi bi-question-circle-fill me-3"></i>
        Yardım Merkezi
    </h1>
    <p class="lead mb-0">Size yardımcı olmak için buradayız. Aradığınız cevabı bulamıyor musunuz?</p>
</div>


<div class="row justify-content-center mb-5">
    <div class="col-lg-8">
        <div class="p-4">
            <div class="input-group input-group-lg bg-white rounded border">
                <span class="input-group-text bg-primary text-white border-0">
                    <i class="bi bi-search"></i>
                </span>
                <input type="text" class="form-control border-0 bg-white" placeholder="Sorunuzu yazın..." id="helpSearch">
                <button class="btn btn-primary fw-semibold" type="button">Ara</button>
            </div>
        </div>
    </div>
</div>


<div class="row g-4 mb-5">
    <div class="col-lg-4 col-md-6">
        <div class="p-4 h-100 text-center border bg-white rounded">
            <div class="help-icon mb-3">
                <i class="bi bi-person-plus-fill"></i>
            </div>
            <h5 class="fw-bold mb-3">Hesap İşlemleri</h5>
            <p class="text-muted mb-4">Kayıt olma, giriş yapma ve hesap ayarları hakkında bilgiler</p>
            <ul class="list-unstyled text-start">
                <li class="mb-2"><a href="#" class="text-decoration-none">Nasıl kayıt olabilirim?</a></li>
                <li class="mb-2"><a href="#" class="text-decoration-none">Şifremi unuttum</a></li>
                <li class="mb-2"><a href="#" class="text-decoration-none">Hesabımı nasıl silerim?</a></li>
                <li class="mb-2"><a href="#" class="text-decoration-none">Profil bilgilerimi güncelleme</a></li>
            </ul>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-6">
        <div class="p-4 h-100 text-center border bg-white rounded">
            <div class="help-icon mb-3">
                <i class="bi bi-book-fill"></i>
            </div>
            <h5 class="fw-bold mb-3">Kitap İşlemleri</h5>
            <p class="text-muted mb-4">Kitap ekleme, düzenleme ve arama konularında yardım</p>
            <ul class="list-unstyled text-start">
                <li class="mb-2"><a href="#" class="text-decoration-none">Kitap nasıl eklerim?</a></li>
                <li class="mb-2"><a href="#" class="text-decoration-none">Kitap kapağı yükleme</a></li>
                <li class="mb-2"><a href="#" class="text-decoration-none">Kitap bilgilerini düzenleme</a></li>
                <li class="mb-2"><a href="#" class="text-decoration-none">Gelişmiş arama kullanımı</a></li>
            </ul>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-6">
        <div class="p-4 h-100 text-center border bg-white rounded">
            <div class="help-icon mb-3">
                <i class="bi bi-star-fill"></i>
            </div>
            <h5 class="fw-bold mb-3">Değerlendirmeler</h5>
            <p class="text-muted mb-4">Kitapları değerlendirme ve yorum yapma rehberi</p>
            <ul class="list-unstyled text-start">
                <li class="mb-2"><a href="#" class="text-decoration-none">Nasıl değerlendirme yaparım?</a></li>
                <li class="mb-2"><a href="#" class="text-decoration-none">Puan sistemi nasıl çalışır?</a></li>
                <li class="mb-2"><a href="#" class="text-decoration-none">Yorumumu nasıl düzenlerim?</a></li>
                <li class="mb-2"><a href="#" class="text-decoration-none">Tavsiye yüzdesi nedir?</a></li>
            </ul>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-6">
        <div class="p-4 h-100 text-center border bg-white rounded">
            <div class="help-icon mb-3">
                <i class="bi bi-heart-fill"></i>
            </div>
            <h5 class="fw-bold mb-3">Favoriler</h5>
            <p class="text-muted mb-4">Favori kitaplarınızı yönetme ve organize etme</p>
            <ul class="list-unstyled text-start">
                <li class="mb-2"><a href="#" class="text-decoration-none">Favorilere nasıl eklerim?</a></li>
                <li class="mb-2"><a href="#" class="text-decoration-none">Favorilerimi nasıl görüntülerim?</a></li>
                <li class="mb-2"><a href="#" class="text-decoration-none">Favorilerden nasıl çıkarırım?</a></li>
                <li class="mb-2"><a href="#" class="text-decoration-none">Favori listemi paylaşabilir miyim?</a></li>
            </ul>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-6">
        <div class="p-4 h-100 text-center border bg-white rounded">
            <div class="help-icon mb-3">
                <i class="bi bi-shield-check"></i>
            </div>
            <h5 class="fw-bold mb-3">Güvenlik</h5>
            <p class="text-muted mb-4">Hesap güvenliği ve gizlilik ayarları</p>
            <ul class="list-unstyled text-start">
                <li class="mb-2"><a href="#" class="text-decoration-none">Güçlü şifre oluşturma</a></li>
                <li class="mb-2"><a href="#" class="text-decoration-none">Hesap güvenliği ipuçları</a></li>
                <li class="mb-2"><a href="#" class="text-decoration-none">Gizlilik ayarları</a></li>
                <li class="mb-2"><a href="#" class="text-decoration-none">Şüpheli aktivite bildirme</a></li>
            </ul>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-6">
        <div class="p-4 h-100 text-center border bg-white rounded">
            <div class="help-icon mb-3">
                <i class="bi bi-gear-fill"></i>
            </div>
            <h5 class="fw-bold mb-3">Teknik Destek</h5>
            <p class="text-muted mb-4">Teknik sorunlar ve site kullanımı hakkında</p>
            <ul class="list-unstyled text-start">
                <li class="mb-2"><a href="#" class="text-decoration-none">Site yavaş çalışıyor</a></li>
                <li class="mb-2"><a href="#" class="text-decoration-none">Resim yüklenmiyor</a></li>
                <li class="mb-2"><a href="#" class="text-decoration-none">Tarayıcı uyumluluğu</a></li>
                <li class="mb-2"><a href="#" class="text-decoration-none">Mobil uygulama</a></li>
            </ul>
        </div>
    </div>
</div>


<div class="py-5">
    <h3 class="fw-bold mb-4 text-center">
        <i class="bi bi-patch-question me-2"></i>
        Sık Sorulan Sorular
    </h3>
    
    <div class="accordion" id="faqAccordion">
        <div class="accordion-item border-0 mb-3">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed rounded" type="button" data-bs-toggle="collapse" data-bs-target="#faq1">
                    KitapKöşem ücretsiz mi?
                </button>
            </h2>
            <div id="faq1" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    Evet! KitapKöşem tamamen ücretsiz bir platformdur. Kayıt olmak, kitap eklemek, değerlendirme yapmak ve tüm özellikleri kullanmak için herhangi bir ücret ödemeniz gerekmez.
                </div>
            </div>
        </div>
        
        <div class="accordion-item border-0 mb-3">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed rounded" type="button" data-bs-toggle="collapse" data-bs-target="#faq2">
                    Kitap eklemek için yazar olmam gerekir mi?
                </button>
            </h2>
            <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    Hayır! KitapKöşem'de herkes kitap ekleyebilir. Okuduğunuz, beğendiğiniz veya tavsiye etmek istediğiniz kitapları platforma ekleyerek diğer okuyucularla paylaşabilirsiniz.
                </div>
            </div>
        </div>
        
        <div class="accordion-item border-0 mb-3">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed rounded" type="button" data-bs-toggle="collapse" data-bs-target="#faq3">
                    Değerlendirmemi sonradan değiştirebilir miyim?
                </button>
            </h2>
            <div id="faq3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    Şu anda değerlendirmeleri düzenleme özelliği geliştirme aşamasındadır. Yakında bu özelliği kullanıma sunacağız. Acil durumlarda bizimle iletişime geçebilirsiniz.
                </div>
            </div>
        </div>
        
        <div class="accordion-item border-0 mb-3">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed rounded" type="button" data-bs-toggle="collapse" data-bs-target="#faq4">
                    Mobil uygulamanız var mı?
                </button>
            </h2>
            <div id="faq4" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    Henüz mobil uygulamamız bulunmuyor, ancak web sitemiz mobil cihazlarda mükemmel çalışacak şekilde tasarlanmıştır. Mobil tarayıcınızdan rahatlıkla kullanabilirsiniz.
                </div>
            </div>
        </div>
    </div>
</div>


<div class="p-5 text-center">
    <h4 class="fw-bold mb-3">Hala yardıma mı ihtiyacınız var?</h4>
    <p class="text-muted mb-4">Aradığınız cevabı bulamadıysanız, bizimle iletişime geçmekten çekinmeyin.</p>
    <div class="d-flex gap-3 justify-content-center flex-wrap">
        <a href="${pageContext.request.contextPath}/pages/contact" class="btn btn-primary rounded fw-semibold px-4">
            <i class="bi bi-envelope me-2"></i>İletişime Geç
        </a>
        <a href="${pageContext.request.contextPath}/pages/feedback" class="btn btn-outline-primary rounded px-4 fw-semibold">
            <i class="bi bi-chat-heart me-2"></i>Geri Bildirim Gönder
        </a>
    </div>
</div>

<style>
.help-category {
    transition: all 0.3s ease;
}

.help-category:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 35px rgba(59, 130, 246, 0.15);
}

.help-icon {
    width: 80px;
    height: 80px;
    background: linear-gradient(135deg, var(--primary-blue), var(--secondary-blue));
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto;
    color: white;
    font-size: 2rem;
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

.accordion-button:focus {
    box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.25);
}

[data-bs-theme="dark"] .help-category {
    background: #2d3748;
}

[data-bs-theme="dark"] .accordion-button {
    background: #4a5568;
    color: white;
    border-color: #4a5568;
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('helpSearch');
    const searchBtn = searchInput.nextElementSibling;
    
    function performSearch() {
        const query = searchInput.value.trim();
        if (query) {
            showToast(`"${query}" için arama yapılıyor...`, 'info');
        }
    }
    
    searchBtn.addEventListener('click', performSearch);
    searchInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            performSearch();
        }
    });
});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %> 