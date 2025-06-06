<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!-- Breadcrumb -->
<nav aria-label="breadcrumb" class="animate-fade-in-up">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="${pageContext.request.contextPath}/">
                <i class="bi bi-house me-1"></i>
                Ana Sayfa
            </a>
        </li>
        <li class="breadcrumb-item">
            <a href="${pageContext.request.contextPath}/books">
                <i class="bi bi-book me-1"></i>
                Kitaplar
            </a>
        </li>
        <li class="breadcrumb-item active" aria-current="page">${book.title}</li>
    </ol>
</nav>

<!-- Main Content -->
<div class="row g-4">
    <!-- Book Details -->
    <div class="col-lg-8">
        <div class="card apple-card animate-fade-in-up" style="animation-delay: 0.1s;">
            <div class="card-header">
                <h3 class="card-title mb-0">
                    <i class="bi bi-info-circle text-primary me-2"></i>
                    Kitap Bilgileri
                </h3>
            </div>
            <div class="card-body">
                <div class="row align-items-start">
                    <div class="col-auto">
                        <div class="book-cover-large mb-3">
                            ${fn:substring(book.title, 0, 1)}
                        </div>
                    </div>
                    <div class="col">
                        <h1 class="book-title-large mb-3">${book.title}</h1>
                        
                        <div class="book-meta-list">
                            <div class="meta-item">
                                <i class="bi bi-person-fill text-primary"></i>
                                <span class="meta-label">Yazar:</span>
                                <span class="meta-value">${book.author}</span>
                            </div>
                            
                            <div class="meta-item">
                                <i class="bi bi-calendar3 text-success"></i>
                                <span class="meta-label">Yayın Yılı:</span>
                                <span class="meta-value">${book.publicationYear}</span>
                            </div>
                            
                            <div class="meta-item">
                                <i class="bi bi-star-fill text-warning"></i>
                                <span class="meta-label">Ortalama Puan:</span>
                                <div class="d-flex align-items-center">
                                    <div class="rating-stars me-2">
                                        <c:forEach begin="1" end="5" var="i">
                                            <i class="${i <= book.averageRating ? 'bi bi-star-fill' : 'bi bi-star'}"></i>
                                        </c:forEach>
                                    </div>
                                    <span class="meta-value">
                                        <fmt:formatNumber value="${book.averageRating}" pattern="#.#" />
                                        <small class="text-muted">(${book.totalReviews} değerlendirme)</small>
                                    </span>
                                </div>
                            </div>
                            
                            <div class="meta-item">
                                <i class="bi bi-people text-info"></i>
                                <span class="meta-label">Okuyucu Sayısı:</span>
                                <span class="badge bg-success">${book.totalReviews} kişi</span>
                            </div>
                        </div>
                        
                        <c:if test="${not empty book.description}">
                            <div class="book-description mt-4">
                                <h5 class="mb-3">
                                    <i class="bi bi-file-text me-2"></i>
                                    Açıklama
                                </h5>
                                <div class="description-content">
                                    <p class="text-muted">${book.description}</p>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Review Form / Login Card -->
    <div class="col-lg-4">
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <div class="card apple-card animate-fade-in-up" style="animation-delay: 0.2s;">
                    <div class="card-header">
                        <h4 class="card-title mb-0">
                            <i class="bi bi-star text-warning me-2"></i>
                            Değerlendirme Yap
                        </h4>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger small" role="alert">
                                <i class="bi bi-exclamation-triangle me-2"></i>
                                ${error}
                            </div>
                        </c:if>
                        
                        <form action="${pageContext.request.contextPath}/review" method="post">
                            <input type="hidden" name="bookId" value="${book.id}">
                            
                            <div class="mb-4">
                                <label class="form-label fw-semibold">
                                    <i class="bi bi-star me-1"></i>
                                    Puanınız
                                </label>
                                <div class="rating-input d-flex justify-content-center">
                                    <input type="radio" id="star5" name="rating" value="5" required>
                                    <label for="star5"><i class="bi bi-star"></i></label>
                                    <input type="radio" id="star4" name="rating" value="4">
                                    <label for="star4"><i class="bi bi-star"></i></label>
                                    <input type="radio" id="star3" name="rating" value="3">
                                    <label for="star3"><i class="bi bi-star"></i></label>
                                    <input type="radio" id="star2" name="rating" value="2">
                                    <label for="star2"><i class="bi bi-star"></i></label>
                                    <input type="radio" id="star1" name="rating" value="1">
                                    <label for="star1"><i class="bi bi-star"></i></label>
                                </div>
                            </div>
                            
                            <div class="mb-4">
                                <label for="comment" class="form-label fw-semibold">
                                    <i class="bi bi-chat-left-text me-1"></i>
                                    Yorumunuz
                                </label>
                                <textarea name="comment" id="comment" class="form-control" rows="4" 
                                          placeholder="Bu kitap hakkındaki düşüncelerinizi paylaşın..." required></textarea>
                            </div>
                            
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-send me-2"></i>
                                    Değerlendirme Gönder
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="card apple-card animate-fade-in-up" style="animation-delay: 0.2s;">
                    <div class="card-body text-center py-5">
                        <div class="login-prompt-icon mb-4">
                            <i class="bi bi-lock display-4 text-muted"></i>
                        </div>
                        <h4 class="mb-3">Değerlendirme yapmak için giriş yapın</h4>
                        <p class="text-muted mb-4">
                            Bu kitaba yorum yapmak ve puan vermek için hesabınıza giriş yapmanız gerekmektedir.
                        </p>
                        <div class="d-grid gap-2">
                            <a href="${pageContext.request.contextPath}/login" class="btn btn-primary">
                                <i class="bi bi-box-arrow-in-right me-2"></i>
                                Giriş Yap
                            </a>
                            <a href="${pageContext.request.contextPath}/register" class="btn btn-outline-primary">
                                <i class="bi bi-person-plus me-2"></i>
                                Kayıt Ol
                            </a>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
        
        <!-- Quick Actions Card -->
        <div class="card apple-card mt-4 animate-fade-in-up" style="animation-delay: 0.3s;">
            <div class="card-body">
                <h6 class="card-title mb-3">
                    <i class="bi bi-lightning me-2"></i>
                    Hızlı İşlemler
                </h6>
                <div class="d-grid gap-2">
                    <a href="${pageContext.request.contextPath}/books" class="btn btn-outline-secondary btn-sm">
                        <i class="bi bi-arrow-left me-2"></i>
                        Kitaplara Dön
                    </a>
                    <c:if test="${not empty sessionScope.user}">
                        <a href="${pageContext.request.contextPath}/books/add" class="btn btn-outline-success btn-sm">
                            <i class="bi bi-plus-circle me-2"></i>
                            Yeni Kitap Ekle
                        </a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Reviews Section -->
