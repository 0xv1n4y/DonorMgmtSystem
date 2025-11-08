-- 05_create_backup_tables.sql

USE donor_mgmt;

-- 1. Donor Backup Table

CREATE TABLE IF NOT EXISTS donor_backup (
    donor_backup_id INT AUTO_INCREMENT PRIMARY KEY,
    donor_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender_id INT,
    country_id INT,
    prefix_id INT,
    phone_number VARCHAR(15),
    email VARCHAR(100),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    backup_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_backup_gender FOREIGN KEY (gender_id)
        REFERENCES gender_ref(gender_id)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_backup_country FOREIGN KEY (country_id)
        REFERENCES country_ref(country_id)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_backup_prefix FOREIGN KEY (prefix_id)
        REFERENCES telephone_prefix_ref(prefix_id)
        ON DELETE SET NULL ON UPDATE CASCADE
);


-- 2. Donation Backup Table

CREATE TABLE IF NOT EXISTS donation_backup (
    donation_backup_id INT AUTO_INCREMENT PRIMARY KEY,
    donation_id INT,
    donor_id INT,
    amount DECIMAL(10,2),
    currency_id INT,
    payment_mode_id INT,
    comments TEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    backup_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_backup_donor FOREIGN KEY (donor_id)
        REFERENCES donor(donor_id)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_backup_currency FOREIGN KEY (currency_id)
        REFERENCES currency_ref(currency_id)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_backup_payment FOREIGN KEY (payment_mode_id)
        REFERENCES payment_mode_ref(payment_mode_id)
        ON DELETE SET NULL ON UPDATE CASCADE
);

