<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>

<c:set var="title" value="Profilim" scope="request"/>
<%@ include file="../common/header.jsp" %>

<!-- Profile Hero Section -->
<div class="profile-hero">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-3 text-center">
                <div class="profile-avatar-container">
                    <div class="profile-avatar">
                        <span class="avatar-letter">${fn:substring(user.username, 0, 1)}</span>
                    </div>
                    <div class="avatar-status online"></div>
                </div>
            </div>
            <div class="col-md-6">
                <h1 class="profile-name">${user.username}</h1>
                <p class="profile-email text-muted">
                    <i class="bi bi-envelope me-2"></i>${user.email}
                </p>
                <div class="profile-badges">
                    <span class="badge bg-primary rounded-pill">
                        <i class="bi bi-person-check me-1"></i>Aktif Üye
                    </span>
                    <c:if test="${user.username == 'admin'}">
                        <span class="badge bg-warning rounded-pill">
                            <i class="bi bi-shield-check me-1"></i>Admin
                        </span>
                    </c:if>
                </div>
            </div>
            <div class="col-md-3 text-end">
                <button class="btn btn-outline-light rounded-pill" data-bs-toggle="modal" data-bs-target="#editProfileModal">
                    <i class="bi bi-pencil me-2"></i>Profili Düzenle
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Profile Stats -->
<div class="container mt-4">
    <div class="row g-4">
        <div class="col-md-3">
            <div class="stat-card">
                <div class="stat-icon bg-primary">
                    <i class="bi bi-chat-heart"></i>
                </div>
                <div class="stat-content">
                    <h3 class="stat-number">${fn:length(userReviews)}</h3>
                    <p class="stat-label">Değerlendirme</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card">
                <div class="stat-icon bg-danger">
                    <i class="bi bi-heart-fill"></i>
                </div>
                <div class="stat-content">
                    <h3 class="stat-number">${favoriteCount}</h3>
                    <p class="stat-label">Favori Kitap</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card">
                <div class="stat-icon bg-success">
                    <i class="bi bi-book"></i>
                </div>
                <div class="stat-content">
                    <h3 class="stat-number">${userBooksCount}</h3>
                    <p class="stat-label">Eklenen Kitap</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card">
                <div class="stat-icon bg-warning">
                    <i class="bi bi-star-fill"></i>
                </div>
                <div class="stat-content">
                    <h3 class="stat-number">${averageRating}</h3>
                    <p class="stat-label">Ortalama Puan</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Profile Content -->
