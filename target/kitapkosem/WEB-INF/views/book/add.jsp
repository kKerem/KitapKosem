<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<c:set var="title" value="Yeni Kitap Ekle" scope="request"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!-- Add Book Hero Section -->
<div class="add-book-hero">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 text-center">
                <div class="hero-content">
                    <div class="hero-icon mb-3">
                        <i class="bi bi-book-half display-4 text-white"></i>
                    </div>
                    <h1 class="hero-title">Yeni Kitap Ekle</h1>
                    <p class="hero-subtitle">Kitap koleksiyonumuza katkıda bulunun ve diğer okuyucularla paylaşın</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Add Book Form -->
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="add-book-card">
                <!-- Progress Steps -->
                <div class="form-steps mb-5">
                    <div class="step active" data-step="1">
                        <div class="step-number">1</div>
                        <div class="step-label">Temel Bilgiler</div>
                    </div>
                    <div class="step" data-step="2">
                        <div class="step-number">2</div>
                        <div class="step-label">Detaylar</div>
                    </div>
                    <div class="step" data-step="3">
                        <div class="step-number">3</div>
                        <div class="step-label">Kapak Resmi</div>
                    </div>
                    <div class="step" data-step="4">
                        <div class="step-number">4</div>
                        <div class="step-label">Önizleme</div>
                    </div>
                </div>

                <!-- Error Alert -->
                <c:if test="${not empty error}">
                    <div class="alert alert-danger small rounded-4 border-0 mb-4" role="alert">
                        <i class="bi bi-exclamation-triangle me-2"></i>
                        ${error}
                    </div>
                </c:if>

                <!-- Multi-Step Form -->
                <form action="${pageContext.request.contextPath}/books/add" method="POST" enctype="multipart/form-data" id="addBookForm">
                    
                    <!-- Step 1: Basic Information -->
                    <div class="form-step active" id="step-1">
                        <div class="step-header mb-4">
                            <h3 class="step-title">
                                <i class="bi bi-info-circle me-2"></i>
                                Temel Bilgiler
                            </h3>
                            <p class="step-description text-muted">Kitabın temel bilgilerini girin</p>
                        </div>

                        <div class="row g-4">
                            <div class="col-md-8">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="title" name="title" 
                                           placeholder="Kitap adı" required maxlength="200">
                                    <label for="title">
                                        <i class="bi bi-book me-2"></i>Kitap Adı *
                                    </label>
                                    <div class="form-feedback"></div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-floating">
                                    <input type="number" class="form-control" id="publicationYear" name="publicationYear" 
                                           placeholder="Yayın yılı" min="1800" max="2024" required>
                                    <label for="publicationYear">
                                        <i class="bi bi-calendar3 me-2"></i>Yayın Yılı *
                                    </label>
                                    <div class="form-feedback"></div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="author" name="author" 
                                           placeholder="Yazar adı" required maxlength="100">
                                    <label for="author">
                                        <i class="bi bi-person me-2"></i>Yazar *
                                    </label>
                                    <div class="form-feedback"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Step 2: Details -->
                    <div class="form-step" id="step-2">
                        <div class="step-header mb-4">
                            <h3 class="step-title">
                                <i class="bi bi-card-text me-2"></i>
                                Detaylar
                            </h3>
                            <p class="step-description text-muted">Kitap hakkında detaylı bilgi verin</p>
                        </div>

                        <div class="row g-4">
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <select class="form-select" id="category" name="category">
                                        <option value="">Kategori seçin</option>
                                        <option value="roman">Roman</option>
                                        <option value="bilim-kurgu">Bilim Kurgu</option>
                                        <option value="fantastik">Fantastik</option>
                                        <option value="tarih">Tarih</option>
                                        <option value="biyografi">Biyografi</option>
                                        <option value="felsefe">Felsefe</option>
                                        <option value="psikoloji">Psikoloji</option>
                                        <option value="egitim">Eğitim</option>
                                        <option value="cocuk">Çocuk</option>
                                        <option value="diger">Diğer</option>
                                    </select>
                                    <label for="category">
                                        <i class="bi bi-tag me-2"></i>Kategori
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="isbn" name="isbn" 
                                           placeholder="ISBN numarası" maxlength="20">
                                    <label for="isbn">
                                        <i class="bi bi-upc me-2"></i>ISBN (Opsiyonel)
                                    </label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-floating">
                                    <textarea class="form-control" id="description" name="description" 
                                              placeholder="Kitap açıklaması" style="height: 120px;" required maxlength="1000"></textarea>
                                    <label for="description">
                                        <i class="bi bi-card-text me-2"></i>Açıklama *
                                    </label>
                                </div>
                                <div class="character-count mt-2">
                                    <small class="text-muted">
                                        <span id="descriptionCount">0</span>/1000 karakter
                                    </small>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="translator" name="translator" 
                                           placeholder="Çevirmen adı" maxlength="100">
                                    <label for="translator">
                                        <i class="bi bi-translate me-2"></i>Çevirmen
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="publisher" name="publisher" 
                                           placeholder="Yayınevi" maxlength="100">
                                    <label for="publisher">
                                        <i class="bi bi-building me-2"></i>Yayınevi
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-floating">
                                    <input type="number" class="form-control" id="pageCount" name="pageCount" 
                                           placeholder="Sayfa sayısı" min="1" max="9999">
                                    <label for="pageCount">
                                        <i class="bi bi-file-earmark-text me-2"></i>Sayfa Sayısı
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="dimensions" name="dimensions" 
                                           placeholder="13,5 x 21" maxlength="20">
                                    <label for="dimensions">
                                        <i class="bi bi-aspect-ratio me-2"></i>Ebat (cm)
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-floating">
                                    <input type="number" class="form-control" id="firstPublicationYear" name="firstPublicationYear" 
                                           placeholder="İlk baskı yılı" min="1000" max="2030">
                                    <label for="firstPublicationYear">
                                        <i class="bi bi-calendar-event me-2"></i>İlk Baskı Yılı
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="edition" name="edition" 
                                           placeholder="1. Basım" maxlength="50">
                                    <label for="edition">
                                        <i class="bi bi-bookmark me-2"></i>Baskı Sayısı
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <select class="form-select" id="language" name="language">
                                        <option value="Türkçe" selected>Türkçe</option>
                                        <option value="İngilizce">İngilizce</option>
                                        <option value="Almanca">Almanca</option>
                                        <option value="Fransızca">Fransızca</option>
                                        <option value="İspanyolca">İspanyolca</option>
                                        <option value="İtalyanca">İtalyanca</option>
                                        <option value="Rusça">Rusça</option>
                                        <option value="Diğer">Diğer</option>
                                    </select>
                                    <label for="language">
                                        <i class="bi bi-globe me-2"></i>Dil
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Step 3: Cover Image -->
                    <div class="form-step" id="step-3">
                        <div class="step-header mb-4">
                            <h3 class="step-title">
                                <i class="bi bi-image me-2"></i>
                                Kapak Resmi
                            </h3>
                            <p class="step-description text-muted">Kitabın kapak resmini yükleyin (opsiyonel)</p>
                        </div>

                        <div class="row g-4">
                            <div class="col-md-6">
                                <div class="image-upload-area" id="imageUploadArea">
                                    <div class="upload-placeholder">
                                        <i class="bi bi-cloud-upload display-4 text-muted mb-3"></i>
                                        <h5 class="text-muted">Kapak Resmi Yükle</h5>
                                        <p class="text-muted small mb-3">
                                            JPG, PNG veya GIF formatında<br>
                                            Maksimum 5MB
                                        </p>
                                        <button type="button" class="btn btn-outline-primary rounded-pill" onclick="document.getElementById('coverImage').click()">
                                            <i class="bi bi-plus-circle me-2"></i>Resim Seç
                                        </button>
                                    </div>
                                    <input type="file" class="d-none" id="coverImage" name="coverImage" 
                                           accept="image/*" onchange="previewImage(this)">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="image-preview" id="imagePreview" style="display: none;">
                                    <div class="preview-header d-flex justify-content-between align-items-center mb-3">
                                        <h6 class="mb-0">Önizleme</h6>
                                        <button type="button" class="btn btn-sm btn-outline-danger rounded-pill" onclick="removeImage()">
                                            <i class="bi bi-trash me-1"></i>Kaldır
                                        </button>
                                    </div>
                                    <div class="preview-container">
                                        <img id="previewImg" src="" alt="Önizleme" class="preview-image">
                                    </div>
                                    <div class="image-info mt-3">
                                        <small class="text-muted" id="imageInfo"></small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Step 4: Preview -->
                    <div class="form-step" id="step-4">
                        <div class="step-header mb-4">
                            <h3 class="step-title">
                                <i class="bi bi-eye me-2"></i>
                                Önizleme
                            </h3>
                            <p class="step-description text-muted">Kitap bilgilerini kontrol edin ve onaylayın</p>
                        </div>

                        <div class="book-preview-card">
                            <div class="row g-4">
                                <div class="col-md-4">
                                    <div class="preview-cover">
                                        <div id="finalPreviewImage" class="final-cover-placeholder">
                                            <span id="finalCoverLetter">?</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="preview-details">
                                        <h4 id="previewTitle" class="preview-book-title">-</h4>
                                        <p id="previewAuthor" class="preview-book-author text-muted">-</p>
                                        
                                        <div class="preview-meta mb-3">
                                            <span class="badge bg-primary rounded-pill me-2">
                                                <i class="bi bi-calendar3 me-1"></i>
                                                <span id="previewYear">-</span>
                                            </span>
                                            <span class="badge bg-secondary rounded-pill" id="previewCategoryBadge" style="display: none;">
                                                <i class="bi bi-tag me-1"></i>
                                                <span id="previewCategory">-</span>
                                            </span>
                                        </div>
                                        
                                        <div class="preview-description">
                                            <h6>Açıklama:</h6>
                                            <p id="previewDescription" class="text-muted">-</p>
                                        </div>
                                        
                                        <div class="preview-isbn" id="previewIsbnContainer" style="display: none;">
                                            <small class="text-muted">
                                                <strong>ISBN:</strong> <span id="previewIsbn">-</span>
                                            </small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Form Navigation -->
                    <div class="form-navigation">
                        <div class="d-flex justify-content-between align-items-center">
                            <button type="button" class="btn btn-outline-secondary rounded-pill" id="prevBtn" onclick="if(typeof changeStep === 'function') changeStep(-1); else alert('Function loading...');" style="display: none;">
                                <i class="bi bi-arrow-left me-2"></i>Önceki
                            </button>
                            
                            <div class="step-indicator">
                                <span id="currentStepText">1</span> / 4
                            </div>
                            
                            <div>
                                <button type="button" class="btn btn-primary rounded-pill" id="nextBtn" onclick="if(typeof changeStep === 'function') changeStep(1); else alert('Function loading...');">
                                    Sonraki <i class="bi bi-arrow-right ms-2"></i>
                                </button>
                                <button type="submit" class="btn btn-success rounded-pill" id="submitBtn" style="display: none;">
                                    <i class="bi bi-check-circle me-2"></i>Kitabı Ekle
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Add Book Styles -->
<style>
.add-book-hero {
    background: linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%);
    color: white;
    padding: 4rem 0 2rem;
    margin-top: -2rem;
    position: relative;
    overflow: hidden;
}

