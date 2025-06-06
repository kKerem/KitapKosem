<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

<c:set var="title" value="Favorilerim" scope="request" />


<div class="hero-section text-center mb-5 mt-md-5">
    <h1 class="display-4 fw-bold mb-3">
        <i class="bi bi-heart-fill me-3"></i>
        Favori Kitaplarım
    </h1>
    <p class="lead mb-0">En çok sevdiğiniz kitapları burada bulabilirsiniz</p>
</div>


<div class="row">
    <div class="col-12">
        <c:choose>
            <c:when test="${empty favoriteBooks}">
                
                <div class="text-center py-5">
                    <div class="mb-4">
                        <i class="bi bi-heart display-1 text-muted opacity-50"></i>
                    </div>
                    <h3 class="text-muted mb-3">Henüz favori kitabınız yok</h3>
                    <p class="text-muted mb-4">Beğendiğiniz kitapları favorilere ekleyerek burada görüntüleyebilirsiniz.</p>
                    <a href="${pageContext.request.contextPath}/books" class="btn btn-primary rounded fw-semibold px-4">
                        <i class="bi bi-search me-2"></i>Kitapları Keşfet
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                
                <div class="row gy-4">
                    <c:forEach var="book" items="${favoriteBooks}">
                        <div class="col-lg-4 col-md-6">
                            <div class="book-card h-100 fade-in-up bg-white rounded border p-3">
                                <div class="d-flex">
                                    
                                    <div class="me-3">
                                        <div class="book-cover">
                                            <c:choose>
                                                <c:when test="${not empty book.coverImage}">
                                                    <img src="${pageContext.request.contextPath}${book.coverImage}" 
                                                         alt="${book.title}" 
                                                         style="width: 80px; height: 120px; object-fit: cover; border-radius: 12px;">
                                                </c:when>
                                                <c:otherwise>
                                                    ${fn:toUpperCase(fn:substring(book.title, 0, 1))}
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    
                                    
                                    <div class="flex-fill">
                                        <h5 class="text-decoration-none fw-semibold text-link fz-16">
                                            <a href="${pageContext.request.contextPath}/books/view/${book.id}" 
                                               class="text-decoration-none">
                                                ${book.title}
                                            </a>
                                        </h5>
                                        
                                        <p class="text-muted mb-2 small">
                                            <i class="bi bi-person me-1"></i>
                                            ${book.author}
                                        </p>
                                        
                                        <div class="d-flex align-items-center mb-2">
                                            <div class="rating-stars me-2">
                                                <c:forEach var="star" begin="1" end="5">
                                                    <i class="bi ${star <= book.rating ? 'bi-star-fill' : 'bi-star'} text-warning"></i>
                                                </c:forEach>
                                            </div>
                                            <small class="text-muted">
                                                ${book.rating} (${book.reviewCount} değerlendirme)
                                            </small>
                                        </div>
                                        
                                        <div class="d-flex justify-content-between align-items-center mt-2">
                                            <div class="btn-group btn-group-sm">
                                                <a href="${pageContext.request.contextPath}/books/view/${book.id}" 
                                                   class="btn btn-outline-primary btn-sm">
                                                    <i class="bi bi-eye me-1"></i>İncele
                                                </a>
                                                <c:if test="${not empty book.id}">
                                                    <button type="button" class="btn btn-outline-danger btn-sm favorite-remove-btn" 
                                                            data-book-id="${book.id}">
                                                        <i class="bi bi-heart-fill me-1"></i>Kaldır
                                                    </button>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                
                
                <div class="row mt-5 justify-content-center">
                    <div class="col-auto">
                        <div class="text-center p-3 bg-dark rounded border text-white">
                                <i class="bi bi-heart-fill text-primary"></i>
                            ${fn:length(favoriteBooks)}
                            Favori Kitap
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<style>
[data-bs-theme="dark"] .book-card {
    background: #2d3748;
    border-color: rgba(255, 255, 255, 0.1);
    color: white;
}

.favorite-remove-btn {
    transition: all 0.3s ease;
}

.favorite-remove-btn:hover {
    transform: translateY(-1px);
}

@media (max-width: 768px) {
    .book-cover {
        width: 60px;
        height: 90px;
        font-size: 1.2rem;
    }
}
</style>


<script>
document.addEventListener('DOMContentLoaded', function() {
    // Remove from favorites functionality
    const removeButtons = document.querySelectorAll('.favorite-remove-btn');
    removeButtons.forEach(btn => {
        btn.addEventListener('click', function() {
            const bookId = this.dataset.bookId;
            const card = this.closest('.col-lg-4, .col-md-6');
            
            // Show loading state
            this.innerHTML = '<i class="spinner-border spinner-border-sm me-1"></i>Kaldırılıyor...';
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
                if (data.status === 'removed') {
                    // Animate card removal
                    card.style.transition = 'all 0.5s ease';
                    card.style.opacity = '0';
                    card.style.transform = 'scale(0.8)';
                    
                    setTimeout(() => {
                        card.remove();
                        
                        // Check if all favorites are removed
                        const remainingCards = document.querySelectorAll('.book-card').length;
                        if (remainingCards === 0) {
                            location.reload(); // Show empty state
                        }
                    }, 500);
                    
                    showToast(data.message, 'success');
                } else {
                    throw new Error('Beklenmeyen yanıt');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showToast('Favorilerden kaldırma işlemi başarısız oldu', 'error');
                
                // Reset button state
                this.innerHTML = '<i class="bi bi-heart-fill me-1"></i>Kaldır';
                this.disabled = false;
            });
        });
    });
});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %> 