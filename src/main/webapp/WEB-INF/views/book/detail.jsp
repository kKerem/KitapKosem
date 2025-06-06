<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>

<c:set var="title" value="${book.title}" scope="request"/>
<%@ include file="../common/header.jsp" %>

<div class="container py-5">
    <div class="row">
        <div class="col-md-8">
            <h1 class="mb-3">${book.title}</h1>
            <h5 class="text-muted mb-4">${book.author}</h5>
            
            <div class="mb-4">
                <div class="d-flex align-items-center gap-2">
                    <div class="rating">
                        <c:forEach begin="1" end="5" var="i">
                            <i class="fas fa-star${i <= book.rating ? '' : '-o'} text-warning"></i>
                        </c:forEach>
                    </div>
                    <span class="text-muted">
                        (<fmt:formatNumber value="${book.rating}" maxFractionDigits="1" minFractionDigits="1"/>/5 - ${book.reviewCount} değerlendirme)
                    </span>
                </div>
            </div>

            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="card-title">Kitap Hakkında</h5>
                    <p class="card-text">${book.description}</p>
                    
                    <dl class="row mb-0">
                        <dt class="col-sm-3">Kategori</dt>
                        <dd class="col-sm-9">${book.category}</dd>
                        
                        <dt class="col-sm-3">Yayın Yılı</dt>
                        <dd class="col-sm-9">${book.publishYear}</dd>
                        
                        <dt class="col-sm-3">ISBN</dt>
                        <dd class="col-sm-9">${book.isbn}</dd>
                    </dl>
                </div>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h5 class="card-title mb-0">Değerlendirmeler</h5>
                        <%-- Debug: User logged in: ${not empty sessionScope.user}, Has reviewed: ${hasReviewed}, Reviews size: ${fn:length(reviews)} --%>
                        <c:if test="${not empty sessionScope.user and (hasReviewed == null or not hasReviewed)}">
                            <a href="${pageContext.request.contextPath}/books/view/${book.id}/review" 
                               class="btn btn-primary btn-sm">
                                <i class="fas fa-star me-1"></i>Değerlendir
                            </a>
                        </c:if>
                    </div>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger small mb-4">
                            ${error}
                        </div>
                    </c:if>

                    <c:if test="${not empty success}">
                        <div class="alert alert-success mb-4">
                            ${success}
                        </div>
                    </c:if>

                    <%-- Debug: Reviews attribute exists: ${not empty reviews}, Reviews size: ${fn:length(reviews)} --%>
                    <c:choose>
                        <c:when test="${not empty reviews}">
                            <%-- Debug: Displaying reviews --%>
                            <div class="reviews">
                                <c:forEach items="${reviews}" var="review" varStatus="status">
                                    <%-- Debug: Review ${status.index + 1}: ID=${review.id}, User=${review.username}, Rating=${review.rating} --%>
                                    <div class="review mb-4 p-3 border rounded">
                                        <div class="d-flex justify-content-between align-items-start mb-2">
                                            <div>
                                                <div class="d-flex align-items-center gap-2 mb-1">
                                                    <strong class="text-primary">${review.username}</strong>
                                                    <div class="rating">
                                                        <c:forEach begin="1" end="5" var="i">
                                                            <i class="fas fa-star${i <= review.rating ? '' : '-o'} text-warning"></i>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                                <small class="text-muted d-block">${review.formattedDate}</small>
                                            </div>
                                        </div>
                                        <p class="mb-0" style="white-space: pre-wrap;">${review.comment}</p>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <%-- Debug: No reviews found, User logged in: ${not empty sessionScope.user}, Has reviewed: ${hasReviewed} --%>
                            <div class="text-center py-4">
                                <p class="text-muted mb-0">
                                    Henüz değerlendirme yapılmamış.
                                    <c:if test="${not empty sessionScope.user and (hasReviewed == null or not hasReviewed)}">
                                        İlk değerlendirmeyi siz yapın!
                                    </c:if>
                                </p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <a href="${pageContext.request.contextPath}/books" class="btn btn-outline-secondary w-100">
                        <i class="fas fa-arrow-left me-2"></i>Kitap Listesine Dön
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %> 