<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<% 
    request.setAttribute("navbarClass", "navbar-dark");
    request.setAttribute("bgClass", "bg-dark");
    request.setAttribute("isIndexPage", true);
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
</div>

<div class="jumbo-alan position-relative overflow-hidden" style="top:-2px;background: #FBFCFF; background: linear-gradient(180deg, rgba(251, 252, 255, 1) 0%, rgba(255, 255, 255, 1) 90%);">
    
    <svg id="wave" style="transform:rotate(180deg); transition: 0.3s" viewBox="0 0 1440 100" version="1.1" xmlns="http://www.w3.org/2000/svg"><defs><linearGradient id="sw-gradient-0" x1="0" x2="0" y1="1" y2="0"><stop stop-color="rgba(33, 37, 41, 1)" offset="0%"></stop><stop stop-color="rgba(33, 37, 41, 1)" offset="100%"></stop></linearGradient></defs><path style="transform:translate(0, 0px); opacity:1" fill="url(#sw-gradient-0)" d="M0,30L34.3,31.7C68.6,33,137,37,206,35C274.3,33,343,27,411,30C480,33,549,47,617,46.7C685.7,47,754,33,823,38.3C891.4,43,960,67,1029,73.3C1097.1,80,1166,70,1234,61.7C1302.9,53,1371,47,1440,50C1508.6,53,1577,67,1646,71.7C1714.3,77,1783,73,1851,63.3C1920,53,1989,37,2057,40C2125.7,43,2194,67,2263,65C2331.4,63,2400,37,2469,21.7C2537.1,7,2606,3,2674,8.3C2742.9,13,2811,27,2880,26.7C2948.6,27,3017,13,3086,16.7C3154.3,20,3223,40,3291,46.7C3360,53,3429,47,3497,36.7C3565.7,27,3634,13,3703,20C3771.4,27,3840,53,3909,66.7C3977.1,80,4046,80,4114,70C4182.9,60,4251,40,4320,31.7C4388.6,23,4457,27,4526,33.3C4594.3,40,4663,50,4731,53.3C4800,57,4869,53,4903,51.7L4937.1,50L4937.1,100L4902.9,100C4868.6,100,4800,100,4731,100C4662.9,100,4594,100,4526,100C4457.1,100,4389,100,4320,100C4251.4,100,4183,100,4114,100C4045.7,100,3977,100,3909,100C3840,100,3771,100,3703,100C3634.3,100,3566,100,3497,100C3428.6,100,3360,100,3291,100C3222.9,100,3154,100,3086,100C3017.1,100,2949,100,2880,100C2811.4,100,2743,100,2674,100C2605.7,100,2537,100,2469,100C2400,100,2331,100,2263,100C2194.3,100,2126,100,2057,100C1988.6,100,1920,100,1851,100C1782.9,100,1714,100,1646,100C1577.1,100,1509,100,1440,100C1371.4,100,1303,100,1234,100C1165.7,100,1097,100,1029,100C960,100,891,100,823,100C754.3,100,686,100,617,100C548.6,100,480,100,411,100C342.9,100,274,100,206,100C137.1,100,69,100,34,100L0,100Z"></path></svg>
    <div class="container position-relative py-md-3">
        <div class="row align-items-center flex-lg-row flex-column-reverse">
            <div class="col-lg-6 text-center text-lg-start mt-4 mt-lg-0">
                <h1 class="display-3 fw-bold mb-3" style="letter-spacing:-1px;">
                    <span class="d-block mb-0 fs-2">Kitap Köşem'e</span>
                    <span class="text-primary fw-bold">Hoş geldiniz!</span>
                </h1>
                <p class="lead mb-4 text-muted">
                    Binlerce kitapsever ile buluşun, favori kitaplarınızı keşfedin, değerlendirin ve unutulmaz okuma deneyimleri yaşayın.
                </p>
                <div class="d-flex gap-3 flex-wrap justify-content-center justify-content-lg-start">
                    <a href="${pageContext.request.contextPath}/books" class="btn btn-primary btn-lg fw-semibold fz-16 py-2 px-3 rounded shadow-sm">
                        <div class="row g-0 align-items-center">
                            <div class="col-auto pe-0">
                                <i class="bi bi-compass fz-24 me-2"></i>
                            </div>
                            <div class="col">
                                Kitapları Keşfet
                            </div>
                        </div>
                    </a>
                    <c:if test="${empty sessionScope.user}">
                        <a href="${pageContext.request.contextPath}/register" class="btn btn-outline-primary btn-lg fw-semibold fz-16 py-2 px-3 rounded shadow-sm">
                            <div class="row align-items-center">
                                <div class="col-auto pe-0">
                                    <i class="bi bi-person-plus fz-24 me-2"></i>
                                </div>
                                <div class="col">
                                    Ücretsiz Katıl
                                </div>
                            </div>
                        </a>
                    </c:if>
                </div>
            </div>
            <div class="col-lg-6 text-center mb-4 mb-lg-0">
                
                <svg width="320" height="320" viewBox="0 0 320 320" fill="none" xmlns="http://www.w3.org/2000/svg" class="img-fluid" style="max-height:320px;">
                    <ellipse cx="160" cy="280" rx="120" ry="24" fill="#fbe3ec"/>
                    <rect x="60" y="80" width="200" height="120" rx="18" fill="#fff" stroke="#bd0e40" stroke-width="4"/>
                    <rect x="80" y="100" width="160" height="80" rx="10" fill="#fbe3ec"/>
                    <rect x="100" y="120" width="120" height="40" rx="6" fill="#fff"/>
                    <rect x="120" y="135" width="80" height="10" rx="3" fill="#bd0e40"/>
                    <rect x="120" y="150" width="80" height="6" rx="2" fill="#eec3d0"/>
                    <rect x="120" y="160" width="40" height="6" rx="2" fill="#eec3d0"/>
                    <rect x="170" y="160" width="30" height="6" rx="2" fill="#eec3d0"/>
                    <rect x="80" y="190" width="160" height="10" rx="5" fill="#bd0e40"/>
                </svg>
            </div>
        </div>
    </div>
