<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<c:set var="title" value="Kayıt Ol" scope="request"/>
<%@ include file="../common/header.jsp" %>


<div class="auth-hero">
    <div class="container">
        <div class="row justify-content-center align-items-center min-vh-100">
            <div class="col-lg-6 col-md-8">
                <div class="auth-card">
                    
                    <div class="auth-header text-center mb-4">
                        <div class="auth-logo mb-3">
                            <i class="bi bi-person-plus display-4 text-success"></i>
                        </div>
                        <h2 class="auth-title fw-semibold">Aramıza Katılın!</h2>
                        <p class="auth-subtitle text-muted">Yeni hesap oluşturun ve kitap dünyasını keşfedin</p>
                    </div>

                    
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger small rounded border-0 mb-4" role="alert">
                            <i class="bi bi-exclamation-triangle me-2"></i>
                            ${error}
                        </div>
                    </c:if>

                    
                    <c:if test="${not empty success}">
                        <div class="alert alert-success rounded border-0 mb-4" role="alert">
                            <i class="bi bi-check-circle me-2"></i>
                            ${success}
                        </div>
                    </c:if>

                    
                    <form action="${pageContext.request.contextPath}/register" method="POST" class="auth-form" id="registerForm">
                        <div class="row g-3 mb-3">
                            <div class="col-md-12">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="username" name="username" 
                                           placeholder="Kullanıcı adınız" required minlength="3" maxlength="20">
                                    <label for="username">
                                        <i class="bi bi-person me-2"></i>Kullanıcı Adı
                                    </label>
                                    <div class="form-feedback"></div>
                                </div>
                            </div>
                            
                            <div class="col-md-12">
                                <div class="form-floating">
                                    <input type="email" class="form-control" id="email" name="email" 
                                           placeholder="E-posta adresiniz" required>
                                    <label for="email">
                                        <i class="bi bi-envelope me-2"></i>E-posta
                                    </label>
                                    <div class="form-feedback"></div>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="password" class="form-control" id="password" name="password" 
                                           placeholder="Şifreniz" required minlength="4">
                                    <label for="password">
                                        <i class="bi bi-lock me-2"></i>Şifre
                                    </label>
                                    <div class="form-feedback"></div>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" 
                                           placeholder="Şifrenizi tekrar girin" required>
                                    <label for="confirmPassword">
                                        <i class="bi bi-lock-fill me-2"></i>Şifre Tekrar
                                    </label>
                                    <div class="form-feedback"></div>
                                </div>
                            </div>
                        </div>

                        
                        <div class="password-strength my-3" style="display: none;">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <small class="text-muted">Şifre Gücü:</small>
                                <small class="strength-text">Zayıf</small>
                            </div>
                            <div class="progress" style="height: 4px;">
                                <div class="progress-bar" role="progressbar" style="width: 0%"></div>
                            </div>
                        </div>

                        <div class="row justify-content-center text-center">
                            <div class="col-12 col-md-4">
                                <button type="submit" class="btn btn-primary py-2 px-3 fw-semibold rounded mb-3 d-block w-100">
                                    <i class="bi bi-person-plus me-2"></i>
                                    <small>Hesap Oluştur</small>
                                </button>
                            </div>
                        </div>
                    </form>

                    
                    <div class="mb-3 text-center text-muted">
                        veya
                    </div>

                    
                    <div class="benefits-section mb-4">
                        <h6 class="text-center mb-3">Üyelik Avantajları</h6>
                        <div class="row g-3 text-center">
                            <div class="col-4">
                                <div class="benefit-item">
                                    <i class="bi bi-heart text-danger mb-2"></i>
                                    <small>Favoriler</small>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="benefit-item">
                                    <i class="bi bi-chat-heart text-primary mb-2"></i>
                                    <small>Değerlendirme</small>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="benefit-item">
                                    <i class="bi bi-plus-circle text-success mb-2"></i>
                                    <small>Kitap Ekleme</small>
                                </div>
                            </div>
                        </div>
                    </div>

                    
                    <div class="text-center">
                        <p class="mb-0">
                            Zaten hesabınız var mı? 
                            <a href="${pageContext.request.contextPath}/login" class="text-decoration-none fw-medium">
                                Giriş Yapın
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<style>

.form-floating > .form-control:focus {
    border-color: #10b981;
    box-shadow: 0 0 0 0.2rem rgba(16, 185, 129, 0.15);
}

