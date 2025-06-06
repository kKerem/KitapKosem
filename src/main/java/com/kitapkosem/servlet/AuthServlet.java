package com.kitapkosem.servlet;

import java.io.IOException;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.kitapkosem.dao.UserDAO;
import com.kitapkosem.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AuthServlet extends HttpServlet {
    private static final Logger logger = LoggerFactory.getLogger(AuthServlet.class);
    private UserDAO userDAO;
    
    @Override
    public void init() throws ServletException {
        logger.info("AuthServlet başlatılıyor...");
        try {
            userDAO = new UserDAO();
            logger.info("AuthServlet başarıyla başlatıldı");
        } catch (Exception e) {
            logger.error("AuthServlet başlatılırken hata oluştu: ", e);
            // userDAO'yu null bırak, hata olmadan devam et
            userDAO = null;
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String path = request.getServletPath();
        logger.info("GET isteği için path: {}", path);
        
        try {
            switch (path) {
                case "/login":
                    request.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(request, response);
                    break;
                case "/register":
                    request.getRequestDispatcher("/WEB-INF/views/user/register.jsp").forward(request, response);
                    break;
                case "/logout":
                    HttpSession session = request.getSession(false);
                    if (session != null) {
                        session.invalidate();
                    }
                    response.sendRedirect(request.getContextPath() + "/");
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (Exception e) {
            logger.error("doGet içinde hata oluştu: ", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String path = request.getServletPath();
        logger.info("POST isteği için path: {}", path);
        
        try {
            switch (path) {
                case "/login":
                    handleLogin(request, response);
                    break;
                case "/register":
                    handleRegister(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (Exception e) {
            logger.error("doPost içinde hata oluştu: ", e);
            request.setAttribute("error", "Sistem hatası oluştu. Lütfen tekrar deneyin.");
            if ("/login".equals(path)) {
                request.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("/WEB-INF/views/user/register.jsp").forward(request, response);
            }
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        logger.info("Kullanıcı adı ile giriş denemesi: {}", username);
        
        if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("error", "Kullanıcı adı ve şifre boş olamaz!");
            request.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(request, response);
            return;
        }
        
        try {
            if (userDAO != null) {
                User user = userDAO.getUserByUsername(username);
                if (user != null && password.equals(user.getPassword())) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    logger.info("Başarılı giriş: {}", username);
                    response.sendRedirect(request.getContextPath() + "/");
                    return;
                }
            }
            
            // Giriş başarısız
            logger.warn("Başarısız giriş denemesi: {}", username);
            request.setAttribute("error", "Geçersiz kullanıcı adı veya şifre!");
            request.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(request, response);
            
        } catch (SQLException e) {
            logger.error("Veritabanı hatası (giriş sırasında)", e);
            request.setAttribute("error", "Sistem hatası oluştu. Lütfen tekrar deneyin.");
            request.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(request, response);
        }
    }

    private void handleRegister(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        
        logger.info("Kayıt denemesi - kullanıcı adı: {}, e-posta: {}", username, email);
        
        // Validasyon
        if (username == null || email == null || password == null || confirmPassword == null ||
            username.trim().isEmpty() || email.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("error", "Tüm alanları doldurunuz!");
            request.getRequestDispatcher("/WEB-INF/views/user/register.jsp").forward(request, response);
            return;
        }
        
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Şifreler eşleşmiyor!");
            request.getRequestDispatcher("/WEB-INF/views/user/register.jsp").forward(request, response);
            return;
        }
        
        try {
            if (userDAO != null) {
                // E-posta kontrolü
                if (userDAO.isEmailExists(email)) {
                    request.setAttribute("error", "Bu e-posta adresi zaten kayıtlı!");
                    request.getRequestDispatcher("/WEB-INF/views/user/register.jsp").forward(request, response);
                    return;
                }
                
                // Kullanıcı adı kontrolü
                if (userDAO.isUsernameExists(username)) {
                    request.setAttribute("error", "Bu kullanıcı adı zaten alınmış!");
                    request.getRequestDispatcher("/WEB-INF/views/user/register.jsp").forward(request, response);
                    return;
                }
                
                // Yeni kullanıcı oluştur
                User newUser = new User();
                newUser.setUsername(username.trim());
                newUser.setEmail(email.trim());
                newUser.setPassword(password);
                newUser.setRole("user");
                
                userDAO.addUser(newUser);
                logger.info("New user registered successfully: {}", username);
                
                // Başarı mesajı ile login sayfasına yönlendir
                HttpSession session = request.getSession();
                session.setAttribute("success", "Kayıt başarılı! Şimdi giriş yapabilirsiniz.");
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                request.setAttribute("error", "Sistem şu anda kayıt alamıyor. Lütfen daha sonra tekrar deneyin.");
                request.getRequestDispatcher("/WEB-INF/views/user/register.jsp").forward(request, response);
            }
            
        } catch (SQLException e) {
            logger.error("Veritabanı hatası (kayıt sırasında)", e);
            request.setAttribute("error", "Kayıt sırasında hata oluştu. Lütfen tekrar deneyin.");
            request.getRequestDispatcher("/WEB-INF/views/user/register.jsp").forward(request, response);
        }
    }
} 