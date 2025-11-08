

USE donor_mgmt;

-- change delimiter so MySQL can read the whole procedure body
DELIMITER $$

-- 1. Insert Donor Procedure

CREATE PROCEDURE sp_insert_donor (
    IN p_first_name VARCHAR(50),
    IN p_last_name VARCHAR(50),
    IN p_gender_id INT,
    IN p_country_id INT,
    IN p_prefix_id INT,
    IN p_phone_number VARCHAR(15),
    IN p_email VARCHAR(100)
)
BEGIN
    INSERT INTO donor ( first_name, last_name, gender_id, country_id, prefix_id, phone_number, email )
    VALUES (
        p_first_name, p_last_name, p_gender_id, p_country_id, p_prefix_id,
        p_phone_number, p_email
    );
END $$


-- 2. Update Donor Procedure (with backup)


CREATE PROCEDURE sp_update_donor (
    IN p_donor_id INT,
    IN p_first_name VARCHAR(50),
    IN p_last_name VARCHAR(50),
    IN p_gender_id INT,
    IN p_country_id INT,
    IN p_prefix_id INT,
    IN p_phone_number VARCHAR(15),
    IN p_email VARCHAR(100)
)
BEGIN
    -- Step 1: Backup current donor record
    INSERT INTO donor_backup (
        donor_id, first_name, last_name, gender_id, country_id, prefix_id,
        phone_number, email, created_at, updated_at
    )
    SELECT donor_id, first_name, last_name, gender_id, country_id, prefix_id,
           phone_number, email, created_at, updated_at
    FROM donor
    WHERE donor_id = p_donor_id;

    -- Step 2: Update donor table
    UPDATE donor
    SET first_name = p_first_name,
        last_name = p_last_name,
        gender_id = p_gender_id,
        country_id = p_country_id,
        prefix_id = p_prefix_id,
        phone_number = p_phone_number,
        email = p_email,
        updated_at = CURRENT_TIMESTAMP
    WHERE donor_id = p_donor_id;
END $$


-- 3. Insert Donation Procedure

CREATE PROCEDURE sp_insert_donation (
    IN p_donor_id INT,
    IN p_amount DECIMAL(10,2),
    IN p_currency_id INT,
    IN p_payment_mode_id INT,
    IN p_comments TEXT
)
BEGIN
    INSERT INTO donation (
        donor_id, amount, currency_id, payment_mode_id, comments
    )
    VALUES (
        p_donor_id, p_amount, p_currency_id, p_payment_mode_id, p_comments
    );
END $$


-- 4. Update Donation Procedure (with backup)


CREATE PROCEDURE sp_update_donation (
    IN p_donation_id INT,
    IN p_amount DECIMAL(10,2),
    IN p_currency_id INT,
    IN p_payment_mode_id INT,
    IN p_comments TEXT
)
BEGIN
    -- Step 1: Backup current donation record
    INSERT INTO donation_backup (
        donation_id, donor_id, amount, currency_id, payment_mode_id, comments,
        created_at, updated_at
    )
    SELECT donation_id, donor_id, amount, currency_id, payment_mode_id, comments,
           created_at, updated_at
    FROM donation
    WHERE donation_id = p_donation_id;

    -- Step 2: Update donation table
    UPDATE donation
    SET amount = p_amount,
        currency_id = p_currency_id,
        payment_mode_id = p_payment_mode_id,
        comments = p_comments,
        updated_at = CURRENT_TIMESTAMP
    WHERE donation_id = p_donation_id;
END $$

DELIMITER ;