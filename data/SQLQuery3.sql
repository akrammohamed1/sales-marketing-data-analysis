
use Hospital_DB;


select * from departments;

select * from doctors;
/*
************************************************8*/


select * from patients;

select * from patients where patient_id = 'PAT015';

select first_name, last_name, phone from patients where last_name = 'Al-Fayed';

Select * from doctors where department_id = 'DEPT001';

Select * from appointments ;

Select * from appointments where appointment_date = '2024-2-15';

Select * from patients where date_of_birth between  '1990-1-1' and '1995-12-31';

insert into patients values ('PAT051', 'Ali', 'Hassan', '1988-11-03', 'Male', '123 Palm Street, Dubai', '971-555-0123',
'ali.hassan@email.com','Fatima Hassan-971-555-0124',
'B+', 'None') ; 

insert into medicines values
 ('MED016', 'Paracetamol', 'Pain reliever', 1500, 7.50, '2026-05-31'),
 ('MED017', 'Amoxicillin-Clavulanate', 'Antibiotic', 800, 22.75, '2025-10-15'),
 ('MED018', 'Metoprolol Succinate', 'Beta blocker', 600, 18.25, '2025-11-30');

insert into appointments values('APT041', 'PAT025', '2024-03-10', '10:30:00', 'Scheduled', 'Cardiac screening', 'Family history of heart disease','DEPT002', 'DOC003');

insert into departments values ('DT011','Physical Therapy', 'Floor 5,Wing A', '555-1011' );

insert into lab_tests values ('LAB011', 'HIV Test', 'Test for HIV antibodies', 150.00)
, ('LAB012', 'Hepatitis Panel', 'Test for Hepatitis A, B, and C', 225.00);



UPDATE patients
SET phone = '966-500-2007'
WHERE patient_id = 'PAT007';

UPDATE appointments
SET status = 'Completed'
WHERE appointments_id = 'APT012';

UPDATE medicines
SET stock_quantity = 2500
WHERE medicines_id = 'MED005';

UPDATE doctors
SET email = 'lisa.thomas@medicalcenter.com'
WHERE doctor_id = 'DOC008';

UPDATE bills
SET payment_status = 'Paid',
    paid_amount = 350.00
WHERE bills_id = 'BILL004';


DELETE FROM patients
WHERE patient_id = 'PAT042';

DELETE FROM appointments
WHERE appointment_date < '2020-01-01';

DELETE FROM patients
WHERE patient_id NOT IN (
    SELECT MIN(patient_id)
    FROM patients
    GROUP BY first_name, last_name, date_of_birth);


DELETE FROM lab_results
WHERE patient_id = 'PAT018';


DELETE FROM medicines
WHERE expiry_date < CAST(GETDATE() AS DATE);



/*
akram
*/

SELECT *
FROM patients
WHERE gender = 'Female'
  AND date_of_birth < '1985-01-01';
  use Hospital_DB;

  SELECT *
FROM patients
WHERE blood_type = 'O+'


SELECT *
FROM patients
WHERE blood_type = 'O+'
  AND (allergies IS NULL OR allergies = '');



  SELECT *
FROM appointments
WHERE doctor_id = 'DOC005'
  or status = 'Completed';



  select * 
  from bills where total_amount > ('300')
  and payment_status = ('Pending');



  SELECT *
FROM bills
WHERE total_amount > 300
  AND payment_status = 'Pending';




  select * from medicines 
  where stock_quantity < ('100')
  and unit_price > ('15')

SELECT *
FROM medicines
WHERE stock_quantity < 100
  AND unit_price > 15;


  SELECT d.department_id, dept.name, COUNT(d.doctor_id) AS doctor_count
FROM doctors d
JOIN departments dept
  ON d.department_id = dept.department_id
GROUP BY d.department_id, dept.name
HAVING COUNT(d.doctor_id) < 3;


SELECT *
FROM doctors;




SELECT 
    doctors.doctor_id,
    doctors.first_name,
    doctors.last_name,
    COUNT(appointments.appointments_id) AS total_appointments
FROM doctors
INNER JOIN appointments
    ON doctors.doctor_id = appointments.doctor_id
GROUP BY doctors.doctor_id, doctors.first_name, doctors.last_name
HAVING COUNT(appointments.appointments_id) > 5;

