-- Boş veritabanı - hiç veri yok 

-- Demo admin ve normal kullanıcı
INSERT INTO users (username, email, password_hash, role) VALUES
('admin', 'admin@kitapkosem.com', '12345', 'admin'),
('kerem', 'kerem@kitapkosem.com', '12345', 'user'); 