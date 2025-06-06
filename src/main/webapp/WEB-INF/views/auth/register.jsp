<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

<c:set var="title" value="Kayıt Ol" scope="request"/>
<%@ include file="../common/header.jsp" %>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="bg-white shadow-sm p-3 rounded">
                <div class="fz-12 text-center text-muted mb-2"><span class="border-bottom pb-1 px-4">Kitap Köşem</span></div>
                <h2 class="fw-semibold text-center fs-4 mb-3">Kayıt Ol</h2>
                
                <c:if test="${not empty error}">
                    <div class="alert alert-danger small" role="alert">
                        ${error}
                    </div>
                </c:if>
                
                <form action="${pageContext.request.contextPath}/register" method="POST">
                    <div class="form-floating my-3">
                        <input type="text" class="form-control" id="username" name="username" 
                                placeholder="Kullanıcı Adı" required>
                        <label for="username">
                            Kullanıcı Adı
                        </label>
                        <div class="form-feedback"></div>
                    </div>
                    
                    <div class="form-floating my-3">
                        <input type="email" class="form-control" id="email" name="email" 
                                placeholder="E-posta" required>
                        <label for="email">
                            E-Posta
                        </label>
                        <div class="form-feedback"></div>
                    </div>
                    
                    <div class="form-floating my-3">
                        <input type="password" class="form-control" id="password" name="password" 
                                placeholder="Şifre" required>
                        <label for="password">
                            Şifre
                        </label>
                        <div class="form-feedback"></div>
                    </div>
                    
                    <div class="form-floating my-3">
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" 
                                placeholder="Şifre Tekrar" required>
                        <label for="confirmPassword">
                            Şifre (Tekrar)
                        </label>
                        <div class="form-feedback"></div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary fw-semibold w-100 py-2">Kayıt Ol</button>
                </form>
                
                <div class="text-center mt-3 mt-md-4">
                    <p class="mb-0 small text-muted">Zaten hesabınız var mı? <a href="${pageContext.request.contextPath}/login">Giriş yapın</a></p>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %> 