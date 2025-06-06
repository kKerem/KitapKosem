<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="../common/header.jsp" %>

</div>
<div class="hero-section bg-white border-bottom mb-3 mb-lg-4 p-3 p-lg-5" style="background-image: linear-gradient(rgba(0, 0, 0, .025) 1px, transparent 1px), linear-gradient(to right, rgba(0, 0, 0, .025) 1px, transparent 1px);background-size: 20px 20px;">
    <div class="container">
        <h1 class="display-6 fw-semibold mb-3">
            <i class="bi bi-pencil-square me-3 text-primary"></i>
            Kitap Düzenleme
        </h1>
        <p class="lead mb-4 opacity-90">
            Kitap adı <br><span class="fw-semibold">${book.title}</span>
        </p>
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb m-0">
                <li class="breadcrumb-item small"><a href="${pageContext.request.contextPath}/" class="text-decoration-none">Ana Sayfa</a></li>
                <li class="breadcrumb-item small"><a href="${pageContext.request.contextPath}/books" class="text-decoration-none">Kitaplar</a></li>
                <li class="breadcrumb-item small active" aria-current="page">${book.title}</li>
            </ol>
        </nav>
    </div>
</div>

<div class="container">

    <!-- Edit Form -->
    <form action="${pageContext.request.contextPath}/books/edit/${book.id}" method="post" class="needs-validation" novalidate>
        <div class="bg-white shadow-sm rounded p-3 mb-3">
            
            <!-- Basic Info Section -->
            <h6 class="mb-2 small fw-normal text-secondary">Temel Bilgiler</h6>
            <div class="row g-3">
                
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="title" name="title" 
                                placeholder="Kitap adı" value="${book.title}" required>
                        <label for="title">
                            <i class="bi bi-book me-2"></i>Kitap Adı *
                        </label>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="author" name="author" 
                                placeholder="Yazar adı" value="${book.author}" required>
                        <label for="author">
                            <i class="bi bi-person me-2"></i>Yazar *
                        </label>
                    </div>
                </div>

                <div class="col-12">
                    <div class="form-floating">
                        <textarea class="form-control" id="description" name="description" 
                                placeholder="Kitap açıklaması" style="height: 120px;" required>${book.description}</textarea>
                        <label for="description">
                            <i class="bi bi-card-text me-2"></i>Açıklama *
                        </label>
                    </div>
                </div>
            </div>

            <!-- Publication Info Section -->
            <h6 class="mt-3 mb-2 small fw-normal text-secondary">Yayın Bilgileri</h6>
            <div class="row g-3">

                <div class="col-md-4">
                    <div class="form-floating">
                        <select class="form-select" id="category" name="category">
                            <option value="">Kategori seçin</option>
                            <option value="roman" ${book.category == 'roman' ? 'selected' : ''}>Roman</option>
                            <option value="bilim-kurgu" ${book.category == 'bilim-kurgu' ? 'selected' : ''}>Bilim Kurgu</option>
                            <option value="fantastik" ${book.category == 'fantastik' ? 'selected' : ''}>Fantastik</option>
                            <option value="tarih" ${book.category == 'tarih' ? 'selected' : ''}>Tarih</option>
                            <option value="biyografi" ${book.category == 'biyografi' ? 'selected' : ''}>Biyografi</option>
                            <option value="felsefe" ${book.category == 'felsefe' ? 'selected' : ''}>Felsefe</option>
                            <option value="psikoloji" ${book.category == 'psikoloji' ? 'selected' : ''}>Psikoloji</option>
                            <option value="egitim" ${book.category == 'egitim' ? 'selected' : ''}>Eğitim</option>
                            <option value="cocuk" ${book.category == 'cocuk' ? 'selected' : ''}>Çocuk</option>
                            <option value="diger" ${book.category == 'diger' ? 'selected' : ''}>Diğer</option>
                        </select>
                        <label for="category">
                            <i class="bi bi-tag me-2"></i>Kategori
                        </label>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="publisher" name="publisher" 
                                placeholder="Yayınevi" value="${book.publisher}">
                        <label for="publisher">
                            <i class="bi bi-building me-2"></i>Yayınevi
                        </label>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="isbn" name="isbn" 
                                placeholder="ISBN numarası" value="${book.isbn}">
                        <label for="isbn">
                            <i class="bi bi-upc me-2"></i>ISBN
                        </label>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="translator" name="translator" 
                                placeholder="Çevirmen adı" value="${book.translator}">
                        <label for="translator">
                            <i class="bi bi-translate me-2"></i>Çevirmen
                        </label>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="language" name="language" 
                                placeholder="Türkçe" value="${book.language}">
                        <label for="language">
                            <i class="bi bi-globe me-2"></i>Dil
                        </label>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-floating">
                        <input type="number" class="form-control" id="pageCount" name="pageCount" 
                                placeholder="Sayfa sayısı" value="${book.pageCount}">
                        <label for="pageCount">
                            <i class="bi bi-file-earmark-text me-2"></i>Sayfa Sayısı
                        </label>
                    </div>
                </div>
            </div>

            <!-- Additional Info Section -->
            <h6 class="mt-3 mb-2 small fw-normal text-secondary">Ek Bilgiler</h6>
            <div class="row g-3">

                <div class="col-md-3">
                    <div class="form-floating">
                        <input type="number" class="form-control" id="publicationYear" name="publicationYear" 
                                placeholder="Yayın yılı" value="${book.publicationYear}">
                        <label for="publicationYear">
                            <i class="bi bi-calendar me-2"></i>Yayın Yılı
                        </label>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-floating">
                        <input type="number" class="form-control" id="firstPublicationYear" name="firstPublicationYear" 
                                placeholder="İlk baskı yılı" value="${book.firstPublicationYear}">
                        <label for="firstPublicationYear">
                            <i class="bi bi-calendar-event me-2"></i>İlk Baskı Yılı
                        </label>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="dimensions" name="dimensions" 
                                placeholder="13,5 x 21" value="${book.dimensions}">
                        <label for="dimensions">
                            <i class="bi bi-aspect-ratio me-2"></i>Ebat (cm)
                        </label>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="edition" name="edition" 
                                placeholder="1. Basım" value="${book.edition}">
                        <label for="edition">
                            <i class="bi bi-bookmark me-2"></i>Baskı
                        </label>
                    </div>
                </div>
            </div>

            <!-- Rating Section -->
            <h6 class="mt-3 mb-2 small fw-normal text-secondary">Değerlendirme</h6>
            <div class="row g-3">

                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="number" step="0.01" class="form-control" id="rating" name="rating" 
                                placeholder="Puan" value="${book.rating}">
                        <label for="rating">
                            <i class="bi bi-star me-2"></i>Puan
                        </label>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="number" class="form-control" id="reviewCount" name="reviewCount" 
                                placeholder="Yorum sayısı" value="${book.reviewCount}">
                        <label for="reviewCount">
                            <i class="bi bi-chat me-2"></i>Yorum Sayısı
                        </label>
                    </div>
                </div>
            </div>
        </div>

        <!-- Submit Button -->
        <div class="text-end mt-3">
            <button type="submit" class="btn btn-primary fz-14 fw-semibold px-4">
                <i class="bi bi-check-circle me-2"></i>
                Kaydet
            </button>
        </div>
    </form>
</div>

<%@ include file="../common/footer.jsp" %>