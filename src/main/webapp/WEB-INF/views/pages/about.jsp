<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<c:set var="title" value="Hakkımızda" scope="request" />


<div class="hero-section text-center mb-5">
    <h1 class="display-4 fw-bold mb-3">
        <i class="bi bi-info-circle-fill text-white me-3"></i>
        Hakkımızda
    </h1>
    <p class="lead mb-0">Kitapseverlerin dijital buluşma noktası</p>
</div>


<div class="row g-5 mb-5">
    <div class="col-lg-6">
        <div class="p-5 h-100">
            <div class="text-center mb-4">
                <div class="mission-icon mb-3">
                    <i class="bi bi-bullseye"></i>
                </div>
                <h3 class="fw-bold">Misyonumuz</h3>
            </div>
            <p class="text-muted lh-lg">
                KitapKöşem olarak, kitapseverlerin bir araya gelerek deneyimlerini paylaştığı, 
                yeni kitaplar keşfettiği ve okuma kültürünün geliştiği bir platform oluşturmayı hedefliyoruz. 
                Herkesin kitap sevgisini artırmak ve okuma alışkanlığını yaygınlaştırmak temel misyonumuzdur.
            </p>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="p-5 h-100">
            <div class="text-center mb-4">
                <div class="vision-icon mb-3">
                    <i class="bi bi-eye"></i>
                </div>
                <h3 class="fw-bold">Vizyonumuz</h3>
            </div>
            <p class="text-muted lh-lg">
                Türkiye'nin en büyük kitap topluluğu olmak ve dünya çapında tanınan bir platform haline gelmek. 
                Teknoloji ile edebiyatı buluşturarak, gelecek nesillere daha zengin bir okuma deneyimi sunmak 
                ve kitap kültürünün dijital çağda da yaşatılmasını sağlamak vizyonumuzdur.
            </p>
        </div>
    </div>
</div>


<div class="p-5 mb-5">
    <h3 class="fw-bold mb-4 text-center">
        <i class="bi bi-book-half me-2"></i>
        Hikayemiz
    </h3>
    <div class="row align-items-center">
        <div class="col-lg-8">
            <p class="lh-lg mb-4">
                KitapKöşem, 2024 yılında kitap sevgisini paylaşan bir grup geliştirici tarafından kuruldu. 
                Amacımız, kitapseverlerin deneyimlerini paylaşabileceği, yeni kitaplar keşfedebileceği 
                ve okuma alışkanlığını geliştirebileceği modern bir platform oluşturmaktı.
            </p>
            <p class="lh-lg mb-4">
                Başlangıçta küçük bir proje olarak hayata geçen KitapKöşem, kısa sürede binlerce 
                kitapseverin buluşma noktası haline geldi. Kullanıcılarımızın geri bildirimleri 
                doğrultusunda sürekli gelişen platformumuz, bugün Türkiye'nin önde gelen 
                kitap topluluk platformlarından biri olmaya doğru ilerliyor.
            </p>
        </div>
        <div class="col-lg-4 text-center">
            <div class="story-illustration">
                <i class="bi bi-people-fill"></i>
            </div>
        </div>
    </div>
</div>


<div class="mb-5">
    <h3 class="fw-bold mb-4 text-center">
        <i class="bi bi-star-fill me-2"></i>
        Özelliklerimiz
    </h3>
    <div class="row g-4">
        <div class="col-lg-4 col-md-6">
            <div class="p-4 text-center feature-card">
                <div class="feature-icon mb-3">
                    <i class="bi bi-search"></i>
                </div>
                <h5 class="fw-bold mb-3">Kitap Keşfi</h5>
                <p class="text-muted">Geniş kitap koleksiyonumuzda aradığınız kitabı kolayca bulun ve yeni favoriler keşfedin.</p>
            </div>
        </div>
        <div class="col-lg-4 col-md-6">
            <div class="p-4 text-center feature-card">
                <div class="feature-icon mb-3">
                    <i class="bi bi-chat-dots"></i>
                </div>
                <h5 class="fw-bold mb-3">Değerlendirme Sistemi</h5>
                <p class="text-muted">Okuduğunuz kitapları puanlayın, yorum yapın ve diğer okuyucularla deneyimlerinizi paylaşın.</p>
            </div>
        </div>
        <div class="col-lg-4 col-md-6">
            <div class="p-4 text-center feature-card">
                <div class="feature-icon mb-3">
                    <i class="bi bi-heart"></i>
                </div>
                <h5 class="fw-bold mb-3">Favori Listesi</h5>
                <p class="text-muted">Beğendiğiniz kitapları favorilerinize ekleyin ve kişisel okuma listenizi oluşturun.</p>
            </div>
        </div>
        <div class="col-lg-4 col-md-6">
            <div class="p-4 text-center feature-card">
                <div class="feature-icon mb-3">
                    <i class="bi bi-people"></i>
                </div>
                <h5 class="fw-bold mb-3">Topluluk</h5>
                <p class="text-muted">Binlerce kitapseverle tanışın, kitap önerilerini paylaşın ve okuma deneyiminizi zenginleştirin.</p>
            </div>
        </div>
        <div class="col-lg-4 col-md-6">
            <div class="p-4 text-center feature-card">
                <div class="feature-icon mb-3">
                    <i class="bi bi-shield-check"></i>
                </div>
                <h5 class="fw-bold mb-3">Güvenli Platform</h5>
                <p class="text-muted">Verileriniz güvende. Modern güvenlik standartları ile korunan bir platform sunuyoruz.</p>
            </div>
        </div>
        <div class="col-lg-4 col-md-6">
            <div class="p-4 text-center feature-card">
                <div class="feature-icon mb-3">
                    <i class="bi bi-phone"></i>
                </div>
                <h5 class="fw-bold mb-3">Mobil Uyumlu</h5>
                <p class="text-muted">Her cihazda mükemmel çalışan responsive tasarım ile her yerden erişim sağlayın.</p>
            </div>
        </div>
    </div>
