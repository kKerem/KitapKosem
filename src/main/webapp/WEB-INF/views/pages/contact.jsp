<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<c:set var="title" value="İletişim" scope="request" />


<c:if test="${not empty sessionScope.success}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <i class="bi bi-check-circle me-2 text-primary"></i>
        ${sessionScope.success}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
    <c:remove var="success" scope="session" />
</c:if>


<div class="hero-section text-center mb-5 mt-md-5">
    <h1 class="display-4 fw-bold my-3">
        <i class="bi bi-envelope-fill me-3"></i>
        İletişim
    </h1>
    <p class="lead mb-0">Bizimle iletişime geçin, size yardımcı olmaktan mutluluk duyarız</p>
</div>

<div class="row g-5">
    
    <div class="col-lg-8">
        <h3 class="fw-bold mb-4 fs-5">
            <i class="bi bi-chat-dots me-2 text-primary"></i>
            Mesaj Gönder
        </h3>
        
        <form action="${pageContext.request.contextPath}/pages/contact" method="POST">
            <div class="row g-3">
                <div class="col-md-6">
                    <label for="name" class="form-label fw-medium">Ad Soyad *</label>
                    <input type="text" class="form-control bg-white" id="name" name="name" required>
                </div>
                <div class="col-md-6">
                    <label for="email" class="form-label fw-medium">E-posta Adresi *</label>
                    <input type="email" class="form-control bg-white" id="email" name="email" required>
                </div>
                <div class="col-12">
                    <label for="subject" class="form-label fw-medium">Konu *</label>
                    <select class="form-select bg-white" id="subject" name="subject" required>
                        <option value="">Konu seçin</option>
                        <option value="general">Genel Sorular</option>
                        <option value="technical">Teknik Destek</option>
                        <option value="account">Hesap Sorunları</option>
                        <option value="suggestion">Öneri/İstek</option>
                        <option value="bug">Hata Bildirimi</option>
                        <option value="other">Diğer</option>
                    </select>
                </div>
                <div class="col-12">
                    <label for="message" class="form-label fw-medium">Mesajınız *</label>
                    <textarea class="form-control bg-white" id="message" name="message" rows="6" 
                                placeholder="Mesajınızı buraya yazın..." required></textarea>
                </div>
                <div class="col-12">
                    <div class="form-check">
                        <input class="form-check-input bg-white" type="checkbox" id="privacy" required>
                        <label class="form-check-label" for="privacy">
                            <a href="${pageContext.request.contextPath}/pages/privacy" class="text-decoration-none">Gizlilik Politikası</a>'nı okudum ve kabul ediyorum *
                        </label>
                    </div>
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-primary rounded px-5 fw-semibold">
                        <i class="bi bi-send me-2 text-primary"></i>Mesajı Gönder
                    </button>
                </div>
            </div>
        </form>
    </div>
    
    
    <div class="col-lg-4">
        <h5 class="fw-bold my-3 mt-md-0 bg-white rounded border p-3 fs-6">
            <i class="bi bi-info-circle me-2 text-primary"></i>
            İletişim Bilgileri
        </h5>
        
        <div class="contact-item py-2">
            <div class="d-flex align-items-center">
                <div class="contact-icon me-3">
                    <i class="bi bi-envelope-fill"></i>
                </div>
                <div>
                    <small class="text-muted">E-posta</small>
                    <div class="fw-medium">kerem.er@bil.omu.edu.tr</div>
                </div>
            </div>
        </div>
        
        <div class="contact-item py-2">
            <div class="d-flex align-items-center">
                <div class="contact-icon me-3">
                    <i class="bi bi-telephone-fill"></i>
                </div>
                <div>
                    <small class="text-muted">Telefon</small>
                    <div class="fw-medium">+90 (536) 259 93 99</div>
                </div>
            </div>
        </div>
        
        <div class="contact-item py-2">
            <div class="d-flex align-items-center">
                <div class="contact-icon me-3">
                    <i class="bi bi-geo-alt-fill"></i>
                </div>
                <div>
                    <small class="text-muted">Adres</small>
                    <div class="fw-medium">Samsun, Türkiye</div>
                </div>
            </div>
        </div>
        
        <div class="contact-item py-2">
            <div class="d-flex align-items-center">
                <div class="contact-icon me-3">
                    <i class="bi bi-clock-fill"></i>
                </div>
                <div>
                    <small class="text-muted">Çalışma Saatleri</small>
                    <div class="fw-medium">7/24 Online Destek</div>
                </div>
            </div>
        </div>
        
        
        <h5 class="fw-bold my-3 bg-white rounded border p-3 fs-6">
            <i class="bi bi-share me-2 text-primary"></i>
            Sosyal Medya
        </h5>
        <div class="d-flex gap-3">
            <a href="#" class="social-btn">
                <i class="bi bi-facebook"></i>
            </a>
            <a href="#" class="social-btn">
                <i class="bi bi-twitter"></i>
            </a>
            <a href="#" class="social-btn">
                <i class="bi bi-instagram"></i>
            </a>
            <a href="https://github.com/kitapkosem" class="social-btn" target="_blank">
                <i class="bi bi-github"></i>
            </a>
        </div>
    </div>
</div>

<style>
.contact-icon {
    width: 40px;
    height: 40px;
    background: linear-gradient(135deg, var(--primary-blue), var(--secondary-blue));
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 1.1rem;
}

.social-btn {
    width: 45px;
    height: 45px;
    background: linear-gradient(135deg, var(--primary-blue), var(--secondary-blue));
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    text-decoration: none;
    transition: all 0.3s ease;
    font-size: 1.2rem;
}

.social-btn:hover {
    transform: translateY(-3px) scale(1.1);
    box-shadow: 0 8px 20px rgba(59, 130, 246, 0.4);
    color: white;
}

.contact-item:last-child {
    border-bottom: none;
}

[data-bs-theme="dark"] .contact-item {
    border-bottom-color: rgba(255,255,255,0.1);
}
</style>

<%@ include file="/WEB-INF/views/common/footer.jsp" %> 