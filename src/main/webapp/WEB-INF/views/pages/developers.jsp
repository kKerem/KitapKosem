<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<c:set var="title" value="Geliştirici API" scope="request" />


<div class="hero-section text-center mb-5 mt-md-5">
    <h1 class="display-4 fw-bold mb-3">
        <i class="bi bi-code-slash me-3"></i>
        Geliştirici API
    </h1>
    <p class="lead mb-0">KitapKöşem verilerine programlı erişim sağlayın</p>
</div>


<div class="p-5 mb-5">
    <h3 class="fw-bold mb-4">
        <i class="bi bi-info-circle me-2"></i>
        API Hakkında
    </h3>
    <p class="lh-lg mb-4">
        KitapKöşem API'si, platformumuzdaki kitap verilerine güvenli bir şekilde erişim sağlar. 
        RESTful mimarisi ile kolay entegrasyon ve JSON formatında yanıtlar sunar.
    </p>
    
    <div class="row g-4">
        <div class="col-md-4">
            <div class="api-feature text-center">
                <div class="feature-icon mb-3">
                    <i class="bi bi-shield-check"></i>
                </div>
                <h5 class="fw-bold">Güvenli</h5>
                <p class="text-muted">Token tabanlı kimlik doğrulama</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="api-feature text-center">
                <div class="feature-icon mb-3">
                    <i class="bi bi-lightning"></i>
                </div>
                <h5 class="fw-bold">Hızlı</h5>
                <p class="text-muted">Optimize edilmiş sorgular</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="api-feature text-center">
                <div class="feature-icon mb-3">
                    <i class="bi bi-code-square"></i>
                </div>
                <h5 class="fw-bold">RESTful</h5>
                <p class="text-muted">Standart HTTP metodları</p>
            </div>
        </div>
    </div>
</div>


<div class="p-5 mb-5">
    <h3 class="fw-bold mb-4">
        <i class="bi bi-play-circle me-2"></i>
        Başlangıç
    </h3>
    
    <div class="step-item mb-4">
        <h5 class="fw-bold">1. API Anahtarı Alın</h5>
        <p class="text-muted mb-3">API'yi kullanmak için önce bir API anahtarı almanız gerekir.</p>
        <div class="code-block">
            <code>POST /api/auth/register</code>
        </div>
    </div>
    
    <div class="step-item mb-4">
        <h5 class="fw-bold">2. Kimlik Doğrulama</h5>
        <p class="text-muted mb-3">Her istekte API anahtarınızı header'da gönderin.</p>
        <div class="code-block">
            <code>Authorization: Bearer YOUR_API_KEY</code>
        </div>
    </div>
    
    <div class="step-item">
        <h5 class="fw-bold">3. İlk İsteğinizi Gönderin</h5>
        <p class="text-muted mb-3">Kitap listesini almak için GET isteği gönderin.</p>
        <div class="code-block">
            <code>GET /api/books</code>
        </div>
    </div>
</div>


<div class="p-5 mb-5">
    <h3 class="fw-bold mb-4">
        <i class="bi bi-list-ul me-2"></i>
        API Endpoints
    </h3>
    
    
    <div class="endpoint-section mb-5">
        <h4 class="fw-bold mb-3 text-primary">Kitaplar</h4>
        
        <div class="endpoint-item mb-4">
            <div class="d-flex justify-content-between align-items-center mb-2">
                <div class="d-flex align-items-center">
                    <span class="method-badge get me-3">GET</span>
                    <code>/api/books</code>
                </div>
                <small class="text-muted">Kitap listesi</small>
            </div>
            <p class="text-muted small mb-3">Tüm kitapları sayfalı olarak getirir.</p>
            
            <div class="example-request">
                <h6 class="fw-bold mb-2">Örnek İstek:</h6>
                <div class="code-block mb-3">
<pre><code>curl -X GET "https://api.kitapkosem.com/api/books?page=1&size=10" \
     -H "Authorization: Bearer YOUR_API_KEY"</code></pre>
                </div>
                
                <h6 class="fw-bold mb-2">Örnek Yanıt:</h6>
                <div class="code-block">