</div>


<div class="p-5 mb-5">
    <h3 class="fw-bold mb-4 text-center">
        <i class="bi bi-people-fill me-2"></i>
        Ekibimiz
    </h3>
    <div class="row g-4">
        <div class="col-lg-4 col-md-6">
            <div class="team-member text-center">
                <div class="team-avatar mb-3">
                    <i class="bi bi-person-fill"></i>
                </div>
                <h5 class="fw-bold mb-2">Ahmet Yılmaz</h5>
                <p class="text-primary mb-2">Kurucu & CEO</p>
                <p class="text-muted small">Kitap tutkunu ve teknoloji uzmanı. 15 yıllık yazılım geliştirme deneyimi.</p>
            </div>
        </div>
        <div class="col-lg-4 col-md-6">
            <div class="team-member text-center">
                <div class="team-avatar mb-3">
                    <i class="bi bi-person-fill"></i>
                </div>
                <h5 class="fw-bold mb-2">Elif Kaya</h5>
                <p class="text-primary mb-2">CTO</p>
                <p class="text-muted small">Full-stack geliştirici ve sistem mimarı. Modern web teknolojileri uzmanı.</p>
            </div>
        </div>
        <div class="col-lg-4 col-md-6">
            <div class="team-member text-center">
                <div class="team-avatar mb-3">
                    <i class="bi bi-person-fill"></i>
                </div>
                <h5 class="fw-bold mb-2">Mehmet Demir</h5>
                <p class="text-primary mb-2">UI/UX Designer</p>
                <p class="text-muted small">Kullanıcı deneyimi uzmanı. Estetik ve işlevselliği harmanlayan tasarımlar yaratır.</p>
            </div>
        </div>
    </div>
</div>


<div class="p-5 text-center">
    <h4 class="fw-bold mb-3">Bizimle İletişime Geçin</h4>
    <p class="text-muted mb-4">Sorularınız, önerileriniz veya iş birliği teklifleriniz için bizimle iletişime geçebilirsiniz.</p>
    <div class="d-flex gap-3 justify-content-center flex-wrap">
        <a href="${pageContext.request.contextPath}/pages/contact" class="btn btn-primary rounded fw-semibold px-4">
            <i class="bi bi-envelope me-2"></i>İletişime Geç
        </a>
        <a href="${pageContext.request.contextPath}/pages/feedback" class="btn btn-outline-primary rounded px-4 fw-semibold">
            <i class="bi bi-chat-heart me-2"></i>Geri Bildirim
        </a>
    </div>
</div>

<style>
.mission-icon, .vision-icon {
    width: 80px;
    height: 80px;
    background: linear-gradient(135deg, var(--primary-blue), var(--secondary-blue));
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto;
    color: white;
    font-size: 2rem;
}

.story-illustration {
    width: 150px;
    height: 150px;
    background: linear-gradient(135deg, var(--light-blue), var(--primary-blue));
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto;
    color: white;
    font-size: 4rem;
    opacity: 0.9;
}

.feature-card {
    transition: all 0.3s ease;
}

.feature-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 35px rgba(59, 130, 246, 0.15);
}

.feature-icon {
    width: 70px;
    height: 70px;
    background: linear-gradient(135deg, var(--primary-blue), var(--secondary-blue));
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto;
    color: white;
    font-size: 1.8rem;
}

.team-avatar {
    width: 100px;
    height: 100px;
    background: linear-gradient(135deg, var(--primary-blue), var(--secondary-blue));
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto;
    color: white;
    font-size: 3rem;
}

.team-member {
    padding: 1.5rem;
    transition: all 0.3s ease;
}

.team-member:hover {
    transform: translateY(-3px);
}

[data-bs-theme="dark"] .feature-card,
[data-bs-theme="dark"] .team-member {
    background: #2d3748;
}
</style>

<%@ include file="/WEB-INF/views/common/footer.jsp" %> 