/*
SELECT 
    d.doctor_id,
    d.first_name,
    d.last_name,
    COUNT(a.appointments_id) AS total_appointments
FROM doctors d
INNER JOIN appointments a
    ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name
HAVING COUNT(a.appointments_id) > 5;





SELECT 
    p.patient_id, 
    p.first_name + ' ' + p.last_name AS patient_name, 
    d.first_name + ' ' + d.last_name AS doctor_name,
    a.appointments_id,
    a.appointment_date, 
    a.appointment_time, 
    a.status
FROM patients p
JOIN appointments a ON p.patient_id = a.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id; 

*/



SELECT 
    patients.patient_id,
    patients.first_name,
    patients.last_name,
    COUNT(appointments.appointments_id) AS total_appointments
FROM patients
INNER JOIN appointments
    ON patients.patient_id = appointments.patient_id
GROUP BY patients.patient_id, patients.first_name, patients.last_name
HAVING COUNT(appointments.appointments_id) > 2;



SELECT 
    m.name,
    AVG(m.unit_price) AS average_price
FROM medicines m
GROUP BY m.name
HAVING AVG(m.unit_price) > 20;




/*

SELECT 
    departments.department_id,
    departments.name,
    AVG(appointments.duration_minutes) AS average_duration
FROM departments
INNER JOIN appointments
    ON departments.department_id = appointments.department_id
GROUP BY departments.department_id, departments.name
HAVING AVG(appointments.duration_minutes) > 30;

*/


SELECT *
FROM patients
ORDER BY patients.last_name ASC;




select * from appointments
order by appointments.appointment_date DESC ,  appointments.appointment_time ASC ;




select * from medicines

order by medicines.unit_price ASC , medicines.name DESC ;

use  Hospital_DB;

SELECT *
FROM doctors
ORDER BY specialization ASC, last_name ASC;



SELECT *
FROM bills
ORDER BY total_amount DESC, billing_date ASC;



SELECT gender, COUNT(patient_id) AS total_patients
FROM patients
GROUP BY gender;





select status , count(appointments_id) as total 
from appointments
group by status


SELECT payment_status, SUM(total_amount) AS total_bills
FROM bills
GROUP BY payment_status;



SELECT blood_type, COUNT(patient_id) AS total_patients
FROM patients
GROUP BY blood_type;




SELECT TOP 5 *
FROM patients
ORDER BY date_of_birth ASC;





SELECT TOP 10 *
FROM medicines
ORDER BY unit_price DESC;





SELECT TOP 5 *
FROM appointments
ORDER BY appointment_date DESC, appointment_time DESC;

SELECT TOP 3 
    doctors.doctor_id,
    doctors.first_name,
    doctors.last_name,
    COUNT(appointments.appointments_id) AS total_appointments
FROM doctors
INNER JOIN appointments
    ON doctors.doctor_id = appointments.doctor_id
GROUP BY doctors.doctor_id, doctors.first_name, doctors.last_name
ORDER BY COUNT(appointments.appointments_id) DESC;


SELECT TOP 5 *
FROM bills
ORDER BY total_amount DESC;



SELECT DISTINCT specialization
FROM doctors;


SELECT DISTINCT blood_type
FROM patients;


SELECT DISTINCT status
FROM appointments;


SELECT DISTINCT payment_method
FROM bills;



SELECT distinct allergies
FROM patients;


SELECT *
FROM patients
ORDER BY date_of_birth DESC
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY;

SELECT *
FROM appointments
ORDER BY appointment_date ASC
OFFSET 10 ROWS
FETCH NEXT 5 ROWS ONLY;



SELECT *
FROM medicines
ORDER BY unit_price DESC
OFFSET 0 ROWS
FETCH NEXT 3 ROWS ONLY;


SELECT *
FROM bills
ORDER BY total_amount DESC
OFFSET 0 ROWS
FETCH NEXT 5 ROWS ONLY;


SELECT *
FROM doctors
ORDER BY last_name ASC
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY;

/*hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh*/



SELECT *
FROM Patients
WHERE gender <> 'Male';

SELECT *
FROM Appointments
WHERE status <> 'Completed';

SELECT *
FROM Bills
WHERE paid_amount < total_amount;



SELECT *
FROM Doctors
WHERE department_id <> 'DEPT007';


SELECT *
FROM Patients
WHERE last_name LIKE 'Al-%';

SELECT *
FROM Doctors
WHERE first_name LIKE '%a';

