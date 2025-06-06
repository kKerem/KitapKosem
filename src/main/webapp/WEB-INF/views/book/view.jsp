<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>


    <nav aria-label="breadcrumb" class="small">
        <ol class="breadcrumb py-3 mb-0">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Ana Sayfa</a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/books">Kitaplar</a></li>
            <li class="breadcrumb-item active" aria-current="page">${book.title}</li>
        </ol>
    </nav>
    
    <div class="row">
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
        
        <div class="col-lg">
            
            <c:if test="${sessionScope.user.role == 'admin' || sessionScope.user.id == book.userId}">
                <div class="position-relative">
                    <a href="${pageContext.request.contextPath}/books/edit/${book.id}" class="btn btn-outline-dark position-absolute end-0 fw-semibold btn-sm"><i class="bi bi-pencil-square pe-2"></i>Düzenle</a>
                </div>
            </c:if>
            <span class="detail-label text-muted small">Kategori:</span>
            <span class="detail-value fw-medium small">${book.category}</span>
            <h4 class="fz-18 mt-2 mb-0">
                <c:if test="${book.reviewCount == 0}">
                    <span class="text-primary rounded fw-semibold">
                        <i class="bi bi-fire"></i>
                    </span>
                </c:if>
                <a href="${pageContext.request.contextPath}/books/view/${book.id}" class="text-decoration-none fw-semibold text-link">
                    ${book.title}
                </a>
            </h4>
            <p class="book-author text-muted fz-13 mb-2">
                ${book.author}
            </p>

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
            <div class="my-2 small">
                <span class="detail-label text-muted">Ekleyen:</span>
                <span class="detail-value fw-medium">
                    <c:choose>
                        <c:when test="${not empty book.addedByUsername}">${book.addedByUsername}</c:when>
                        <c:otherwise>${book.userId}</c:otherwise>
                    </c:choose>
                </span>
            </div>

            <div class="row my-2 small">
                <div class="col-6">
                    <div class="detail-label text-muted small">Yayın Yılı</div>
                    <div class="detail-value fw-medium">${book.publicationYear}</div>
                </div>
                <div class="col-6">
                    <div class="detail-label text-muted small">ISBN</div>
                    <div class="detail-value fw-medium">${book.isbn}</div>
                </div>
                <div class="col-6">
                    <div class="detail-label text-muted small">Çevirmen</div>
                    <div class="detail-value fw-medium">${book.translator}</div>
                </div>
                <div class="col-6">
                    <div class="detail-label text-muted small">Yayınevi</div>
                    <div class="detail-value fw-medium">${book.publisher}</div>
                </div>
                <div class="col-6">
                    <div class="detail-label text-muted small">Sayfa Sayısı</div>
                    <div class="detail-value fw-medium">${book.pageCount}</div>
                </div>
                <div class="col-6">
                    <div class="detail-label text-muted small">Ebat</div>
                    <div class="detail-value fw-medium">${book.dimensions}</div>
                </div>
                <div class="col-6">
                    <div class="detail-label text-muted small">İlk Baskı Yılı</div>
                    <div class="detail-value fw-medium">${book.firstPublicationYear}</div>
                </div>
                <div class="col-6">
                    <div class="detail-label text-muted small">Baskı</div>
                    <div class="detail-value fw-medium">${book.edition}</div>
                </div>
                <div class="col-6">
                    <div class="detail-label text-muted small">Dil</div>
                    <div class="detail-value fw-medium">${book.language}</div>
                </div>
                <div class="col-6">
                    <div class="detail-label text-muted small">Eklenme Tarihi</div>
                    <div class="detail-value fw-medium">
                        <fmt:formatDate value="${book.createdAt}" pattern="dd MMMM, yyyy"/>
                    </div>
                </div>
            </div>

            <div class="row align-items-center">
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <div class="col col-md-auto">
                            <button class="btn btn-dark fw-semibold py-2 px-4" 
                                    data-bs-toggle="modal" data-bs-target="#reviewModal">
                                <i class="bi bi-chat-heart me-2"></i>Değerlendirme Yap
                            </button>
                        </div>
                        <div class="col-auto col-md-auto">
                            <div class="d-flex gap-2">
                                <c:if test="${not empty book.id}">
                                    <button class="btn btn-outline-danger fw-semibold py-2 px-4 flex-grow-1 favorite-toggle" data-book-id="${book.id}">
                                        <i class="bi bi-heart me-md-2"></i><span class="d-none d-md-inline-block">Favorilere Ekle</span>
                                    </button>
                                </c:if>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col col-md-auto">
                            <div class="fw-semibold small bg-white shadow-sm rounded py-2 px-3 mt-3 d-inline-block">
                                <div class="row align-items-center">
                                    <div class="col-auto pe-0 d-none d-md-flex"><i class="bi bi-info-circle me-2 text-primary fz-22"></i></div>
                                    <div class="col">
                                        Değerlendirme yapmak için
                                        <a href="${pageContext.request.contextPath}/login" class="text-primary text-decoration-hover mx-1"><i class="bi bi-box-arrow-in-right me-2"></i>Giriş yapın</a> 
                                        veya 
                                        <a href="${pageContext.request.contextPath}/register" class="text-primary text-decoration-hover mx-1"><i class="bi bi-plus-circle me-2"></i>kayıt olun</a>.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            
        </div>
    </div>

    
    <div class="bg-white rounded border p-3 mt-3">
        <h6 class="fw-semibold mb-1">Kitap Hakkında</h6>
        <div class="book-description">${book.description}</div>
    </div>

    <div class="my-3 my-md-4 pt-3 pt-md-4 border-top">
        <div class="d-flex justify-content-between align-items-center">
            <h4 class="mb-0">
                <span class="badge bg-primary rounded me-2">${fn:length(reviews)}</span>
                Değerlendirme
            </h4>
            <c:if test="${not empty sessionScope.user}">
                <button class="btn btn-primary btn-sm fw-semibold rounded" data-bs-toggle="modal" data-bs-target="#reviewModal">
                    <i class="bi bi-pen me-2"></i>Yorum Ekle
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
                                <div class="flex-shrink-0">
                                    <div class="user-avatar bg-primary text-white rounded-circle d-flex align-items-center justify-content-center w-40 h-40 fw-semibold">
                                        <span class="p-2">${fn:substring(review.username, 0, 1)}</span>
                                    </div>
                                </div>
                                
                                <div class="flex-grow-1">
                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                        <div>
                                            <h6 class="mb-1 fw-bold">${review.username}</h6>
                                            <small class="text-muted small">
                                                <i class="bi bi-clock me-1 text-secondary"></i>
                                                <fmt:formatDate value="${review.createdAt}" pattern="dd MMM yyyy, HH:mm"/>
                                            </small>
                                        </div>
                                        
                                        <div class="text-end">
                                            <div class="rating-stars mb-1">
                                                <c:forEach begin="1" end="5" var="i">
                                                    <i class="bi bi-star-fill ${i <= review.rating ? 'text-warning' : 'text-light'}"></i>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <blockquote class="blockquote bg-white rounded border p-3">
                                        <p class="mb-0 text-muted fz-14">${review.comment}</p>
                                    </blockquote>
                                </div>
                            </div>
                            <c:if test="${sessionScope.user.id == review.userId || sessionScope.user.role == 'admin'}">
                                <div class="review-actions mt-2">
                                    <button class="btn btn-sm btn-outline-primary edit-review-btn" 
                                            data-review-id="${review.id}" 
                                            data-rating="${review.rating}" 
                                            data-comment="${fn:escapeXml(review.comment)}">
                                        <i class="bi bi-pencil me-1"></i>Düzenle
                                    </button>
                                    <button class="btn btn-sm btn-outline-danger delete-review-btn" 
                                            data-review-id="${review.id}">
                                        <i class="bi bi-trash me-1"></i>Sil
                                    </button>
                                </div>
                            </c:if>
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
                        <button class="btn btn-primary rounded fw-semibold px-4" data-bs-toggle="modal" data-bs-target="#reviewModal">
                            <i class="bi bi-chat-heart me-2"></i>İlk Değerlendirmeyi Yap
                        </button>
                    </c:if>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