.add-book-hero::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="books" width="50" height="50" patternUnits="userSpaceOnUse"><rect width="50" height="50" fill="none"/><path d="M10,10 L40,10 L40,40 L10,40 Z" fill="white" opacity="0.1"/><path d="M15,15 L35,15" stroke="white" opacity="0.1" stroke-width="1"/><path d="M15,20 L35,20" stroke="white" opacity="0.1" stroke-width="1"/><path d="M15,25 L30,25" stroke="white" opacity="0.1" stroke-width="1"/></pattern></defs><rect width="100" height="100" fill="url(%23books)"/></svg>');
    pointer-events: none;
}

.hero-content {
    position: relative;
    z-index: 1;
}

.hero-title {
    font-size: 3rem;
    font-weight: 800;
    margin-bottom: 1rem;
    text-shadow: 0 2px 4px rgba(0,0,0,0.3);
}

.hero-subtitle {
    font-size: 1.2rem;
    opacity: 0.9;
    margin-bottom: 0;
}

.add-book-card {
    background: white;
    border-radius: 24px;
    padding: 3rem;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
    border: 1px solid rgba(0, 0, 0, 0.05);
    margin-top: -3rem;
    position: relative;
    z-index: 2;
}

.form-steps {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 2rem;
    position: relative;
}

