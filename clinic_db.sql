-- CREATING CLINIC DATABASE 
CREATE DATABASE clinic_db;

USE clinic_db; 

-- CREATING TABLES
-- 1. Departments Table

CREATE TABLE department(
department_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR (255) NOT NULL UNIQUE,
description TEXT
);
-- 2: medication table
CREATE TABLE medication(
medication_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR (255) NOT NULL UNIQUE,
description TEXT
);

-- 3: doctors table
CREATE TABLE doctors(
doctors_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR (255) NOT NULL,
email VARCHAR (255) NOT NULL,
phone VARCHAR(30) NOT NULL,
specialization VARCHAR (255) NOT NULL,
department_id INT,
FOREIGN KEY (department_id) REFERENCES department(department_id)
);

-- 4: patients table
CREATE TABLE patients(
patients_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR (255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
phone VARCHAR(30) NOT NULL UNIQUE,
gender ENUM ('Male', 'Female', 'Other') NOT NULL,
date_of_birth DATE,
email VARCHAR (255), 
address VARCHAR (255) UNIQUE
);

-- 5: appointments table
CREATE TABLE appointments(
appointments_id INT AUTO_INCREMENT PRIMARY KEY,
patients_id INT NOT NULL,
doctors_id INT NOT NULL,
appointment_date DATE,
appointment_status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
note TEXT,
FOREIGN KEY (doctors_id) REFERENCES doctors(doctors_id),
FOREIGN KEY (patients_id) REFERENCES patients(patients_id)
);

-- 6: prescription table
CREATE TABLE prescription (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    doctor_id INT NOT NULL,
    patient_id INT NOT NULL,
    date_issued DATE,
    notes TEXT,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointments_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctors_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patients_id)
);

-- 7: -- 7. doctor ratings Table
CREATE TABLE doctor_ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    doctors_id INT NOT NULL,
    patients_id INT NOT NULL,
    appointment_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    rating_date DATE,
    FOREIGN KEY (doctors_id) REFERENCES doctors(doctors_id),
    FOREIGN KEY (patients_id) REFERENCES patients(patients_id),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointments_id)
);


-- 8: prescription_medication table 
CREATE TABLE prescription_medication (
    prescription_id INT,
    medication_id INT,
    dosage VARCHAR(100),
    instruction TEXT,
    duration VARCHAR(100),
    PRIMARY KEY (prescription_id, medication_id),
    FOREIGN KEY (prescription_id) REFERENCES prescription(prescription_id),
    FOREIGN KEY (medication_id) REFERENCES medication(medication_id)
);

-- CREATNG USERS FOR THE DATABASE
-- 1. Create admin user with full privileges
CREATE USER 'clinic_admin'@'localhost' IDENTIFIED BY 'Clinic@2025';
GRANT ALL PRIVILEGES ON clinic_db.* TO 'clinic_admin'@'localhost';

-- 2. Create doctor user with limited privileges
CREATE USER 'clinic_doctor'@'localhost' IDENTIFIED BY 'Doctor@2025';
GRANT SELECT, INSERT, UPDATE ON clinic_db.* TO 'clinic_doctor'@'localhost';

-- 3. Apply the changes
FLUSH PRIVILEGES;
