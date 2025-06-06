<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
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

    <form action="${pageContext.request.contextPath}/books/edit/${book.id}" method="post" class="needs-validation" novalidate enctype="multipart/form-data">
        <div class="bg-white shadow-sm rounded p-3 mb-3">
            
            <div class="row">
                <div class="col-lg-3">
                    <h6 class="mb-2 small fw-normal text-secondary">Kapak Fotoğrafı</h6>
                    <div class="image-upload-area" id="imageUploadArea">
                        <c:choose>
                            <c:when test="${not empty book.coverImage}">
                                <img src="${pageContext.request.contextPath}${book.coverImage}" alt="Kapak" class="img-fluid rounded mb-2" id="previewImg">
                            </c:when>
                            <c:otherwise>
                                <div class="cover-placeholder d-flex align-items-center justify-content-center bg-light text-secondary mb-2">
                                    <i class="bi bi-image" style="font-size:2rem;"></i>
                                </div>
                            </c:otherwise>
                        </c:choose>
                        <input type="file" class="form-control" id="coverImage" name="coverImage" accept="image/*" onchange="previewImage(this)">
                        <input type="hidden" id="removeCover" name="removeCover" value="false">
                        <button type="button" class="btn btn-outline-danger btn-sm mt-2 w-100 fw-semibold" onclick="removeImage()"><i class="bi bi-trash3-fill me-2 fz-20"></i>Kapağı Kaldır</button>
                    </div>
                </div>
                <div class="col">
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
                                        placeholder="Kitap açıklaması" style="height: 250px;" required>${book.description}</textarea>
                                <label for="description">
                                    <i class="bi bi-card-text me-2"></i>Açıklama *
                                </label>
                            </div>
                        </div>
                    </div>

                    <h6 class="mt-3 mb-2 small fw-normal text-secondary">Yayın Bilgileri</h6>
                    <div class="row g-3">

                        <div class="col-md-4">
                            <div class="form-floating">
                                <select class="form-select" id="category" name="category">
                                    <option value="">Kategori seçin</option>
                                    <option value="Roman" ${book.category == 'Roman' ? 'selected' : ''}>Roman</option>
                                    <option value="Klasik" ${book.category == 'Klasik' ? 'selected' : ''}>Klasik</option>
                                    <option value="Edebiyat" ${book.category == 'Edebiyat' ? 'selected' : ''}>Edebiyat</option>
                                    <option value="Tarih" ${book.category == 'Tarih' ? 'selected' : ''}>Tarih</option>
                                    <option value="Psikoloji" ${book.category == 'Psikoloji' ? 'selected' : ''}>Psikoloji</option>
                                    <option value="Çocuk" ${book.category == 'Çocuk' ? 'selected' : ''}>Çocuk</option>
                                    <option value="Kişisel Gelişim" ${book.category == 'Kişisel Gelişim' ? 'selected' : ''}>Kişisel Gelişim</option>
                                    <option value="Hikaye" ${book.category == 'Hikaye' ? 'selected' : ''}>Hikaye</option>
                                    <option value="Genel" ${book.category == 'Genel' ? 'selected' : ''}>Genel</option>
                                    <option value="Diğer" ${book.category == 'Diğer' ? 'selected' : ''}>Diğer</option>
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
            </div>
        </div>

        <div class="text-end mt-3">
            <button type="submit" class="btn btn-primary fz-14 fw-semibold px-4">
                <i class="bi bi-check-circle me-2"></i>
                Kaydet
            </button>
        </div>
    </form>
</div>

<%@ include file="../common/footer.jsp" %>

<script>
function previewImage(input) {
    if (input.files && input.files[0]) {
        const file = input.files[0];
        const reader = new FileReader();
        reader.onload = function(e) {
            const previewImg = document.getElementById('previewImg');
            if (previewImg) previewImg.src = e.target.result;
        };
        reader.readAsDataURL(file);
        document.getElementById('removeCover').value = 'false';
    }
}
function removeImage() {
    const coverImage = document.getElementById('coverImage');
    const previewImg = document.getElementById('previewImg');
    if (coverImage) coverImage.value = '';
    if (previewImg) previewImg.src = '';
    document.getElementById('removeCover').value = 'true';
    coverImage.form.submit();
}
</script>

<c:if test="${not empty book.id}">
    <button class="btn btn-outline-danger favorite-btn" data-book-id="${book.id}">
        <i class="bi bi-heart"></i>
    </button>
</c:if>