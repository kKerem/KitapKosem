package com.kitapkosem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kitapkosem.model.Book;
import com.kitapkosem.util.DatabaseManager;

public class FavoriteDAO {
    
    public void addToFavorites(Long userId, Long bookId) throws SQLException {
        String sql = "INSERT OR IGNORE INTO favorites (user_id, book_id, created_at) VALUES (?, ?, CURRENT_TIMESTAMP)";
        
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setLong(1, userId);
            pstmt.setLong(2, bookId);
            pstmt.executeUpdate();
        }
    }
    
    public void removeFromFavorites(Long userId, Long bookId) throws SQLException {
        String sql = "DELETE FROM favorites WHERE user_id = ? AND book_id = ?";
        
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setLong(1, userId);
            pstmt.setLong(2, bookId);
            pstmt.executeUpdate();
        }
    }
    
    public boolean isFavorite(Long userId, Long bookId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM favorites WHERE user_id = ? AND book_id = ?";
        
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setLong(1, userId);
            pstmt.setLong(2, bookId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next() && rs.getInt(1) > 0;
            }
        }
    }
    
    public List<Book> getUserFavoriteBooks(Long userId) throws SQLException {
        List<Book> favoriteBooks = new ArrayList<>();
        String sql = """
            SELECT b.*, u.username as added_by_username 
            FROM favorites f 
            JOIN books b ON f.book_id = b.id 
            LEFT JOIN users u ON b.user_id = u.id
            WHERE f.user_id = ? 
            ORDER BY f.created_at DESC
        """;
        
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setLong(1, userId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Book book = new Book();
                    book.setId(rs.getLong("id"));
                    book.setTitle(rs.getString("title"));
                    book.setAuthor(rs.getString("author"));
                    book.setDescription(rs.getString("description"));
                    book.setPublicationYear(rs.getInt("publication_year"));
                    book.setRating(rs.getDouble("rating"));
                    book.setReviewCount(rs.getInt("review_count"));
                    book.setUserId(rs.getLong("user_id"));
                    book.setCoverImage(rs.getString("cover_image"));
                    book.setCreatedAt(rs.getTimestamp("created_at"));
                    book.setAddedByUsername(rs.getString("added_by_username"));
                    favoriteBooks.add(book);
                }
            }
        }
        return favoriteBooks;
    }
    
    public int getUserFavoriteCount(Long userId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM favorites WHERE user_id = ?";
        
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setLong(1, userId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next() ? rs.getInt(1) : 0;
            }
        }
    }
} 