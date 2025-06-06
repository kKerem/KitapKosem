<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<c:set var="title" value="Geri Bildirim" scope="request" />


<c:if test="${not empty sessionScope.success}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <i class="bi bi-check-circle me-2"></i>
        ${sessionScope.success}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
    <c:remove var="success" scope="session" />
</c:if>


<div class="hero-section text-center mb-5 mt-md-5">
    <h1 class="display-4 fw-bold mb-3">
        <i class="bi bi-chat-heart-fill me-3"></i>
        Geri Bildirim
    </h1>
    <p class="lead mb-0">Görüşleriniz bizim için çok değerli. Deneyiminizi bizimle paylaşın!</p>
</div>

<div class="row justify-content-center">
    <div class="col-lg-8">
        <div class="p-5 bg-white border rounded">
            <form action="${pageContext.request.contextPath}/pages/feedback" method="POST">
                <div class="row g-4">
                    
                    <div class="col-12">
                        <label class="form-label fw-medium">Geri bildirim türü *</label>
                        <div class="row g-3">
                            <div class="col-md-4">
                                <div class="form-check feedback-option">
                                    <input class="form-check-input" type="radio" name="feedbackType" id="suggestion" value="suggestion" required>
                                    <label class="form-check-label" for="suggestion">
                                        <i class="bi bi-lightbulb-fill text-warning me-2"></i>
                                        Öneri
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-check feedback-option">
                                    <input class="form-check-input" type="radio" name="feedbackType" id="bug" value="bug" required>
                                    <label class="form-check-label" for="bug">
                                        <i class="bi bi-bug-fill text-danger me-2"></i>
                                        Hata Bildirimi
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-check feedback-option">
                                    <input class="form-check-input" type="radio" name="feedbackType" id="compliment" value="compliment" required>
                                    <label class="form-check-label" for="compliment">
                                        <i class="bi bi-heart-fill text-success me-2"></i>
                                        Beğeni
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="col-12">
                        <label class="form-label fw-medium">Genel memnuniyet puanınız *</label>
                        <div class="rating-input">
                            <input type="hidden" name="rating" id="ratingValue" required>
                            <div class="stars">
                                <i class="bi bi-star" data-rating="1"></i>
                                <i class="bi bi-star" data-rating="2"></i>
                                <i class="bi bi-star" data-rating="3"></i>
                                <i class="bi bi-star" data-rating="4"></i>
                                <i class="bi bi-star" data-rating="5"></i>
                            </div>
                            <div class="rating-text mt-2">
                                <small class="text-muted" id="ratingText">Puan verin</small>
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="col-12">
                        <label for="comment" class="form-label fw-medium">Detaylı açıklama *</label>
                        <textarea class="form-control" id="comment" name="comment" rows="6" 
                                  placeholder="Geri bildiriminizi detaylı olarak açıklayın..." required></textarea>
                        <div class="form-text">En az 10 karakter yazmanız gerekmektedir.</div>
                    </div>
                    
                    
                    <div class="col-md-6">
                        <label for="contactName" class="form-label fw-medium">Adınız (İsteğe bağlı)</label>
                        <input type="text" class="form-control" id="contactName" name="contactName">
                    </div>
                    <div class="col-md-6">
                        <label for="contactEmail" class="form-label fw-medium">E-posta (İsteğe bağlı)</label>
                        <input type="email" class="form-control" id="contactEmail" name="contactEmail">
                        <div class="form-text">Geri dönüş istiyorsanız e-posta adresinizi yazın</div>
                    </div>
                    
                    
                    <div class="col-12">
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary fw-semibold py-3 rounded">
                                <i class="bi bi-send-fill me-2"></i>Geri Bildirimi Gönder
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="row g-4 mt-5">
    <div class="col-md-4">
        <div class="p-4 text-center">
            <div class="feedback-stat-icon mb-3">
                <i class="bi bi-chat-heart-fill"></i>
            </div>
            <h4 class="fw-bold mb-2">1,250+</h4>
            <p class="text-muted mb-0">Geri bildirim alındı</p>
        </div>
    </div>
    <div class="col-md-4">
        <div class="p-4 text-center">
            <div class="feedback-stat-icon mb-3">
                <i class="bi bi-check-circle-fill"></i>
            </div>
            <h4 class="fw-bold mb-2">95%</h4>
            <p class="text-muted mb-0">Memnuniyet oranı</p>
        </div>
    </div>
    <div class="col-md-4">
        <div class="p-4 text-center">
            <div class="feedback-stat-icon mb-3">
                <i class="bi bi-lightning-fill"></i>
            </div>
            <h4 class="fw-bold mb-2">24 saat</h4>
            <p class="text-muted mb-0">Ortalama yanıt süresi</p>
        </div>
    </div>
</div>

<style>
.feedback-option {
    background: #f8f9fa;
    border: 2px solid #e9ecef;
    border-radius: 12px;
    padding: 1rem;
    transition: all 0.3s ease;
    cursor: pointer;
}

.feedback-option:hover {
    border-color: var(--primary-blue);
    background: rgba(59, 130, 246, 0.05);
}

.feedback-option input:checked + label {
    color: var(--primary-blue);
    font-weight: 600;
}

.rating-input .stars {
    font-size: 2rem;
    color: #ddd;
    cursor: pointer;
}

.rating-input .stars i {
    transition: all 0.2s ease;
    margin-right: 0.25rem;
}

.rating-input .stars i:hover,
.rating-input .stars i.active {
    color: #fbbf24;
    transform: scale(1.1);
}

.feedback-stat-icon {
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

[data-bs-theme="dark"] .feedback-option {
    background: #2d3748;
    border-color: #4a5568;
}

[data-bs-theme="dark"] .feedback-option:hover {
    background: rgba(96, 165, 250, 0.1);
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Rating functionality
    const stars = document.querySelectorAll('.rating-input .stars i');
    const ratingValue = document.getElementById('ratingValue');
    const ratingText = document.getElementById('ratingText');
    
    const ratingTexts = {
        1: 'Çok kötü',
        2: 'Kötü',
        3: 'Orta',
        4: 'İyi',
        5: 'Mükemmel'
    };
    
    stars.forEach((star, index) => {
        star.addEventListener('click', function() {
            const rating = parseInt(this.dataset.rating);
            ratingValue.value = rating;
            ratingText.textContent = ratingTexts[rating];
            
            // Update star display
            stars.forEach((s, i) => {
                if (i < rating) {
                    s.classList.add('active');
                } else {
                    s.classList.remove('active');
                }
            });
        });
        
        star.addEventListener('mouseenter', function() {
            const rating = parseInt(this.dataset.rating);
            stars.forEach((s, i) => {
                if (i < rating) {
                    s.style.color = '#fbbf24';
                } else {
                    s.style.color = '#ddd';
                }
            });
        });
    });
    
    // Reset on mouse leave
    document.querySelector('.rating-input').addEventListener('mouseleave', function() {
        const currentRating = parseInt(ratingValue.value) || 0;
        stars.forEach((s, i) => {
            if (i < currentRating) {
                s.style.color = '#fbbf24';
            } else {
                s.style.color = '#ddd';
            }
        });
    });
    
    // Feedback option selection
    const feedbackOptions = document.querySelectorAll('.feedback-option');
    feedbackOptions.forEach(option => {
        option.addEventListener('click', function() {
            const radio = this.querySelector('input[type="radio"]');
            radio.checked = true;
            
            // Update visual state
            feedbackOptions.forEach(opt => opt.classList.remove('selected'));
            this.classList.add('selected');
        });
    });
});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %> 