<pre><code>{
  "success": true,
  "data": {
    "books": [
      {
        "id": 1,
        "title": "Suç ve Ceza",
        "author": "Fyodor Dostoyevski",
        "publicationYear": 1866,
        "rating": 4.5,
        "reviewCount": 25
      }
    ],
    "pagination": {
      "page": 1,
      "size": 10,
      "total": 100
    }
  }
}</code></pre>
                </div>
            </div>
        </div>
        
        <div class="endpoint-item mb-4">
            <div class="d-flex justify-content-between align-items-center mb-2">
                <div class="d-flex align-items-center">
                    <span class="method-badge get me-3">GET</span>
                    <code>/api/books/{id}</code>
                </div>
                <small class="text-muted">Kitap detayı</small>
            </div>
            <p class="text-muted small">Belirli bir kitabın detaylı bilgilerini getirir.</p>
        </div>
        
        <div class="endpoint-item mb-4">
            <div class="d-flex justify-content-between align-items-center mb-2">
                <div class="d-flex align-items-center">
                    <span class="method-badge post me-3">POST</span>
                    <code>/api/books</code>
                </div>
                <small class="text-muted">Kitap ekleme</small>
            </div>
            <p class="text-muted small">Yeni kitap ekler. Kimlik doğrulama gerekir.</p>
        </div>
    </div>
    
    
    <div class="endpoint-section mb-5">
        <h4 class="fw-bold mb-3 text-primary">Değerlendirmeler</h4>
        
        <div class="endpoint-item mb-4">
            <div class="d-flex justify-content-between align-items-center mb-2">
                <div class="d-flex align-items-center">
                    <span class="method-badge get me-3">GET</span>
                    <code>/api/books/{id}/reviews</code>
                </div>
                <small class="text-muted">Kitap değerlendirmeleri</small>
            </div>
            <p class="text-muted small">Belirli bir kitabın değerlendirmelerini getirir.</p>
        </div>
        
        <div class="endpoint-item mb-4">
            <div class="d-flex justify-content-between align-items-center mb-2">
                <div class="d-flex align-items-center">
                    <span class="method-badge post me-3">POST</span>
                    <code>/api/books/{id}/reviews</code>
                </div>
                <small class="text-muted">Değerlendirme ekleme</small>
            </div>
            <p class="text-muted small">Kitaba yeni değerlendirme ekler.</p>
        </div>
    </div>
    
    
    <div class="endpoint-section">
        <h4 class="fw-bold mb-3 text-primary">Arama</h4>
        
        <div class="endpoint-item">
            <div class="d-flex justify-content-between align-items-center mb-2">
                <div class="d-flex align-items-center">
                    <span class="method-badge get me-3">GET</span>
                    <code>/api/search</code>
                </div>
                <small class="text-muted">Kitap arama</small>
            </div>
            <p class="text-muted small">Kitap başlığı, yazar veya açıklamada arama yapar.</p>
        </div>
    </div>
</div>


<div class="p-5 mb-5">
    <h3 class="fw-bold mb-4">
        <i class="bi bi-speedometer2 me-2"></i>
        Kullanım Limitleri
    </h3>
    
    <div class="row g-4">
        <div class="col-md-4">
            <div class="limit-card text-center p-4">
                <div class="limit-icon mb-3">
                    <i class="bi bi-person"></i>
                </div>
                <h5 class="fw-bold">Ücretsiz</h5>
                <div class="limit-value">1,000</div>
                <p class="text-muted mb-0">istek/gün</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="limit-card text-center p-4">
                <div class="limit-icon mb-3">
                    <i class="bi bi-building"></i>
                </div>
                <h5 class="fw-bold">İşletme</h5>
                <div class="limit-value">10,000</div>
                <p class="text-muted mb-0">istek/gün</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="limit-card text-center p-4">
                <div class="limit-icon mb-3">
                    <i class="bi bi-rocket"></i>
                </div>
                <h5 class="fw-bold">Enterprise</h5>
                <div class="limit-value">∞</div>
                <p class="text-muted mb-0">Sınırsız</p>
            </div>
        </div>
    </div>
