<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>


    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="small">
        <ol class="breadcrumb py-3">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Ana Sayfa</a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/books">Kitaplar</a></li>
            <li class="breadcrumb-item active" aria-current="page">${book.title}</li>
        </ol>
    </nav>
    
<!-- Book Product Page -->
    <div class="row">
        <!-- Book Cover Section (Left) -->
        <div class="col-lg-3">
            <c:choose>
                <c:when test="${not empty book.coverImage}">
                    <img src="${book.coverImage}" alt="${book.title}" class="mw-100 shadow-sm rounded">
                </c:when>
                <c:otherwise>
                    <div class="cover-placeholder rounded shadow-sm text-center">
                        <span class="cover-initial">
                            <svg class="d-block mx-auto mb-2" xmlns="http://www.w3.org/2000/svg" width="44" height="44" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" color="currentColor"><path d="M20.82 20.82C19.643 22 17.745 22 13.95 22s-5.693 0-6.872-1.18c-.657-.656-.948-1.537-1.077-2.846M17.974 6c1.309.129 2.19.42 2.847 1.077C22 8.256 22 10.154 22 13.949c0 1.433 0 2.596-.064 3.551"/><path d="M16.828 16.828C15.657 18 13.771 18 10 18s-5.657 0-6.828-1.172S2 13.771 2 10s0-5.657 1.172-6.828M6.5 2.062C7.444 2 8.59 2 10 2c3.771 0 5.657 0 6.828 1.172S18 6.229 18 10c0 1.41 0 2.556-.061 3.5"/><path d="M5 17c1.818-2.364 3.723-4.583 6-6m7 .544c-1.252-.965-2.413-1.44-3.5-1.544M2 2l20 20"/></g></svg>
                            <div class="fz-14 opacity-75 mb-3">Görsel Hazırlanıyor</div>
                            <div class="fz-16">${book.title}</div>
                            <div class="fz-12 opacity-75">${book.author}</div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        
        <!-- Product Info Section (Right) -->
        <div class="col-lg">

            <h4 class="fz-18 mt-2 mb-0">
                <!-- New Badge -->
                <c:if test="${book.reviewCount == 0}">
                    <span class="text-primary rounded fw-semibold">
                        <i class="bi bi-fire"></i>
                    </span>
                </c:if>
                <a href="${pageContext.request.contextPath}/books/view/${book.id}" class="text-decoration-none fw-semibold text-link">
                    ${book.title}
                </a>
            </h4>
            <!-- Book Content (Right Side) -->
            <p class="book-author text-muted fz-13 mb-2">
                ${book.author}
            </p>

            <!-- Rating & Reviews -->
            <div class="rating-stars mt-2">
                <c:choose>
                    <c:when test="${book.reviewCount > 0}">
                        <c:forEach var="star" begin="1" end="5">
                            <i class="bi ${star <= book.rating ? 'bi-star-fill' : 'bi-star'} text-warning"></i>
                        </c:forEach>
                        <span class="ms-2 text-muted small fz-13">
                            ${book.rating}/5 (<a href="${pageContext.request.contextPath}/books/view/${book.id}#reviews" class="text-decoration-hover">${book.reviewCount} değerlendirme</a>)
                        </span>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="star" begin="1" end="5">
                            <i class="bi bi-star text-muted"></i>
                        </c:forEach>
                        <span class="ms-2 text-muted small fz-13">Değerlendirme yok</span>
                    </c:otherwise>
                </c:choose>
            </div>

            <c:if test="${not empty book.description}">
                <p class="book-description my-3 satir-3">
                    ${book.description}
                </p>
            </c:if>
            
            <!-- Book Details -->
            <div class="detail-item">
                <div class="detail-label text-muted small">Yayın Yılı</div>
                <div class="detail-value fw-medium">${book.publicationYear}</div>
            </div>
            <div class="detail-item">
                <div class="detail-label text-muted small">Eklenme Tarihi</div>
                <div class="detail-value fw-medium">
                    <fmt:formatDate value="${book.createdAt}" pattern="dd MMMM, yyyy"/>
                </div>
            </div>
            <div class="col-6">
                <div class="detail-item">
                    <div class="detail-label text-muted small">Kategori</div>
                    <div class="detail-value">
                        <c:choose>
                            <c:when test="${not empty book.category}">
                                <span class="badge bg-primary rounded-pill">
                                    <c:choose>
                                        <c:when test="${book.category == 'roman'}">Roman</c:when>
                                        <c:when test="${book.category == 'bilim-kurgu'}">Bilim Kurgu</c:when>
                                        <c:when test="${book.category == 'fantastik'}">Fantastik</c:when>
                                        <c:when test="${book.category == 'tarih'}">Tarih</c:when>
                                        <c:when test="${book.category == 'biyografi'}">Biyografi</c:when>
                                        <c:when test="${book.category == 'felsefe'}">Felsefe</c:when>
                                        <c:when test="${book.category == 'psikoloji'}">Psikoloji</c:when>
                                        <c:when test="${book.category == 'egitim'}">Eğitim</c:when>
                                        <c:when test="${book.category == 'cocuk'}">Çocuk</c:when>
                                        <c:otherwise>Diğer</c:otherwise>
                                    </c:choose>
                                </span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge bg-secondary rounded-pill">Genel</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            
            <!-- Action Buttons -->
            <div class="action-buttons">
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <button class="btn btn-primary btn-lg rounded-pill px-5 mb-3" 
                                data-bs-toggle="modal" data-bs-target="#reviewModal">
                            <i class="bi bi-chat-heart me-2"></i>Değerlendirme Yap
                        </button>
                        <div class="d-flex gap-2">
                            <button class="btn btn-outline-primary rounded-pill flex-grow-1 favorite-toggle" data-book-id="${book.id}">
                                <i class="bi bi-heart me-2"></i>Favorilere Ekle
                            </button>
                            <button class="btn btn-outline-secondary rounded-pill" data-bs-toggle="tooltip" title="Paylaş">
                                <i class="bi bi-share"></i>
                            </button>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-info rounded-4 border-0">
                            <i class="bi bi-info-circle me-2"></i>
                            <strong>Değerlendirme yapmak için</strong> 
                            <a href="${pageContext.request.contextPath}/login" class="alert-link">giriş yapın</a> 
                            veya 
                            <a href="${pageContext.request.contextPath}/register" class="alert-link">kayıt olun</a>.
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Book Details kısmında mevcut alanlardan sonra ekleyin -->
            <div class="row g-3">
                <!-- Mevcut alanlar: Yayın Yılı, Eklenme Tarihi, Kategori, Durum -->
                
                <c:if test="${not empty book.translator}">
                    <div class="col-6">
                        <div class="detail-item">
                            <div class="detail-label text-muted small">Çevirmen</div>
                            <div class="detail-value fw-medium">${book.translator}</div>
                        </div>
                    </div>
                </c:if>
                
                <c:if test="${not empty book.publisher}">
                    <div class="col-6">
                        <div class="detail-item">
                            <div class="detail-label text-muted small">Yayınevi</div>
                            <div class="detail-value fw-medium">${book.publisher}</div>
                        </div>
                    </div>
                </c:if>
                
                <c:if test="${not empty book.pageCount}">
                    <div class="col-6">
                        <div class="detail-item">
                            <div class="detail-label text-muted small">Sayfa Sayısı</div>
                            <div class="detail-value fw-medium">${book.pageCount} sayfa</div>
                        </div>
                    </div>
                </c:if>
                
                <c:if test="${not empty book.dimensions}">
                    <div class="col-6">
                        <div class="detail-item">
                            <div class="detail-label text-muted small">Ebat</div>
                            <div class="detail-value fw-medium">${book.dimensions} cm</div>
                        </div>
                    </div>
                </c:if>
                
                <c:if test="${not empty book.firstPublicationYear}">
                    <div class="col-6">
                        <div class="detail-item">
                            <div class="detail-label text-muted small">İlk Baskı Yılı</div>
                            <div class="detail-value fw-medium">${book.firstPublicationYear}</div>
                        </div>
                    </div>
                </c:if>
                
                <c:if test="${not empty book.edition}">
                    <div class="col-6">
                        <div class="detail-item">
                            <div class="detail-label text-muted small">Baskı</div>
                            <div class="detail-value fw-medium">${book.edition}</div>
                        </div>
                    </div>
                </c:if>
                
                <div class="col-6">
                    <div class="detail-item">
                        <div class="detail-label text-muted small">Dil</div>
                        <div class="detail-value fw-medium">${book.language}</div>
                    </div>
                </div>
            </div>

            <c:if test="${sessionScope.user.role == 'admin' || sessionScope.user.id == book.userId}">
                <a href="${pageContext.request.contextPath}/books/edit/${book.id}" class="btn btn-warning">Düzenle</a>
            </c:if>
        </div>
    </div>