<div class="container mt-5">
    <div class="row g-4">
        <!-- Reviews Section -->
        <div class="col-lg-8">
            <div class="modern-card">
                <div class="card-header bg-transparent border-0">
                    <div class="d-flex justify-content-between align-items-center">
                        <h4 class="mb-0">
                            <i class="bi bi-chat-square-text me-2"></i>
                            Değerlendirmelerim <span class="badge bg-primary rounded-pill ms-2">${fn:length(userReviews)}</span>
                        </h4>
                        <div class="dropdown">
                            <button class="btn btn-outline-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                <i class="bi bi-filter me-1"></i>Filtrele
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#" data-filter="all">Tümü</a></li>
                                <li><a class="dropdown-item" href="#" data-filter="5">5 Yıldız</a></li>
                                <li><a class="dropdown-item" href="#" data-filter="4">4 Yıldız</a></li>
                                <li><a class="dropdown-item" href="#" data-filter="recent">Son Eklenenler</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="card-body">
                    <c:choose>
                        <c:when test="${not empty userReviews}">
                            <div class="reviews-timeline">
                                <c:forEach items="${userReviews}" var="review" varStatus="status">
                                    <div class="review-timeline-item" data-rating="${review.rating}">
                                        <div class="timeline-marker">
                                            <i class="bi bi-chat-heart"></i>
                                        </div>
                                        <div class="timeline-content">
                                            <div class="review-header">
                                                <div class="d-flex justify-content-between align-items-start">
                                                    <div>
                                                        <h6 class="review-book-title mb-1">
                                                            <a href="${pageContext.request.contextPath}/books/view/${review.bookId}" class="text-decoration-none">
                                                                ${review.bookTitle}
                                                            </a>
                                                        </h6>
                                                        <small class="text-muted">
                                                            <i class="bi bi-clock me-1"></i>
                                                            <fmt:formatDate value="${review.createdAt}" pattern="dd MMM yyyy, HH:mm"/>
                                                        </small>
                                                    </div>
                                                    <div class="review-actions">
                                                        <div class="rating-stars mb-1">
                                                            <c:forEach begin="1" end="5" var="i">
                                                                <i class="bi bi-star-fill ${i <= review.rating ? 'text-warning' : 'text-light'}"></i>
                                                            </c:forEach>
                                                        </div>
                                                        <c:if test="${not empty review.recommendationPercentage}">
                                                            <span class="badge ${review.recommendationPercentage >= 70 ? 'bg-success' : review.recommendationPercentage >= 40 ? 'bg-warning' : 'bg-danger'} rounded-pill">
                                                                ${review.recommendationPercentage}% tavsiye
                                                            </span>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            <blockquote class="review-comment mt-2">
                                                <p class="mb-0 text-muted fst-italic">"${review.comment}"</p>
                                            </blockquote>
                                            <div class="review-footer mt-3">
                                                <button class="btn btn-sm btn-outline-primary rounded-pill me-2">
                                                    <i class="bi bi-pencil me-1"></i>Düzenle
                                                </button>
                                                <button class="btn btn-sm btn-outline-danger rounded-pill">
                                                    <i class="bi bi-trash me-1"></i>Sil
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="empty-state text-center py-5">
                                <div class="mb-4">
                                    <i class="bi bi-chat-square-dots text-muted opacity-50" style="font-size: 4rem;"></i>
                                </div>
                                <h5 class="text-muted mb-3">Henüz değerlendirme yapmamışsınız</h5>
                                <p class="text-muted">Kitapları değerlendirerek diğer okuyuculara yardımcı olun!</p>
                                <a href="${pageContext.request.contextPath}/books" class="btn btn-primary rounded-pill px-4">
                                    <i class="bi bi-book me-2"></i>Kitapları Keşfet
                                </a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        
        <!-- Sidebar -->
        <div class="col-lg-4">
            <!-- Favorite Books -->
            <div class="modern-card mb-4">
                <div class="card-header bg-transparent border-0">
                    <h5 class="mb-0">
                        <i class="bi bi-heart-fill text-danger me-2"></i>
                        Favori Kitaplarım
                    </h5>
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${not empty favoriteBooks}">
                            <div class="favorite-books-list">
                                <c:forEach items="${favoriteBooks}" var="book" varStatus="status">
                                    <c:if test="${status.index < 5}">
                                        <div class="favorite-book-item">
                                            <div class="d-flex align-items-center">
                                                <div class="book-mini-cover me-3">
                                                    <c:choose>
                                                        <c:when test="${not empty book.coverImage}">
                                                            <img src="${book.coverImage}" alt="${book.title}" class="rounded">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="mini-cover-placeholder">
                                                                <span>${fn:substring(book.title, 0, 1)}</span>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <h6 class="mb-1">
                                                        <a href="${pageContext.request.contextPath}/books/view/${book.id}" class="text-decoration-none">
                                                            ${fn:length(book.title) > 20 ? fn:substring(book.title, 0, 20) += '...' : book.title}
                                                        </a>
                                                    </h6>
                                                    <small class="text-muted">${book.author}</small>
                                                </div>
                                                <div class="text-end">
                                                    <c:if test="${book.reviewCount > 0}">
                                                        <div class="rating-mini">
                                                            <i class="bi bi-star-fill text-warning"></i>
                                                            <span class="small">${book.rating}</span>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <c:if test="${fn:length(favoriteBooks) > 5}">
                                <div class="text-center mt-3">
                                    <a href="${pageContext.request.contextPath}/favorites" class="btn btn-outline-primary btn-sm rounded-pill">
                                        Tümünü Gör (${fn:length(favoriteBooks)})
                                    </a>
                                </div>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <div class="text-center py-3">
                                <i class="bi bi-heart text-muted opacity-50 mb-2" style="font-size: 2rem;"></i>
                                <p class="text-muted small mb-0">Henüz favori kitabınız yok</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            
            <!-- Quick Actions -->
            <div class="modern-card">
                <div class="card-header bg-transparent border-0">
                    <h5 class="mb-0">
                        <i class="bi bi-lightning me-2"></i>
                        Hızlı İşlemler
                    </h5>
                </div>
                <div class="card-body">
                    <div class="d-grid gap-2">
                        <a href="${pageContext.request.contextPath}/books/add" class="btn btn-primary rounded-pill">
                            <i class="bi bi-plus-circle me-2"></i>Yeni Kitap Ekle
                        </a>
                        <a href="${pageContext.request.contextPath}/books" class="btn btn-outline-primary rounded-pill">
                            <i class="bi bi-search me-2"></i>Kitap Ara
                        </a>
                        <a href="${pageContext.request.contextPath}/favorites" class="btn btn-outline-danger rounded-pill">
                            <i class="bi bi-heart me-2"></i>Favorilerim
                        </a>
                        <button class="btn btn-outline-secondary rounded-pill" data-bs-toggle="modal" data-bs-target="#editProfileModal">
                            <i class="bi bi-gear me-2"></i>Ayarlar
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Edit Profile Modal -->
<div class="modal fade" id="editProfileModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content rounded-4 border-0 shadow">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title fw-bold">
                    <i class="bi bi-person-gear me-2"></i>Profili Düzenle
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            
            <form action="${pageContext.request.contextPath}/profile" method="POST">
                <div class="modal-body">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="username" class="form-label fw-medium">Kullanıcı Adı</label>
                            <input type="text" class="form-control" id="username" name="username" 
                                   value="${user.username}" required>
                        </div>
                        <div class="col-md-6">
                            <label for="email" class="form-label fw-medium">E-posta</label>
                            <input type="email" class="form-control" id="email" name="email" 
                                   value="${user.email}" required>
                        </div>
                        <div class="col-12">
                            <hr class="my-4">
                            <h6 class="fw-bold mb-3">Şifre Değiştir</h6>
                        </div>
                        <div class="col-12">
                            <label for="currentPassword" class="form-label fw-medium">Mevcut Şifre</label>
                            <input type="password" class="form-control" id="currentPassword" name="currentPassword">
                        </div>
                        <div class="col-md-6">
                            <label for="newPassword" class="form-label fw-medium">Yeni Şifre</label>
                            <input type="password" class="form-control" id="newPassword" name="newPassword">
                        </div>
                        <div class="col-md-6">
                            <label for="confirmPassword" class="form-label fw-medium">Yeni Şifre Tekrar</label>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword">
                        </div>
                    </div>
                </div>
                
                <div class="modal-footer border-0">
                    <button type="button" class="btn btn-outline-secondary rounded-pill" data-bs-dismiss="modal">
                        İptal
                    </button>
                    <button type="submit" class="btn btn-primary rounded-pill px-4">
                        <i class="bi bi-check-circle me-2"></i>Değişiklikleri Kaydet
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Profile Styles -->
<style>
.profile-hero {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 3rem 0;
    margin-top: -2rem;
}

