package com.kitapkosem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kitapkosem.model.Review;
import com.kitapkosem.util.DatabaseManager;

public class ReviewDAO {
    
    public void addReview(Long bookId, Long userId, int rating, String comment, int recommendationPercentage) throws SQLException {
        System.out.println("\n=== Adding review - BookID: " + bookId + ", UserID: " + userId + " ===");
        
        String sql = """
            INSERT INTO reviews (book_id, user_id, rating, comment, recommendation_percentage, created_at, updated_at) 
            VALUES (?, ?, ?, ?, ?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
            ON CONFLICT(book_id, user_id) DO UPDATE SET 
                rating = excluded.rating,
                comment = excluded.comment,
                recommendation_percentage = excluded.recommendation_percentage,
                updated_at = CURRENT_TIMESTAMP
        """;
        System.out.println("Executing SQL: " + sql);
        
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setLong(1, bookId);
            pstmt.setLong(2, userId);
            pstmt.setInt(3, rating);
            pstmt.setString(4, comment);
            pstmt.setInt(5, recommendationPercentage);
            
            int result = pstmt.executeUpdate();
            System.out.println("Review added successfully. Rows affected: " + result);
        }
    }
    
    // Backward compatibility method
    public void addReview(Long bookId, Long userId, int rating, String comment) throws SQLException {
        addReview(bookId, userId, rating, comment, 50); // Default 50% recommendation
    }

    public List<Review> getReviewsByBookId(Long bookId) throws SQLException {
        List<Review> reviews = new ArrayList<>();
        String sql = """
            SELECT r.*, u.username 
            FROM reviews r 
            JOIN users u ON r.user_id = u.id 
            WHERE r.book_id = ? 
            ORDER BY r.created_at DESC
        """;
        
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setLong(1, bookId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Review review = new Review();
                    review.setId(rs.getLong("id"));
                    review.setBookId(rs.getLong("book_id"));
                    review.setUserId(rs.getLong("user_id"));
                    review.setUsername(rs.getString("username"));
                    review.setRating(rs.getInt("rating"));
                    review.setComment(rs.getString("comment"));
                    review.setRecommendationPercentage(rs.getInt("recommendation_percentage"));
                    review.setCreatedAt(rs.getTimestamp("created_at"));
                    review.setUpdatedAt(rs.getTimestamp("updated_at"));
                    reviews.add(review);
                }
            }
        }
        return reviews;
    }

    public List<Review> getLatestReviews(int limit) throws SQLException {
        List<Review> reviews = new ArrayList<>();
        String sql = """
            SELECT r.*, u.username, b.title as book_title
            FROM reviews r 
            JOIN users u ON r.user_id = u.id 
            JOIN books b ON r.book_id = b.id
            ORDER BY r.created_at DESC 
            LIMIT ?
        """;
        
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, limit);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Review review = new Review();
                    review.setId(rs.getLong("id"));
                    review.setBookId(rs.getLong("book_id"));
                    review.setUserId(rs.getLong("user_id"));
                    review.setUsername(rs.getString("username"));
                    review.setBookTitle(rs.getString("book_title"));
                    review.setRating(rs.getInt("rating"));
                    review.setComment(rs.getString("comment"));
                    review.setRecommendationPercentage(rs.getInt("recommendation_percentage"));
                    review.setCreatedAt(rs.getTimestamp("created_at"));
                    review.setUpdatedAt(rs.getTimestamp("updated_at"));
                    reviews.add(review);
                }
            }
        }
        return reviews;
    }

    public List<Review> getUserReviews(Long userId) throws SQLException {
        List<Review> reviews = new ArrayList<>();
        String sql = """
            SELECT r.*, u.username, b.title as book_title, b.author
            FROM reviews r 
            JOIN users u ON r.user_id = u.id 
            JOIN books b ON r.book_id = b.id
            WHERE r.user_id = ?
            ORDER BY r.created_at DESC
        """;
        
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setLong(1, userId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Review review = new Review();
                    review.setId(rs.getLong("id"));
                    review.setBookId(rs.getLong("book_id"));
                    review.setUserId(rs.getLong("user_id"));
                    review.setUsername(rs.getString("username"));
                    review.setBookTitle(rs.getString("book_title"));
                    review.setRating(rs.getInt("rating"));
                    review.setComment(rs.getString("comment"));
                    review.setRecommendationPercentage(rs.getInt("recommendation_percentage"));
                    review.setCreatedAt(rs.getTimestamp("created_at"));
                    review.setUpdatedAt(rs.getTimestamp("updated_at"));
                    reviews.add(review);
                }
            }
        }
        return reviews;
    }

    public void deleteReview(Long reviewId, Long userId) throws SQLException {
        String sql;
        if (userId == null) {
            sql = "DELETE FROM reviews WHERE id = ?";
        } else {
            sql = "DELETE FROM reviews WHERE id = ? AND user_id = ?";
        }
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setLong(1, reviewId);
            if (userId != null) {
                pstmt.setLong(2, userId);
            }
            pstmt.executeUpdate();
        }
    }

    public Review getReviewById(Long reviewId) throws SQLException {
        String sql = """
            SELECT r.*, u.username, b.title as book_title
            FROM reviews r 
            JOIN users u ON r.user_id = u.id 
            JOIN books b ON r.book_id = b.id
            WHERE r.id = ?
        """;
        
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setLong(1, reviewId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Review review = new Review();
                    review.setId(rs.getLong("id"));
                    review.setBookId(rs.getLong("book_id"));
                    review.setUserId(rs.getLong("user_id"));
                    review.setUsername(rs.getString("username"));
                    review.setBookTitle(rs.getString("book_title"));
                    review.setRating(rs.getInt("rating"));
                    review.setComment(rs.getString("comment"));
                    review.setRecommendationPercentage(rs.getInt("recommendation_percentage"));
                    review.setCreatedAt(rs.getTimestamp("created_at"));
                    review.setUpdatedAt(rs.getTimestamp("updated_at"));
                    return review;
                }
            }
        }
        return null;
    }

    public void updateReview(Long reviewId, Long userId, int rating, String comment, int recommendationPercentage) throws SQLException {
        String sql;
        if (userId == null) {
            sql = """
                UPDATE reviews 
                SET rating = ?, comment = ?, recommendation_percentage = ?, updated_at = CURRENT_TIMESTAMP 
                WHERE id = ?
            """;
        } else {
            sql = """
                UPDATE reviews 
                SET rating = ?, comment = ?, recommendation_percentage = ?, updated_at = CURRENT_TIMESTAMP 
                WHERE id = ? AND user_id = ?
            """;
        }
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, rating);
            pstmt.setString(2, comment);
            pstmt.setInt(3, recommendationPercentage);
            pstmt.setLong(4, reviewId);
            if (userId != null) {
                pstmt.setLong(5, userId);
            }
            pstmt.executeUpdate();
        }
    }

    public int getTotalReviews() throws SQLException {
        String sql = "SELECT COUNT(*) FROM reviews";
        
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }
    
    // Alias method for backward compatibility
    public List<Review> getBookReviews(Long bookId) throws SQLException {
        return getReviewsByBookId(bookId);
    }
} 