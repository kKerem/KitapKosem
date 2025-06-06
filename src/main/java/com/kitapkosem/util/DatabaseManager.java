package com.kitapkosem.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DatabaseManager {
    private static final Logger logger = LoggerFactory.getLogger(DatabaseManager.class);
    
    // Persistent database location - stores in user home directory
    private static final String DB_DIRECTORY = System.getProperty("user.home") + File.separator + ".kitapkosem";
    private static final String DB_FILE = DB_DIRECTORY + File.separator + "kitapkosem.db";
    private static final String DB_URL = "jdbc:sqlite:" + DB_FILE;
    
    private static boolean isInitialized = false;
    
    static {
        try {
            logger.info("Loading SQLite JDBC driver...");
            Class.forName("org.sqlite.JDBC");
            
            // Create database directory if it doesn't exist
            createDatabaseDirectory();
            
            initializeDatabase();
        } catch (ClassNotFoundException e) {
            logger.error("SQLite JDBC driver not found", e);
            throw new RuntimeException("SQLite JDBC sürücüsü bulunamadı", e);
        }
    }
    
    private static void createDatabaseDirectory() {
        File dbDir = new File(DB_DIRECTORY);
        if (!dbDir.exists()) {
            boolean created = dbDir.mkdirs();
            if (created) {
                logger.info("Created database directory: {}", DB_DIRECTORY);
            } else {
                logger.warn("Failed to create database directory: {}", DB_DIRECTORY);
            }
        }
        logger.info("Database will be stored at: {}", DB_FILE);
    }
    
    public static Connection getConnection() throws SQLException {
        logger.debug("Getting database connection to: {}", DB_FILE);
        logger.debug("Veritabanı bağlantısı alınıyor: {}", DB_FILE);
        return DriverManager.getConnection(DB_URL);
    }
    
    private static void initializeDatabase() {
        if (isInitialized) {
            logger.debug("Database already initialized, skipping...");
            logger.debug("Veritabanı zaten başlatılmış, atlanıyor...");
            return;
        }
        
        logger.info("Initializing database...");
        try (Connection conn = getConnection()) {
            // Check if database already has tables (persistent database exists)
            if (!isDatabaseEmpty(conn)) {
                logger.info("Database already exists and contains data. Skipping initialization.");
                isInitialized = true;
                return;
            }
            
            // Schema oluştur
            logger.info("Loading and executing schema.sql...");
            String schema = loadResourceFile("/schema.sql");
            executeSqlScript(conn, schema);
            
            // Örnek verileri ekle
            logger.info("Loading and executing data.sql...");
            String data = loadResourceFile("/data.sql");
            executeSqlScript(conn, data);
            
            isInitialized = true;
            logger.info("Database initialization completed successfully.");
        } catch (SQLException | IOException e) {
            logger.error("Failed to initialize database", e);
            throw new RuntimeException("Veritabanı başlatılamadı", e);
        }
    }
    
    private static boolean isDatabaseEmpty(Connection conn) throws SQLException {
        String sql = "SELECT COUNT(*) FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%'";
        try (Statement stmt = conn.createStatement();
             var rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                int tableCount = rs.getInt(1);
                logger.debug("Found {} tables in database", tableCount);
                logger.debug("Veritabanında {} tablo bulundu", tableCount);
                return tableCount == 0;
            }
        }
        return true;
    }
    
    private static String loadResourceFile(String resourcePath) throws IOException {
        logger.debug("Loading resource file: {}", resourcePath);
        logger.debug("Kaynak dosya yükleniyor: {}", resourcePath);
        try (InputStream is = DatabaseManager.class.getResourceAsStream(resourcePath)) {
            if (is == null) {
                logger.error("Resource not found: {}", resourcePath);
                throw new IOException("Resource bulunamadı: " + resourcePath);
            }
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(is, "UTF-8"))) {
                String content = reader.lines().collect(Collectors.joining("\n"));
                logger.debug("Resource file loaded successfully: {}", resourcePath);
                logger.debug("Kaynak dosya başarıyla yüklendi: {}", resourcePath);
                return content;
            }
        }
    }
    
    private static void executeSqlScript(Connection conn, String script) throws SQLException {
        String[] statements = script.split(";");
        try (Statement stmt = conn.createStatement()) {
            for (String sql : statements) {
                if (!sql.trim().isEmpty()) {
                    logger.debug("Executing SQL statement: {}", sql.trim());
                    logger.debug("SQL sorgusu çalıştırılıyor: {}", sql.trim());
                    stmt.execute(sql.trim());
                }
            }
        }
    }
    
    /**
     * Force database reinitialization (for testing purposes)
     */
    public static void forceReinitialize() {
        isInitialized = false;
        initializeDatabase();
    }
    
    /**
     * Get database file path for external operations
     */
    public static String getDatabasePath() {
        return DB_FILE;
    }
} 