.profile-avatar-container {
    position: relative;
    display: inline-block;
}

.profile-avatar {
    width: 120px;
    height: 120px;
    background: rgba(255, 255, 255, 0.2);
    border: 4px solid rgba(255, 255, 255, 0.3);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    backdrop-filter: blur(10px);
}

.avatar-letter {
    font-size: 3rem;
    font-weight: 800;
    text-shadow: 0 2px 4px rgba(0,0,0,0.3);
}

.avatar-status {
    position: absolute;
    bottom: 8px;
    right: 8px;
    width: 24px;
    height: 24px;
    border-radius: 50%;
    border: 3px solid white;
}

.avatar-status.online {
    background: #10b981;
}

.profile-name {
    font-size: 2.5rem;
    font-weight: 800;
    margin-bottom: 0.5rem;
    text-shadow: 0 2px 4px rgba(0,0,0,0.3);
}

.profile-email {
    font-size: 1.1rem;
    margin-bottom: 1rem;
}

.profile-badges .badge {
    margin-right: 0.5rem;
    font-size: 0.875rem;
    padding: 0.5rem 1rem;
}

.stat-card {
    background: white;
    border-radius: 16px;
    padding: 1.5rem;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    display: flex;
    align-items: center;
    gap: 1rem;
    transition: transform 0.3s ease;
}

