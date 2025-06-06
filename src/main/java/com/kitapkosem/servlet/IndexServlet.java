package com.kitapkosem.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.kitapkosem.dao.BookDAO;
import com.kitapkosem.dao.ReviewDAO;
import com.kitapkosem.dao.UserDAO;
import com.kitapkosem.model.Book;
import com.kitapkosem.model.Review;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class IndexServlet extends HttpServlet {
    private BookDAO bookDAO;
    private ReviewDAO reviewDAO;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        bookDAO = new BookDAO();
        reviewDAO = new ReviewDAO();
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String requestURI = request.getRequestURI();
        
        // Static kaynakları default servlet'e yönlendir
        if (requestURI.startsWith(request.getContextPath() + "/resources/")) {
            RequestDispatcher rd = request.getServletContext().getNamedDispatcher("default");
            rd.forward(request, response);
            return;
        }
        
        // Normal index servlet logic...
        try {
            // Öne çıkan kitapları al
            List<Book> featuredBooks = bookDAO.getFeaturedBooks();
            request.setAttribute("featuredBooks", featuredBooks);

            // Son yorumları al
            List<Review> latestReviews = reviewDAO.getLatestReviews(6);
            request.setAttribute("latestReviews", latestReviews);

            // İstatistikleri al
            int totalBooks = bookDAO.getTotalBooks();
            int totalUsers = userDAO.getTotalUsers();
            int totalReviews = reviewDAO.getTotalReviews();

            request.setAttribute("totalBooks", totalBooks);
            request.setAttribute("totalUsers", totalUsers);
            request.setAttribute("totalReviews", totalReviews);

            request.getRequestDispatcher("/index.jsp").forward(request, response);
            
        } catch (SQLException e) {
            throw new ServletException("Veritabanı hatası oluştu", e);
        }
    }
} 