<div class="card apple-card mt-5 animate-fade-in-up" style="animation-delay: 0.4s;">
    <div class="card-header">
        <h3 class="card-title mb-0">
            <i class="bi bi-chat-left-quote text-info me-2"></i>
            Yorumlar ve Değerlendirmeler (${fn:length(reviews)})
        </h3>
    </div>
    <div class="card-body">
        <c:choose>
            <c:when test="${empty reviews}">
                <div class="empty">
                    <div class="empty-icon">
                        <i class="bi bi-chat-quote"></i>
                    </div>
                    <div class="empty-title">Henüz değerlendirme yok</div>
                    <div class="empty-description">
                        Bu kitap için henüz hiç değerlendirme yapılmamış. İlk değerlendirmeyi siz yapın!
                    </div>
                    <c:if test="${not empty sessionScope.user}">
                        <button class="btn btn-primary" onclick="scrollToReviewForm()">
                            <i class="bi bi-plus-circle me-2"></i>
                            İlk Değerlendirmeyi Yap
                        </button>
                    </c:if>
                </div>
            </c:when>
            <c:otherwise>
                <div class="reviews-list">
                    <c:forEach var="review" items="${reviews}" varStatus="status">
                        <div class="review-item animate-fade-in-up" style="animation-delay: ${(status.index + 5) * 0.1}s;">
                            <div class="d-flex">
                                <div class="review-avatar">
                                    ${fn:substring(review.username, 0, 1)}
                                </div>
                                <div class="review-content">
                                    <div class="review-header">
                                        <div class="d-flex justify-content-between align-items-start">
                                            <div>
                                                <h6 class="review-author mb-1">
                                                    <i class="bi bi-person me-1"></i>
                                                    ${review.username}
                                                </h6>
                                                <div class="review-meta">
                                                    <i class="bi bi-clock me-1"></i>
                                                    <fmt:formatDate value="${review.createdAt}" pattern="dd.MM.yyyy HH:mm" />
                                                </div>
                                            </div>
                                            <div class="review-rating">
                                                <div class="rating-stars">
                                                    <c:forEach begin="1" end="5" var="i">
                                                        <i class="${i <= review.rating ? 'bi bi-star-fill' : 'bi bi-star'}"></i>
                                                    </c:forEach>
                                                </div>
                                                <span class="rating-badge">${review.rating}/5</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="review-text mt-3">
                                        <blockquote class="blockquote mb-0">
                                            <p class="mb-0">"${review.comment}"</p>
                                        </blockquote>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <c:if test="${!status.last}">
                            <hr class="my-4">
                        </c:if>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<style>
