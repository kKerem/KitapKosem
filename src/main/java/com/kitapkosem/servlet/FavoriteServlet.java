package com.kitapkosem.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.kitapkosem.dao.BookDAO;
import com.kitapkosem.dao.FavoriteDAO;
import com.kitapkosem.model.Book;
import com.kitapkosem.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class FavoriteServlet extends HttpServlet {
    private static final Logger logger = LoggerFactory.getLogger(FavoriteServlet.class);
    private FavoriteDAO favoriteDAO;
    private BookDAO bookDAO;
    
    @Override
    public void init() throws ServletException {
        favoriteDAO = new FavoriteDAO();
        bookDAO = new BookDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        try {
            List<Book> favoriteBooks = favoriteDAO.getUserFavoriteBooks(user.getId());
            request.setAttribute("favoriteBooks", favoriteBooks);
            request.getRequestDispatcher("/WEB-INF/views/user/favorites.jsp").forward(request, response);
        } catch (SQLException e) {
            logger.error("Favori kitaplar alınırken hata oluştu", e);
            throw new ServletException("Favoriler yüklenirken hata oluştu", e);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }
        
        String action = request.getParameter("action");
        String bookIdStr = request.getParameter("bookId");
        
        if (action == null || bookIdStr == null || bookIdStr.trim().isEmpty()) {
            logger.error("Kitap ID parametresi eksik veya boş!");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.setContentType("application/json");
            response.getWriter().write("{\"status\":\"error\",\"message\":\"Kitap ID eksik!\"}");
            return;
        }
        
        Long bookId = null;
        try {
            bookId = Long.parseLong(bookIdStr);
        } catch (NumberFormatException e) {
            logger.error("Geçersiz kitap ID formatı", e);
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.setContentType("application/json");
            response.getWriter().write("{\"status\":\"error\",\"message\":\"Geçersiz kitap ID!\"}");
            return;
        }
        
        try {
            if ("toggle".equals(action)) {
                boolean isCurrentlyFavorite = favoriteDAO.isFavorite(user.getId(), bookId);
                
                if (isCurrentlyFavorite) {
                    favoriteDAO.removeFromFavorites(user.getId(), bookId);
                    response.getWriter().write("{\"status\":\"removed\",\"message\":\"Favorilerden çıkarıldı\"}");
                } else {
                    favoriteDAO.addToFavorites(user.getId(), bookId);
                    response.getWriter().write("{\"status\":\"added\",\"message\":\"Favorilere eklendi\"}");
                }
                
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.setContentType("application/json");
                response.getWriter().write("{\"status\":\"error\",\"message\":\"Geçersiz işlem\"}");
            }
        } catch (SQLException e) {
            logger.error("Favori işlemi sırasında hata oluştu", e);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.setContentType("application/json");
            response.getWriter().write("{\"status\":\"error\",\"message\":\"Favori işlemi sırasında hata oluştu\"}");
        }
    }
} 