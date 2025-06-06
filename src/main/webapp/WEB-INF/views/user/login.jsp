<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<c:set var="title" value="Giriş Yap" scope="request"/>
<%@ include file="../common/header.jsp" %>


<div class="auth-hero">
    <div class="container">
        <div class="row justify-content-center align-items-center my-3 my-md-5">
            <div class="col-lg-5 col-md-7">
                <div class="auth-card">
                    
                    <div class="auth-header text-center mb-4">
                        <div class="text-primary">
                            <svg xmlns="http://www.w3.org/2000/svg" width="55" height="55" viewBox="0 0 256 256"><path fill="currentColor" d="m231.65 194.55l-33.19-157.8a16 16 0 0 0-19-12.39l-46.81 10.06a16.08 16.08 0 0 0-12.3 19l33.19 157.8A16 16 0 0 0 169.16 224a16.3 16.3 0 0 0 3.38-.36l46.81-10.06a16.09 16.09 0 0 0 12.3-19.03M136 50.15v-.09l46.8-10l3.33 15.87L139.33 66Zm6.62 31.47l46.82-10.05l3.34 15.9L146 97.53Zm6.64 31.57l46.82-10.06l13.3 63.24l-46.82 10.06ZM216 197.94l-46.8 10l-3.33-15.87l46.8-10.07l3.33 15.85zM104 32H56a16 16 0 0 0-16 16v160a16 16 0 0 0 16 16h48a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16M56 48h48v16H56Zm0 32h48v96H56Zm48 128H56v-16h48z"></path></svg>
                        </div>
                        <h2 class="auth-title">Hoşgeldiniz</h2>
                        <p class="auth-subtitle text-muted">Hesabınıza giriş yapın</p>
                    </div>

                    
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger small rounded border-0 mb-4" role="alert">
                            <i class="bi bi-exclamation-triangle me-2"></i>
                            ${error}
                        </div>
                    </c:if>

                    
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

                        <div class="row justify-content-center text-center">
                            <div class="col-12 col-md-4">
                                <button type="submit" class="btn btn-primary py-2 px-3 fw-semibold rounded mb-3 d-block w-100">
                                    <i class="bi bi-box-arrow-in-right me-2"></i>
                                    <small>Giriş Yap</small>
                                </button>
                            </div>
                        </div>
                    </form>

                    
                    <div class="text-center text-muted small mb-2">
                        veya
                    </div>

                    
                    <div class="mb-4">
                        <h6 class="text-center mb-3">demo Hesapları deneyebilirsiniz</h6>
                        <div class="row g-2">
                            <div class="col-6">
                                <button type="button" class="btn btn-outline-primary btn-sm w-100 demo-login p-2" 
                                        data-username="admin" data-password="123456">
                                    <i class="bi bi-shield-check me-1"></i>Admin
                                </button>
                            </div>
                            <div class="col-6">
                                <button type="button" class="btn btn-outline-primary btn-sm w-100 demo-login p-2" 
                                        data-username="kerem" data-password="123456">
                                    <i class="bi bi-person me-1"></i>Kullanıcı
                                </button>
                            </div>
                        </div>
                    </div>

                    
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
            this.classList.add('btn-primary');
            this.classList.remove('btn-outline-primary', 'btn-outline-secondary');
            
            setTimeout(() => {
                this.innerHTML = this.innerHTML.replace('Dolduruldu', username == 'admin' ? 'Admin' : 'Kullanıcı');
                this.classList.remove('btn-primary');
                this.classList.add(username == 'admin' ? 'btn-outline-primary' : 'btn-outline-secondary');
            }, 500);
            
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