.form-floating > .form-control.is-valid {
    border-color: #10b981;
}

.form-floating > .form-control.is-invalid {
    border-color: #ef4444;
}

.form-floating > label {
    padding: 1rem 0.75rem;
    color: #6b7280;
    font-weight: 500;
}

.form-feedback {
    font-size: 0.875rem;
    margin-top: 0.25rem;
}

.form-feedback.valid {
    color: #10b981;
}

.form-feedback.invalid {
    color: #ef4444;
}

.password-strength .progress {
    border-radius: 2px;
    background: #e5e7eb;
}

.password-strength .progress-bar {
    transition: all 0.3s ease;
    border-radius: 2px;
}

.strength-weak { background-color: #ef4444 !important; }
.strength-medium { background-color: #f59e0b !important; }
.strength-strong { background-color: #10b981 !important; }

.form-check-input:checked {
    background-color: #10b981;
    border-color: #10b981;
}

.btn-success {
    background: linear-gradient(135deg, #10b981 0%, #059669 100%);
    border: none;
    font-weight: 600;
    padding: 0.875rem 2rem;
    transition: all 0.3s ease;
}

.btn-success:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 30px rgba(16, 185, 129, 0.3);
}

.auth-divider {
    position: relative;
    text-align: center;
    margin: 2rem 0;
}

.auth-divider::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 0;
    right: 0;
    height: 1px;
    background: #e2e8f0;
}

.auth-divider span {
    background: rgba(255, 255, 255, 0.95);
    padding: 0 1rem;
    color: #6b7280;
    font-size: 0.875rem;
    font-weight: 500;
}

.benefits-section {
    background: var(--bs-gray-100);
    border-radius: 12px;
    padding: 1.5rem;
    border: 1px solid var(--bs-gray-200);
}

.benefit-item {
    padding: 0.5rem;
}

.benefit-item i {
    font-size: 1.5rem;
    display: block;
}

.auth-footer {
    padding-top: 1rem;
    border-top: 1px solid #e2e8f0;
}

[data-bs-theme="dark"] .auth-card {
    background: rgba(45, 55, 72, 0.95);
    color: white;
}

[data-bs-theme="dark"] .auth-title {
    color: #f7fafc;
}

[data-bs-theme="dark"] .form-floating > .form-control {
    background: rgba(74, 85, 104, 0.5);
    border-color: #4a5568;
    color: white;
}

[data-bs-theme="dark"] .form-floating > label {
    color: #a0aec0;
}

[data-bs-theme="dark"] .benefits-section {
    background: rgba(74, 85, 104, 0.3);
    border-color: #4a5568;
}

[data-bs-theme="dark"] .auth-footer {
    border-color: #4a5568;
}

@media (max-width: 768px) {
    .auth-card {
        margin: 1rem;
        padding: 2rem;
    }
    
    .auth-hero {
        padding-top: 1rem;
    }
}
</style>


<script>
document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('registerForm');
    const usernameInput = document.getElementById('username');
    const emailInput = document.getElementById('email');
    const passwordInput = document.getElementById('password');
    const confirmPasswordInput = document.getElementById('confirmPassword');
    const passwordStrength = document.querySelector('.password-strength');
    const progressBar = passwordStrength.querySelector('.progress-bar');
    const strengthText = passwordStrength.querySelector('.strength-text');

    // Password strength checker
    passwordInput.addEventListener('input', function() {
        const password = this.value;
        const strength = calculatePasswordStrength(password);
        
        if (password.length > 0) {
            passwordStrength.style.display = 'block';
            updatePasswordStrength(strength);
        } else {
            passwordStrength.style.display = 'none';
        }
    });

    function calculatePasswordStrength(password) {
        let score = 0;
        
        if (password.length >= 6) score += 25;
        if (password.length >= 10) score += 25;
        if (/[a-z]/.test(password)) score += 10;
        if (/[A-Z]/.test(password)) score += 10;
        if (/[0-9]/.test(password)) score += 15;
        if (/[^A-Za-z0-9]/.test(password)) score += 15;
        
        return Math.min(score, 100);
    }

    function updatePasswordStrength(strength) {
        progressBar.style.width = strength + '%';
        
        if (strength < 40) {
            progressBar.className = 'progress-bar strength-weak';
            strengthText.textContent = 'Zayıf';
            strengthText.style.color = '#ef4444';
        } else if (strength < 70) {
            progressBar.className = 'progress-bar strength-medium';
            strengthText.textContent = 'Orta';
            strengthText.style.color = '#f59e0b';
        } else {
            progressBar.className = 'progress-bar strength-strong';
            strengthText.textContent = 'Güçlü';
            strengthText.style.color = '#10b981';
        }
    }

    // Real-time validation
    function validateField(input, validationFn) {
        const feedback = input.parentElement.querySelector('.form-feedback');
        const result = validationFn(input.value);
        
        if (result.isValid) {
            input.classList.remove('is-invalid');
            input.classList.add('is-valid');
            feedback.textContent = result.message;
            feedback.className = 'form-feedback valid';
        } else {
            input.classList.remove('is-valid');
            input.classList.add('is-invalid');
            feedback.textContent = result.message;
            feedback.className = 'form-feedback invalid';
        }
        
        return result.isValid;
    }

    // Username validation
    usernameInput.addEventListener('blur', function() {
        validateField(this, function(value) {
            if (value.length < 3) {
                return { isValid: false, message: 'Kullanıcı adı en az 3 karakter olmalıdır.' };
            }
            if (value.length > 20) {
                return { isValid: false, message: 'Kullanıcı adı en fazla 20 karakter olabilir.' };
            }
            if (!/^[a-zA-Z0-9_]+$/.test(value)) {
                return { isValid: false, message: 'Sadece harf, rakam ve alt çizgi kullanabilirsiniz.' };
            }
            return { isValid: true, message: 'Kullanıcı adı uygun.' };
        });
    });

    // Email validation
    emailInput.addEventListener('blur', function() {
        validateField(this, function(value) {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(value)) {
                return { isValid: false, message: 'Geçerli bir e-posta adresi girin.' };
            }
            return { isValid: true, message: 'E-posta adresi geçerli.' };
        });
    });

    // Password validation
    passwordInput.addEventListener('blur', function() {
        validateField(this, function(value) {
            if (value.length < 6) {
                return { isValid: false, message: 'Şifre en az 6 karakter olmalıdır.' };
            }
            return { isValid: true, message: 'Şifre uygun.' };
        });
    });

    // Confirm password validation
    confirmPasswordInput.addEventListener('blur', function() {
        validateField(this, function(value) {
            if (value !== passwordInput.value) {
                return { isValid: false, message: 'Şifreler eşleşmiyor.' };
            }
            if (value.length === 0) {
                return { isValid: false, message: 'Şifre tekrarını girin.' };
            }
            return { isValid: true, message: 'Şifreler eşleşiyor.' };
        });
    });

    // Form submission
    form.addEventListener('submit', function(e) {
        const isUsernameValid = validateField(usernameInput, function(value) {
            return value.length >= 3 && value.length <= 20 && /^[a-zA-Z0-9_]+$/.test(value) 
                ? { isValid: true, message: '' } 
                : { isValid: false, message: 'Kullanıcı adı geçersiz.' };
        });

        const isEmailValid = validateField(emailInput, function(value) {
            return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value) 
                ? { isValid: true, message: '' } 
                : { isValid: false, message: 'E-posta geçersiz.' };
        });

        const isPasswordValid = validateField(passwordInput, function(value) {
            return value.length >= 6 
                ? { isValid: true, message: '' } 
                : { isValid: false, message: 'Şifre çok kısa.' };
        });

        const isConfirmValid = validateField(confirmPasswordInput, function(value) {
            return value === passwordInput.value 
                ? { isValid: true, message: '' } 
                : { isValid: false, message: 'Şifreler eşleşmiyor.' };
        });

        const agreeTerms = document.getElementById('agreeTerms').checked;

        if (!isUsernameValid || !isEmailValid || !isPasswordValid || !isConfirmValid || !agreeTerms) {
            e.preventDefault();
            if (!agreeTerms) {
                showToast('Kullanım şartlarını kabul etmelisiniz!', 'error');
            } else {
                showToast('Lütfen tüm alanları doğru şekilde doldurun!', 'error');
            }
            return;
        }

        // Show loading state
        const submitBtn = form.querySelector('button[type="submit"]');
        const originalText = submitBtn.innerHTML;
        submitBtn.innerHTML = '<i class="bi bi-arrow-clockwise spin me-2"></i>Hesap oluşturuluyor...';
        submitBtn.disabled = true;

        // Reset button after a delay if form submission fails
        setTimeout(() => {
            submitBtn.innerHTML = originalText;
            submitBtn.disabled = false;
        }, 5000);
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