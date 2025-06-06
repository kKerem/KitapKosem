<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<c:set var="title" value="Kitap Değerlendirmesi" scope="request"/>
<%@ include file="../common/header.jsp" %>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="bg-white shadow-sm p-3 rounded">
                <div class="card-body">
                    <h2 class="card-title text-center mb-4">Kitap Değerlendirmesi</h2>

                    <div class="book-info mb-4">
                        <div>
                            <h4 class="mb-1">${book.title}</h4>
                            <p class="text-muted mb-0">${book.author}</p>
                        </div>
                    </div>

                    <c:if test="${not empty sessionScope.error}">
                        <div class="alert alert-danger small mb-4">
                            ${sessionScope.error}
                            <% session.removeAttribute("error"); %>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/books/view/${book.id}/review" method="POST">
                        <div class="mb-4">
                            <label class="form-label">Puanınız *</label>
                            <div class="rating-input">
                                <div class="btn-group" role="group">
                                    <c:forEach begin="1" end="5" var="i">
                                        <input type="radio" class="btn-check" name="rating" id="rating${i}" 
                                               value="${i}" required>
                                        <label class="btn btn-outline-warning" for="rating${i}">
                                            ${i} <i class="fas fa-star"></i>
                                        </label>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="comment" class="form-label">Yorumunuz *</label>
                            <textarea class="form-control" id="comment" name="comment" rows="5" 
                                      placeholder="Kitap hakkındaki düşüncelerinizi paylaşın..." required></textarea>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-paper-plane me-2"></i>Değerlendirmeyi Gönder
                            </button>
                            <a href="${pageContext.request.contextPath}/books/view/${book.id}" 
                               class="btn btn-outline-secondary">
                                <i class="fas fa-arrow-left me-2"></i>Geri Dön
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %> 