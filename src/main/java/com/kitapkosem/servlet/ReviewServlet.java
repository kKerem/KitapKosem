package com.kitapkosem.servlet;

import java.io.IOException;
import java.sql.SQLException;

import com.kitapkosem.dao.ReviewDAO;
import com.kitapkosem.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReviewDAO reviewDAO;

    public void init() {
        reviewDAO = new ReviewDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        System.out.println("\n=== ReviewServlet.doPost() started ===");
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            System.out.println("User not logged in - redirecting to login");
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");
        try {
            if ("delete".equals(action)) {
                // Yorum silme
                Long reviewId = Long.parseLong(request.getParameter("reviewId"));
                // Sadece yorumu yazan kullanıcı veya admin silebilir
                if (user.getRole() != null && user.getRole().equals("admin")) {
                    reviewDAO.deleteReview(reviewId, null); // admin için userId null gönder
                } else {
                    reviewDAO.deleteReview(reviewId, user.getId());
                }
                response.setContentType("application/json");
                response.getWriter().write("{\"status\":\"success\",\"message\":\"Yorum silindi\"}");
                return;
            } else if ("edit".equals(action)) {
                // Yorum düzenleme
                Long reviewId = Long.parseLong(request.getParameter("reviewId"));
                int rating = Integer.parseInt(request.getParameter("rating"));
                String comment = request.getParameter("comment");
                int recommendationPercentage = 50; // opsiyonel, basitlik için sabit
                if (user.getRole() != null && user.getRole().equals("admin")) {
                    // admin için userId null gönder, DAO'da kontrol et
                    reviewDAO.updateReview(reviewId, null, rating, comment, recommendationPercentage);
                } else {
                    reviewDAO.updateReview(reviewId, user.getId(), rating, comment, recommendationPercentage);
                }
                response.setContentType("application/json");
                response.getWriter().write("{\"status\":\"success\",\"message\":\"Yorum güncellendi\"}");
                return;
            }
            // Yorum ekleme (mevcut kod)
            Long bookId = Long.parseLong(request.getParameter("bookId"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment");
            
            System.out.println("Processing review - Book: " + bookId + 
                             ", User: " + user.getId() + 
                             ", Rating: " + rating);

            if (rating < 1 || rating > 5) {
                System.out.println("Invalid rating value: " + rating);
                request.setAttribute("error", "Rating must be between 1 and 5");
                request.getRequestDispatcher("/book?id=" + bookId).forward(request, response);
                return;
            }

            if (comment == null || comment.trim().isEmpty()) {
                System.out.println("Empty comment submitted");
                request.setAttribute("error", "Comment cannot be empty");
                request.getRequestDispatcher("/book?id=" + bookId).forward(request, response);
                return;
            }

            reviewDAO.addReview(bookId, user.getId(), rating, comment.trim());
            System.out.println("Review added successfully");
            
            response.sendRedirect("book?id=" + bookId);
            
        } catch (NumberFormatException e) {
            System.out.println("Error parsing numbers: " + e.getMessage());
            response.sendRedirect("index.jsp");
        } catch (SQLException e) {
            System.out.println("Database error: " + e.getMessage());
            throw new ServletException("Database error", e);
        }
        
        System.out.println("=== ReviewServlet.doPost() completed ===\n");
    }
} 