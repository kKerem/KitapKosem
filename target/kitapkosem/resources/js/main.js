// Modern KitapKöşem JavaScript - Bootstrap 5.3.6
document.addEventListener('DOMContentLoaded', function() {
    
    // Initialize all components
    initThemeToggle();
    initAnimations();
    initCounterAnimations();
    initScrollEffects();
    initFormEnhancements();
});

// Theme Toggle with smooth transition
function initThemeToggle() {
    const themeToggle = document.getElementById('theme-toggle');
    const html = document.documentElement;
    const lightIcon = themeToggle?.querySelector('.theme-icon-light');
    const darkIcon = themeToggle?.querySelector('.theme-icon-dark');
    
    if (!themeToggle || !lightIcon || !darkIcon) return;
    
    const currentTheme = localStorage.getItem('theme') || 'light';
    updateThemeIcons(currentTheme, lightIcon, darkIcon);
    
    themeToggle.addEventListener('click', function(e) {
        e.preventDefault();
        
        const currentTheme = html.getAttribute('data-bs-theme');
        const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
        
        // Add transition class
        document.body.style.transition = 'all 0.3s ease';
        
        // Update theme
        html.setAttribute('data-bs-theme', newTheme);
        localStorage.setItem('theme', newTheme);
        
        // Update icons with animation
        updateThemeIcons(newTheme, lightIcon, darkIcon);
        
        // Show success toast
        showToast(`${newTheme === 'dark' ? '🌙 Karanlık' : '☀️ Aydınlık'} tema aktif`, 'success');
        
        // Remove transition class after animation
        setTimeout(() => {
            document.body.style.transition = '';
        }, 300);
    });
}

function updateThemeIcons(theme, lightIcon, darkIcon) {
    if (theme === 'dark') {
        lightIcon.classList.add('d-none');
        darkIcon.classList.remove('d-none');
        darkIcon.style.transform = 'rotate(180deg)';
        setTimeout(() => { darkIcon.style.transform = 'rotate(0deg)'; }, 150);
    } else {
        darkIcon.classList.add('d-none');
        lightIcon.classList.remove('d-none');
        lightIcon.style.transform = 'rotate(-180deg)';
        setTimeout(() => { lightIcon.style.transform = 'rotate(0deg)'; }, 150);
    }
}

// Enhanced Animations
function initAnimations() {
    // Intersection Observer for fade animations
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);
    
    // Apply fade-in animations
    const animatedElements = document.querySelectorAll('.fade-in-up, .fade-in-up-delay-1, .fade-in-up-delay-2, .fade-in-up-delay-3, .fade-in-up-delay-4');
    animatedElements.forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = 'opacity 0.6s cubic-bezier(0.4, 0, 0.2, 1), transform 0.6s cubic-bezier(0.4, 0, 0.2, 1)';
        observer.observe(el);
    });
    
    // Card hover effects
    const cards = document.querySelectorAll('.modern-card, .book-card, .stats-card');
    cards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = this.classList.contains('stats-card') 
                ? 'translateY(-8px) scale(1.02)' 
                : 'translateY(-4px)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1)';
        });
    });
    
    // Button ripple effect
    const buttons = document.querySelectorAll('.btn');
    buttons.forEach(button => {
        button.addEventListener('click', function(e) {
            const ripple = document.createElement('span');
            const rect = this.getBoundingClientRect();
            const size = Math.max(rect.width, rect.height);
            const x = e.clientX - rect.left - size / 2;
            const y = e.clientY - rect.top - size / 2;
            
            ripple.style.cssText = `
                position: absolute;
                width: ${size}px;
                height: ${size}px;
                left: ${x}px;
                top: ${y}px;
                background: rgba(255, 255, 255, 0.3);
                border-radius: 50%;
                transform: scale(0);
                animation: ripple 0.6s linear;
                pointer-events: none;
            `;
            
            this.style.position = 'relative';
            this.style.overflow = 'hidden';
            this.appendChild(ripple);
            
            setTimeout(() => {
                ripple.remove();
            }, 600);
        });
    });
}

// Counter Animations for Statistics
function initCounterAnimations() {
    const counters = document.querySelectorAll('.counter');
    
    const animateCounter = (counter) => {
        const target = parseInt(counter.textContent) || 0;
        if (target === 0) return;
        
        const increment = target / 60; // 60 frames for smooth animation
        let current = 0;
        
        const updateCounter = () => {
            if (current < target) {
                current += increment;
                counter.textContent = Math.floor(current);
                requestAnimationFrame(updateCounter);
            } else {
                counter.textContent = target;
                // Add completion effect
                counter.style.transform = 'scale(1.1)';
                setTimeout(() => {
                    counter.style.transform = 'scale(1)';
                }, 200);
            }
        };
        
        updateCounter();
    };

    const counterObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                setTimeout(() => {
                    animateCounter(entry.target);
                }, 300); // Delay for visual effect
                counterObserver.unobserve(entry.target);
            }
        });
    }, { threshold: 0.5 });

    counters.forEach(counter => {
        counter.style.transition = 'transform 0.2s ease';
        counterObserver.observe(counter);
    });
}

