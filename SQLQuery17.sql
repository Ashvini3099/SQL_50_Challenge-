

CREATE TABLE patients (
    patient_id VARCHAR(50),
    name VARCHAR(100),
    age INT,
    arrival_date DATE,
    departure_date DATE,
    service VARCHAR(50),
    satisfaction INT
);



INSERT INTO patients (patient_id, name, age, arrival_date, departure_date, service, satisfaction) VALUES
('PAT-09484753', 'Richard Rodriguez', 24, '2025-03-16', '2025-03-22', 'surgery', 61),
('PAT-f0644084', 'Shannon Walker', 6, '2025-12-13', '2025-12-14', 'surgery', 83),
('PAT-ac6162e4', 'Julia Torres', 24, '2025-06-29', '2025-07-05', 'general_medicine', 83),
('PAT-3dda2bb5', 'Crystal Johnson', 32, '2025-10-12', '2025-10-23', 'emergency', 81),
('PAT-08591375', 'Garrett Lin', 25, '2025-02-18', '2025-02-25', 'ICU', 76);


CREATE TABLE services_weekly (
    week INT,
    month INT,
    service VARCHAR(50),
    available_beds INT,
    patients_request INT,
    patients_admitted INT,
    patients_refused INT,
    patient_satisfaction INT,
    staff_morale INT,
    event VARCHAR(50)
);


INSERT INTO services_weekly 
(week, month, service, available_beds, patients_request, patients_admitted, patients_refused, patient_satisfaction, staff_morale, event) 
VALUES
(1, 1, 'emergency', 32, 76, 32, 44, 67, 70, 'none'),
(1, 1, 'surgery', 45, 130, 45, 85, 83, 78, 'flu'),
(1, 1, 'general_medicine', 37, 201, 37, 164, 97, 43, 'flu'),
(1, 1, 'ICU', 22, 31, 22, 9, 84, 91, 'flu'),
(2, 1, 'emergency', 28, 169, 28, 141, 75, 64, 'none');


CREATE TABLE staff (
    staff_id VARCHAR(50),
    staff_name VARCHAR(100),
    role VARCHAR(50),
    service VARCHAR(50)
);

INSERT INTO staff (staff_id, staff_name, role, service) VALUES
('STF-5ca26577', 'Allison Hill', 'doctor', 'emergency'),
('STF-02ae59ca', 'Noah Rhodes', 'doctor', 'emergency'),
('STF-d8006e7c', 'Angie Henderson', 'doctor', 'emergency'),
('STF-212d8b31', 'Daniel Wagner', 'doctor', 'emergency'),
('STF-107a58e4', 'Cristian Santos', 'doctor', 'emergency'),
('STF-fd24fd30', 'Jason Pittman', 'doctor', 'emergency'),
('STF-1751e5e2', 'Amanda Lopez', 'doctor', 'emergency'),
('STF-3c9487fb', 'Ryan Benson', 'doctor', 'emergency'),
('STF-6aafb69d', 'Elizabeth Carter', 'doctor', 'emergency'),
('STF-9d6d8ee3', 'Nisha Patel', 'doctor', 'surgery'),
('STF-6afc4bc0', 'James Taylor', 'doctor', 'surgery'),
('STF-b21e6498', 'Olivia White', 'doctor', 'surgery'),
('STF-6a005e23', 'John Murphy', 'doctor', 'surgery'),
('STF-293bd89c', 'Briana Hall', 'doctor', 'surgery'),
('STF-52a0fbfa', 'Michael Brown', 'doctor', 'surgery'),
('STF-95ac0cbb', 'Lisa Mitchell', 'doctor', 'general_medicine'),
('STF-bcaaa297', 'Thomas Evans', 'doctor', 'general_medicine'),
('STF-8a4b714f', 'Sophia Adams', 'doctor', 'general_medicine'),
('STF-6ac847c1', 'Samuel Harris', 'doctor', 'general_medicine'),
('STF-8e0c2a67', 'Grace Rivera', 'doctor', 'general_medicine'),
('STF-afd19440', 'Yara Anderson', 'doctor', 'ICU'),
('STF-3afc1474', 'Lucas Carter', 'doctor', 'ICU'),
('STF-74dc60e4', 'Isabella Moore', 'doctor', 'ICU'),
('STF-a7f3b6b0', 'Owen Barnes', 'doctor', 'ICU'),
('STF-904bf0bc', 'Ella Wright', 'doctor', 'ICU');

select* from patients;

select top 3 * from services_weekly;

select *from patients where age >= 20;

select  patient_id ,name , age,satisfaction from patients where service = 'surgery' and satisfaction <=70;
select * from patients ; 