.form-steps::before {
    content: '';
    position: absolute;
    top: 20px;
    left: 50%;
    transform: translateX(-50%);
    width: 60%;
    height: 2px;
    background: #e5e7eb;
    z-index: 0;
}

.step {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.5rem;
    position: relative;
    z-index: 1;
}

.step-number {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background: #e5e7eb;
    color: #6b7280;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 600;
    transition: all 0.3s ease;
}

.step.active .step-number {
    background: #3b82f6;
    color: white;
}

.step.completed .step-number {
    background: #10b981;
    color: white;
}

.step-label {
    font-size: 0.875rem;
    font-weight: 500;
    color: #6b7280;
    text-align: center;
}

.step.active .step-label {
    color: #3b82f6;
}

.form-step {
    display: none;
    animation: fadeInUp 0.5s ease;
}

.form-step.active {
    display: block;
}

@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.step-header {
    text-align: center;
    margin-bottom: 2rem;
}

.step-title {
    font-weight: 700;
    color: #1a202c;
    margin-bottom: 0.5rem;
}

.step-description {
    font-size: 1.1rem;
}

.form-floating > .form-control,
.form-floating > .form-select {
    border-radius: 12px;
    border: 2px solid #e2e8f0;
    padding: 1rem 0.75rem;
    height: auto;
    transition: all 0.3s ease;
}

