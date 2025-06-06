-- Mevcut reviews tablosunu yedekle
CREATE TABLE reviews_backup AS SELECT * FROM reviews;

-- Mevcut reviews tablosunu sil
DROP TABLE reviews;

-- Yeni reviews tablosunu oluştur
CREATE TABLE reviews (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    book_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    rating INTEGER NOT NULL,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Yedeklenen verileri yeni tabloya aktar
INSERT INTO reviews (id, book_id, user_id, rating, comment, created_at)
SELECT id, book_id, user_id, rating, comment, created_at
FROM reviews_backup;

-- Yedek tabloyu sil
DROP TABLE reviews_backup;

-- Mevcut books tablosunu yedekle
CREATE TABLE books_backup AS SELECT id, title, author, description, category, publish_year, isbn, added_by, created_at, rating, review_count FROM books;

-- Mevcut books tablosunu sil
DROP TABLE books;

-- Yeni books tablosunu oluştur
CREATE TABLE books (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    author TEXT NOT NULL,
    description TEXT,
    category TEXT,
    publish_year INTEGER,
    isbn TEXT,
    added_by INTEGER,
    created_at TIMESTAMP,
    rating DOUBLE DEFAULT 0.0,
    review_count INTEGER DEFAULT 0,
    FOREIGN KEY (added_by) REFERENCES users(id)
);

-- Yedeklenen verileri yeni tabloya aktar
INSERT INTO books (id, title, author, description, category, publish_year, isbn, added_by, created_at, rating, review_count)
SELECT id, title, author, description, category, publish_year, isbn, added_by, created_at, rating, review_count
FROM books_backup;

-- Yedek tabloyu sil
DROP TABLE books_backup; 