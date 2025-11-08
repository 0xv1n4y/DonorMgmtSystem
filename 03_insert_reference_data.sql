-- 03_insert_reference_data.sql
-- Purpose: Insert sample master data

USE donor_mgmt;

-- 1. Gender Reference Data

INSERT INTO gender_ref (gender_code, gender_name)
VALUES
('M', 'Male'),
('F', 'Female'),
('O', 'Other');

-- 2. Country Reference Data

INSERT INTO country_ref (country_code, country_name)
VALUES
('IN', 'India'),
('US', 'United States'),
('UK', 'United Kingdom');

-- 3. Telephone Prefix Reference Data

-- Match each prefix to its country_id

INSERT INTO telephone_prefix_ref (country_id, prefix_code)
SELECT country_id, '+91' FROM country_ref WHERE country_code = 'IN';
INSERT INTO telephone_prefix_ref (country_id, prefix_code)
SELECT country_id, '+1'  FROM country_ref WHERE country_code = 'US';
INSERT INTO telephone_prefix_ref (country_id, prefix_code)
SELECT country_id, '+44' FROM country_ref WHERE country_code = 'UK';


-- 4. Currency Reference Data

INSERT INTO currency_ref (currency_code, currency_name)
VALUES
('INR', 'Indian Rupee'),
('USD', 'US Dollar'),
('GBP', 'Pound Sterling');

-- 5. Payment Mode Reference Data

INSERT INTO payment_mode_ref (payment_code, payment_name)
VALUES
('CASH',  'Cash'),
('CARD',  'Credit/Debit Card'),
('UPI',   'Unified Payments Interface'),
('CHQ',   'Cheque');