</div>


<div class="p-5 mb-5">
    <h3 class="fw-bold mb-4">
        <i class="bi bi-exclamation-triangle me-2"></i>
        Hata Kodları
    </h3>
    
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th>Kod</th>
                    <th>Açıklama</th>
                    <th>Çözüm</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><code class="error-code">400</code></td>
                    <td>Geçersiz istek</td>
                    <td>İstek parametrelerini kontrol edin</td>
                </tr>
                <tr>
                    <td><code class="error-code">401</code></td>
                    <td>Yetkisiz erişim</td>
                    <td>API anahtarınızı kontrol edin</td>
                </tr>
                <tr>
                    <td><code class="error-code">403</code></td>
                    <td>Erişim engellendi</td>
                    <td>Rate limit aşıldı, bekleyin</td>
                </tr>
                <tr>
                    <td><code class="error-code">404</code></td>
                    <td>Kaynak bulunamadı</td>
                    <td>URL'yi kontrol edin</td>
                </tr>
                <tr>
                    <td><code class="error-code">500</code></td>
                    <td>Sunucu hatası</td>
                    <td>Destek ekibiyle iletişime geçin</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>


<div class="p-5 text-center">
    <h4 class="fw-bold mb-3">Destek mi Gerekiyor?</h4>
    <p class="text-muted mb-4">API kullanımı hakkında sorularınız için bizimle iletişime geçin.</p>
    <div class="d-flex gap-3 justify-content-center flex-wrap">
        <a href="${pageContext.request.contextPath}/pages/contact" class="btn btn-primary rounded fw-semibold px-4">
            <i class="bi bi-envelope me-2"></i>İletişime Geç
        </a>
        <a href="https://github.com/kitapkosem/api-examples" class="btn btn-outline-primary rounded px-4 fw-semibold" target="_blank">
            <i class="bi bi-github me-2"></i>Örnek Kodlar
        </a>
    </div>
</div>

<style>
.api-feature {
    padding: 1.5rem;
    transition: all 0.3s ease;
}

.api-feature:hover {
    transform: translateY(-5px);
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

.code-block {
    background: #1e293b;
    color: #e2e8f0;
    padding: 1rem;
    border-radius: 8px;
    font-family: 'Courier New', monospace;
    overflow-x: auto;
}

.code-block code {
    color: #e2e8f0;
    background: none;
}

.method-badge {
    padding: 0.25rem 0.75rem;
    border-radius: 20px;
    font-size: 0.75rem;
    font-weight: 600;
    text-transform: uppercase;
}

.method-badge.get {
    background: #10b981;
    color: white;
}

.method-badge.post {
    background: #3b82f6;
    color: white;
}

.endpoint-item {
    padding: 1.5rem;
    border: 1px solid #e5e7eb;
    border-radius: 12px;
    background: #f9fafb;
}

.example-request {
    margin-top: 1rem;
    padding-top: 1rem;
    border-top: 1px solid #e5e7eb;
}

.limit-card {
    border: 2px solid #e5e7eb;
    border-radius: 16px;
    transition: all 0.3s ease;
}

.limit-card:hover {
    border-color: var(--primary-blue);
    transform: translateY(-3px);
}

.limit-icon {
    width: 60px;
    height: 60px;
    background: linear-gradient(135deg, var(--primary-blue), var(--secondary-blue));
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto;
    color: white;
    font-size: 1.5rem;
}

.limit-value {
    font-size: 2rem;
    font-weight: 800;
    color: var(--primary-blue);
}

.error-code {
    background: #fee2e2;
    color: #dc2626;
    padding: 0.25rem 0.5rem;
    border-radius: 4px;
}

[data-bs-theme="dark"] .endpoint-item {
    background: #2d3748;
    border-color: #4a5568;
}

[data-bs-theme="dark"] .limit-card {
    background: #2d3748;
    border-color: #4a5568;
}

[data-bs-theme="dark"] .example-request {
    border-top-color: #4a5568;
}
</style>

<%@ include file="/WEB-INF/views/common/footer.jsp" %> 