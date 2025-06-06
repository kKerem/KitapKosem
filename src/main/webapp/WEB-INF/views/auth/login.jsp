<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

<c:set var="title" value="Giriş Yap" scope="request"/>
<%@ include file="../common/header.jsp" %>

<div class="hero-section bg-white border-bottom mb-3 mb-lg-4 p-3 p-lg-5" style="background-image: linear-gradient(rgba(0, 0, 0, .025) 1px, transparent 1px), linear-gradient(to right, rgba(0, 0, 0, .025) 1px, transparent 1px);background-size: 20px 20px;">
    <div class="container">
        <h1 class="display-6 fw-semibold mb-3">
            <i class="bi bi-person-circle me-3 text-primary"></i>
            Giriş Yap
        </h1>
        <p class="lead mb-4 opacity-90">
            Kitap Köşem'e giriş yapın ve kitap koleksiyonunuzu yönetin.
        </p>
    </div>
</div>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="bg-white shadow-sm rounded p-4">
                <div class="text-center mb-4">
                    <i class="bi bi-person-circle display-4 text-primary"></i>
                </div>
                <h2 class="fw-semibold text-center fs-4 mb-3">Giriş Yap</h2>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger small" role="alert">
                        ${error}
                    </div>
                </c:if>
                <form action="${pageContext.request.contextPath}/login" method="POST" class="needs-validation" novalidate>
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control" id="email" name="email" placeholder="E-posta" required>
                        <label for="email"><i class="bi bi-envelope me-2"></i>E-posta</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Şifre" required>
                        <label for="password"><i class="bi bi-lock me-2"></i>Şifre</label>
                    </div>
                    <div class="form-check mb-3">
                        <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
                        <label class="form-check-label" for="rememberMe">Beni hatırla</label>
                    </div>
                    <button type="submit" class="btn btn-primary fw-semibold w-100 py-2">
                        <i class="bi bi-box-arrow-in-right me-2"></i>Giriş Yap
                    </button>
                </form>
                <div class="text-center mt-3">
                    <p class="mb-0">Hesabınız yok mu? <a href="${pageContext.request.contextPath}/register">Kayıt olun</a></p>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %> 