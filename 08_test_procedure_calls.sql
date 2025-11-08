-- ======================================================
-- 08_test_real_data_procedures.sql
-- Purpose: Demonstrate stored procedure functionality
-- Project: Donor Management System (MySQL)
-- Author: Vinay Surisetty
-- ======================================================

USE donor_mgmt;

-- ======================================================
-- STEP 1: CLEANUP EXISTING DATA
-- ======================================================
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE donation_backup;
TRUNCATE TABLE donor_backup;
TRUNCATE TABLE donation;
TRUNCATE TABLE donor;
SET FOREIGN_KEY_CHECKS = 1;

SELECT '✅ Old data cleared successfully.' AS Status;

-- ======================================================
-- STEP 2: INSERT DONORS USING PROCEDURE
-- ======================================================
CALL sp_insert_donor('Ramesh', 'Kumar', 1, 1, 1, '9876543210', 'ramesh@gmail.com');
CALL sp_insert_donor('Sita', 'Devi', 2, 1, 1, '9998877766', 'sita@gmail.com');
CALL sp_insert_donor('John', 'Smith', 1, 2, 2, '2025551234', 'john.smith@gmail.com');

SELECT '--- Donor Table After Insert ---' AS Section;
SELECT donor_id, first_name, last_name, email FROM donor;

-- ======================================================
-- STEP 3: INSERT DONATIONS USING PROCEDURE
-- ======================================================
CALL sp_insert_donation(1, 1000.00, 1, 1, 'Donation for School Project');
CALL sp_insert_donation(2, 500.00, 1, 2, 'Donation for Health Camp');
CALL sp_insert_donation(3, 200.00, 2, 1, 'Donation for Library');

SELECT '--- Donation Table After Insert ---' AS Section;
SELECT donation_id, donor_id, amount, comments FROM donation;

-- ======================================================
-- STEP 4: UPDATE DONOR (TRIGGER BACKUP)
-- ======================================================
CALL sp_update_donor(
  1, 'Ramesh', 'Krishna', 1, 1, 1, '9876543210', 'ramesh_new@gmail.com'
);

SELECT '--- Donor Table After Update ---' AS Section;
SELECT donor_id, first_name, last_name, email FROM donor;

SELECT '--- Donor Backup Table (Old Version) ---' AS Section;
SELECT donor_id, first_name, last_name, email, backup_timestamp FROM donor_backup;

-- ======================================================
-- STEP 5: UPDATE DONATION (TRIGGER BACKUP)
-- ======================================================
CALL sp_update_donation(
  1, 1200.00, 1, 2, 'Updated donation for lab project'
);

SELECT '--- Donation Table After Update ---' AS Section;
SELECT donation_id, donor_id, amount, comments FROM donation;

SELECT '--- Donation Backup Table (Old Version) ---' AS Section;
SELECT donation_id, donor_id, amount, comments, backup_timestamp FROM donation_backup;

-- ======================================================
-- STEP 6: FINAL OVERVIEW
-- ======================================================
SELECT '--- All Donors ---' AS Section;
SELECT donor_id, first_name, last_name, email FROM donor;

SELECT '--- All Donations ---' AS Section;
SELECT donation_id, donor_id, amount, comments FROM donation;

SELECT '--- All Backups ---' AS Section;
SELECT COUNT(*) AS Donor_Backups FROM donor_backup;
SELECT COUNT(*) AS Donation_Backups FROM donation_backup;

SELECT '🎉 TEST COMPLETED SUCCESSFULLY — ALL PROCEDURES WORKING AS EXPECTED.' AS Final_Status;
