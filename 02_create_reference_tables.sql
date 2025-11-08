-- 02_create_reference_tables.sql


-- 1. Gender Reference Table

USE donor_mgmt;


CREATE TABLE IF NOT EXISTS gender_ref (
    gender_id INT AUTO_INCREMENT PRIMARY KEY,
    gender_code VARCHAR(10) NOT NULL UNIQUE,
    gender_name VARCHAR(50) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- 2. Country Reference Table

CREATE TABLE IF NOT EXISTS country_ref (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_code VARCHAR(10) NOT NULL UNIQUE,
    country_name VARCHAR(100) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 3. Telephone Prefix Reference Table

CREATE TABLE IF NOT EXISTS telephone_prefix_ref (
    prefix_id INT AUTO_INCREMENT PRIMARY KEY,
    country_id INT NOT NULL,
    prefix_code VARCHAR(10) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_prefix_country FOREIGN KEY (country_id)
        REFERENCES country_ref(country_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);


-- 4. Currency Reference Table

CREATE TABLE IF NOT EXISTS currency_ref (
    currency_id INT AUTO_INCREMENT PRIMARY KEY,
    currency_code VARCHAR(10) NOT NULL UNIQUE,
    currency_name VARCHAR(50) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- 5. Payment Mode Reference Table

CREATE TABLE IF NOT EXISTS payment_mode_ref (
    payment_mode_id INT AUTO_INCREMENT PRIMARY KEY,
    payment_code VARCHAR(10) NOT NULL UNIQUE,
    payment_name VARCHAR(50) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