</div>

<div class="bg-white pt-3 pt-lg-5">
    
     <div class="bg-dark text-white">
        <div class="container mb-5">
            <div class="row text-center">
                <div class="col-6 col-lg-3">
                    <div class="p-3 p-md-4">
                        <span class="pe-2 fs-3"><i class="bi bi-book-fill"></i></span>
                        <span class="fw-bold fs-3">${totalBooks}</span>
                        <span class="opacity-50 small">Kitap</span>
                    </div>
                </div>
                <div class="col-6 col-lg-3">
                    <div class="p-3 p-md-4">
                        <span class="pe-2 fs-3"><i class="bi bi-people-fill"></i></span>
                        <span class="fw-bold fs-3">${totalUsers}</span>
                        <span class="opacity-50 small">Aktif Üye</span>
                    </div>
                </div>
                <div class="col-6 col-lg-3">
                    <div class="p-3 p-md-4">
                        <span class="pe-2 fs-3"><i class="bi bi-chat-heart-fill"></i></span>
                        <span class="fw-bold fs-3">${totalReviews}</span>
                        <span class="opacity-50 small">Değerlendirme</span>
                    </div>
                </div>
                <div class="col-6 col-lg-3">
                    <div class="p-3 p-md-4">
                        <span class="pe-2 fs-3"><i class="bi bi-star-fill"></i></span>
                        <span class="fw-bold fs-3">4.7</span>
                        <span class="opacity-50 small">Ortalama Puan</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    <div class="container mb-5">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2 class="h4 fw-bold mb-0">Öne Çıkan Kitaplar</h2>
            <a href="${pageContext.request.contextPath}/books" class="btn btn-outline-primary btn-sm rounded">
                <i class="bi bi-arrow-right-circle me-2"></i>Tümünü Gör
            </a>
        </div>
        <div class="swiper kitap-swiper">
            <div class="swiper-wrapper">
                <c:choose>
                    <c:when test="${empty featuredBooks}">
                        <div class="swiper-slide text-center text-muted py-4">Henüz öne çıkan kitap yok.</div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${featuredBooks}" var="book">
                            <div class="swiper-slide">
                                <div class="bg-white rounded border p-3 h-100 d-flex flex-column justify-content-between">
                                    <c:choose>
                                        <c:when test="${not empty book.coverImage}">
                                            <a href="${pageContext.request.contextPath}/books/view/${book.id}">
                                                <img src="${book.coverImage}" alt="${book.title}" class="mw-100 shadow-sm rounded">
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${pageContext.request.contextPath}/books/view/${book.id}" class="text-decoration-none">
                                                <div class="cover-placeholder cover-placeholder-index rounded shadow-sm text-center">
                                                    <span class="cover-initial">
                                                        <svg class="d-block mx-auto mb-2" xmlns="http://www.w3.org/2000/svg" width="44" height="44" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" color="currentColor"><path d="M20.82 20.82C19.643 22 17.745 22 13.95 22s-5.693 0-6.872-1.18c-.657-.656-.948-1.537-1.077-2.846M17.974 6c1.309.129 2.19.42 2.847 1.077C22 8.256 22 10.154 22 13.949c0 1.433 0 2.596-.064 3.551"/><path d="M16.828 16.828C15.657 18 13.771 18 10 18s-5.657 0-6.828-1.172S2 13.771 2 10s0-5.657 1.172-6.828M6.5 2.062C7.444 2 8.59 2 10 2c3.771 0 5.657 0 6.828 1.172S18 6.229 18 10c0 1.41 0 2.556-.061 3.5"/><path d="M5 17c1.818-2.364 3.723-4.583 6-6m7 .544c-1.252-.965-2.413-1.44-3.5-1.544M2 2l20 20"/></g></svg>
                                                        <div class="fz-14 opacity-75 mb-3">Görsel Hazırlanıyor</div>
                                                        <div class="fz-16">${book.title}</div>
                                                        <div class="fz-12 opacity-75">${book.author}</div>
                                                </div>
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
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
                                    <div class="fw-bold text-primary fz-14 satir-1 mt-2">${book.title}</div>
                                    <div class="small"><i class="bi bi-person me-1"></i>${book.author}</div>
                                    <div class="text-muted small my-1">
                                        <c:choose>
                                            <c:when test="${fn:length(book.description) > 100}">
                                                ${fn:substring(book.description, 0, 100)}...
                                            </c:when>
                                            <c:otherwise>
                                                ${book.description}
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/books/view/${book.id}" class="btn btn-primary btn-sm fw-semibold mt-2">İncele</a>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="swiper-pagination"></div>
        </div>
    </div>

    
    <div class="container mb-5">
        <h2 class="h4 fw-bold mb-3">Son Değerlendirmeler</h2>
        <div class="swiper yorum-swiper">
            <div class="swiper-wrapper">
                <c:choose>
                    <c:when test="${empty latestReviews}">
                        <div class="swiper-slide text-center text-muted py-4">Henüz değerlendirme yok.</div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${latestReviews}" var="review">
                            <div class="swiper-slide">
                                <div class="bg-white rounded border p-3 h-100 d-flex flex-column justify-content-between">
                                    <div class="d-flex align-items-center mb-2">
                                        <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-3" style="width: 40px; height: 40px;">
                                            <span class="fw-bold">${fn:substring(review.username, 0, 1)}</span>
                                        </div>
                                        <div>
                                            <div class="fw-semibold">${review.username}</div>
                                            <small class="text-muted"><fmt:formatDate value="${review.createdAt}" pattern="dd MMM yyyy"/></small>
                                        </div>
                                    </div>
                                    <div class="mb-2">
                                        <a href="${pageContext.request.contextPath}/books/view/${review.bookId}" class="text-primary text-decoration-none fw-semibold">
                                            <i class="bi bi-book me-2"></i>${review.bookTitle}
                                        </a>
                                    </div>
                                    <blockquote class="blockquote mb-0">
                                        <p class="mb-0 text-muted fz-14">${review.comment}</p>
                                    </blockquote>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="swiper-pagination"></div>
        </div>
    </div>

    
    <c:if test="${empty sessionScope.user}">
        <div class="container mb-5">
            <div class="bg-primary rounded-4 text-white text-center p-5">
                <h2 class="fw-bold mb-3">Topluluğumuza Katılın!</h2>
                <p class="lead mb-4">Binlerce kitapseverle birlikte okuma serüveninizi başlatın. Kitapları keşfedin, değerlendirin ve deneyimlerinizi paylaşın.</p>
                <a href="${pageContext.request.contextPath}/login" class="btn btn-dark fw-semibold rounded px-5">Giriş Yap</a>
                <span class="px-3 text-white fw-semibold">veya</span>
                <a href="${pageContext.request.contextPath}/register" class="btn btn-light fw-semibold rounded px-5 me-2">Ücretsiz Hesap Oluştur</a>
            </div>
        </div>
    </c:if>

</div>


<script>
    document.addEventListener('DOMContentLoaded', function() {
        new Swiper('.kitap-swiper', {
            slidesPerView: 1,
            spaceBetween: 20,
            loop: true,
            navigation: {
                nextEl: '.kitap-swiper .swiper-button-next',
                prevEl: '.kitap-swiper .swiper-button-prev',
            },
            pagination: {
                el: '.kitap-swiper .swiper-pagination',
                clickable: true,
            },
            breakpoints: {
                768: { slidesPerView: 3 },
                1200: { slidesPerView: 4 }
            }
        });
        new Swiper('.yorum-swiper', {
            slidesPerView: 1,
            spaceBetween: 24,
            loop: true,
            navigation: {
                nextEl: '.yorum-swiper .swiper-button-next',
                prevEl: '.yorum-swiper .swiper-button-prev',
            },
            pagination: {
                el: '.yorum-swiper .swiper-pagination',
                clickable: true,
            },
            breakpoints: {
                768: { slidesPerView: 2 },
                1200: { slidesPerView: 3 }
            }
        });
    });
</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
