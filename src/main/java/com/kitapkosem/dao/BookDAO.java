package com.kitapkosem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kitapkosem.model.Book;
import com.kitapkosem.util.DatabaseManager;

public class BookDAO {
    
    public void addBook(Book book) throws SQLException {
        String sql = """
            INSERT INTO books (title, author, description, publication_year, 
                             user_id, created_at, rating, review_count, cover_image)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        """;
        
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            pstmt.setString(1, book.getTitle());
            pstmt.setString(2, book.getAuthor());
            pstmt.setString(3, book.getDescription());
            pstmt.setInt(4, book.getPublicationYear());
            pstmt.setLong(5, book.getUserId());
            pstmt.setTimestamp(6, book.getCreatedAt());
            pstmt.setDouble(7, 0.0);
            pstmt.setInt(8, 0);
            pstmt.setString(9, book.getCoverImage());
            
            pstmt.executeUpdate();
            
            try (ResultSet rs = pstmt.getGeneratedKeys()) {
                if (rs.next()) {
                    book.setId(rs.getLong(1));
                }
            }
        }
    }
    
    public Book getBookById(Long id) throws SQLException {
        System.out.println("Gösterilen kitap ID: " + id);
        
        String sql = "SELECT b.*, u.username as added_by_username FROM books b LEFT JOIN users u ON b.user_id = u.id WHERE b.id = ?";
        
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setLong(1, id);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Book book = mapResultSetToBook(rs);
                    book.setAddedByUsername(rs.getString("added_by_username"));
                    System.out.println("Kitap Adı: " + book.getTitle() + ", Değerlendirme: " + book.getRating() + ", Yorum: " + book.getReviewCount());
                    return book;
                }
            }
        }
        System.out.println("Book not found with ID: " + id);
        return null;
    }
    
    public List<Book> getAllBooks() throws SQLException {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books ORDER BY created_at DESC";
        
        try (Connection conn = DatabaseManager.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                books.add(mapResultSetToBook(rs));
            }
        }
        return books;
    }
    
    public List<Book> getAllBooks(String sort) throws SQLException {
        String orderBy = getOrderByClause(sort);
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books " + orderBy;
        try (Connection conn = DatabaseManager.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                books.add(mapResultSetToBook(rs));
            }
        }
        return books;
    }
    
    private Book mapResultSetToBook(ResultSet rs) throws SQLException {
        Book book = new Book();
        book.setId(rs.getLong("id"));
        book.setTitle(rs.getString("title"));
        book.setAuthor(rs.getString("author"));
        book.setDescription(rs.getString("description"));
        book.setPublicationYear(rs.getInt("publication_year"));
        book.setRating(rs.getDouble("rating"));
        book.setReviewCount(rs.getInt("review_count"));
        book.setUserId(rs.getLong("user_id"));
        book.setCreatedAt(rs.getTimestamp("created_at"));
        book.setCoverImage(rs.getString("cover_image"));
        book.setCategory(rs.getString("category"));
        book.setIsbn(rs.getString("isbn"));
        book.setTranslator(rs.getString("translator"));
        book.setPublisher(rs.getString("publisher"));
        book.setPageCount(rs.getInt("page_count"));
        book.setDimensions(rs.getString("dimensions"));
        book.setFirstPublicationYear(rs.getInt("first_publication_year"));
        book.setEdition(rs.getString("edition"));
        book.setLanguage(rs.getString("language"));
        return book;
    }

    public void updateBookRating(Long bookId) throws SQLException {
        System.out.println("Updating rating for book: " + bookId);
        
        String statsSql = """
            SELECT AVG(rating) as avg_rating, COUNT(*) as review_count 
            FROM reviews 
            WHERE book_id = ?
        """;
        
        double newRating = 0.0;
        int newReviewCount = 0;
        
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(statsSql)) {
            
            pstmt.setLong(1, bookId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    newRating = rs.getDouble("avg_rating");
                    newReviewCount = rs.getInt("review_count");
                }
            }
        }
        
        System.out.println("New rating stats - Rating: " + newRating + ", Reviews: " + newReviewCount);
        
        String updateSql = "UPDATE books SET rating = ?, review_count = ? WHERE id = ?";
        
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(updateSql)) {
            
            pstmt.setDouble(1, newRating);
            pstmt.setInt(2, newReviewCount);
            pstmt.setLong(3, bookId);
            
            int result = pstmt.executeUpdate();
            System.out.println("Book rating updated. Rows affected: " + result);
        }
    }

    public List<Book> searchBooks(String query) throws SQLException {
        List<Book> books = new ArrayList<>();
        String sql = """
            SELECT * FROM books 
            WHERE LOWER(title) LIKE ? 
               OR LOWER(author) LIKE ? 
               OR LOWER(description) LIKE ?
            ORDER BY created_at DESC
        """;
        
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            String searchPattern = "%" + query.toLowerCase() + "%";
            pstmt.setString(1, searchPattern);
            pstmt.setString(2, searchPattern);
            pstmt.setString(3, searchPattern);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    books.add(mapResultSetToBook(rs));
                }
            }
        }
        return books;
    }

    public List<Book> searchBooks(String query, String sort) throws SQLException {
        String orderBy = getOrderByClause(sort);
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books WHERE LOWER(title) LIKE ? OR LOWER(author) LIKE ? OR LOWER(description) LIKE ? " + orderBy;
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            String searchPattern = "%" + query.toLowerCase() + "%";
            pstmt.setString(1, searchPattern);
            pstmt.setString(2, searchPattern);
            pstmt.setString(3, searchPattern);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    books.add(mapResultSetToBook(rs));
                }
            }
        }
        return books;
    }

    private String getOrderByClause(String sort) {
        if (sort == null) return "ORDER BY created_at DESC";
        switch (sort) {
            case "rating":
                return "ORDER BY rating DESC, review_count DESC, created_at DESC";
            case "title":
                return "ORDER BY title COLLATE NOCASE ASC, created_at DESC";
            case "year":
                return "ORDER BY publication_year DESC, created_at DESC";
            case "newest":
            default:
                return "ORDER BY created_at DESC";
        }
    }

    public List<Book> getFeaturedBooks() throws SQLException {
        List<Book> books = new ArrayList<>();
        String sql = """
            SELECT * FROM books 
            ORDER BY (rating * review_count) DESC, created_at DESC 
            LIMIT 6
        """;
        
        try (Connection conn = DatabaseManager.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                books.add(mapResultSetToBook(rs));
            }
        }
        return books;
    }

    public int getTotalBooks() throws SQLException {
        String sql = "SELECT COUNT(*) FROM books";
        
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return 0;
    }

    public void updateBook(Book book) throws SQLException {
        String sql = "UPDATE books SET title=?, author=?, description=?, publication_year=?, category=?, isbn=?, translator=?, publisher=?, page_count=?, dimensions=?, first_publication_year=?, edition=?, language=?, cover_image=? WHERE id=?";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, book.getTitle());
            pstmt.setString(2, book.getAuthor());
            pstmt.setString(3, book.getDescription());
            pstmt.setInt(4, book.getPublicationYear());
            pstmt.setString(5, book.getCategory());
            pstmt.setString(6, book.getIsbn());
            pstmt.setString(7, book.getTranslator());
            pstmt.setString(8, book.getPublisher());
            if (book.getPageCount() != null) {
                pstmt.setInt(9, book.getPageCount());
            } else {
                pstmt.setNull(9, java.sql.Types.INTEGER);
            }
            pstmt.setString(10, book.getDimensions());
            if (book.getFirstPublicationYear() != null) {
                pstmt.setInt(11, book.getFirstPublicationYear());
            } else {
                pstmt.setNull(11, java.sql.Types.INTEGER);
            }
            pstmt.setString(12, book.getEdition());
            pstmt.setString(13, book.getLanguage());
            pstmt.setString(14, book.getCoverImage());
            pstmt.setLong(15, book.getId());
            pstmt.executeUpdate();
        }
    }
} 