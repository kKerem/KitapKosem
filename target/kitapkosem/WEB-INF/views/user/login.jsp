<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<c:set var="title" value="Giriş Yap" scope="request"/>
<%@ include file="../common/header.jsp" %>

<!-- Auth Hero Section -->
<div class="auth-hero">
    <div class="container">
        <div class="row justify-content-center align-items-center min-vh-100">
            <div class="col-lg-5 col-md-7">
                <div class="auth-card">
                    <!-- Logo & Welcome -->
                    <div class="auth-header text-center mb-4">
                        <div class="auth-logo mb-3">
                            <i class="bi bi-book-half display-4 text-primary"></i>
                        </div>
                        <h2 class="auth-title">Hoş Geldiniz!</h2>
                        <p class="auth-subtitle text-muted">Hesabınıza giriş yapın</p>
                    </div>

                    <!-- Error Alert -->
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger small rounded-4 border-0 mb-4" role="alert">
                            <i class="bi bi-exclamation-triangle me-2"></i>
                            ${error}
                        </div>
                    </c:if>

                    <!-- Login Form -->
                    <form action="${pageContext.request.contextPath}/login" method="POST" class="auth-form">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="username" name="username" 
                                   placeholder="Kullanıcı adınız" required>
                            <label for="username">
                                <i class="bi bi-person me-2"></i>Kullanıcı Adı
                            </label>
                        </div>

                        <div class="form-floating mb-4">
                            <input type="password" class="form-control" id="password" name="password" 
                                   placeholder="Şifreniz" required>
                            <label for="password">
                                <i class="bi bi-lock me-2"></i>Şifre
                            </label>
                        </div>

                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe">
                                <label class="form-check-label" for="rememberMe">
                                    Beni hatırla
                                </label>
                            </div>
                            <a href="#" class="text-decoration-none small">Şifremi unuttum?</a>
                        </div>

                        <button type="submit" class="btn btn-primary btn-lg w-100 rounded-pill mb-4">
                            <i class="bi bi-box-arrow-in-right me-2"></i>
                            Giriş Yap
                        </button>
                    </form>

                    <!-- Divider -->
                    <div class="text-center">
                        <span>veya</span>
                    </div>

                    <!-- Demo Accounts -->
                    <div class="mb-4">
                        <h6 class="text-center mb-3">Demo Hesaplar</h6>
                        <div class="row g-2">
                            <div class="col-6">
                                <button type="button" class="btn btn-outline-primary btn-sm w-100 demo-login" 
                                        data-username="admin" data-password="admin">
                                    <i class="bi bi-shield-check me-1"></i>Admin
                                </button>
                            </div>
                            <div class="col-6">
                                <button type="button" class="btn btn-outline-secondary btn-sm w-100 demo-login" 
                                        data-username="mert" data-password="admin">
                                    <i class="bi bi-person me-1"></i>Kullanıcı
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Register Link -->
                    <div class="auth-footer text-center">
                        <p class="mb-0">
                            Hesabınız yok mu? 
                            <a href="${pageContext.request.contextPath}/register" class="text-decoration-none fw-medium">
                                Kayıt Olun
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Auth JavaScript -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Demo login functionality
    const demoButtons = document.querySelectorAll('.demo-login');
    const usernameInput = document.getElementById('username');
    const passwordInput = document.getElementById('password');
    
    demoButtons.forEach(btn => {
        btn.addEventListener('click', function() {
            const username = this.dataset.username;
            const password = this.dataset.password;
            
            usernameInput.value = username;
            passwordInput.value = password;
            
            // Add visual feedback
            this.innerHTML = '<i class="bi bi-check-circle me-1"></i>Dolduruldu';
            this.classList.add('btn-success');
            this.classList.remove('btn-outline-primary', 'btn-outline-secondary');
            
            setTimeout(() => {
                this.innerHTML = this.innerHTML.replace('Dolduruldu', username == 'admin' ? 'Admin' : 'Kullanıcı');
                this.classList.remove('btn-success');
                this.classList.add(username == 'admin' ? 'btn-outline-primary' : 'btn-outline-secondary');
            }, 1500);
            
            if (typeof showToast === 'function') {
                showToast(`${username == 'admin' ? 'Admin' : 'Kullanıcı'} bilgileri dolduruldu!`, 'success');
            }
        });
    });
    
    // Form validation
    const form = document.querySelector('.auth-form');
    if (form) {
        form.addEventListener('submit', function(e) {
            const username = usernameInput.value.trim();
            const password = passwordInput.value.trim();
            
            if (!username || !password) {
                e.preventDefault();
                if (typeof showToast === 'function') {
                    showToast('Lütfen tüm alanları doldurun!', 'error');
                } else {
                    alert('Lütfen tüm alanları doldurun!');
                }
                return;
            }
            
            // Show loading state
            const submitBtn = form.querySelector('button[type="submit"]');
            if (submitBtn) {
                const originalText = submitBtn.innerHTML;
                submitBtn.innerHTML = '<i class="bi bi-arrow-clockwise spin me-2"></i>Giriş yapılıyor...';
                submitBtn.disabled = true;
                
                // Reset button after a delay if form submission fails
                setTimeout(() => {
                    submitBtn.innerHTML = originalText;
                    submitBtn.disabled = false;
                }, 3000);
            }
        });
    }
    
    // Add floating label animation
    const inputs = document.querySelectorAll('.form-floating input');
    inputs.forEach(input => {
        input.addEventListener('focus', function() {
            this.parentElement.classList.add('focused');
        });
        
        input.addEventListener('blur', function() {
            if (!this.value) {
                this.parentElement.classList.remove('focused');
            }
        });
    });
});

// Add spin animation for loading
const style = document.createElement('style');
style.textContent = `
    .spin {
        animation: spin 1s linear infinite;
    }
    
    @keyframes spin {
        from { transform: rotate(0deg); }
        to { transform: rotate(360deg); }
    }
`;
document.head.appendChild(style);
</script>

<%@ include file="../common/footer.jsp" %> 