SELECT *
FROM Medicines
WHERE name LIKE '%cin%';

SELECT *
FROM Departments
WHERE location LIKE '%Floor 1%';

SELECT email
FROM Patients
WHERE email LIKE '%@gmail.com';


/*mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm*/

select * from departments;
select * from doctors;
SELECT * from patients;
select * from medical_records;
select * from prescriptions;
select * from medicines;
select * from prescription_medicines;
select * from lab_tests;
select * from lab_results;
select * from bills;
select * from appointments;
select * from medical_records;

--20,21--
SELECT appointments_id,
       patient_id,
       doctor_id,
       appointment_date,
       status
FROM Appointments
WHERE status IN ('Scheduled', 'Completed', 'Cancelled');
SELECT patient_id, address
FROM Patients
WHERE address LIKE '%Riyadh%'
   OR address LIKE '%Dubai%'
   OR address LIKE '%Doha%';
SELECT medicines_id,
       name,
       unit_price
FROM Medicines
WHERE unit_price BETWEEN 10 AND 50;
SELECT bills_id,
       patient_id,
       paid_amount,
       payment_method
FROM Bills
WHERE payment_method IN ('Credit Card', 'Debit Card', 'Cash');
SELECT patient_id,
       first_name,
       last_name,
       address
FROM Patients
WHERE address NOT LIKE '%Riyadh%';
SELECT doctor_id,
       first_name,
       last_name,
       specialization,
       department_id
FROM Doctors
WHERE department_id <> 'DEPT001';
SELECT appointments_id,
       patient_id,
       doctor_id,
       appointment_date,
       status
FROM Appointments
WHERE MONTH(appointment_date) <> MONTH(GETDATE())
  OR YEAR(appointment_date) <> YEAR(GETDATE());
SELECT medicines_id,
       name,
       unit_price
FROM Medicines
WHERE unit_price NOT BETWEEN 10 AND 50;
SELECT bills_id,
       patient_id,
       paid_amount,
       payment_method
FROM Bills
WHERE payment_method <> 'Insurance';
SELECT patient_id,
       first_name,
       last_name,
       phone,
       emergency_contact
FROM Patients
WHERE emergency_contact IS NULL;
SELECT appointments_id,
       patient_id,
       doctor_id,
       appointment_date,
       status
FROM Appointments
WHERE doctor_id IS NULL;
SELECT bills_id,
       patient_id,
       total_amount,
       paid_amount,
       payment_method
FROM Bills
WHERE payment_method IS NULL;
SELECT medical_records_id,
       patient_id,
       doctor_id,
       diagnosis,
       treatment
FROM medical_records
WHERE diagnosis IS NULL;

--22--
SELECT first_name
FROM Patients
UNION   
SELECT first_name
FROM Doctors;
SELECT last_name
FROM Patients
UNION ALL   -- UNION ALL keeps duplicates
SELECT last_name
FROM Doctors;
SELECT patient_id
FROM Patients
EXCEPT
SELECT patient_id
FROM Appointments;
SELECT patient_id AS person_id,
       first_name + ' ' + last_name AS full_name,
       'Patient' AS person_type
FROM Patients
UNION
SELECT doctor_id AS person_id,
       first_name + ' ' + last_name AS full_name,
       'Doctor' AS person_type
FROM Doctors;
SELECT medicines_id
FROM Medicines
EXCEPT
SELECT medicine_id
FROM Prescription_Medicines;

--23--
SELECT appointments_id,
       patient_id,
       doctor_id,
       appointment_date,
       status
FROM Appointments
WHERE appointment_date BETWEEN '2021-03-01' AND '2021-03-07';
SELECT patient_id,
       first_name,
       last_name,
       date_of_birth
FROM Patients
WHERE date_of_birth BETWEEN '1980-01-01' AND '1990-12-31';
SELECT bills_id,
       patient_id,
       billing_date,
       total_amount,
       paid_amount,
       payment_method
FROM Bills
WHERE billing_date BETWEEN '2021-02-01' AND '2024-02-29'
  AND paid_amount BETWEEN 200 AND 500;
 SELECT medicines_id,
       name,
       unit_price
FROM Medicines
WHERE unit_price BETWEEN 10 AND 25;
SELECT description,
       name,
       cost
FROM lab_tests
WHERE cost BETWEEN 50 AND 100;