<c:if test="${not empty sessionScope.user}">
    <div class="modal fade" id="reviewModal" tabindex="-1">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content rounded border-0 shadow">
                <div class="modal-header border-0 pb-0">
                    <h5 class="modal-title fw-bold">
                        <i class="bi bi-chat-heart me-3 fz-24 text-primary"></i>Değerlendirme Yap
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                
                <form action="${pageContext.request.contextPath}/books/view/${book.id}/review" method="POST">
                    <div class="modal-body">
                        <div class="bg-primary-subtle rounded p-3 mb-3">
                            <h6 class="mb-1">${book.title}</h6>
                            <small class="text-muted">${book.author}</small>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label fw-medium text-muted small">Puan Verin *</label>
                            <div class="star-rating-input" id="starRating">
                                <input type="hidden" name="rating" id="ratingValue" required>
                                <div class="stars fs-4 cursor-pointer d-inline-block">
                                    <i class="bi bi-star" data-rating="1"></i>
                                    <i class="bi bi-star" data-rating="2"></i>
                                    <i class="bi bi-star" data-rating="3"></i>
                                    <i class="bi bi-star" data-rating="4"></i>
                                    <i class="bi bi-star" data-rating="5"></i>
                                </div>
                                <div class="rating-labels ms-2 d-inline-block">
                                    <small class="text-muted fw-semibold" id="ratingLabel"> </small>
                                </div>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="comment" class="form-label fw-medium text-muted small">Yorumunuz *</label>
                            <textarea class="form-control form-control-sm p-3" id="comment" name="comment" rows="5" 
                                      placeholder="Bu kitap hakkındaki düşüncelerinizi paylaşın..." required></textarea>
                            <div class="form-text">
                                <i class="bi bi-info-circle me-1"></i>
                                Diğer okuyuculara yardımcı olacak detaylı bir değerlendirme yazın.
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary rounded fw-semibold btn-sm py-2 px-3">
                            <i class="bi bi-send me-2"></i>Değerlendirmeyi Gönder
                        </button>
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
</c:if>

