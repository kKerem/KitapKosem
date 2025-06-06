<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    </div> <!-- container end from header -->
    
    <!-- Modern Blue-Themed Footer -->
    <footer class="bg-white mt-5 position-relative">
        <!-- Main Footer -->
        <div class="modern-card border-0 rounded-top-4">
            <div class="container py-5">
                <div class="row g-4">
                    <!-- Brand Section -->
                    <div class="col-lg-4 col-md-6">
                        <div class="mb-4">
                            <div class="d-flex align-items-center mb-3">
                                <div class="bg-white bg-opacity-20 rounded-3 d-flex align-items-center justify-content-center me-3" style="width: 50px; height: 50px; backdrop-filter: blur(10px);">
                                    <i class="bi bi-book-fill fs-4"></i>
                                </div>
                                <h4 class="mb-0 fw-bold">KitapKöşem</h4>
                            </div>
                            <p class="opacity-90 mb-4 lh-base">
                                Türkiye'nin en büyük kitapseverlerin buluşma noktası. 
                                Kitapları keşfedin, değerlendirin ve deneyimlerinizi paylaşın.
                            </p>
                            <div class="d-flex gap-3">
                                <a href="#" class="text-decoration-none social-link">
                                    <i class="bi bi-facebook fs-5"></i>
                                </a>
                                <a href="#" class="text-decoration-none social-link">
                                    <i class="bi bi-twitter fs-5"></i>
                                </a>
                                <a href="#" class="text-decoration-none social-link">
                                    <i class="bi bi-instagram fs-5"></i>
                                </a>
                                <a href="https://github.com/kitapkosem" class="text-decoration-none social-link" target="_blank">
                                    <i class="bi bi-github fs-5"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Quick Links -->
                    <div class="col-lg-2 col-md-6">
                        <h6 class="fw-bold mb-3 text-uppercase tracking-wide">Hızlı Bağlantılar</h6>
                        <ul class="list-unstyled">
                            <li class="mb-2">
                                <a href="${pageContext.request.contextPath}/" class="footer-link">
                                    <i class="bi bi-house me-2"></i>Ana Sayfa
                                </a>
                            </li>
                            <li class="mb-2">
                                <a href="${pageContext.request.contextPath}/books" class="footer-link">
                                    <i class="bi bi-collection me-2"></i>Kitap Koleksiyonu
                                </a>
                            </li>
                            <c:if test="${not empty sessionScope.user}">
                                <li class="mb-2">
                                    <a href="${pageContext.request.contextPath}/profile" class="footer-link">
                                        <i class="bi bi-person me-2"></i>Profilim
                                    </a>
                                </li>
                                <li class="mb-2">
                                    <a href="${pageContext.request.contextPath}/favorites" class="footer-link">
                                        <i class="bi bi-heart me-2"></i>Favorilerim
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                    
                    <!-- Support -->
                    <div class="col-lg-2 col-md-6">
                        <h6 class="fw-bold mb-3 text-uppercase tracking-wide">Destek & Yardım</h6>
                        <ul class="list-unstyled">
                            <li class="mb-2">
                                <a href="${pageContext.request.contextPath}/pages/help" class="footer-link">
                                    <i class="bi bi-question-circle me-2"></i>Yardım Merkezi
                                </a>
                            </li>
                            <li class="mb-2">
                                <a href="${pageContext.request.contextPath}/pages/contact" class="footer-link">
                                    <i class="bi bi-envelope me-2"></i>İletişim
                                </a>
                            </li>
                            <li class="mb-2">
                                <a href="${pageContext.request.contextPath}/pages/faq" class="footer-link">
                                    <i class="bi bi-patch-question me-2"></i>Sık Sorulan Sorular
                                </a>
                            </li>
                            <li class="mb-2">
                                <a href="${pageContext.request.contextPath}/pages/feedback" class="footer-link">
                                    <i class="bi bi-chat-left-heart me-2"></i>Geri Bildirim
                                </a>
                            </li>
                        </ul>
                    </div>
                    
                    <!-- Legal -->
                    <div class="col-lg-2 col-md-6">
                        <h6 class="fw-bold mb-3 text-uppercase tracking-wide">Yasal Bilgiler</h6>
                        <ul class="list-unstyled">
                            <li class="mb-2">
                                <a href="${pageContext.request.contextPath}/pages/privacy" class="footer-link">
                                    <i class="bi bi-shield-check me-2"></i>Gizlilik Politikası
                                </a>
                            </li>
                            <li class="mb-2">
                                <a href="${pageContext.request.contextPath}/pages/terms" class="footer-link">
                                    <i class="bi bi-file-text me-2"></i>Kullanım Şartları
                                </a>
                            </li>
                            <li class="mb-2">
                                <a href="${pageContext.request.contextPath}/pages/about" class="footer-link">
                                    <i class="bi bi-info-circle me-2"></i>Hakkımızda
                                </a>
                            </li>
                            <li class="mb-2">
                                <a href="${pageContext.request.contextPath}/pages/developers" class="footer-link">
                                    <i class="bi bi-code-slash me-2"></i>Geliştirici API
                                </a>
                            </li>
                        </ul>
                    </div>
                    
                    <!-- Newsletter -->
                    <div class="col-lg-2 col-md-6">
                        <h6 class="fw-bold mb-3 text-uppercase tracking-wide">Haberdar Olun</h6>
                        <p class="opacity-90 small mb-3 lh-base">
                            Yeni kitaplar ve özel güncellemelerden ilk siz haberdar olun.
                        </p>
                        <form class="mb-3" onsubmit="return false;">
                            <div class="input-group newsletter-form">
                                <input type="email" class="form-control newsletter-input" 
                                       placeholder="E-posta adresinizi girin">
                                <button class="btn btn-light newsletter-btn" type="submit">
                                    <i class="bi bi-send-fill"></i>
                                </button>
                            </div>
                        </form>
                        <small class="opacity-75">
                            <i class="bi bi-shield-lock me-1"></i>
                            E-posta adresiniz güvende ve korunmaktadır
                        </small>
                    </div>
                </div>
                
                <!-- Statistics Row -->
                <div class="row mt-5 pt-4 border-top border-white border-opacity-20">
                    <div class="col-md-3 col-6 text-center mb-3">
                        <div class="d-flex flex-column align-items-center">
                            <i class="bi bi-book-fill fs-3 mb-2 opacity-75"></i>
                            <h5 class="mb-1 fw-bold">1,250+</h5>
                            <small class="opacity-75">Kitap</small>
                        </div>
                    </div>
                    <div class="col-md-3 col-6 text-center mb-3">
                        <div class="d-flex flex-column align-items-center">
                            <i class="bi bi-people-fill fs-3 mb-2 opacity-75"></i>
                            <h5 class="mb-1 fw-bold">500+</h5>
                            <small class="opacity-75">Üye</small>
                        </div>
                    </div>
                    <div class="col-md-3 col-6 text-center mb-3">
                        <div class="d-flex flex-column align-items-center">
                            <i class="bi bi-chat-heart-fill fs-3 mb-2 opacity-75"></i>
                            <h5 class="mb-1 fw-bold">2,800+</h5>
                            <small class="opacity-75">Değerlendirme</small>
                        </div>
                    </div>
                    <div class="col-md-3 col-6 text-center mb-3">
                        <div class="d-flex flex-column align-items-center">
                            <i class="bi bi-star-fill fs-3 mb-2 opacity-75"></i>
                            <h5 class="mb-1 fw-bold">4.8/5</h5>
                            <small class="opacity-75">Ortalama Puan</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Bottom Footer -->
        <div">
            <div class="container py-4">
                <div class="row align-items-center">
                    <div class="col-md-6 text-center text-md-start">
                        <div class="d-flex align-items-center justify-content-center justify-content-md-start">
                            <span class="me-3">© 2024 KitapKöşem. Tüm hakları saklıdır.</span>
                            <span class="badge bg-success rounded-pill">
                                <i class="bi bi-circle-fill me-1" style="font-size: 6px;"></i>
                                Çevrimiçi
                            </span>
                        </div>
                    </div>
                    <div class="col-md-6 text-center text-md-end mt-3 mt-md-0">
                        <div class="d-flex justify-content-center justify-content-md-end align-items-center gap-4 flex-wrap">
                            <small class="text-light opacity-75">
                                <i class="bi bi-code-square me-1"></i>
                                Versiyon 2.1.0
                            </small>
                            <small class="text-light opacity-75">
                                <i class="bi bi-heart-fill text-danger me-1"></i>
                                Türkiye'den sevgiyle yapıldı
                            </small>
                            <small class="text-light opacity-75">
                                <i class="bi bi-lightning-fill text-warning me-1"></i>
                                Hızlı & Güvenli
                            </small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    
    <!-- Bootstrap JavaScript v5.3.6 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    
    
</body>
</html> 