--24--
SELECT patient_id,
       first_name,
       last_name,
       date_of_birth,
       address
FROM Patients
WHERE date_of_birth < ALL (
    SELECT date_of_birth
    FROM Patients
    WHERE address = 'Dubai'
);
SELECT d.doctor_id,
       d.first_name + ' ' + d.last_name AS doctor_name,
       COUNT(a.appointments_id) AS total_appointments
FROM Doctors d
JOIN Appointments a 
     ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name
HAVING COUNT(a.appointments_id) > ANY (
    SELECT COUNT(a2.appointments_id)
    FROM Doctors d2
    JOIN Appointments a2 
         ON d2.doctor_id = a2.doctor_id
    WHERE d2.specialization IN ('Neurologist', 'Neurosurgeon')
    GROUP BY d2.doctor_id
)
ORDER BY total_appointments DESC;
SELECT d.doctor_id,
       d.first_name + ' ' + d.last_name AS doctor_name,
       d.specialization,
       COUNT(a.appointments_id) AS total_appointments
FROM Doctors d
LEFT JOIN Appointments a 
       ON d.doctor_id = a.doctor_id
WHERE d.specialization IN ('Neurologist', 'Neurosurgeon')
GROUP BY d.doctor_id, d.first_name, d.last_name, d.specialization
ORDER BY total_appointments DESC;
SELECT medicines_id,
       name,
       unit_price
FROM Medicines
WHERE unit_price > ALL (
    SELECT unit_price
    FROM Medicines
    WHERE CAST(description AS VARCHAR(MAX)) LIKE '%Pain Reliever%'
);
SELECT bills_id,
       patient_id,
       total_amount,
       payment_method
FROM Bills
WHERE total_amount > ANY (
    SELECT total_amount
    FROM Bills
    WHERE CAST(payment_method AS VARCHAR(MAX)) LIKE '%Insurance%'
);
SELECT appointments_id,
       patient_id,
       doctor_id,
       appointment_time
FROM Appointments
WHERE appointment_time < ALL (
    SELECT appointment_time
    FROM Appointments
    WHERE patient_id = 'PAT001'
);

--25--
SELECT d.doctor_id,
       d.first_name,
       d.last_name,
       d.specialization
FROM Doctors d
WHERE EXISTS (
    SELECT 1
    FROM Appointments a
    WHERE a.doctor_id = d.doctor_id
      AND a.status = 'Completed'
);
SELECT p.patient_id,
       p.first_name,
       p.last_name
FROM Patients p
WHERE EXISTS (
    SELECT 1
    FROM Bills b
    WHERE b.patient_id = p.patient_id
      AND b.payment_status = 'Unpaid'
);

SELECT m.medicines_id,
       m.name,
       m.unit_price
FROM Medicines m
WHERE EXISTS (
    SELECT 1
    FROM Prescription_Medicines pm
    WHERE pm.medicine_id = m.medicines_id
);
SELECT d.department_id,
       d.name,
       d.location
FROM Departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM Doctors doc
    WHERE doc.department_id = d.department_id
);
SELECT p.patient_id,
       p.first_name,
       p.last_name
FROM Patients p
WHERE NOT EXISTS (
    SELECT 1
    FROM Appointments a
    WHERE a.patient_id = p.patient_id
);

--26--
SELECT COUNT(*) AS male_patients_count
FROM Patients
WHERE gender = 'Male';
SELECT SUM(total_amount - paid_amount) AS total_outstanding_balance
FROM Bills;
SELECT MIN(unit_price) AS least_expensive_medicine
FROM Medicines;
SELECT AVG(cost) AS average_lab_test_cost
FROM Lab_Tests;




-- 131. INNER JOIN: appointments + patient + doctor
SELECT 
    a.appointments_id,
    a.appointment_date,
    a.appointment_time,
    p.first_name + ' ' + p.last_name AS patient_full_name,
    d.first_name + ' ' + d.last_name AS doctor_full_name
FROM appointments a
INNER JOIN patients p ON a.patient_id = p.patient_id
INNER JOIN doctors d ON a.doctor_id = d.doctor_id;

-- 132. LEFT JOIN: all patients + appointments
SELECT 
    p.patient_id,
    p.first_name + ' ' + p.last_name AS patient_full_name,
    a.appointments_id,
    a.appointment_date,
    a.appointment_time,
    a.status
FROM patients p
LEFT JOIN appointments a ON p.patient_id = a.patient_id;