<!-- Reviews Section -->
<div class="modern-card mx-3 mx-md-4 mb-4">
    <div class="card-header bg-transparent border-0 pb-0">
        <div class="d-flex justify-content-between align-items-center">
            <h4 class="mb-0">
                <i class="bi bi-chat-square-text me-2"></i>
                Değerlendirmeler <span class="badge bg-primary rounded-pill ms-2">${fn:length(reviews)}</span>
            </h4>
            <c:if test="${not empty sessionScope.user}">
                <button class="btn btn-primary rounded-pill" data-bs-toggle="modal" data-bs-target="#reviewModal">
                    <i class="bi bi-plus-circle me-2"></i>Yorum Ekle
                </button>
            </c:if>
        </div>
    </div>
    
    <div class="card-body">
        <c:choose>
            <c:when test="${not empty reviews}">
                <div class="reviews-list">
                    <c:forEach items="${reviews}" var="review" varStatus="status">
                        <div class="review-item ${status.index > 0 ? 'border-top pt-4' : ''} mb-4">
                            <div class="d-flex gap-3">
                                <!-- User Avatar -->
                                <div class="flex-shrink-0">
                                    <div class="user-avatar bg-primary text-white rounded-circle d-flex align-items-center justify-content-center">
                                        <span class="fw-bold">M</span>
                                    </div>
                                </div>
                                
                                <!-- Review Content -->
                                <div class="flex-grow-1">
                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                        <div>
                                            <h6 class="mb-1 fw-bold">mert</h6>
                                            <small class="text-muted">
                                                <i class="bi bi-clock me-1"></i>
                                                <fmt:formatDate value="${review.createdAt}" pattern="dd MMM yyyy, HH:mm"/>
                                            </small>
                                        </div>
                                        
                                        <!-- Rating & Recommendation -->
                                        <div class="text-end">
                                            <div class="rating-stars mb-1">
                                                <c:forEach begin="1" end="5" var="i">
                                                    <i class="bi bi-star-fill ${i <= review.rating ? 'text-warning' : 'text-light'}"></i>
                                                </c:forEach>
                                            </div>
                                            <c:if test="${not empty review.recommendationPercentage}">
                                                <div class="recommendation-badge">
                                                    <span class="badge ${review.recommendationPercentage >= 70 ? 'bg-success' : review.recommendationPercentage >= 40 ? 'bg-warning' : 'bg-danger'} rounded-pill">
                                                        ${review.recommendationPercentage}% tavsiye
                                                    </span>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                    
                                    <!-- Review Text -->
                                    <blockquote class="blockquote">
                                        <p class="mb-0 text-muted fst-italic">"${review.comment}"</p>
                                    </blockquote>
                                    
                                    <!-- Review Actions -->
                                    <div class="review-actions mt-3">
                                        <button class="btn btn-sm btn-outline-secondary rounded-pill me-2">
                                            <i class="bi bi-hand-thumbs-up me-1"></i>Yararlı (0)
                                        </button>
                                        <button class="btn btn-sm btn-outline-secondary rounded-pill">
                                            <i class="bi bi-reply me-1"></i>Yanıtla
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="empty-reviews text-center py-5">
                    <div class="mb-4">
                        <i class="bi bi-chat-square-dots text-muted opacity-50" style="font-size: 4rem;"></i>
                    </div>
                    <h5 class="text-muted mb-3">Henüz değerlendirme yok</h5>
                    <p class="text-muted">Bu kitap hakkındaki düşüncelerinizi paylaşan ilk kişi olun!</p>
                    <c:if test="${not empty sessionScope.user}">
                        <button class="btn btn-primary rounded-pill px-4" data-bs-toggle="modal" data-bs-target="#reviewModal">
                            <i class="bi bi-chat-heart me-2"></i>İlk Değerlendirmeyi Yap
                        </button>
                    </c:if>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- Enhanced Review Modal -->
