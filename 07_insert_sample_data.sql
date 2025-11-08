USE donor_mgmt;


-- India donors
CALL sp_insert_donor('Ramesh', 'Kumar', 1, 1, 1, '9876543210', 'ramesh@gmail.com');
CALL sp_insert_donor('Sita', 'Devi', 2, 1, 1, '9998877766', 'sita@gmail.com');
CALL sp_insert_donor('Arjun', 'Reddy', 1, 1, 1, '9955443322', 'arjun@gmail.com');

-- USA donors
CALL sp_insert_donor('John', 'Smith', 1, 2, 2, '2025551234', 'john.smith@gmail.com');
CALL sp_insert_donor('Mary', 'Jones', 2, 2, 2, '2025555678', 'mary.jones@gmail.com');

-- UK donor
CALL sp_insert_donor('David', 'Brown', 1, 3, 3, '7722334455', 'david.brown@gmail.com');



-- Ramesh (India)
CALL sp_insert_donation(1, 1000.00, 1, 1, 'Donation for School Books');

-- Sita
CALL sp_insert_donation(2, 500.00, 1, 4, 'Cheque donation for education');

-- Arjun
CALL sp_insert_donation(3, 1200.00, 1, 2, 'Card payment for ICT Lab support');

-- John (USA)
CALL sp_insert_donation(4, 200.00, 2, 2, 'Online card donation');

-- Mary (USA)
CALL sp_insert_donation(5, 150.00, 2, 1, 'Cash donation during visit');

-- David (UK)
CALL sp_insert_donation(6, 100.00, 3, 2, 'Card donation for rural project');



SELECT donation_id, donor_id, amount, comments FROM donation;


-- Update Ramesh’s email and donation amount
CALL sp_update_donor(1, 'Ramesh', 'Kumar', 1, 1, 1, '9876543210', 'ramesh_new@gmail.com');
CALL sp_update_donation(1, 1200.00, 1, 2, 'Updated donation after project expansion');


SELECT * FROM donor_backup;
SELECT * FROM donation_backup;

