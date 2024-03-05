-- here is the schema, table layouts
-- MedicalCenter
-- •	MedicalCenterID (PK)
-- •	Name
-- Doctor
-- •	DoctorID (PK)
-- •	MedicalCenterID (FK)
-- •	Name
-- •	Specialty 
-- Patient
-- •	PatientID (PK)
-- •	Name
-- •	DateOfBirth
-- •	Gender
-- •	Address
-- Visit
-- •	VisitID (PK)
-- •	DoctorID (FK)
-- •	PatientID (FK)
-- •	Date
-- •	Diagnosis
-- Disease
-- •	DiseaseID (PK)
-- •	VisitID (FK)
-- •	Name
-- •	Description 

--Here is the DDL/list of tables
CREATE TABLE MedicalCenter(
    MedicalCenterID INT PRIMARY KEY, --setting up the column, the datatype, and specifiying the primary key 
    Name VARCHAR(100)
);

CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    MecialCenterID INT,
    Name VARCHAR (100),
    Speciality VARCHAR (100),
    FOREIGN KEY (MedicalCenterID) REFERENCES MedicalCenter(MedicalCenterID) --at the end, we specify which primary key we want to connect to this table and make it our foreig key. we specify the specific column from this table, will reference another table with that same column 
);

CREATE TABLE Patient (
    Patient ID INT PRIMARY KEY,
    Name VARCHAR(100),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Address VARCHAR(255)
);

CREATE TABLE Visit (
    VisitID INT PRIMARY KEY,
    DoctorID INT,
    PatientID INT, 
    Date DATE,
    Diagnosis VARCHAR(255),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

CREATE TABLE Disease (
    DiseaseID INT PRIMARY KEY,
    VisitID INT,
    Name VARCHAR(100),
    Description VARCHAR(255),
    FOREIGN KEY (VisitID) REFERENCES Visit(VisitID)
);