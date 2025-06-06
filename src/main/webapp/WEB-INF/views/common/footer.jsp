<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    </div> 
    
    
    <svg id="wave" style="transform:rotate(0deg); transition: 0.3s" viewBox="0 0 1440 100" version="1.1" xmlns="http://www.w3.org/2000/svg"><defs><linearGradient id="sw-gradient-0" x1="0" x2="0" y1="1" y2="0"><stop stop-color="rgba(33, 37, 41, 1)" offset="0%"></stop><stop stop-color="rgba(33, 37, 41, 1)" offset="100%"></stop></linearGradient></defs><path style="transform:translate(0, 0px); opacity:1" fill="url(#sw-gradient-0)" d="M0,30L34.3,31.7C68.6,33,137,37,206,35C274.3,33,343,27,411,30C480,33,549,47,617,46.7C685.7,47,754,33,823,38.3C891.4,43,960,67,1029,73.3C1097.1,80,1166,70,1234,61.7C1302.9,53,1371,47,1440,50C1508.6,53,1577,67,1646,71.7C1714.3,77,1783,73,1851,63.3C1920,53,1989,37,2057,40C2125.7,43,2194,67,2263,65C2331.4,63,2400,37,2469,21.7C2537.1,7,2606,3,2674,8.3C2742.9,13,2811,27,2880,26.7C2948.6,27,3017,13,3086,16.7C3154.3,20,3223,40,3291,46.7C3360,53,3429,47,3497,36.7C3565.7,27,3634,13,3703,20C3771.4,27,3840,53,3909,66.7C3977.1,80,4046,80,4114,70C4182.9,60,4251,40,4320,31.7C4388.6,23,4457,27,4526,33.3C4594.3,40,4663,50,4731,53.3C4800,57,4869,53,4903,51.7L4937.1,50L4937.1,100L4902.9,100C4868.6,100,4800,100,4731,100C4662.9,100,4594,100,4526,100C4457.1,100,4389,100,4320,100C4251.4,100,4183,100,4114,100C4045.7,100,3977,100,3909,100C3840,100,3771,100,3703,100C3634.3,100,3566,100,3497,100C3428.6,100,3360,100,3291,100C3222.9,100,3154,100,3086,100C3017.1,100,2949,100,2880,100C2811.4,100,2743,100,2674,100C2605.7,100,2537,100,2469,100C2400,100,2331,100,2263,100C2194.3,100,2126,100,2057,100C1988.6,100,1920,100,1851,100C1782.9,100,1714,100,1646,100C1577.1,100,1509,100,1440,100C1371.4,100,1303,100,1234,100C1165.7,100,1097,100,1029,100C960,100,891,100,823,100C754.3,100,686,100,617,100C548.6,100,480,100,411,100C342.9,100,274,100,206,100C137.1,100,69,100,34,100L0,100Z"></path></svg>

    <footer class="bg-dark text-white position-relative py-3 pt-lg-0">
        
        <div class="container">
            <div class="row g-4">
                
                <div class="col-lg-4 col-md-6">
                    <div class="row align-items-center">
                        <div class="col-auto">
                            <div class="brand-icon bg-primary text-white rounded-3 d-flex align-items-center justify-content-center me-0" style="width: 48px; height: 48px;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="34" height="34" viewBox="0 0 256 256"><path fill="currentColor" d="m231.65 194.55l-33.19-157.8a16 16 0 0 0-19-12.39l-46.81 10.06a16.08 16.08 0 0 0-12.3 19l33.19 157.8A16 16 0 0 0 169.16 224a16.3 16.3 0 0 0 3.38-.36l46.81-10.06a16.09 16.09 0 0 0 12.3-19.03M136 50.15v-.09l46.8-10l3.33 15.87L139.33 66Zm6.62 31.47l46.82-10.05l3.34 15.9L146 97.53Zm6.64 31.57l46.82-10.06l13.3 63.24l-46.82 10.06ZM216 197.94l-46.8 10l-3.33-15.87l46.8-10.07l3.33 15.85zM104 32H56a16 16 0 0 0-16 16v160a16 16 0 0 0 16 16h48a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16M56 48h48v16H56Zm0 32h48v96H56Zm48 128H56v-16h48z"/></svg>
                            </div>
                        </div>
                        <div class="col-auto p-0">
                            <div class="fz-20 text-white fw-bold">KitapKöşem</div>
                            <div class="fz-12 text-white text-opacity-50 fw-normal">Kerem ER <b>-</b> 21061204</div>
                        </div>
                    </div>
                    <p class="opacity-50 lh-base mt-3 fz-14 fw-normal">
                        Türkiye'nin en büyük kitapseverlerin buluşma noktası. 
                        Kitapları keşfedin, değerlendirin ve deneyimlerinizi paylaşın.
                    </p>
                </div>
                
                <div class="col-lg col-md-6">
                    <h6 class="fw-bold mb-3 text-uppercase tracking-wide">Hızlı Bağlantılar</h6>
                    <ul class="list-unstyled small m-0">
                        <li class="my-1">
                            <a href="${pageContext.request.contextPath}/" class="footer-link">
                                <i class="bi bi-house me-2"></i>Ana Sayfa
                            </a>
                        </li>
                        <li class="my-1">
                            <a href="${pageContext.request.contextPath}/books" class="footer-link">
                                <i class="bi bi-collection me-2"></i>Kitap Koleksiyonu
                            </a>
                        </li>
                        <c:if test="${not empty sessionScope.user}">
                            <li class="my-1">
                                <a href="${pageContext.request.contextPath}/profile" class="footer-link">
                                    <i class="bi bi-person me-2"></i>Profilim
                                </a>
                            </li>
                            <li class="my-1">
                                <a href="${pageContext.request.contextPath}/favorites" class="footer-link">
                                    <i class="bi bi-heart me-2"></i>Favorilerim
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </div>
                
                
                <div class="col-lg col-md-6">
                    <h6 class="fw-bold mb-3 text-uppercase tracking-wide">Destek & Yardım</h6>
                    <ul class="list-unstyled small m-0">
                        <li class="my-1">
                            <a href="${pageContext.request.contextPath}/pages/help" class="footer-link">
                                <i class="bi bi-question-circle me-2"></i>Yardım Merkezi
                            </a>
                        </li>
                        <li class="my-1">
                            <a href="${pageContext.request.contextPath}/pages/contact" class="footer-link">
                                <i class="bi bi-envelope me-2"></i>İletişim
                            </a>
                        </li>
                        <li class="my-1">
                            <a href="${pageContext.request.contextPath}/pages/faq" class="footer-link">
                                <i class="bi bi-patch-question me-2"></i>Sık Sorulan Sorular
                            </a>
                        </li>
                        <li class="my-1">
                            <a href="${pageContext.request.contextPath}/pages/feedback" class="footer-link">
                                <i class="bi bi-chat-left-heart me-2"></i>Geri Bildirim
                            </a>
                        </li>
                    </ul>
                </div>
                
                
                <div class="col-lg col-md-6">
                    <h6 class="fw-bold mb-3 text-uppercase tracking-wide">Yasal Bilgiler</h6>
                    <ul class="list-unstyled small m-0">
                        <li class="my-1">
                            <a href="${pageContext.request.contextPath}/pages/privacy" class="footer-link">
                                <i class="bi bi-shield-check me-2"></i>Gizlilik Politikası
                            </a>
                        </li>
                        <li class="my-1">
                            <a href="${pageContext.request.contextPath}/pages/terms" class="footer-link">
                                <i class="bi bi-file-text me-2"></i>Kullanım Şartları
                            </a>
                        </li>
                        <li class="my-1">
                            <a href="${pageContext.request.contextPath}/pages/about" class="footer-link">
                                <i class="bi bi-info-circle me-2"></i>Hakkımızda
                            </a>
                        </li>
                        <li class="my-1">
                            <a href="${pageContext.request.contextPath}/pages/developers" class="footer-link">
                                <i class="bi bi-code-slash me-2"></i>Geliştirici API
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="text-center text-white small fw-semibold mt-3 mt-lg-4">© 2025 KitapKöşem. Tüm hakları saklıdır.</div>
        </div>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    
    
</body>
</html> 