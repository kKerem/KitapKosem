<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="container py-5 text-center">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="error-content">
                <h1 class="display-1 text-danger">500</h1>
                <h2 class="mb-4">Sunucu Hatası</h2>
                <p class="lead mb-4">Üzgünüz, bir hata oluştu. Lütfen daha sonra tekrar deneyin.</p>
                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
                    <a href="${pageContext.request.contextPath}/" class="btn btn-primary btn-lg px-4">
                        <i class="fas fa-home me-2"></i>Ana Sayfa
                    </a>
                    <a href="javascript:history.back()" class="btn btn-outline-primary btn-lg px-4">
                        <i class="fas fa-arrow-left me-2"></i>Geri Dön
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %> 