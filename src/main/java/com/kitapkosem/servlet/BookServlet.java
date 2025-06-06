package com.kitapkosem.servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.kitapkosem.dao.BookDAO;
import com.kitapkosem.dao.ReviewDAO;
import com.kitapkosem.model.Book;
import com.kitapkosem.model.Review;
import com.kitapkosem.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1 MB
    maxFileSize = 1024 * 1024 * 5,   // 5 MB
    maxRequestSize = 1024 * 1024 * 10 // 10 MB
)
public class BookServlet extends HttpServlet {
    private static final Logger logger = LoggerFactory.getLogger(BookServlet.class);
    private BookDAO bookDAO;
    private ReviewDAO reviewDAO;
    private static final String UPLOAD_DIR = "resources" + File.separator + "images" + File.separator + "covers";
    
    @Override
    public void init() throws ServletException {
        logger.info("BookServlet başlatılıyor...");
        bookDAO = new BookDAO();
        reviewDAO = new ReviewDAO();
        
        // Upload dizinini oluştur
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        Path uploadDir = Paths.get(uploadPath);
        
        if (!Files.exists(uploadDir)) {
            try {
                logger.info("Yükleme dizini oluşturuluyor: {}", uploadPath);
                Files.createDirectories(uploadDir);
            } catch (IOException e) {
                logger.error("Yükleme dizini oluşturulamadı", e);
                throw new ServletException("Upload dizini oluşturulamadı", e);
            }
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        logger.debug("GET isteği işleniyor, pathInfo: {}", pathInfo);
        
        try {
            if (pathInfo == null || pathInfo.equals("/")) {
                // Kitap listesi sayfası
                String query = request.getParameter("q");
                String sort = request.getParameter("sort");
                if (sort == null || sort.isEmpty()) sort = "newest";
                List<Book> books;
                
                if (query != null && !query.trim().isEmpty()) {
                    logger.debug("Sorgu ile kitaplar aranıyor: {}", query);
                    books = bookDAO.searchBooks(query.trim(), sort);
                } else {
                    logger.debug("Tüm kitaplar getiriliyor, sıralama: {}", sort);
                    books = bookDAO.getAllBooks(sort);
                }
                request.setAttribute("books", books);
                request.setAttribute("selectedSort", sort);
                logger.debug("{} kitap bulundu", books.size());
                request.getRequestDispatcher("/WEB-INF/views/book/list.jsp").forward(request, response);
            } else if (pathInfo.startsWith("/view/covers/")) {
                // Statik kapak resmi dosyası erişimi
                String fileName = pathInfo.substring("/view/covers/".length());
                logger.debug("Serving cover image: {}", fileName);
                
                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                Path filePath = Paths.get(uploadPath, fileName);
                
                if (Files.exists(filePath) && Files.isRegularFile(filePath)) {
                    // MIME type'ı belirle
                    String mimeType = getServletContext().getMimeType(fileName);
                    if (mimeType == null) {
                        mimeType = "application/octet-stream";
                    }
                    
                    response.setContentType(mimeType);
                    response.setContentLengthLong(Files.size(filePath));
                    
                    // Cache headers
                    response.setHeader("Cache-Control", "public, max-age=31536000"); // 1 yıl
                    response.setDateHeader("Expires", System.currentTimeMillis() + 31536000000L);
                    
                    try {
                        Files.copy(filePath, response.getOutputStream());
                        logger.debug("Kapak resmi başarıyla sunuldu: {}", fileName);
                    } catch (IOException e) {
                        logger.error("Kapak resmi sunulurken hata oluştu: {}", fileName, e);
                        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    }
                } else {
                    logger.warn("Kapak resmi bulunamadı: {}", fileName);
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
                return;
            } else if (pathInfo.startsWith("/view/")) {
                // Kitap detay sayfası (sadece sayısal ID'ler için)
                String[] parts = pathInfo.split("/");
                if (parts.length != 3) {
                    logger.warn("Geçersiz kitap görüntüleme yolu formatı: {}", pathInfo);
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    return;
                }
                
                try {
                    Long bookId = Long.parseLong(parts[2]);
                    logger.debug("Kitap detayları alınıyor, ID: {}", bookId);
                    Book book = bookDAO.getBookById(bookId);
                    
                    if (book == null) {
                        logger.warn("Kitap bulunamadı, ID: {}", bookId);
                        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Kitap bulunamadı");
                        return;
                    }
                    
                    // Kitabın yorumlarını al
                    List<Review> reviews = reviewDAO.getBookReviews(bookId);
                    logger.debug("Kitap için {} yorum bulundu, kitap ID: {}", reviews.size(), bookId);
                    
                    request.setAttribute("book", book);
                    request.setAttribute("reviews", reviews);
                    request.getRequestDispatcher("/WEB-INF/views/book/view.jsp").forward(request, response);
                    
                } catch (NumberFormatException e) {
                    logger.error("Yol içindeki kitap ID formatı geçersiz: {}", pathInfo, e);
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Geçersiz kitap ID");
                }
            } else if ("/add".equals(pathInfo)) {
                // Kitap ekleme formu
                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("user");
                
                if (user == null) {
                    logger.warn("Kitap eklemeye yetkisiz erişim girişimi");
                    response.sendRedirect(request.getContextPath() + "/login");
                    return;
                }
                
                request.getRequestDispatcher("/WEB-INF/views/book/add.jsp").forward(request, response);
            } else if (pathInfo != null && pathInfo.matches("/edit/\\d+")) {
                handleBookEditForm(request, response);
                return;
            } else {
                logger.warn("Eşleşen bir yol bulunamadı: {}", pathInfo);
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (SQLException e) {
            logger.error("GET isteği işlenirken veritabanı hatası", e);
            throw new ServletException("Veritabanı hatası oluştu", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        logger.debug("POST isteği işleniyor, pathInfo: {}", pathInfo);
        
        try {
            if ("/add".equals(pathInfo)) {
                handleBookAdd(request, response);
            } else if (pathInfo != null && pathInfo.matches("/view/\\d+/review")) {
                handleReviewSubmit(request, response);
            } else if (pathInfo != null && pathInfo.matches("/edit/\\d+")) {
                handleBookEdit(request, response);
            } else {
                logger.warn("POST isteği için eşleşen bir yol bulunamadı: {}", pathInfo);
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (Exception e) {
            logger.error("POST isteği işlenirken hata oluştu", e);
            throw new ServletException("İşlem sırasında hata oluştu", e);
        }
    }
    
    private void handleBookAdd(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            logger.warn("Kitap eklemeye yetkisiz erişim girişimi");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String description = request.getParameter("description");
        String publicationYearStr = request.getParameter("publicationYear");
        
        logger.debug("Form parametreleri - Başlık: {}, Yazar: {}, Açıklama uzunluğu: {}, Yıl: {}", 
                    title, author, description != null ? description.length() : 0, publicationYearStr);
        
        if (title == null || title.trim().isEmpty() ||
            author == null || author.trim().isEmpty() ||
            description == null || description.trim().isEmpty() ||
            publicationYearStr == null || publicationYearStr.trim().isEmpty()) {
            
            logger.warn("Kitap ekleme formunda gerekli alanlar eksik");
            request.setAttribute("error", "Tüm alanları doldurunuz.");
            request.getRequestDispatcher("/WEB-INF/views/book/add.jsp").forward(request, response);
            return;
        }
        
        try {
            int publicationYear = Integer.parseInt(publicationYearStr);
            
            // Kapak resmi yükleme - Detaylı debug
            String coverImage = null;
            logger.debug("Kapak resmi yükleme işlemi başlatılıyor...");
            
            try {
                Part filePart = request.getPart("coverImage");
                logger.debug("Dosya parçası alındı: {}", filePart != null ? "BOŞ DEĞİL" : "BOŞ");
                
                if (filePart != null) {
                    logger.debug("Dosya parçası boyutu: {}", filePart.getSize());
                    logger.debug("Dosya parçası içerik tipi: {}", filePart.getContentType());
                    
                    if (filePart.getSize() > 0) {
                        String fileName = filePart.getSubmittedFileName();
                        logger.debug("Orijinal dosya adı: {}", fileName);
                        
                        if (fileName != null && !fileName.trim().isEmpty()) {
                            // Dosya uzantısını güvenli şekilde al
                            String fileExt = "";
                            int dotIndex = fileName.lastIndexOf(".");
                            if (dotIndex > 0 && dotIndex < fileName.length() - 1) {
                                fileExt = fileName.substring(dotIndex);
                            } else {
                                fileExt = ".jpg"; // Varsayılan uzantı
                            }
                            logger.debug("Dosya uzantısı belirlendi: {}", fileExt);
                            
                            String newFileName = "cover_" + UUID.randomUUID().toString() + fileExt;
                            logger.debug("Yeni dosya adı oluşturuldu: {}", newFileName);
                            
                            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                            logger.debug("Yükleme yolu: {}", uploadPath);
                            
                            Path filePath = Paths.get(uploadPath, newFileName);
                            logger.debug("Tam dosya yolu: {}", filePath);
                            
                            // Upload dizininin varlığını kontrol et
                            Path uploadDir = Paths.get(uploadPath);
                            if (!Files.exists(uploadDir)) {
                                logger.info("Yükleme dizini mevcut değil, oluşturuluyor: {}", uploadDir);
                                Files.createDirectories(uploadDir);
                            } else {
                                logger.debug("Yükleme dizini mevcut: {}", uploadDir);
                            }
                            
                            logger.debug("Kapak resmi kaydediliyor: {}", filePath);
                            try (InputStream input = filePart.getInputStream()) {
                                long bytesCopied = Files.copy(input, filePath, StandardCopyOption.REPLACE_EXISTING);
                                logger.info("Kapak resmi başarıyla kaydedildi: {} bayt yazıldı -> {}", bytesCopied, filePath);
                                
                                // Dosyanın gerçekten kaydedildiğini kontrol et
                                if (Files.exists(filePath)) {
                                    long fileSize = Files.size(filePath);
                                    logger.info("Dosya doğrulama: {} mevcut, boyutu {} bayt", filePath, fileSize);
                                    
                                    // Path'i servlet mapping ile uyumlu hale getir
                                    coverImage = "/books/view/covers/" + newFileName;
                                    logger.debug("Kapak resmi yolu veritabanına kaydedildi: {}", coverImage);
                                } else {
                                    logger.error("Dosya başarıyla kaydedilemedi: {}", filePath);
                                }
                            } catch (IOException e) {
                                logger.error("Kapak resmi kaydedilirken hata oluştu: {}", e.getMessage(), e);
                            }
                        } else {
                            logger.debug("Dosya adı boş veya null");
                        }
                    } else {
                        logger.debug("Dosya parçası boyutu 0, dosya yüklenmedi");
                    }
                } else {
                    logger.debug("İstek içinde dosya parçası bulunamadı");
                }
            } catch (ServletException e) {
                logger.error("İstekten dosya parçası alınırken hata oluştu: {}", e.getMessage(), e);
            }
            
            Book book = new Book();
            book.setTitle(title.trim());
            book.setAuthor(author.trim());
            book.setDescription(description.trim());
            book.setPublicationYear(publicationYear);
            book.setUserId(user.getId());
            book.setCoverImage(coverImage);
            
            logger.info("Yeni kitap ekleniyor: {}", book.getTitle());
            bookDAO.addBook(book);
            
            session.setAttribute("success", "Kitap başarıyla eklendi.");
            response.sendRedirect(request.getContextPath() + "/books");
            
        } catch (NumberFormatException e) {
            logger.warn("Yayın yılı formatı geçersiz: {}", publicationYearStr);
            request.setAttribute("error", "Geçersiz yayın yılı.");
            request.getRequestDispatcher("/WEB-INF/views/book/add.jsp").forward(request, response);
        }
    }
    
    private void handleReviewSubmit(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            logger.warn("Yorumu göndermek için yetkisiz erişim girişimi");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        String pathInfo = request.getPathInfo();
        String[] parts = pathInfo.split("/");
        if (parts.length != 4) {
            logger.warn("Yorum gönderimi için yol formatı geçersiz: {}", pathInfo);
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        
        try {
            Long bookId = Long.parseLong(parts[2]);
            Book book = bookDAO.getBookById(bookId);
            
            if (book == null) {
                logger.warn("Yorum gönderiminde kitap bulunamadı, ID: {}", bookId);
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
            
            String ratingStr = request.getParameter("rating");
            String comment = request.getParameter("comment");
            
            if (ratingStr == null || ratingStr.trim().isEmpty() ||
                comment == null || comment.trim().isEmpty()) {
                
                logger.warn("Yorum gönderiminde gerekli alanlar eksik");
                session.setAttribute("error", "Tüm alanları doldurunuz.");
                response.sendRedirect(request.getContextPath() + "/books/view/" + bookId);
                return;
            }
            
            try {
                int rating = Integer.parseInt(ratingStr);
                
                if (rating < 1 || rating > 5) {
                    logger.warn("Geçersiz puan değeri: {}", rating);
                    session.setAttribute("error", "Puan 1-5 arasında olmalıdır.");
                    response.sendRedirect(request.getContextPath() + "/books/view/" + bookId);
                    return;
                }
                
                logger.info("Kitap için yeni yorum ekleniyor, kitap ID: {}", bookId);
                reviewDAO.addReview(bookId, user.getId(), rating, comment.trim());
                bookDAO.updateBookRating(bookId);
                
                session.setAttribute("success", "Değerlendirmeniz başarıyla eklendi.");
                response.sendRedirect(request.getContextPath() + "/books/view/" + bookId);
                
            } catch (NumberFormatException e) {
                logger.warn("Puan formatı geçersiz: {}", ratingStr);
                session.setAttribute("error", "Geçersiz puan değeri.");
                response.sendRedirect(request.getContextPath() + "/books/view/" + bookId);
            }
            
        } catch (NumberFormatException e) {
            logger.error("Yorum gönderim yolunda kitap ID formatı geçersiz: {}", pathInfo, e);
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void handleBookEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }
            String[] parts = request.getPathInfo().split("/");
            Long bookId = Long.parseLong(parts[2]);
            Book book = bookDAO.getBookById(bookId);
            if (book == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
            // Yetki kontrolü
            if (!user.getRole().equals("admin") && !user.getId().equals(book.getUserId())) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "Bu kitabı düzenleme yetkiniz yok.");
                return;
            }
            request.setAttribute("book", book);
            request.getRequestDispatcher("/WEB-INF/views/book/edit.jsp").forward(request, response);
        } catch (SQLException e) {
            // Hata logla ve kullanıcıya hata mesajı göster
            e.printStackTrace();
            request.setAttribute("error", "Veritabanı hatası: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/error/error.jsp").forward(request, response);
        }
    }

    private void handleBookEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        String[] parts = request.getPathInfo().split("/");
        Long bookId = Long.parseLong(parts[2]);
        Book book = null;
        try {
            book = bookDAO.getBookById(bookId);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Veritabanı hatası: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/error/error.jsp").forward(request, response);
            return;
        }
        if (book == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        if (!user.getRole().equals("admin") && !user.getId().equals(book.getUserId())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Bu kitabı düzenleme yetkiniz yok.");
            return;
        }
        // Formdan gelen verilerle güncelle
        book.setTitle(request.getParameter("title"));
        book.setAuthor(request.getParameter("author"));
        book.setDescription(request.getParameter("description"));
        book.setPublicationYear(Integer.parseInt(request.getParameter("publicationYear")));
        book.setCategory(request.getParameter("category"));
        book.setIsbn(request.getParameter("isbn"));
        book.setTranslator(request.getParameter("translator"));
        book.setPublisher(request.getParameter("publisher"));
        String pageCountStr = request.getParameter("pageCount");
        if (pageCountStr != null && !pageCountStr.isEmpty()) {
            try {
                book.setPageCount(Integer.parseInt(pageCountStr));
            } catch (NumberFormatException e) {
                book.setPageCount(null);
            }
        } else {
            book.setPageCount(null);
        }
        book.setDimensions(request.getParameter("dimensions"));
        String firstPubYearStr = request.getParameter("firstPublicationYear");
        if (firstPubYearStr != null && !firstPubYearStr.isEmpty()) {
            try {
                book.setFirstPublicationYear(Integer.parseInt(firstPubYearStr));
            } catch (NumberFormatException e) {
                book.setFirstPublicationYear(null);
            }
        } else {
            book.setFirstPublicationYear(null);
        }
        book.setEdition(request.getParameter("edition"));
        book.setLanguage(request.getParameter("language"));

        // Kapak fotoğrafı işlemleri
        String oldCoverImage = book.getCoverImage();
        String newCoverImage = oldCoverImage;
        try {
            Part filePart = request.getPart("coverImage");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = filePart.getSubmittedFileName();
                String fileExt = ".jpg";
                int dotIndex = fileName.lastIndexOf(".");
                if (dotIndex > 0 && dotIndex < fileName.length() - 1) {
                    fileExt = fileName.substring(dotIndex);
                }
                String newFileName = "cover_" + java.util.UUID.randomUUID().toString() + fileExt;
                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                java.nio.file.Path filePath = java.nio.file.Paths.get(uploadPath, newFileName);
                java.nio.file.Path uploadDir = java.nio.file.Paths.get(uploadPath);
                if (!java.nio.file.Files.exists(uploadDir)) {
                    java.nio.file.Files.createDirectories(uploadDir);
                }
                try (InputStream input = filePart.getInputStream()) {
                    java.nio.file.Files.copy(input, filePath, java.nio.file.StandardCopyOption.REPLACE_EXISTING);
                }
                newCoverImage = "/books/view/covers/" + newFileName;
            } else {
                // Kullanıcı kapağı kaldırmak istiyorsa (input boş ve eski kapak varsa)
                String removeCover = request.getParameter("removeCover");
                if (removeCover != null && removeCover.equals("true")) {
                    newCoverImage = null;
                }
            }
        } catch (Exception e) {
            // Dosya yükleme hatası olursa eski kapak korunur
        }
        book.setCoverImage(newCoverImage);

        try {
            bookDAO.updateBook(book);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Veritabanı hatası: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/error/error.jsp").forward(request, response);
            return;
        }
        response.sendRedirect(request.getContextPath() + "/books/view/" + bookId);
    }
}