-- 133. RIGHT JOIN: all doctors + appointments
SELECT 
    d.doctor_id,
    d.first_name + ' ' + d.last_name AS doctor_full_name,
    a.appointments_id,
    a.appointment_date,
    a.appointment_time,
    a.status
FROM appointments a
RIGHT JOIN doctors d ON a.doctor_id = d.doctor_id;

-- 134. FULL JOIN: patients + doctors with or without appointments
SELECT
    p.patient_id,
    p.first_name + ' ' + p.last_name AS patient_full_name,
    d.doctor_id,
    d.first_name + ' ' + d.last_name AS doctor_full_name,
    a.appointments_id
FROM patients p
FULL JOIN appointments a ON p.patient_id = a.patient_id
FULL JOIN doctors d ON a.doctor_id = d.doctor_id;

-- 135. Multi-table JOIN: appointment APT005 details
SELECT
    a.appointments_id,
    p.first_name + ' ' + p.last_name AS patient_full_name,
    d.first_name + ' ' + d.last_name AS doctor_full_name,
    dept.name AS department_name,
    mr.diagnosis,
    (SELECT SUM(b.total_amount) 
     FROM bills b
     WHERE b.appointment_id = a.appointments_id) AS total_bill_amount
FROM appointments a
LEFT JOIN patients p ON a.patient_id = p.patient_id
LEFT JOIN doctors d ON a.doctor_id = d.doctor_id
LEFT JOIN departments dept ON a.department_id = dept.department_id
LEFT JOIN medical_records mr ON mr.appointment_id = a.appointments_id
WHERE a.appointments_id = 'APT005';



-- 136. Year of birth for patients
SELECT patient_id, date_of_birth, DATEPART(year, date_of_birth) AS birth_year
FROM patients;

-- 137. Patient age calculation
SELECT
    patient_id,
    first_name + ' ' + last_name AS patient_full_name,
    date_of_birth,
    DATEDIFF(year, date_of_birth, GETDATE())
      - CASE 
          WHEN (MONTH(GETDATE()) < MONTH(date_of_birth))
            OR (MONTH(GETDATE()) = MONTH(date_of_birth) AND DAY(GETDATE()) < DAY(date_of_birth))
          THEN 1 ELSE 0
        END AS age
FROM patients;

-- 138. Appointments on Monday
SELECT *
FROM appointments
WHERE DATENAME(weekday, appointment_date) = 'Monday';

-- 139. Add 30 days to billing date
SELECT bills_id, billing_date, DATEADD(day, 30, billing_date) AS due_date
FROM bills;

-- 140. Days until future appointments
SELECT
    a.appointments_id,
    a.appointment_date,
    DATEDIFF(day, GETDATE(), a.appointment_date) AS days_until_appointment
FROM appointments a
WHERE a.appointment_date > CAST(GETDATE() AS date);



-- 141. Last names uppercase
SELECT patient_id, UPPER(last_name) AS last_name_upper
FROM patients;

-- 142. Doctor full names
SELECT doctor_id, CONCAT(first_name, ' ', last_name) AS doctor_full_name
FROM doctors;

-- 143. First 3 chars of blood type
SELECT patient_id, blood_type, SUBSTRING(blood_type, 1, 3) AS blood_type_prefix
FROM patients;

-- 144. Trim spaces in address
SELECT patient_id, LTRIM(RTRIM(address)) AS address_trimmed
FROM patients;

-- 145. Replace 'None' with 'No Known Allergies'
SELECT patient_id,
       CASE 
         WHEN allergies IS NULL THEN 'No Known Allergies'
         ELSE REPLACE(allergies, 'None', 'No Known Allergies')
       END AS allergies_normalized
FROM patients;







-- 146. Create view


CREATE VIEW vPatientAppointments AS
SELECT 
    a.appointments_id,
    p.patient_id,
    p.first_name + ' ' + p.last_name AS patient_full_name,
    a.appointment_date,
    a.appointment_time,
    d.first_name + ' ' + d.last_name AS doctor_full_name
FROM appointments a
LEFT JOIN patients p ON a.patient_id = p.patient_id
LEFT JOIN doctors d ON a.doctor_id = d.doctor_id;

-- 147. Insert new patient + check view
INSERT INTO patients (patient_id, first_name, last_name, date_of_birth, gender)
VALUES ('PAT999', 'Test', 'Patient', '1990-01-01', 'Male');