<c:if test="${not empty sessionScope.user}">
    <div class="modal fade" id="reviewModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content rounded-4 border-0 shadow">
                <div class="modal-header border-0 pb-0">
                    <h5 class="modal-title fw-bold">
                        <i class="bi bi-chat-heart me-2"></i>Değerlendirme Yap
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                
                <form action="${pageContext.request.contextPath}/books/view/${book.id}/review" method="POST">
                    <div class="modal-body">
                        <!-- Book Info -->
                        <div class="bg-light rounded-3 p-3 mb-4">
                            <div class="d-flex align-items-center gap-3">
                                <div class="book-mini-cover">
                                    <c:choose>
                                        <c:when test="${not empty book.coverImage}">
                                            <img src="${book.coverImage}" alt="${book.title}" class="rounded">
                                        </c:when>
                                        <c:otherwise>
                                            <div class="mini-placeholder bg-primary text-white rounded d-flex align-items-center justify-content-center">
                                                <span class="fw-bold">${fn:substring(book.title, 0, 1)}</span>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div>
                                    <h6 class="mb-1">${book.title}</h6>
                                    <small class="text-muted">${book.author}</small>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Star Rating -->
                        <div class="mb-4">
                            <label class="form-label fw-medium">Puan Verin *</label>
                            <div class="star-rating-input" id="starRating">
                                <input type="hidden" name="rating" id="ratingValue" required>
                                <div class="stars">
                                    <i class="bi bi-star" data-rating="1"></i>
                                    <i class="bi bi-star" data-rating="2"></i>
                                    <i class="bi bi-star" data-rating="3"></i>
                                    <i class="bi bi-star" data-rating="4"></i>
                                    <i class="bi bi-star" data-rating="5"></i>
                                </div>
                                <div class="rating-labels mt-2">
                                    <small class="text-muted" id="ratingLabel">Puan seçin</small>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Recommendation Percentage Slider -->
                        <div class="mb-4">
                            <label class="form-label fw-medium">Ne kadar tavsiye edersiniz?</label>
                            <div class="recommendation-slider">
                                <input type="range" class="form-range" name="recommendationPercentage" 
                                       id="recommendationSlider" min="0" max="100" value="50">
                                <div class="d-flex justify-content-between align-items-center mt-2">
                                    <small class="text-muted">Hiç</small>
                                    <div class="recommendation-display">
                                        <span class="badge bg-primary rounded-pill px-3 py-2 fs-6">
                                            <span id="recommendationValue">50</span>% Tavsiye
                                        </span>
                                    </div>
                                    <small class="text-muted">Kesinlikle</small>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Comment -->
                        <div class="mb-3">
                            <label for="comment" class="form-label fw-medium">Yorumunuz *</label>
                            <textarea class="form-control" id="comment" name="comment" rows="5" 
                                      placeholder="Bu kitap hakkındaki düşüncelerinizi paylaşın..." required></textarea>
                            <div class="form-text">
                                <i class="bi bi-info-circle me-1"></i>
                                Diğer okuyuculara yardımcı olacak detaylı bir değerlendirme yazın.
                            </div>
                        </div>
                    </div>
                    
                    <div class="modal-footer border-0">
                        <button type="button" class="btn btn-outline-secondary rounded-pill" data-bs-dismiss="modal">
                            İptal
                        </button>
                        <button type="submit" class="btn btn-primary rounded-pill px-4">
                            <i class="bi bi-send me-2"></i>Değerlendirmeyi Gönder
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</c:if>

