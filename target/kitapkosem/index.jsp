<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!-- Modern Hero Section -->
<div class="hero-section fade-in-up">
    <div class="row align-items-center">
        <div class="col-lg-8">
            <h1 class="display-4 fw-bold mb-4">
                <i class="bi bi-book-half me-3"></i>
                Kitap Dünyasına <span class="text-warning">Hoş Geldiniz!</span>
            </h1>
            <p class="lead mb-4 opacity-90">
                Binlerce kitapsever ile buluşun, favori kitaplarınızı keşfedin, 
                değerlendirin ve unutulmaz okuma deneyimleri yaşayın.
            </p>
            <div class="d-flex gap-3 flex-wrap">
                <a href="${pageContext.request.contextPath}/books" class="btn btn-light btn-lg rounded-pill px-5">
                    <i class="bi bi-compass me-2"></i>Kitapları Keşfet
                </a>
                <c:if test="${empty sessionScope.user}">
                    <a href="${pageContext.request.contextPath}/register" class="btn btn-outline-light btn-lg rounded-pill px-5">
                        <i class="bi bi-person-plus me-2"></i>Ücretsiz Katıl
                    </a>
                </c:if>
            </div>
        </div>
        <div class="col-lg-4 text-center">
            <div class="position-relative">
                <i class="bi bi-books display-1 opacity-75 pulse"></i>
                <div class="position-absolute top-50 start-50 translate-middle">
                    <div class="bg-warning rounded-circle" style="width: 20px; height: 20px; animation: pulse 2s infinite;"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Platform Statistics -->
<div class="mb-5">
    <h2 class="section-title mb-4 text-center">Platform İstatistikleri</h2>
    <div class="row g-4">
        <div class="col-lg-3 col-md-6">
            <div class="stats-card fade-in-up-delay-1">
                <div class="stats-icon">
                    <i class="bi bi-book-fill"></i>
                </div>
                <div class="stats-number counter">${totalBooks}</div>
                <div class="stats-label">Toplam Kitap</div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stats-card fade-in-up-delay-2" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);">
                <div class="stats-icon">
                    <i class="bi bi-people-fill"></i>
                </div>
                <div class="stats-number counter">${totalUsers}</div>
                <div class="stats-label">Aktif Üye</div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stats-card fade-in-up-delay-3" style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);">
                <div class="stats-icon">
                    <i class="bi bi-chat-heart-fill"></i>
                </div>
                <div class="stats-number counter">${totalReviews}</div>
                <div class="stats-label">Değerlendirme</div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stats-card fade-in-up-delay-4" style="background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);">
                <div class="stats-icon">
                    <i class="bi bi-star-fill"></i>
                </div>
                <div class="stats-number">4.8</div>
                <div class="stats-label">Ortalama Puan</div>
            </div>
        </div>
    </div>
</div>