SELECT * FROM vPatientAppointments WHERE patient_id = 'PAT999';

-- 148. Rename view
EXEC sp_rename 'vPatientAppointments', 'vPatientVisits';

-- 149. Drop view
DROP VIEW IF EXISTS vPatientVisits;

-- 150. Daily revenue view

/*

CREATE VIEW vDailyRevenue AS
SELECT billing_date, SUM(paid_amount) AS total_paid_amount
FROM bills
GROUP BY billing_date;


-- 151. Doctor with highest salary
SELECT first_name + ' ' + last_name AS doctor_full_name
FROM doctors
WHERE salary = (SELECT MAX(salary) FROM doctors);

*/

-- 152. Patients with Cardiology doctors
SELECT DISTINCT p.patient_id, p.first_name + ' ' + p.last_name AS patient_full_name
FROM patients p
WHERE p.patient_id IN (
    SELECT a.patient_id
    FROM appointments a
    JOIN doctors d ON a.doctor_id = d.doctor_id
    WHERE d.department_id = 'DEPT001'
);

-- 153. Medicines above average price in same stock qty
SELECT m1.medicines_id, m1.name, m1.unit_price, m1.stock_quantity
FROM medicines m1
WHERE m1.unit_price > (
    SELECT AVG(m2.unit_price)
    FROM medicines m2
    WHERE m2.stock_quantity = m1.stock_quantity
      AND m2.medicines_id <> m1.medicines_id
);

-- 154. Appointments + total count per patient
SELECT 
    a.appointments_id,
    a.appointment_date,
    a.patient_id,
    (SELECT COUNT(*) FROM appointments a2 WHERE a2.patient_id = a.patient_id) AS patient_total_appointments
FROM appointments a;

-- 155. Departments with surgeon doctors
SELECT d.department_id, d.name
FROM departments d
WHERE EXISTS (
    SELECT 1 FROM doctors doc
    WHERE doc.department_id = d.department_id
      AND doc.specialization LIKE '%Surgeon%'
);

-- 156. Patients with no pending bills
SELECT p.patient_id, p.first_name + ' ' + p.last_name AS patient_full_name
FROM patients p
WHERE NOT EXISTS (
    SELECT 1 FROM bills b
    WHERE b.patient_id = p.patient_id
      AND b.payment_status = 'Pending'
);

-- 157. Doctors with above-average appointments
SELECT 
    d.doctor_id,
    d.first_name + ' ' + d.last_name AS doctor_full_name,
    COUNT(a.appointments_id) AS total_appointments
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name
HAVING COUNT(a.appointments_id) > (
    SELECT AVG(doctor_counts) FROM (
        SELECT COUNT(*) AS doctor_counts
        FROM appointments
        GROUP BY doctor_id
    ) AS t
);

-- 158. Medicines prescribed for patient PAT001
SELECT DISTINCT m.name
FROM medicines m
WHERE m.medicines_id IN (
    SELECT pm.medicine_id
    FROM prescription_medicines pm
    JOIN prescriptions p ON pm.prescription_id = p.prescriptions_id
    WHERE p.patient_id = 'PAT001'
);

-- 159. Increase stock by 50 if prescribed >10 times last month
UPDATE medicines
SET stock_quantity = stock_quantity + 50
WHERE medicines_id IN (
    SELECT pm.medicine_id
    FROM prescription_medicines pm
    JOIN prescriptions p ON pm.prescription_id = p.prescriptions_id
    WHERE p.prescription_date >= DATEADD(month, -1, CAST(GETDATE() AS date))
    GROUP BY pm.medicine_id
    HAVING COUNT(*) > 10
);

-- 160. Delete lab tests never performed
DELETE FROM lab_tests
WHERE NOT EXISTS (
    SELECT 1
    FROM lab_results lr
    WHERE lr.lab_test_id = lab_tests.lab_tests_id
);



-- 161. Full backup
BACKUP DATABASE [Hospital_DB]
TO DISK = N'D:\Backups\Hospital DB Full.bak'
WITH INIT,
     NAME = N'Hospital DB Full Backup';

-- 162. Restore (overwrite existing DB)
RESTORE DATABASE [Hospital_DB]
FROM DISK = N'D:\Backups\Hospital DB Full.bak'
WITH REPLACE, RECOVERY;