<div class="modal fade" id="editReviewModal" tabindex="-1">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content rounded border-0 shadow">
      <div class="modal-header border-0 pb-0">
        <h5 class="modal-title fw-bold">
          <i class="bi bi-pencil me-2 text-primary"></i>Yorumu Düzenle
        </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <form id="editReviewForm">
        <div class="modal-body">
          <input type="hidden" name="reviewId" id="editReviewId">
          <div class="mb-3">
            <label class="form-label fw-medium text-muted small">Puan *</label>
            <select class="form-select" name="rating" id="editReviewRating" required>
              <option value="1">1 - Çok Kötü</option>
              <option value="2">2 - Kötü</option>
              <option value="3">3 - Orta</option>
              <option value="4">4 - İyi</option>
              <option value="5">5 - Mükemmel</option>
            </select>
          </div>
          <div class="mb-3">
            <label for="editReviewComment" class="form-label fw-medium text-muted small">Yorum *</label>
            <textarea class="form-control" name="comment" id="editReviewComment" rows="5" required></textarea>
          </div>
        </div>
        <div class="modal-footer border-0">
          <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">İptal</button>
          <button type="submit" class="btn btn-primary">Kaydet</button>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
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
    
    const favoriteButtons = document.querySelectorAll('.favorite-toggle');
    favoriteButtons.forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            console.log('Favori butonuna tıklandı!');
            const bookId = this.dataset.bookId;
            const icon = this.querySelector('i');
            const originalText = this.innerHTML;
            if (!bookId || bookId.trim() === '') {
                if (typeof showToast === 'function') {
                    showToast('Kitap ID bulunamadı!', 'error');
                } else {
                    alert('Kitap ID bulunamadı!');
                }
                this.disabled = false;
                this.innerHTML = originalText;
                return;
            }
            this.innerHTML = '<i class="spinner-border spinner-border-sm me-2"></i>İşleniyor...';
            this.disabled = true;
            console.log('Favori AJAX başlatılıyor, bookId:', bookId);
            const params = new URLSearchParams();
            params.append('action', 'toggle');
            params.append('bookId', bookId);
            fetch('<%= request.getContextPath() %>/favorites', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: params
            })
            .then(response => {
                console.log('Favori AJAX yanıtı:', response);
                if (response.status === 401) {
                    window.location.href = '<%= request.getContextPath() %>/login';
                    return Promise.reject('Giriş gerekli');
                }
                return response.json();
            })
            .then(data => {
                console.log('Favori AJAX data:', data);
                if (data.status === 'added') {
                    this.innerHTML = '<i class="bi bi-heart-fill me-2"></i>Favorilerden Çıkar';
                    this.classList.add('text-danger');
                    if (typeof showToast === 'function') {
                        showToast(data.message, 'success');
                    } else {
                        alert(data.message);
                    }
                } else if (data.status === 'removed') {
                    this.innerHTML = '<i class="bi bi-heart me-2"></i>Favorilere Ekle';
                    this.classList.remove('text-danger');
                    if (typeof showToast === 'function') {
                        showToast(data.message, 'info');
                    } else {
                        alert(data.message);
                    }
                }
                this.disabled = false;
            })
            .catch(error => {
                console.error('Favori AJAX hata:', error);
                if (typeof showToast === 'function') {
                    showToast('Favoriler işlemi başarısız oldu', 'error');
                } else {
                    alert('Favoriler işlemi başarısız oldu: ' + error);
                }
                this.innerHTML = originalText;
                this.disabled = false;
            });
        });
    });
    
    const shareButtons = document.querySelectorAll('[data-bs-toggle="tooltip"][title="Paylaş"]');
    shareButtons.forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            
            if (navigator.share) {
                navigator.share({
                    title: '${book.title}',
                    text: '${book.author} tarafından yazılan bu harika kitabı inceleyin!',
                    url: window.location.href
                }).then(() => {
                    showToast('Paylaşım başarılı!', 'success');
                }).catch(() => {
                    copyToClipboard();
                });
            } else {
                copyToClipboard();
            }
            
            function copyToClipboard() {
                navigator.clipboard.writeText(window.location.href).then(() => {
                    showToast('Link panoya kopyalandı!', 'success');
                }).catch(() => {
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
    
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });

    document.querySelectorAll('.edit-review-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const reviewId = this.dataset.reviewId;
            const rating = this.dataset.rating;
            const comment = this.dataset.comment;
            document.getElementById('editReviewId').value = reviewId;
            document.getElementById('editReviewRating').value = rating;
            document.getElementById('editReviewComment').value = comment;
            const modal = new bootstrap.Modal(document.getElementById('editReviewModal'));
            modal.show();
        });
    });
    document.getElementById('editReviewForm').addEventListener('submit', function(e) {
        e.preventDefault();
        const reviewId = document.getElementById('editReviewId').value;
        const rating = document.getElementById('editReviewRating').value;
        const comment = document.getElementById('editReviewComment').value;
        const params = new URLSearchParams();
        params.append('action', 'edit');
        params.append('reviewId', reviewId);
        params.append('rating', rating);
        params.append('comment', comment);
        fetch('<%= request.getContextPath() %>/review', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: params
        })
        .then(res => res.json())
        .then(data => {
            if (data.status === 'success') {
                if (typeof showToast === 'function') showToast(data.message, 'success');
                else alert(data.message);
                setTimeout(() => window.location.reload(), 1000);
            } else {
                if (typeof showToast === 'function') showToast(data.message || 'Hata oluştu', 'error');
                else alert(data.message || 'Hata oluştu');
            }
        })
        .catch(() => alert('Sunucu hatası!'));
    });
    document.querySelectorAll('.delete-review-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            if (!confirm('Yorumu silmek istediğinize emin misiniz?')) return;
            const reviewId = this.dataset.reviewId;
            const params = new URLSearchParams();
            params.append('action', 'delete');
            params.append('reviewId', reviewId);
            fetch('<%= request.getContextPath() %>/review', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: params
            })
            .then(res => res.json())
            .then(data => {
                if (data.status === 'success') {
                    if (typeof showToast === 'function') showToast(data.message, 'success');
                    else alert(data.message);
                    setTimeout(() => window.location.reload(), 1000);
                } else {
                    if (typeof showToast === 'function') showToast(data.message || 'Hata oluştu', 'error');
                    else alert(data.message || 'Hata oluştu');
                }
            })
            .catch(() => alert('Sunucu hatası!'));
        });
    });
});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %> 