.book-cover-large {
    width: 120px;
    height: 180px;
    background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: 700;
    font-size: 3rem;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}

.book-title-large {
    font-size: 2rem;
    font-weight: 700;
    color: var(--text-primary);
    line-height: 1.2;
}

.book-meta-list {
    display: flex;
    flex-direction: column;
    gap: 1rem;
}

.meta-item {
    display: flex;
    align-items: center;
    gap: 0.75rem;
    padding: 0.75rem;
    background: var(--surface-secondary);
    border-radius: 12px;
    border: 1px solid var(--apple-border);
}

.meta-item i {
    font-size: 1.25rem;
    width: 24px;
    text-align: center;
}

.meta-label {
    font-weight: 600;
    color: var(--text-primary);
    min-width: 120px;
}

.meta-value {
    color: var(--text-secondary);
    font-weight: 500;
}

.description-content {
    background: var(--surface-secondary);
    border-radius: 12px;
    padding: 1.5rem;
    border: 1px solid var(--apple-border);
}

.login-prompt-icon {
    opacity: 0.6;
}

.review-item {
    margin-bottom: 2rem;
}

.review-avatar {
    width: 48px;
    height: 48px;
    background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: 600;
    font-size: 1.25rem;
    flex-shrink: 0;
}

.review-content {
    flex: 1;
    margin-left: 1rem;
}

.review-author {
    color: var(--text-primary);
    font-weight: 600;
    margin-bottom: 0;
}

.review-meta {
    color: var(--text-secondary);
    font-size: 0.875rem;
}

.review-rating {
    text-align: right;
}

.rating-badge {
    background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
    color: white;
    padding: 4px 8px;
    border-radius: 20px;
    font-size: 0.75rem;
    font-weight: 600;
    margin-left: 0.5rem;
}

.review-text blockquote {
    border-left: 4px solid var(--primary-color);
    padding-left: 1rem;
    margin-left: 0;
}

.review-text p {
    color: var(--text-primary);
    font-style: italic;
    line-height: 1.6;
}

@media (max-width: 768px) {
    .book-cover-large {
        width: 80px;
        height: 120px;
        font-size: 2rem;
    }
    
    .book-title-large {
        font-size: 1.5rem;
    }
    
    .meta-item {
        flex-direction: column;
        align-items: flex-start;
        text-align: left;
    }
    
    .meta-label {
        min-width: auto;
    }
}
</style>

<script>
function scrollToReviewForm() {
    const reviewForm = document.querySelector('form[action*="/review"]');
    if (reviewForm) {
        reviewForm.scrollIntoView({ behavior: 'smooth', block: 'center' });
        reviewForm.querySelector('textarea').focus();
    }
}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %> 