<!-- Enhanced JavaScript -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Star Rating Input
    const starRating = document.getElementById('starRating');
    if (starRating) {
        const stars = starRating.querySelectorAll('.stars i');
        const ratingValue = document.getElementById('ratingValue');
        const ratingLabel = document.getElementById('ratingLabel');
        
        const labels = {
            1: 'Çok Kötü',
            2: 'Kötü', 
            3: 'Orta',
            4: 'İyi',
            5: 'Mükemmel'
        };
        
        stars.forEach((star, index) => {
            star.addEventListener('click', function() {
                const rating = parseInt(this.dataset.rating);
                ratingValue.value = rating;
                ratingLabel.textContent = labels[rating];
                
                stars.forEach((s, i) => {
                    if (i < rating) {
                        s.classList.remove('bi-star');
                        s.classList.add('bi-star-fill', 'active');
                    } else {
                        s.classList.remove('bi-star-fill', 'active');
                        s.classList.add('bi-star');
                    }
                });
            });
            
            star.addEventListener('mouseenter', function() {
                const rating = parseInt(this.dataset.rating);
                stars.forEach((s, i) => {
                    if (i < rating) {
                        s.style.color = '#fbbf24';
                    } else {
                        s.style.color = '#e2e8f0';
                    }
                });
            });
        });
        
        starRating.addEventListener('mouseleave', function() {
            const currentRating = parseInt(ratingValue.value) || 0;
            stars.forEach((s, i) => {
                if (i < currentRating) {
                    s.style.color = '#fbbf24';
                } else {
                    s.style.color = '#e2e8f0';
                }
            });
        });
    }
    
    // Recommendation Slider
    const slider = document.getElementById('recommendationSlider');
    const value = document.getElementById('recommendationValue');
    if (slider && value) {
        slider.addEventListener('input', function() {
            value.textContent = this.value;
            
            // Change badge color based on percentage
            const badge = value.parentElement;
            badge.className = 'badge rounded-pill px-3 py-2 fs-6';
            if (this.value >= 70) {
                badge.classList.add('bg-success');
            } else if (this.value >= 40) {
                badge.classList.add('bg-warning');
            } else {
                badge.classList.add('bg-danger');
            }
        });
        
        // Initialize with default value
        slider.dispatchEvent(new Event('input'));
    }
    
    // Favorite Toggle
    const favoriteButtons = document.querySelectorAll('.favorite-toggle');
    favoriteButtons.forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            const bookId = this.dataset.bookId;
            const icon = this.querySelector('i');
            const originalText = this.innerHTML;
            
            // Show loading state
            this.innerHTML = '<i class="spinner-border spinner-border-sm me-2"></i>İşleniyor...';
            this.disabled = true;
            
            // Make AJAX request
            fetch('${pageContext.request.contextPath}/favorites', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: `action=toggle&bookId=${bookId}`
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'added') {
                    this.innerHTML = '<i class="bi bi-heart-fill me-2"></i>Favorilerden Çıkar';
                    this.classList.add('text-danger');
                    showToast(data.message, 'success');
                } else if (data.status === 'removed') {
                    this.innerHTML = '<i class="bi bi-heart me-2"></i>Favorilere Ekle';
                    this.classList.remove('text-danger');
                    showToast(data.message, 'info');
                }
                this.disabled = false;
            })
            .catch(error => {
                console.error('Error:', error);
                showToast('Favoriler işlemi başarısız oldu', 'error');
                this.innerHTML = originalText;
                this.disabled = false;
            });
        });
    });
    
    // Share functionality
    const shareButtons = document.querySelectorAll('[data-bs-toggle="tooltip"][title="Paylaş"]');
    shareButtons.forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            
            // Use Web Share API if available, otherwise fallback to clipboard
            if (navigator.share) {
                navigator.share({
                    title: '${book.title}',
                    text: '${book.author} tarafından yazılan bu harika kitabı inceleyin!',
                    url: window.location.href
                }).then(() => {
                    showToast('Paylaşım başarılı!', 'success');
                }).catch(() => {
                    // Fallback to clipboard
                    copyToClipboard();
                });
            } else {
                copyToClipboard();
            }
            
            function copyToClipboard() {
                navigator.clipboard.writeText(window.location.href).then(() => {
                    showToast('Link panoya kopyalandı!', 'success');
                }).catch(() => {
                    // Final fallback
                    const textArea = document.createElement('textarea');
                    textArea.value = window.location.href;
                    document.body.appendChild(textArea);
                    textArea.select();
                    document.execCommand('copy');
                    document.body.removeChild(textArea);
                    showToast('Link panoya kopyalandı!', 'success');
                });
            }
        });
    });
    
    // Initialize tooltips
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %> 