.form-floating > .form-control:focus,
.form-floating > .form-select:focus {
    border-color: #3b82f6;
    box-shadow: 0 0 0 0.2rem rgba(59, 130, 246, 0.15);
}

.form-floating > label {
    padding: 1rem 0.75rem;
    color: #6b7280;
    font-weight: 500;
}

.image-upload-area {
    border: 2px dashed #d1d5db;
    border-radius: 16px;
    padding: 2rem;
    text-align: center;
    transition: all 0.3s ease;
    cursor: pointer;
    min-height: 300px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.image-upload-area:hover {
    border-color: #3b82f6;
    background: #f8fafc;
}

.image-upload-area.dragover {
    border-color: #3b82f6;
    background: #eff6ff;
}

.preview-container {
    border-radius: 12px;
    overflow: hidden;
    background: #f8f9fa;
    aspect-ratio: 2/3;
    display: flex;
    align-items: center;
    justify-content: center;
}

.preview-image {
    max-width: 100%;
    max-height: 100%;
    object-fit: cover;
    border-radius: 8px;
}

.book-preview-card {
    background: #f8fafc;
    border-radius: 16px;
    padding: 2rem;
    border: 1px solid #e2e8f0;
}

.preview-cover {
    text-align: center;
}

.final-cover-placeholder {
    width: 200px;
    height: 300px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 4rem;
    font-weight: 800;
    margin: 0 auto;
    box-shadow: 0 10px 30px rgba(0,0,0,0.2);
}

.preview-book-title {
    font-weight: 700;
    color: #1a202c;
    margin-bottom: 0.5rem;
}

.preview-book-author {
    font-size: 1.1rem;
    margin-bottom: 1rem;
}

.form-navigation {
    margin-top: 3rem;
    padding-top: 2rem;
    border-top: 1px solid #e2e8f0;
}

.step-indicator {
    font-weight: 600;
    color: #6b7280;
}

.character-count {
    text-align: right;
}

.form-feedback {
    font-size: 0.875rem;
    margin-top: 0.25rem;
}

.form-feedback.valid {
    color: #10b981;
}

.form-feedback.invalid {
    color: #ef4444;
}

[data-bs-theme="dark"] .add-book-card {
    background: #2d3748;
    color: white;
}

[data-bs-theme="dark"] .step-title {
    color: #f7fafc;
}

[data-bs-theme="dark"] .form-floating > .form-control,
[data-bs-theme="dark"] .form-floating > .form-select {
    background: rgba(74, 85, 104, 0.5);
    border-color: #4a5568;
    color: white;
}

[data-bs-theme="dark"] .form-floating > label {
    color: #a0aec0;
}

[data-bs-theme="dark"] .book-preview-card {
    background: #4a5568;
    border-color: #4a5568;
}

[data-bs-theme="dark"] .preview-book-title {
    color: #f7fafc;
}

@media (max-width: 768px) {
    .add-book-card {
        margin: 1rem;
        padding: 2rem;
    }
    
    .hero-title {
        font-size: 2rem;
    }
    
    .form-steps {
        gap: 1rem;
    }
    
    .step-label {
        font-size: 0.75rem;
    }
    
    .final-cover-placeholder {
        width: 150px;
        height: 225px;
        font-size: 3rem;
    }
}
</style>

<!-- Add Book JavaScript -->
<script>
// Global variables
let currentStep = 1;
const totalSteps = 4;

// MAIN FUNCTION - Step Change with extensive debugging
window.changeStep = function(direction) {
    console.log('=== STEP CHANGE START ===');
    console.log('Direction:', direction);
    console.log('Current step before:', currentStep);
    
    // Validation only on forward moves
    if (direction === 1) {
        const isValid = validateCurrentStep();
        console.log('Validation result:', isValid);
        if (!isValid) {
            console.log('Validation failed - stopping step change');
            alert('Lütfen gerekli alanları doldurun!');
            return;
        }
    }
    
    const newStep = currentStep + direction;
    console.log('Calculated new step:', newStep);
    
    if (newStep < 1 || newStep > totalSteps) {
        console.log('Invalid step range - stopping');
        return;
    }
    
    // Hide current step
    console.log('Hiding current step:', currentStep);
    const currentStepElement = document.getElementById('step-' + currentStep);
    const currentStepIndicator = document.querySelector('[data-step="' + currentStep + '"]');
    
    console.log('Current step element found:', !!currentStepElement);
    console.log('Current step indicator found:', !!currentStepIndicator);
    
    if (currentStepElement) {
        currentStepElement.classList.remove('active');
        console.log('Removed active from step element');
    }
    if (currentStepIndicator) {
        currentStepIndicator.classList.remove('active');
        console.log('Removed active from step indicator');
        
        // Mark as completed when moving forward
        if (direction === 1) {
            currentStepIndicator.classList.add('completed');
            console.log('Added completed to step indicator');
        }
    }
    
    // Show new step
    console.log('Showing new step:', newStep);
    currentStep = newStep;
    
    const newStepElement = document.getElementById('step-' + currentStep);
    const newStepIndicator = document.querySelector('[data-step="' + currentStep + '"]');
    
    console.log('New step element found:', !!newStepElement);
    console.log('New step indicator found:', !!newStepIndicator);
    
    if (newStepElement) {
        newStepElement.classList.add('active');
        console.log('Added active to new step element');
    }
    if (newStepIndicator) {
        newStepIndicator.classList.add('active');
        console.log('Added active to new step indicator');
    }
    
    // Update navigation
    updateNavigation();
    
    // Update preview if on step 4
    if (currentStep === 4) {
        updatePreview();
    }
    
    console.log('=== STEP CHANGE END ===');
    console.log('Final current step:', currentStep);
};

window.updateNavigation = function() {
    console.log('Updating navigation for step:', currentStep);
    
    const prevBtn = document.getElementById('prevBtn');
    const nextBtn = document.getElementById('nextBtn');
    const submitBtn = document.getElementById('submitBtn');
    const currentStepText = document.getElementById('currentStepText');
    
    if (currentStepText) {
        currentStepText.textContent = currentStep;
        console.log('Updated step text to:', currentStep);
    }
    
    if (prevBtn) {
        prevBtn.style.display = currentStep === 1 ? 'none' : 'inline-block';
        console.log('Previous button display:', prevBtn.style.display);
    }
    if (nextBtn) {
        nextBtn.style.display = currentStep === totalSteps ? 'none' : 'inline-block';
        console.log('Next button display:', nextBtn.style.display);
    }
    if (submitBtn) {
        submitBtn.style.display = currentStep === totalSteps ? 'inline-block' : 'none';
        console.log('Submit button display:', submitBtn.style.display);
    }
};

window.validateCurrentStep = function() {
    console.log('Validating step:', currentStep);
    
    if (currentStep === 1) {
        const title = document.getElementById('title');
        const author = document.getElementById('author');
        const year = document.getElementById('publicationYear');
        
        console.log('Title value:', title ? title.value : 'NOT FOUND');
        console.log('Author value:', author ? author.value : 'NOT FOUND');
        console.log('Year value:', year ? year.value : 'NOT FOUND');
        
        if (!title || title.value.trim().length < 2) {
            console.log('Title validation failed');
            return false;
        }
        if (!author || author.value.trim().length < 2) {
            console.log('Author validation failed');
            return false;
        }
        if (!year || !year.value || parseInt(year.value) < 1800) {
            console.log('Year validation failed');
            return false;
        }
        
        console.log('Step 1 validation passed');
        return true;
    } else if (currentStep === 2) {
        const description = document.getElementById('description');
        console.log('Description value:', description ? description.value : 'NOT FOUND');
        
        if (!description || description.value.trim().length < 10) {
            console.log('Description validation failed');
            return false;
        }
        
        console.log('Step 2 validation passed');
        return true;
    }
    
    console.log('No validation needed for step:', currentStep);
    return true;
};

window.validateField = function(fieldId) {
    const field = document.getElementById(fieldId);
    if (!field) {
        console.warn('Field not found:', fieldId);
        return true;
    }
    
    const feedback = field.parentElement.querySelector('.form-feedback');
    let isValid = true;
    let message = '';
    
    if (fieldId === 'title') {
        if (field.value.trim().length < 2) {
            isValid = false;
            message = 'Kitap adı en az 2 karakter olmalıdır.';
        } else if (field.value.trim().length > 200) {
            isValid = false;
            message = 'Kitap adı en fazla 200 karakter olabilir.';
        } else {
            message = 'Kitap adı uygun.';
        }
    } else if (fieldId === 'author') {
        if (field.value.trim().length < 2) {
            isValid = false;
            message = 'Yazar adı en az 2 karakter olmalıdır.';
        } else if (field.value.trim().length > 100) {
            isValid = false;
            message = 'Yazar adı en fazla 100 karakter olabilir.';
        } else {
            message = 'Yazar adı uygun.';
        }
    } else if (fieldId === 'publicationYear') {
        const year = parseInt(field.value);
        const currentYear = new Date().getFullYear();
        if (year < 1800 || year > currentYear) {
            isValid = false;
            message = 'Yayın yılı 1800-' + currentYear + ' arasında olmalıdır.';
        } else {
            message = 'Yayın yılı uygun.';
        }
    } else if (fieldId === 'description') {
        if (field.value.trim().length < 10) {
            isValid = false;
            message = 'Açıklama en az 10 karakter olmalıdır.';
        } else if (field.value.trim().length > 1000) {
            isValid = false;
            message = 'Açıklama en fazla 1000 karakter olabilir.';
        } else {
            message = 'Açıklama uygun.';
        }
    }
    
    if (feedback) {
        feedback.textContent = message;
        feedback.className = 'form-feedback ' + (isValid ? 'valid' : 'invalid');
    }
    
    field.classList.toggle('is-valid', isValid);
    field.classList.toggle('is-invalid', !isValid);
    
    return isValid;
};

window.updatePreview = function() {
    const title = document.getElementById('title') ? document.getElementById('title').value : 'Kitap Adı';
    const author = document.getElementById('author') ? document.getElementById('author').value : 'Yazar';
    const year = document.getElementById('publicationYear') ? document.getElementById('publicationYear').value : 'Yıl';
    const description = document.getElementById('description') ? document.getElementById('description').value : 'Açıklama';
    const category = document.getElementById('category') ? document.getElementById('category').value : '';
    const isbn = document.getElementById('isbn') ? document.getElementById('isbn').value : '';
    
    // Safely update elements
    const previewTitle = document.getElementById('previewTitle');
    const previewAuthor = document.getElementById('previewAuthor');
    const previewYear = document.getElementById('previewYear');
    const previewDescription = document.getElementById('previewDescription');
    const finalCoverLetter = document.getElementById('finalCoverLetter');
    
    if (previewTitle) previewTitle.textContent = title;
    if (previewAuthor) previewAuthor.textContent = author;
    if (previewYear) previewYear.textContent = year;
    if (previewDescription) previewDescription.textContent = description;
    if (finalCoverLetter) finalCoverLetter.textContent = title.charAt(0).toUpperCase();
    
    // Category
    const categoryBadge = document.getElementById('previewCategoryBadge');
    const previewCategory = document.getElementById('previewCategory');
    if (category && categoryBadge && previewCategory) {
        previewCategory.textContent = category;
        categoryBadge.style.display = 'inline-block';
    } else if (categoryBadge) {
        categoryBadge.style.display = 'none';
    }
    
    // ISBN
    const isbnContainer = document.getElementById('previewIsbnContainer');
    const previewIsbn = document.getElementById('previewIsbn');
    if (isbn && isbnContainer && previewIsbn) {
        previewIsbn.textContent = isbn;
        isbnContainer.style.display = 'block';
    } else if (isbnContainer) {
        isbnContainer.style.display = 'none';
    }
};

window.previewImage = function(input) {
    if (input.files && input.files[0]) {
        const file = input.files[0];
        const reader = new FileReader();
        
        // Validate file size (5MB)
        if (file.size > 5 * 1024 * 1024) {
            if (window.showToast) {
                showToast('Dosya boyutu 5MB\'dan büyük olamaz!', 'error');
            } else {
                alert('Dosya boyutu 5MB\'dan büyük olamaz!');
            }
            input.value = '';
            return;
        }
        
        reader.onload = function(e) {
            const preview = document.getElementById('imagePreview');
            const previewImg = document.getElementById('previewImg');
            const imageInfo = document.getElementById('imageInfo');
            const uploadArea = document.getElementById('imageUploadArea');
            
            if (previewImg) previewImg.src = e.target.result;
            if (preview) preview.style.display = 'block';
            if (uploadArea) uploadArea.style.display = 'none';
            
            // Update final preview
            const finalPreview = document.getElementById('finalPreviewImage');
            if (finalPreview) {
                finalPreview.innerHTML = '<img src="' + e.target.result + '" alt="Kapak" style="width: 100%; height: 100%; object-fit: cover; border-radius: 12px;">';
            }
            
            // Show file info
            if (imageInfo) {
                const sizeInMB = (file.size / (1024 * 1024)).toFixed(2);
                imageInfo.textContent = file.name + ' (' + sizeInMB + ' MB)';
            }
        };
        
        reader.readAsDataURL(file);
    }
};

window.removeImage = function() {
    const coverImage = document.getElementById('coverImage');
    const imagePreview = document.getElementById('imagePreview');
    const imageUploadArea = document.getElementById('imageUploadArea');
    const finalPreview = document.getElementById('finalPreviewImage');
    
    if (coverImage) coverImage.value = '';
    if (imagePreview) imagePreview.style.display = 'none';
    if (imageUploadArea) imageUploadArea.style.display = 'flex';
    
    // Reset final preview
    if (finalPreview) {
        const title = document.getElementById('title') ? document.getElementById('title').value : '?';
        finalPreview.innerHTML = '<span id="finalCoverLetter">' + title.charAt(0).toUpperCase() + '</span>';
        finalPreview.className = 'final-cover-placeholder';
    }
};

function setupValidation() {
    ['title', 'author', 'publicationYear', 'description'].forEach(fieldId => {
        const field = document.getElementById(fieldId);
        if (field) {
            field.addEventListener('blur', () => validateField(fieldId));
            field.addEventListener('input', () => {
                if (field.classList.contains('is-invalid')) {
                    validateField(fieldId);
                }
            });
        }
    });
}

function setupImageUpload() {
    const uploadArea = document.getElementById('imageUploadArea');
    const fileInput = document.getElementById('coverImage');
    
    if (!uploadArea || !fileInput) {
        console.warn('Image upload elements not found');
        return;
    }
    
    // Click to upload
    uploadArea.addEventListener('click', () => {
        fileInput.click();
    });
    
    // Drag and drop
    uploadArea.addEventListener('dragover', (e) => {
        e.preventDefault();
        uploadArea.classList.add('dragover');
    });
    
    uploadArea.addEventListener('dragleave', () => {
        uploadArea.classList.remove('dragover');
    });
    
    uploadArea.addEventListener('drop', (e) => {
        e.preventDefault();
        uploadArea.classList.remove('dragover');
        
        const files = e.dataTransfer.files;
        if (files.length > 0) {
            fileInput.files = files;
            previewImage(fileInput);
        }
    });
    
    // File input change
    fileInput.addEventListener('change', () => {
        previewImage(fileInput);
    });
}

// Test function availability
console.log('=== FUNCTION AVAILABILITY TEST ===');
console.log('changeStep:', typeof window.changeStep);
console.log('updateNavigation:', typeof window.updateNavigation);
console.log('validateCurrentStep:', typeof window.validateCurrentStep);
console.log('validateField:', typeof window.validateField);
console.log('updatePreview:', typeof window.updatePreview);
console.log('previewImage:', typeof window.previewImage);
console.log('removeImage:', typeof window.removeImage);
console.log('setupValidation:', typeof setupValidation);
console.log('setupImageUpload:', typeof setupImageUpload);
console.log('=== TEST COMPLETE ===');

// DOM Ready event
document.addEventListener('DOMContentLoaded', function() {
    console.log('=== DOM LOADED ===');
    console.log('Initializing add book form...');
    
    // Test step elements
    for (let i = 1; i <= 4; i++) {
        const stepElement = document.getElementById('step-' + i);
        const stepIndicator = document.querySelector('[data-step="' + i + '"]');
        console.log('Step ' + i + ' element found:', !!stepElement);
        console.log('Step ' + i + ' indicator found:', !!stepIndicator);
    }
    
    // Test navigation elements
    const prevBtn = document.getElementById('prevBtn');
    const nextBtn = document.getElementById('nextBtn');
    const submitBtn = document.getElementById('submitBtn');
    const currentStepText = document.getElementById('currentStepText');
    
    console.log('Previous button found:', !!prevBtn);
    console.log('Next button found:', !!nextBtn);
    console.log('Submit button found:', !!submitBtn);
    console.log('Current step text found:', !!currentStepText);
    
    // Character counter for description
    const descriptionTextarea = document.getElementById('description');
    const descriptionCount = document.getElementById('descriptionCount');
    
    if (descriptionTextarea && descriptionCount) {
        descriptionTextarea.addEventListener('input', function() {
            const count = this.value.length;
            descriptionCount.textContent = count;
            
            if (count > 900) {
                descriptionCount.style.color = '#ef4444';
            } else if (count > 700) {
                descriptionCount.style.color = '#f59e0b';
            } else {
                descriptionCount.style.color = '#6b7280';
            }
        });
        console.log('Character counter initialized');
    }
    
    // Real-time preview updates
    const titleField = document.getElementById('title');
    const authorField = document.getElementById('author');
    const yearField = document.getElementById('publicationYear');
    const descField = document.getElementById('description');
    const categoryField = document.getElementById('category');
    const isbnField = document.getElementById('isbn');
    
    if (titleField) titleField.addEventListener('input', updatePreview);
    if (authorField) authorField.addEventListener('input', updatePreview);
    if (yearField) yearField.addEventListener('input', updatePreview);
    if (descField) descField.addEventListener('input', updatePreview);
    if (categoryField) categoryField.addEventListener('change', updatePreview);
    if (isbnField) isbnField.addEventListener('input', updatePreview);
    console.log('Preview updates initialized');
    
    // Form validation
    setupValidation();
    console.log('Validation setup complete');
    
    // Drag and drop for image upload
    setupImageUpload();
    console.log('Image upload setup complete');
    
    // Form submission
    const addBookForm = document.getElementById('addBookForm');
    if (addBookForm) {
        addBookForm.addEventListener('submit', function(e) {
            if (!validateCurrentStep()) {
                e.preventDefault();
                if (window.showToast) {
                    showToast('Lütfen tüm gerekli alanları doğru şekilde doldurun!', 'error');
                } else {
                    alert('Lütfen tüm gerekli alanları doğru şekilde doldurun!');
                }
                return;
            }
            
            const submitBtn = document.getElementById('submitBtn');
            if (submitBtn) {
                const originalText = submitBtn.innerHTML;
                submitBtn.innerHTML = '<i class="bi bi-arrow-clockwise spin me-2"></i>Kitap ekleniyor...';
                submitBtn.disabled = true;
                
                // Reset button after delay if submission fails
                setTimeout(function() {
                    submitBtn.innerHTML = originalText;
                    submitBtn.disabled = false;
                }, 5000);
            }
        });
        console.log('Form submission handler added');
    }
    
    console.log('=== INITIALIZATION COMPLETE ===');
    console.log('Final function check - changeStep:', typeof window.changeStep);
});

// Add spin animation
const style = document.createElement('style');
style.textContent = '.spin { animation: spin 1s linear infinite; } @keyframes spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }';
document.head.appendChild(style);
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %> 