<!-- Featured Books Section -->
<div class="mb-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="section-title mb-0">⭐ Öne Çıkan Kitaplar</h2>
        <a href="${pageContext.request.contextPath}/books" class="btn btn-outline-primary rounded-pill">
            <i class="bi bi-arrow-right-circle me-2"></i>Tümünü Görüntüle
        </a>
    </div>

    <div class="modern-card p-4 fade-in-up">
        <c:choose>
            <c:when test="${empty featuredBooks}">
                <div class="text-center py-5">
                    <div class="mb-4">
                        <i class="bi bi-book-fill text-muted opacity-50" style="font-size: 4rem;"></i>
                    </div>
                    <h4 class="text-muted">Henüz kitap eklenmemiş</h4>
                    <p class="text-muted mb-4">İlk kitabı ekleyen siz olun ve topluluğumuzun başlangıcını yapın!</p>
                    <c:if test="${not empty sessionScope.user}">
                        <a href="${pageContext.request.contextPath}/books/add" class="btn btn-primary rounded-pill px-4">
                            <i class="bi bi-plus-circle me-2"></i>İlk Kitabı Ekle
                        </a>
                    </c:if>
                </div>
            </c:when>
            <c:otherwise>
                <div class="row g-4">
                    <c:forEach items="${featuredBooks}" var="book" varStatus="status">
                        <div class="col-xl-4 col-lg-6">
                            <div class="book-card fade-in-up-delay-${status.index + 1}">
                                <div class="d-flex mb-3">
                                    <div class="book-cover me-3 position-relative">
                                        <span class="fw-bold">${fn:substring(book.title, 0, 1)}</span>
                                        <div class="position-absolute top-0 end-0 translate-middle">
                                            <span class="badge bg-warning rounded-pill">
                                                <i class="bi bi-star-fill"></i>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="flex-grow-1">
                                        <h6 class="fw-bold mb-2 text-primary">${book.title}</h6>
                                        <p class="text-muted small mb-2">
                                            <i class="bi bi-person-circle me-1"></i>
                                            <span class="fw-medium">${book.author}</span>
                                        </p>
                                        <p class="text-muted small mb-0">
                                            <i class="bi bi-calendar3 me-1"></i>
                                            ${book.publicationYear}
                                        </p>
                                    </div>
                                </div>
                                
                                <c:choose>
                                    <c:when test="${book.reviewCount > 0}">
                                        <div class="d-flex align-items-center justify-content-between mb-3">
                                            <div class="rating-stars">
                                                <c:forEach begin="1" end="5" var="i">
                                                    <i class="bi bi-star-fill"></i>
                                                </c:forEach>
                                            </div>
                                            <span class="badge bg-primary rounded-pill">${book.rating}/5</span>
                                        </div>
                                        <small class="text-muted">
                                            <i class="bi bi-chat-dots me-1"></i>
                                            ${book.reviewCount} değerlendirme
                                        </small>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-success rounded-pill">
                                            <i class="bi bi-lightning-fill me-1"></i>Yeni Eklendi
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                                
                                <div class="d-grid mt-3">
                                    <a href="${pageContext.request.contextPath}/books/view/${book.id}" 
                                       class="btn btn-primary rounded-pill">
                                        <i class="bi bi-eye me-2"></i>İncele
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- Latest Reviews Section -->
<div class="mb-5">
    <h2 class="section-title mb-4">💬 Son Değerlendirmeler</h2>
    
    <div class="modern-card p-4 fade-in-up">
        <c:choose>
            <c:when test="${empty latestReviews}">
                <div class="text-center py-5">
                    <div class="mb-4">
                        <i class="bi bi-chat-square-heart text-muted opacity-50" style="font-size: 4rem;"></i>
                    </div>
                    <h4 class="text-muted">Henüz değerlendirme yok</h4>
                    <p class="text-muted">İlk değerlendirmeyi yapan siz olun ve fikirlerinizi paylaşın!</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="row g-4">
                    <c:forEach items="${latestReviews}" var="review" varStatus="status">
                        <div class="col-lg-6">
                            <div class="modern-card p-3 h-100 fade-in-up-delay-${status.index + 1}">
                                <div class="d-flex mb-3">
                                    <div class="flex-shrink-0">
                                        <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center" 
                                             style="width: 48px; height: 48px;">
                                            <span class="fw-bold">M</span>
                                        </div>
                                    </div>
                                    <div class="flex-grow-1 ms-3">
                                        <div class="d-flex justify-content-between align-items-start">
                                            <div>
                                                <h6 class="mb-1 fw-bold">mert</h6>
                                                <small class="text-muted">
                                                    <i class="bi bi-clock me-1"></i>
                                                    <fmt:formatDate value="${review.createdAt}" pattern="dd MMM yyyy"/>
                                                </small>
                                            </div>
                                            <div class="rating-stars">
                                                <c:forEach begin="1" end="5" var="i">
                                                    <i class="bi bi-star-fill"></i>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="mb-3">
                                    <a href="${pageContext.request.contextPath}/books/view/${review.bookId}" 
                                       class="text-decoration-none">
                                        <div class="bg-light rounded-3 p-2">
                                            <i class="bi bi-book text-primary me-2"></i>
                                            <span class="fw-medium text-dark">${review.bookTitle}</span>
                                        </div>
                                    </a>
                                </div>
                                
                                <blockquote class="blockquote">
                                    <p class="mb-0 text-muted fst-italic">"${review.comment}"</p>
                                </blockquote>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- Call to Action for Non-logged Users -->
<c:if test="${empty sessionScope.user}">
    <div class="modern-card p-5 text-center fade-in-up" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; border: none;">
        <div class="mb-4">
            <i class="bi bi-people-fill opacity-75" style="font-size: 5rem;"></i>
        </div>
        <h2 class="fw-bold mb-3">Topluluğumuza Katılın! 🚀</h2>
        <p class="lead mb-4 opacity-90">
            Binlerce kitapseverle birlikte okuma serüveninizi başlatın. 
            Kitapları keşfedin, değerlendirin ve deneyimlerinizi paylaşın.
        </p>
        
        <div class="row justify-content-center mb-4">
            <div class="col-md-8">
                <div class="row text-center">
                    <div class="col-4">
                        <i class="bi bi-search-heart display-6 mb-2 opacity-75"></i>
                        <p class="small mb-0 fw-medium">Keşfet</p>
                    </div>
                    <div class="col-4">
                        <i class="bi bi-star-half display-6 mb-2 opacity-75"></i>
                        <p class="small mb-0 fw-medium">Değerlendir</p>
                    </div>
                    <div class="col-4">
                        <i class="bi bi-share-fill display-6 mb-2 opacity-75"></i>
                        <p class="small mb-0 fw-medium">Paylaş</p>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="d-flex gap-3 justify-content-center flex-wrap">
            <a href="${pageContext.request.contextPath}/register" class="btn btn-light btn-lg rounded-pill px-5">
                <i class="bi bi-person-plus me-2"></i>Ücretsiz Hesap Oluştur
            </a>
            <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-light btn-lg rounded-pill px-5">
                <i class="bi bi-box-arrow-in-right me-2"></i>Giriş Yap
            </a>
        </div>
    </div>
</c:if>

</div> <!-- container end -->

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
