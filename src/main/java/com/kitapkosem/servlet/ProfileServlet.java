package com.kitapkosem.servlet;

import java.io.IOException;
import java.util.List;

import com.kitapkosem.dao.BookDAO;
import com.kitapkosem.dao.FavoriteDAO;
import com.kitapkosem.dao.ReviewDAO;
import com.kitapkosem.model.Book;
import com.kitapkosem.model.Review;
import com.kitapkosem.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ProfileServlet extends HttpServlet {
    private ReviewDAO reviewDAO;
    private FavoriteDAO favoriteDAO;
    private BookDAO bookDAO;

    @Override
    public void init() throws ServletException {
        reviewDAO = new ReviewDAO();
        favoriteDAO = new FavoriteDAO();
        bookDAO = new BookDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            // Kullanıcı giriş yapmamışsa login sayfasına yönlendir
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        try {
            // Kullanıcıya ait değerlendirmeler
            List<Review> userReviews = reviewDAO.getUserReviews(user.getId());
            request.setAttribute("userReviews", userReviews);

            // Favori kitaplar ve sayısı
            List<Book> favoriteBooks = favoriteDAO.getUserFavoriteBooks(user.getId());
            int favoriteCount = favoriteDAO.getUserFavoriteCount(user.getId());
            request.setAttribute("favoriteBooks", favoriteBooks);
            request.setAttribute("favoriteCount", favoriteCount);

            // Eklenen kitap sayısı
            List<Book> userBooks = getUserBooks(user.getId());
            int userBooksCount = userBooks != null ? userBooks.size() : 0;
            request.setAttribute("userBooksCount", userBooksCount);

            // Ortalama puan
            double averageRating = 0.0;
            if (userReviews != null && !userReviews.isEmpty()) {
                int total = 0;
                for (Review r : userReviews) total += r.getRating();
                averageRating = (double) total / userReviews.size();
            }
            request.setAttribute("averageRating", String.format("%.2f", averageRating));
        } catch (Exception e) {
            throw new ServletException("Profil verileri yüklenirken hata oluştu", e);
        }
        
        request.setAttribute("user", user);
        request.getRequestDispatcher("/WEB-INF/views/user/profile.jsp").forward(request, response);
    }

    // Kullanıcının eklediği kitapları döndürür
    private List<Book> getUserBooks(Long userId) throws Exception {
        List<Book> allBooks = bookDAO.getAllBooks();
        List<Book> userBooks = new java.util.ArrayList<>();
        for (Book b : allBooks) {
            if (b.getUserId() != null && b.getUserId().equals(userId)) {
                userBooks.add(b);
            }
        }
        return userBooks;
    }
} 