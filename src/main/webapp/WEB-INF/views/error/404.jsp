<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="container py-5 text-center">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="error-content">
                <h1 class="display-1 text-primary">404</h1>
                <h2 class="mb-4">Sayfa Bulunamadı</h2>
                <p class="lead mb-4">Aradığınız sayfa bulunamadı veya taşınmış olabilir.</p>
                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
                    <a href="${pageContext.request.contextPath}/" class="btn btn-primary btn-lg px-4">
                        <i class="fas fa-home me-2"></i>Ana Sayfa
                    </a>
                    <a href="${pageContext.request.contextPath}/books" class="btn btn-outline-primary btn-lg px-4">
                        <i class="fas fa-book me-2"></i>Kitaplar
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %> 