.stat-card:hover {
    transform: translateY(-4px);
}

.stat-icon {
    width: 60px;
    height: 60px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 1.5rem;
}

.stat-number {
    font-size: 2rem;
    font-weight: 800;
    margin-bottom: 0;
    color: #1a202c;
}

.stat-label {
    color: #6b7280;
    margin-bottom: 0;
    font-weight: 500;
}

.reviews-timeline {
    position: relative;
}

.review-timeline-item {
    position: relative;
    padding-left: 3rem;
    margin-bottom: 2rem;
}

.review-timeline-item:not(:last-child)::before {
    content: '';
    position: absolute;
    left: 1rem;
    top: 2.5rem;
    bottom: -2rem;
    width: 2px;
    background: #e5e7eb;
}

.timeline-marker {
    position: absolute;
    left: 0;
    top: 0;
    width: 2rem;
    height: 2rem;
    background: #3b82f6;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 0.875rem;
}

.timeline-content {
    background: #f8f9fa;
    border-radius: 12px;
    padding: 1.5rem;
    border-left: 4px solid #3b82f6;
}

.review-book-title a {
    color: #1a202c;
    font-weight: 600;
}

.review-book-title a:hover {
    color: #3b82f6;
}

.review-comment {
    background: white;
    border-radius: 8px;
    padding: 1rem;
    border-left: 3px solid #e5e7eb;
}

.favorite-book-item {
    padding: 0.75rem 0;
    border-bottom: 1px solid #f3f4f6;
}

.favorite-book-item:last-child {
    border-bottom: none;
}

.book-mini-cover {
    width: 40px;
    height: 60px;
}

.book-mini-cover img,
.mini-cover-placeholder {
    width: 100%;
    height: 100%;
    border-radius: 4px;
}

.mini-cover-placeholder {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: 700;
    font-size: 0.875rem;
}

.rating-mini {
    font-size: 0.875rem;
}

[data-bs-theme="dark"] .stat-card {
    background: #2d3748;
    color: white;
}

[data-bs-theme="dark"] .stat-number {
    color: #f7fafc;
}

[data-bs-theme="dark"] .timeline-content {
    background: #4a5568;
    color: white;
}

[data-bs-theme="dark"] .review-comment {
    background: #2d3748;
}

@media (max-width: 768px) {
    .profile-hero {
        padding: 2rem 0;
    }
    
    .profile-name {
        font-size: 2rem;
    }
    
    .avatar-letter {
        font-size: 2rem;
    }
    
    .profile-avatar {
        width: 80px;
        height: 80px;
    }
}
</style>

<!-- Profile JavaScript -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Filter reviews
    const filterButtons = document.querySelectorAll('[data-filter]');
    const reviewItems = document.querySelectorAll('.review-timeline-item');
    
    filterButtons.forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            const filter = this.dataset.filter;
            
            reviewItems.forEach(item => {
                if (filter === 'all') {
                    item.style.display = 'block';
                } else if (filter === 'recent') {
                    // Show only recent reviews (you can implement date logic here)
                    item.style.display = 'block';
                } else {
                    const rating = item.dataset.rating;
                    item.style.display = rating === filter ? 'block' : 'none';
                }
            });
            
            // Update active filter
            filterButtons.forEach(b => b.classList.remove('active'));
            this.classList.add('active');
        });
    });
    
    // Animate stats on scroll
    const observerOptions = {
        threshold: 0.5,
        rootMargin: '0px 0px -100px 0px'
    };
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const statNumber = entry.target.querySelector('.stat-number');
                const finalNumber = parseInt(statNumber.textContent);
                animateNumber(statNumber, 0, finalNumber, 1000);
            }
        });
    }, observerOptions);
    
    document.querySelectorAll('.stat-card').forEach(card => {
        observer.observe(card);
    });
    
    function animateNumber(element, start, end, duration) {
        const startTime = performance.now();
        
        function update(currentTime) {
            const elapsed = currentTime - startTime;
            const progress = Math.min(elapsed / duration, 1);
            
            const current = Math.floor(start + (end - start) * progress);
            element.textContent = current;
            
            if (progress < 1) {
                requestAnimationFrame(update);
            }
        }
        
        requestAnimationFrame(update);
    }
});
</script>

<%@ include file="../common/footer.jsp" %> 