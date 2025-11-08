-- 04_create_main_tables.sql
-- Purpose: Create Donor and Donation main tables

USE donor_mgmt;

-- 1. Donor Table


CREATE TABLE IF NOT EXISTS donor (
    donor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    gender_id INT NOT NULL,
    country_id INT NOT NULL,
    prefix_id INT NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY unique_donor (prefix_id, phone_number, email),
    CONSTRAINT fk_donor_gender FOREIGN KEY (gender_id)
        REFERENCES gender_ref(gender_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_donor_country FOREIGN KEY (country_id)
        REFERENCES country_ref(country_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_donor_prefix FOREIGN KEY (prefix_id)
        REFERENCES telephone_prefix_ref(prefix_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 2. Donation Table

CREATE TABLE IF NOT EXISTS donation (
    donation_id INT AUTO_INCREMENT PRIMARY KEY,
    donor_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    currency_id INT NOT NULL,
    payment_mode_id INT NOT NULL,
    comments TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY unique_donation (donor_id, created_at),
    CONSTRAINT fk_donation_donor FOREIGN KEY (donor_id)
        REFERENCES donor(donor_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_donation_currency FOREIGN KEY (currency_id)
        REFERENCES currency_ref(currency_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_donation_payment FOREIGN KEY (payment_mode_id)
        REFERENCES payment_mode_ref(payment_mode_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

 

