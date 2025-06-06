package com.kitapkosem.servlet;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PagesServlet extends HttpServlet {
    private static final Logger logger = LoggerFactory.getLogger(PagesServlet.class);
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String pathInfo = request.getPathInfo();
        logger.debug("Handling static page request: {}", pathInfo);
        logger.debug("Statik sayfa isteği işleniyor: {}", pathInfo);
        
        try {
            switch (pathInfo) {
                case "/help":
                    request.getRequestDispatcher("/WEB-INF/views/pages/help.jsp").forward(request, response);
                    break;
                case "/contact":
                    request.getRequestDispatcher("/WEB-INF/views/pages/contact.jsp").forward(request, response);
                    break;
                case "/faq":
                    request.getRequestDispatcher("/WEB-INF/views/pages/faq.jsp").forward(request, response);
                    break;
                case "/feedback":
                    request.getRequestDispatcher("/WEB-INF/views/pages/feedback.jsp").forward(request, response);
                    break;
                case "/privacy":
                    request.getRequestDispatcher("/WEB-INF/views/pages/privacy.jsp").forward(request, response);
                    break;
                case "/terms":
                    request.getRequestDispatcher("/WEB-INF/views/pages/terms.jsp").forward(request, response);
                    break;
                case "/about":
                    request.getRequestDispatcher("/WEB-INF/views/pages/about.jsp").forward(request, response);
                    break;
                case "/developers":
                    request.getRequestDispatcher("/WEB-INF/views/pages/developers.jsp").forward(request, response);
                    break;
                default:
                    logger.warn("Bilinmeyen sayfa istendi: {}", pathInfo);
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    break;
            }
        } catch (Exception e) {
            logger.error("Statik sayfa sunulurken hata oluştu: " + pathInfo, e);
            throw new ServletException("Sayfa yüklenirken hata oluştu", e);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String pathInfo = request.getPathInfo();
        
        if ("/contact".equals(pathInfo)) {
            handleContactForm(request, response);
        } else if ("/feedback".equals(pathInfo)) {
            handleFeedbackForm(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        }
    }
    
    private void handleContactForm(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        
        logger.info("İletişim formu gönderildi - İsim: {}, E-posta: {}, Konu: {}", name, email, subject);
        
        // Here you would typically save to database or send email
        // For now, we'll just show a success message
        
        request.getSession().setAttribute("success", "Mesajınız başarıyla gönderildi. En kısa sürede size dönüş yapacağız.");
        response.sendRedirect(request.getContextPath() + "/pages/contact");
    }
    
    private void handleFeedbackForm(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String feedbackType = request.getParameter("feedbackType");
        String rating = request.getParameter("rating");
        String comment = request.getParameter("comment");
        
        logger.info("Geri bildirim gönderildi - Tür: {}, Puan: {}", feedbackType, rating);
        
        // Here you would typically save to database
        // For now, we'll just show a success message
        
        request.getSession().setAttribute("success", "Geri bildiriminiz için teşekkür ederiz! Değerlendirmeniz bizim için çok önemli.");
        response.sendRedirect(request.getContextPath() + "/pages/feedback");
    }
} 