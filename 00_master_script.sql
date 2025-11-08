-- 00_master_script.sql
-- Master script to create, populate and test the Donor Management System

-- =============================================
-- 1. Create Database
--
SOURCE 01_create_database.sql;

-- =============================================
-- 2. Create Reference Tables
-- =============================================
SOURCE 02_create_reference_tables.sql;

-- =============================================
-- 3. Insert Reference Data
-- =============================================
SOURCE 03_insert_reference_data.sql;

-- =============================================
-- 4. Create Main Tables
-- =============================================
SOURCE 04_create_main_tables.sql;

-- =============================================
-- 5. Create Backup Tables
-- =============================================
SOURCE 05_create_backup_tables.sql;

-- =============================================
-- 6. Create Stored Procedures
-- =============================================
SOURCE 06_create_stored_procedures.sql;

-- =============================================
-- 7.Inser Sample Data
-- =============================================
SOURCE 07_insert_sample_data.sql;

-- =============================================
-- 8. Run Procedure Tests
-- =============================================
SOURCE 08_test_procedure_calls.sql



SELECT '✅ Donor Management System successfully executed!' AS Final_Status;
