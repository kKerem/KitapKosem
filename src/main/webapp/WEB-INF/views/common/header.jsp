<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<%
    String navbarClass = (String) request.getAttribute("navbarClass");
    if (navbarClass == null) navbarClass = "navbar-light";
    String bgClass = (String) request.getAttribute("bgClass");
    if (bgClass == null) bgClass = "bg-white";
    Boolean isIndexPage = (Boolean) request.getAttribute("isIndexPage");
    if (isIndexPage == null) isIndexPage = false;
%>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KitapKöşem - ${param.title}</title>
    
    <!-- Google Fonts - Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,100..800&display=swap" rel="stylesheet">
    
    <!-- Bootstrap CSS v5.3.6 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <script>
        (function() {
            const theme = localStorage.getItem('theme') || 'light';
            document.documentElement.setAttribute('data-bs-theme', theme);
        })();
    </script>
</head>
<body<%= (isIndexPage != null && isIndexPage) ? " class=\"bg-white\"" : "" %>>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg <%= navbarClass %> <%= bgClass %> sticky-top">
        <div class="container">
            <a class="navbar-brand fw-bold text-primary text-decoration-none" href="${pageContext.request.contextPath}/">
                <div class="row align-items-center justify-content-center">
                    <div class="col-auto">
                        <div class="brand-icon bg-primary text-white rounded-3 d-flex align-items-center justify-content-center me-0" style="width: 48px; height: 48px;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="34" height="34" viewBox="0 0 256 256"><path fill="currentColor" d="m231.65 194.55l-33.19-157.8a16 16 0 0 0-19-12.39l-46.81 10.06a16.08 16.08 0 0 0-12.3 19l33.19 157.8A16 16 0 0 0 169.16 224a16.3 16.3 0 0 0 3.38-.36l46.81-10.06a16.09 16.09 0 0 0 12.3-19.03M136 50.15v-.09l46.8-10l3.33 15.87L139.33 66Zm6.62 31.47l46.82-10.05l3.34 15.9L146 97.53Zm6.64 31.57l46.82-10.06l13.3 63.24l-46.82 10.06ZM216 197.94l-46.8 10l-3.33-15.87l46.8-10.07l3.33 15.85zM104 32H56a16 16 0 0 0-16 16v160a16 16 0 0 0 16 16h48a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16M56 48h48v16H56Zm0 32h48v96H56Zm48 128H56v-16h48z"/></svg>
                        </div>
                    </div>
                    <div class="col-auto p-0">
                        <div class="fz-20 text-white">KitapKöşem</div>
                        <div class="fz-12 text-white text-opacity-50 fw-normal">Kerem ER <b>-</b> 21061204</div>
                    </div>
                </div>
            </a>
            
            <!-- Mobile Toggle -->
            <button class="navbar-toggler border-0 shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <i class="bi bi-list fs-4"></i>
            </button>
            
            <!-- Navigation -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto ms-lg-4 small">
                    <li class="nav-item">
                        <a class="nav-link px-3 py-2 rounded fw-medium text-decoration-none" href="${pageContext.request.contextPath}/">
                            <i class="bi bi-house me-2 text-primary fz-20"></i>Ana Sayfa
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link px-3 py-2 rounded fw-medium text-decoration-none" href="${pageContext.request.contextPath}/books">
                            <i class="bi bi-collection me-2 text-primary fz-20"></i>Kitaplar
                        </a>
                    </li>
                </ul>
                
                <!-- Right Side Actions -->
                <div class="d-block d-md-flex gap-2">
                    <!-- Add Book Button (for logged users) -->
                    <c:if test="${not empty sessionScope.user}">
                        <a href="${pageContext.request.contextPath}/books/add" class="btn btn-primary rounded fw-semibold h-100 d-flex align-items-center btn-sm mt-1 mb-2 my-md-0">
                            <i class="bi bi-plus-circle me-2 fz-20"></i><span class="fz-13">Kitap Ekle</span>
                        </a>
                    </c:if>
                    
                    <!-- User Menu -->
                    <c:choose>
                        <c:when test="${empty sessionScope.user}">
                            <div class="d-block d-md-flex gap-2 w-100">
                                <a href="${pageContext.request.contextPath}/login" class="btn btn-light bg-white fw-semibold h-100 d-flex align-items-center btn-sm mt-1 mb-2 my-md-0">
                                    <i class="bi bi-box-arrow-in-right me-2 fz-20"></i><span class="fz-13">Giriş Yap</span>
                                </a>
                                <a href="${pageContext.request.contextPath}/register" class="btn btn-primary rounded fw-semibold h-100 d-flex align-items-center btn-sm mt-1 mb-2 my-md-0">
                                    <i class="bi bi-plus-circle me-2 fz-20"></i><span class="fz-13">Kayıt Ol</span>
                                </a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="dropdown dropdown-center">
                                <button class="dropdown-toggle btn btn-dark bg-dark text-white rounded fw-semibold h-100 d-flex align-items-center fw-semibold w-100 border" data-bs-toggle="dropdown">
                                    <i class="bi bi-person-circle me-2"></i><span class="fz-13 ps-0">Hesap Ayarları  </span>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-md-end dropdown-menu-dark shadow border-0 rounded-3 bg-dark text-white small p-0 m-0 rounded-top-0" style="margin-top: -1px!important;">
                                    <li class="px-3 py-2">
                                        <small class="text-white fw-normal small text-opacity-75">Hoşgeldin,</small>
                                        <div class="fw-semibold small"><c:choose> <c:when test="${fn:length(sessionScope.user.username) > 15}"> ${fn:substring(sessionScope.user.username, 0, 15)}... </c:when> <c:otherwise> ${sessionScope.user.username} </c:otherwise> </c:choose></div>
                                    </li>
                                    <li><hr class="dropdown-divider my-1"></li>
                                    <li>
                                        <a class="dropdown-item small py-2 px-3" href="${pageContext.request.contextPath}/profile">
                                            <i class="bi bi-person me-2"></i>Profilim
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item small py-2 px-3" href="${pageContext.request.contextPath}/favorites">
                                            <i class="bi bi-heart me-2"></i>Favorilerim
                                        </a>
                                    </li>
                                    <li><hr class="dropdown-divider my-1"></li>
                                    <li>
                                        <a class="dropdown-item small py-2 text-danger py-2 px-3" href="${pageContext.request.contextPath}/logout">
                                            <i class="bi bi-box-arrow-right me-2"></i>Çıkış Yap
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </nav>
    
    
    <div class="container">
</body>
</html> 