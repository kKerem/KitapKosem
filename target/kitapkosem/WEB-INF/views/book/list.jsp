<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

</div>

<!-- Hero Search Section -->
<div class="hero-section bg-white border-bottom mb-3 mb-lg-4 p-3 p-lg-5" style="background-image: linear-gradient(rgba(0, 0, 0, .025) 1px, transparent 1px), linear-gradient(to right, rgba(0, 0, 0, .025) 1px, transparent 1px);background-size: 20px 20px;">
    <div class="container">
        <h1 class="display-6 fw-semibold mb-3">
            <i class="bi bi-collection me-3 text-primary"></i>
            Kitap Koleksiyonu
        </h1>
        <p class="lead mb-4 opacity-90">
            ${empty param.q ? 'Kitaplar arasından size uygun olanı keşfedin.' : '"' += param.q += '" için sonuçlar'}
        </p>
        
        <!-- Advanced Search -->
        <form action="${pageContext.request.contextPath}/books" method="GET">
            <div class="row">
                <div class="col col-md-5">
                    <div class="input-group input-group-lg border rounded-2">
                        <span class="input-group-text text-primary bg-white border-0">
                            <i class="bi bi-search"></i>
                        </span>
                        <input class="form-control fz-16 bg-white ps-0 border-0" 
                            type="search" 
                            placeholder="Kitap adı, yazar veya açıklama ara..." 
                            name="q" 
                            value="${param.q}"
                            style="box-shadow: none;">
                        <button class="btn btn-light btn-lg px-4 bg-white text-primary border-0" type="submit">
                            <i class="bi bi-arrow-right"></i>
                        </button>
                    </div>
                </div>
                <div class="col-auto">
                    <c:if test="${not empty sessionScope.user}">
                        <a href="${pageContext.request.contextPath}/books/add" class="btn btn-dark rounded fw-semibold h-100 d-flex align-items-center">
                            <i class="bi bi-plus-circle me-2"></i>Yeni kitap ekle
                        </a>
                    </c:if>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="container">
    
<!-- Filters and Sort -->
<div class="mb-4">
    <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
        <div class="d-flex gap-2 flex-wrap">
            <small class="text-muted">${fn:length(books)} kitap bulundu</small>
            <c:if test="${not empty param.q}">
                <a href="${pageContext.request.contextPath}/books" class="badge bg-light text-dark rounded-pill px-3 py-2 text-decoration-none">
                    <i class="bi bi-x-circle me-1"></i>Filtreyi Temizle
                </a>
            </c:if>
        </div>
        
        <div class="d-flex gap-2 align-items-center">
            <small class="text-muted">Sıralama:</small>
            <select class="form-select bg-white" id="sortSelect" style="width: auto;">
                <option value="newest">En Yeni</option>
                <option value="rating">En Çok Beğenilen</option>
                <option value="title">A-Z</option>
                <option value="year">Yayın Yılı</option>
            </select>
        </div>
    </div>
</div>

<!-- Blog Post Style Book List -->
<div class="row g-3 g-lg-4" id="booksGrid">
    <c:forEach items="${books}" var="book" varStatus="status">
        <div class="col-12 col-md-4 col-lg-3 book-item fade-in-up-delay-${(status.index % 4) + 1}">
            <div class="shadow-sm rounded p-2 bg-white h-100">
                <div class="position-relative">
                    <a href="${pageContext.request.contextPath}/books/view/${book.id}" class="text-decoration-none fw-semibold text-link">
                        <c:choose>
                            <c:when test="${not empty book.coverImage}">
                                <img src="${book.coverImage}" alt="${book.title}" class="cover-image rounded">
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
                    </a>
                </div>
                
                <div class="p-1 pb-0">
                    <!-- Rating Stars -->
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

                    <h4 class="book-title fz-18 mt-2 mb-0">
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
                    <c:if test="${not empty book.description}">
                        <p class="book-description m-0 satir-3">
                            ${fn:length(book.description) > 100 ? 
                                fn:substring(book.description, 0, 100) += '...' : 
                                book.description}
                        </p>
                    </c:if>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<!-- Empty State -->
<c:if test="${empty books}">
    <div class="text-center py-5">
        <div class="mb-4">
            <i class="bi bi-search text-muted opacity-50" style="font-size: 5rem;"></i>
        </div>
        <h3 class="text-muted mb-3">
            <c:choose>
                <c:when test="${not empty param.q}">
                    "${param.q}" için sonuç bulunamadı
                </c:when>
                <c:otherwise>
                    Henüz kitap eklenmemiş
                </c:otherwise>
            </c:choose>
        </h3>
        <p class="text-muted mb-4">
            <c:choose>
                <c:when test="${not empty param.q}">
                    Farklı anahtar kelimeler deneyin veya aramayı genişletin.
                </c:when>
                <c:otherwise>
                    İlk kitabı ekleyerek koleksiyonu başlatın!
                </c:otherwise>
            </c:choose>
        </p>
        <div class="d-flex gap-3 justify-content-center">
            <c:if test="${not empty param.q}">
                <a href="${pageContext.request.contextPath}/books" class="btn btn-outline-primary rounded-pill">
                    <i class="bi bi-arrow-left me-2"></i>Tüm Kitaplara Dön
                </a>
            </c:if>
            <c:if test="${not empty sessionScope.user}">
                <a href="${pageContext.request.contextPath}/books/add" class="btn btn-primary rounded-pill">
                    <i class="bi bi-plus-circle me-2"></i>Kitap Ekle
                </a>
            </c:if>
        </div>
    </div>
</c:if>

<!-- JavaScript for interactions -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Sort functionality
    const sortSelect = document.getElementById('sortSelect');
    if (sortSelect) {
        sortSelect.addEventListener('change', function() {
            // This would typically trigger a new request to the server
            // For now, we'll just show a toast
            showToast('Sıralama özelliği yakında eklenecek!', 'info');
        });
    }
    
    // Favorite button functionality
    const favoriteButtons = document.querySelectorAll('.favorite-btn');
    favoriteButtons.forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            const bookId = this.dataset.bookId;
            const icon = this.querySelector('i');
            
            // Toggle heart icon
            if (icon.classList.contains('bi-heart')) {
                icon.classList.remove('bi-heart');
                icon.classList.add('bi-heart-fill');
                this.classList.add('text-danger');
                showToast('Favorilere eklendi!', 'success');
            } else {
                icon.classList.remove('bi-heart-fill');
                icon.classList.add('bi-heart');
                this.classList.remove('text-danger');
                showToast('Favorilerden çıkarıldı!', 'info');
            }
            
            // Here you would make an AJAX call to add/remove from favorites
            // fetch(`/favorites/toggle/${bookId}`, { method: 'POST' })...
        });
    });
});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %> 