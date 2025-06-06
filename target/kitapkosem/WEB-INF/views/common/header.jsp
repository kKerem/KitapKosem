<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
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
    <style>
        /* Modern KitapKöşem CSS - Bootstrap 5.3.6 with Inter Font - Blue Theme */
    
    /* Font Family - Inter */
    body{font-family:"Inter",sans-serif!important;font-size:16px;text-align:left;font-weight:500;margin:0;text-rendering:optimizeLegibility;-webkit-font-smoothing:antialiased;transition:background 0.2s linear}
    /* Blue Theme Variables */
    :root {
        --primary-blue: #3b82f6;
        --secondary-blue: #1e40af;
        --light-blue: #60a5fa;
        --dark-blue: #1e3a8a;
        --accent-blue: #0ea5e9;
    }
    
    /* Custom Shadow */
    .shadow-sm {
        box-shadow: 0 .125rem .25rem rgba(59, 130, 246, .075) !important;
    }
    
    /* Dark theme adjustments */
    [data-bs-theme="dark"] .navbar-light {
        background-color: #1e293b !important;
    }
    
    [data-bs-theme="dark"] .navbar-light .navbar-brand,
    [data-bs-theme="dark"] .navbar-light .navbar-nav .nav-link {
        color: #ffffff !important;
    }
    
    [data-bs-theme="dark"] .navbar-light .navbar-toggler {
        border-color: #475569;
    }
    
    [data-bs-theme="dark"] .border-bottom {
        border-color: #475569 !important;
    }
    
    [data-bs-theme="dark"] .bg-white {
        background-color: #1e293b !important;
    }
    
    /* Modern Card Styles */
    .modern-card {
        background: white;
        border: 1px solid rgba(59, 130, 246, 0.08);
        border-radius: 16px;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        overflow: hidden;
    }
    
    .modern-card:hover {
        transform: translateY(-4px);
        box-shadow: 0 12px 24px rgba(59, 130, 246, 0.15);
        border-color: rgba(59, 130, 246, 0.12);
    }
    
    [data-bs-theme="dark"] .modern-card {
        background: #2d3748;
        border-color: rgba(96, 165, 250, 0.1);
    }
    
    /* Stats Cards - Blue Themed */
    .stats-card {
        background: linear-gradient(135deg, var(--primary-blue) 0%, var(--secondary-blue) 100%);
        border: none;
        border-radius: 20px;
        color: white;
        padding: 2rem;
        text-align: center;
        transition: all 0.3s ease;
        position: relative;
        overflow: hidden;
    }
    
    .stats-card:nth-child(2) {
        background: linear-gradient(135deg, var(--light-blue) 0%, var(--primary-blue) 100%);
    }
    
    .stats-card:nth-child(3) {
        background: linear-gradient(135deg, var(--accent-blue) 0%, var(--light-blue) 100%);
    }
    
    .stats-card:nth-child(4) {
        background: linear-gradient(135deg, var(--dark-blue) 0%, var(--primary-blue) 100%);
    }
    
    .stats-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: linear-gradient(45deg, rgba(255,255,255,0.1) 0%, transparent 50%);
        opacity: 0;
        transition: opacity 0.3s ease;
    }
    
    .stats-card:hover::before {
        opacity: 1;
    }
    
    .stats-card:hover {
        transform: translateY(-8px) scale(1.02);
        box-shadow: 0 20px 40px rgba(59, 130, 246, 0.4);
    }
    
    .stats-card .stats-icon {
        font-size: 3rem;
        margin-bottom: 1rem;
        opacity: 0.9;
    }
    
    .stats-card .stats-number {
        font-size: 2.5rem;
        font-weight: 800;
        margin-bottom: 0.5rem;
        text-shadow: 0 2px 4px rgba(0,0,0,0.2);
    }
    
    .stats-card .stats-label {
        font-weight: 600;
        opacity: 0.9;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-size: 0.9rem;
    }
    
    
    /* Rating Stars */
    .rating-stars {
        color: #fbbf24;
        filter: drop-shadow(0 1px 2px rgba(251, 191, 36, 0.3));
    }
    
    .rating-stars .text-muted {
        color: #6c757d !important;
    }
    
    /* Section Titles */
    .section-title {
        font-weight: 800;
        color: #1a202c;
        position: relative;
        display: inline-block;
    }
    
    [data-bs-theme="dark"] .section-title {
        color: #f7fafc;
    }
    
    .section-title::after {
        content: '';
        position: absolute;
        bottom: -4px;
        left: 0;
        width: 50%;
        height: 3px;
        background: linear-gradient(135deg, var(--primary-blue) 0%, var(--secondary-blue) 100%);
        border-radius: 2px;
    }
    
    /* Animations */
    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
    
    .fade-in-up {
        animation: fadeInUp 0.6s cubic-bezier(0.4, 0, 0.2, 1) forwards;
    }
    
    .fade-in-up-delay-1 { animation-delay: 0.1s; }
    .fade-in-up-delay-2 { animation-delay: 0.2s; }
    .fade-in-up-delay-3 { animation-delay: 0.3s; }
    .fade-in-up-delay-4 { animation-delay: 0.4s; }
    
    /* Loading Animation */
    @keyframes pulse {
        0%, 100% {
            opacity: 1;
        }
        50% {
            opacity: 0.5;
        }
    }
    
    .pulse {
        animation: pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite;
    }
    
    /* Responsive Design */
    @media (max-width: 768px) {
        .book-cover {
            width: 60px;
            height: 90px;
            font-size: 1.2rem;
        }
        
        .hero-section {
            padding: 2rem 1rem;
            margin-bottom: 2rem;
        }
        
        .stats-card {
            padding: 1.5rem;
            margin-bottom: 1rem;
        }
        
        .stats-card .stats-number {
            font-size: 2rem;
        }
    }
    
    /* Scrollbar Styling - Blue Themed */
    ::-webkit-scrollbar {
        width: 8px;
    }
    
    ::-webkit-scrollbar-track {
        background: #f1f5f9;
        border-radius: 4px;
    }
    
    ::-webkit-scrollbar-thumb {
        background: linear-gradient(135deg, var(--primary-blue) 0%, var(--secondary-blue) 100%);
        border-radius: 4px;
    }
    
    ::-webkit-scrollbar-thumb:hover {
        background: linear-gradient(135deg, var(--light-blue) 0%, var(--primary-blue) 100%);
    } 
    
    .tracking-wide {
        letter-spacing: 0.5px;
    }
    
    .footer-link {
        color: rgba(255, 255, 255, 0.85);
        text-decoration: none;
        transition: all 0.3s ease;
        display: inline-block;
        padding: 2px 0;
    }
    
    .footer-link:hover {
        color: white;
        transform: translateX(3px);
        text-decoration: none;
    }
    
    .social-link {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        transition: all 0.3s ease;
    }
    
    .social-link:hover {
        background: rgba(255, 255, 255, 0.2);
        transform: translateY(-3px) scale(1.05);
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }
    
    .newsletter-input {
        background: rgba(255, 255, 255, 0.15);
        border: 1px solid rgba(255, 255, 255, 0.2);
        color: white;
        backdrop-filter: blur(10px);
    }
    
    .newsletter-input::placeholder {
        color: rgba(255, 255, 255, 0.7);
    }
    
    .newsletter-input:focus {
        background: rgba(255, 255, 255, 0.25);
        border-color: rgba(255, 255, 255, 0.4);
        box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.1);
        color: white;
    }
    
    .newsletter-btn {
        background: white;
        border: none;
        color: var(--primary-blue);
        font-weight: 600;
    }
    
    .newsletter-btn:hover {
        background: rgba(255, 255, 255, 0.9);
        transform: scale(1.05);
    }
    
    .rounded-top-4 {
        border-top-left-radius: 1.5rem !important;
        border-top-right-radius: 1.5rem !important;
    }
    
    /* Dark theme adjustments */
    [data-bs-theme="dark"] footer {
        border-top: 1px solid rgba(255, 255, 255, 0.1);
    }
    
    @media (max-width: 768px) {
        footer .container {
            padding-left: 1rem;
            padding-right: 1rem;
        }
        
        .social-link {
            width: 35px;
            height: 35px;
            font-size: 0.9rem;
        }
    }
    .fz-10{font-size:10px!important}.fz-11{font-size:11px!important}.fz-12{font-size:12px!important}.fz-13{font-size:13px!important}.fz-14{font-size:14px!important}.fz-15{font-size:15px!important}.fz-16{font-size:16px!important}.fz-17{font-size:17px!important}.fz-18{font-size:18px!important}.fz-19{font-size:19px!important}.fz-20{font-size:20px!important}.fz-21{font-size:21px!important}.fz-22{font-size:22px!important}.fz-23{font-size:23px!important}.fz-24{font-size:24px!important}.fz-25{font-size:25px!important}.fz-26{font-size:26px!important}.fz-27{font-size:27px!important}.fz-28{font-size:28px!important}.fz-29{font-size:29px!important}.fz-30{font-size:30px!important}.fz-32{font-size:32px!important}.fz-34{font-size:34px!important}.fz-36{font-size:36px!important}.fz-38{font-size:38px!important}.fz-40{font-size:40px!important}.fz-42{font-size:42px!important}.fz-44{font-size:44px!important}.fz-46{font-size:46px!important}.fz-48{font-size:48px!important}
    
    :root {
    --bs-body-bg: #fbfcff!important;
    }
    .satir-1{overflow:hidden;display:-webkit-box;-webkit-line-clamp:1!important;-webkit-box-orient:vertical}.satir-2{overflow:hidden;display:-webkit-box;-webkit-line-clamp:2!important;-webkit-box-orient:vertical}.satir-3{overflow:hidden;display:-webkit-box;-webkit-line-clamp:3!important;-webkit-box-orient:vertical}.satir-4{overflow:hidden;display:-webkit-box;-webkit-line-clamp:4!important;-webkit-box-orient:vertical}.satir-5{overflow:hidden;display:-webkit-box;-webkit-line-clamp:5!important;-webkit-box-orient:vertical}.satir-6{overflow:hidden;display:-webkit-box;-webkit-line-clamp:6!important;-webkit-box-orient:vertical}.satir-7{overflow:hidden;display:-webkit-box;-webkit-line-clamp:7!important;-webkit-box-orient:vertical}
    .shadow-sm{box-shadow: 0 .125rem .25rem rgb(0 0 0 / .075)!important;}
    
    .cover-image {
    width: 100%;
    height: 463px;
    object-fit: cover;
    }
    
    .cover-placeholder {
    width: 290px;
    height: 463px;
    background: linear-gradient(220deg, var(--bs-primary), var(--bs-gray-900));
    display: flex;
    align-items: center;
    justify-content: center;
    color: var(--bs-white);
    }
    
    .cover-initial {
    font-size: 1rem;
    font-weight: 600;
    text-shadow: 0 2px 4px rgba(0,0,0,0.3);
    }
    
    .book-content {
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    }
    
    .book-title {
    font-weight: 700;
    line-height: 1.3;
    color: #1a202c;
    }
    
    .book-title a {
    color: inherit;
    transition: color 0.3s ease;
    }
    
    .book-title a:hover {
    color: var(--primary-blue);
    }
    
    .book-author {
    font-size: 1.1rem;
    font-weight: 500;
    }
    
    .book-description {
    color: #6c757d;
    line-height: 1.6;
    font-size: 0.95rem;
    }
    
    .rating-badge-blog {
    position: absolute;
    top: 8px;
    right: 8px;
    background: rgba(0, 0, 0, 0.8);
    color: white;
    padding: 4px 8px;
    border-radius: 12px;
    font-size: 0.8rem;
    backdrop-filter: blur(4px);
    }
    
    .new-badge-blog {
    position: absolute;
    top: 16px;
    left: 20px;
    }
    
    .rating-stars i {
    font-size: 1rem;
    margin-right: 2px;
    }
    
    .favorite-btn {
    transition: all 0.3s ease;
    }
    
    .favorite-btn:hover {
    transform: scale(1.1);
    }
    
    [data-bs-theme="dark"] .blog-post-card {
    background: #2d3748;
    border-color: rgba(96, 165, 250, 0.1);
    }
    
    [data-bs-theme="dark"] .book-title {
    color: #f7fafc;
    }
    
    [data-bs-theme="dark"] .book-description {
    color: #a0aec0;
    }
    
    /* Mobile Responsiveness */
    @media (max-width: 768px) {
    
    .book-cover-blog {
    width: 100px;
    height: 140px;
    }
    
    .cover-initial {
    font-size: 2rem;
    }
    
    .book-content {
    padding: 1rem;
    }
    
    .book-title {
    font-size: 1.25rem;
    }
    }
    
    /* Tablet */
    @media (max-width: 992px) and (min-width: 769px) {
    .book-cover-blog {
    width: 120px;
    height: 170px;
    }
    }
    .text-decoration-hover{text-decoration: none!important;}
    .text-decoration-hover:hover {
    text-decoration: underline !important;
    }
    .text-link:hover{color:var(--bs-primary)!important;}
    
    nav .dropdown-toggle.show {border-bottom-left-radius: 0 !important;border-bottom-right-radius: 0 !important;}

    .breadcrumb{display: flex;flex-wrap: wrap;}
    .breadcrumb-item {display: list-item;}
    .breadcrumb-item+.breadcrumb-item::before {color:var(--bs-gray-500)!important;content: ""; margin: 0 14px; width: 4px; height: 4px; flex: 0 0 4px; background: rgb(0 0 0 / .2); border-radius: 100%; display: inline-block; position: relative; top: -2px;}

    .w-40{width: 40px;}
    .h-40{height: 40px;}
    </style>
    <script>
        (function() {
            const theme = localStorage.getItem('theme') || 'light';
            document.documentElement.setAttribute('data-bs-theme', theme);
        })();
    </script>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom sticky-top">
        <div class="container">
            <a class="navbar-brand fw-bold text-primary" href="${pageContext.request.contextPath}/">
                <div class="row align-items-center justify-content-center">
                    <div class="col-auto">
                        <div class="brand-icon bg-primary text-white rounded-3 d-flex align-items-center justify-content-center me-0" style="width: 48px; height: 48px;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="34" height="34" viewBox="0 0 256 256"><path fill="currentColor" d="m231.65 194.55l-33.19-157.8a16 16 0 0 0-19-12.39l-46.81 10.06a16.08 16.08 0 0 0-12.3 19l33.19 157.8A16 16 0 0 0 169.16 224a16.3 16.3 0 0 0 3.38-.36l46.81-10.06a16.09 16.09 0 0 0 12.3-19.03M136 50.15v-.09l46.8-10l3.33 15.87L139.33 66Zm6.62 31.47l46.82-10.05l3.34 15.9L146 97.53Zm6.64 31.57l46.82-10.06l13.3 63.24l-46.82 10.06ZM216 197.94l-46.8 10l-3.33-15.87l46.8-10.07l3.33 15.85zM104 32H56a16 16 0 0 0-16 16v160a16 16 0 0 0 16 16h48a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16M56 48h48v16H56Zm0 32h48v96H56Zm48 128H56v-16h48z"/></svg>
                        </div>
                    </div>
                    <div class="col-auto p-0">
                        <div class="fz-20 text-dark">KitapKöşem</div>
                        <div class="fz-12 text-muted fw-normal">Kerem ER <b>-</b> 21061204</div>
                    </div>
                </div>
            </a>
            
            <!-- Mobile Toggle -->
            <button class="navbar-toggler border-0 shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <i class="bi bi-list fs-4"></i>
            </button>
            
            <!-- Navigation -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto ms-lg-4">
                    <li class="nav-item">
                        <a class="nav-link px-3 py-2 rounded-pill fw-medium" href="${pageContext.request.contextPath}/">
                            <i class="bi bi-house me-2 text-primary fz-20"></i>Ana Sayfa
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link px-3 py-2 rounded-pill fw-medium" href="${pageContext.request.contextPath}/books">
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
                                <a href="${pageContext.request.contextPath}/login" class="btn btn-dark rounded fw-semibold h-100 d-flex align-items-center btn-sm mt-1 mb-2 my-md-0">
                                    <i class="bi bi-box-arrow-in-right me-2 fz-20"></i><span class="fz-13">Giriş Yap</span>
                                </a>
                                <a href="${pageContext.request.contextPath}/register" class="btn btn-primary rounded fw-semibold h-100 d-flex align-items-center btn-sm mt-1 mb-2 my-md-0">
                                    <i class="bi bi-plus-circle me-2 fz-20"></i><span class="fz-13">Kayıt Ol</span>
                                </a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="dropdown dropdown-center">
                                <button class="dropdown-toggle btn btn-dark bg-dark text-white rounded fw-semibold h-100 d-flex align-items-center fw-semibold w-100" data-bs-toggle="dropdown">
                                    <i class="bi bi-person-circle me-2"></i><span class="fz-13 ps-1">Hesap Ayarları⠀</span>
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
    
    <!-- Main Content -->
    <div class="container">
</body>
</html> 