// Scroll Effects
function initScrollEffects() {
    let ticking = false;
    
    function updateScrollEffects() {
        const scrolled = window.pageYOffset;
        const navbar = document.querySelector('.navbar');
        
        if (navbar) {
            if (scrolled > 100) {
                navbar.style.backdropFilter = 'blur(10px)';
                navbar.style.backgroundColor = 'rgba(255, 255, 255, 0.95)';
                navbar.style.borderBottom = '1px solid rgba(0, 0, 0, 0.1)';
            } else {
                navbar.style.backdropFilter = 'none';
                navbar.style.backgroundColor = 'white';
                navbar.style.borderBottom = 'none';
            }
        }
        
        ticking = false;
    }
    
    function requestScrollUpdate() {
        if (!ticking) {
            requestAnimationFrame(updateScrollEffects);
            ticking = true;
        }
    }
    
    window.addEventListener('scroll', requestScrollUpdate);
}

// Form Enhancements
function initFormEnhancements() {
    // Enhanced form submission with loading states
    document.addEventListener('submit', function(e) {
        const form = e.target;
        const submitBtn = form.querySelector('button[type="submit"], input[type="submit"]');
        
        if (submitBtn) {
            submitBtn.disabled = true;
            const originalText = submitBtn.innerHTML;
            submitBtn.innerHTML = `
                <span class="spinner-border spinner-border-sm me-2" role="status"></span>
                İşleniyor...
            `;
            
            // Re-enable button after 10 seconds (safety)
            setTimeout(() => {
                submitBtn.disabled = false;
                submitBtn.innerHTML = originalText;
            }, 10000);
        }
    });
    
    // Enhanced form controls
    const formControls = document.querySelectorAll('.form-control, .form-select');
    formControls.forEach(control => {
        control.addEventListener('focus', function() {
            this.style.transform = 'scale(1.01)';
            this.style.boxShadow = '0 0 0 3px rgba(102, 126, 234, 0.15)';
        });
        
        control.addEventListener('blur', function() {
            this.style.transform = 'scale(1)';
            this.style.boxShadow = '';
        });
    });
}

// Toast Notification System
function showToast(message, type = 'info', duration = 3000) {
    // Remove existing toasts
    const existingToasts = document.querySelectorAll('.custom-toast');
    existingToasts.forEach(toast => toast.remove());
    
    // Create toast
    const toast = document.createElement('div');
    toast.className = `custom-toast position-fixed top-0 end-0 m-3 p-3 rounded-3 text-white fw-medium`;
    toast.style.cssText = `
        z-index: 9999;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        transform: translateX(100%);
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        min-width: 300px;
        backdrop-filter: blur(10px);
    `;
    
    // Set background based on type
    if (type === 'success') {
        toast.style.background = 'linear-gradient(135deg, #4facfe 0%, #00f2fe 100%)';
    } else if (type === 'error') {
        toast.style.background = 'linear-gradient(135deg, #f093fb 0%, #f5576c 100%)';
    }
    
    toast.innerHTML = `
        <div class="d-flex align-items-center">
            <i class="bi bi-check-circle-fill me-2"></i>
            <span>${message}</span>
            <button type="button" class="btn-close btn-close-white ms-auto" onclick="this.parentElement.parentElement.remove()"></button>
        </div>
    `;
    
    document.body.appendChild(toast);
    
    // Animate in
    requestAnimationFrame(() => {
        toast.style.transform = 'translateX(0)';
    });
    
    // Auto remove
    setTimeout(() => {
        toast.style.transform = 'translateX(100%)';
        setTimeout(() => toast.remove(), 300);
    }, duration);
}

// Utility Functions
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

// Add CSS for ripple animation
const style = document.createElement('style');
style.textContent = `
    @keyframes ripple {
        to {
            transform: scale(4);
            opacity: 0;
        }
    }
    
    .custom-toast {
        font-family: 'Inter', sans-serif;
    }
`;
document.head.appendChild(style);

// Initialize navigation active states
function setActiveNavigation() {
    const currentPath = window.location.pathname;
    const navLinks = document.querySelectorAll('.navbar-nav .nav-link');
    
    navLinks.forEach(link => {
        const href = link.getAttribute('href');
        if (href && currentPath.includes(href) && href !== '/') {
            link.classList.add('active');
        } else if (href === '/' && currentPath === '/') {
            link.classList.add('active');
        }
    });
}

// Call on page load
setActiveNavigation(); 