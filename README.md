# 📋 Clinic Booking & Patient Management System 
## 🏥 Project Overview
This project is a MySQL-based Clinic Booking and Patient Management System. It is designed to help clinics manage departments, doctors, patients, appointments, prescriptions, medications, and doctor ratings. The system supports efficient scheduling, tracking of prescriptions, and collection of patient feedback.
## 🧱 Database Schema
The database is named clinic_db and contains the following tables:

department – Stores department names and descriptions.

doctors – Contains doctor profiles, specialization, contact, and department.

patients – Stores patient personal details, contact info, and gender.

appointments – Manages patient-doctor appointments and their statuses.

prescription – Records prescriptions issued by doctors during appointments.

medication – Stores information about medicines prescribed.

prescription_medication – Many-to-many link between prescriptions and medications.

doctor_ratings – Collects feedback and ratings from patients after appointments.

### 📥 How to Import and Run the SQL File in MySQL Workbench
Open MySQL Workbench and connect to your local server.

Go to File > Open SQL Script, then select the SQL file (clinic_db.sql).

Ensure the script starts with:
CREATE DATABASE clinic_db;
USE clinic_db;
Click the lightning bolt icon or press Ctrl + Shift + Enter to execute the script.

After successful execution, expand the Schemas tab to view the newly created clinic_db with all tables.

## 📊 Entity Relationship Diagram (ERD)

Below is the ERD for the Clinic Booking & Patient Management System:











