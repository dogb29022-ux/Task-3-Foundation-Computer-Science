# Task-3-Foundation-Computer-Science
## overview
Through the lens of database normalization, this project illustrates the core ideas of Relational Database Management Systems (RDBMS). The main objective is to create a structured, effective, and anomaly-free Third Normal Form (3NF) database from a "flat" unnormalized dataset that is representative of raw club membership records. We reduce redundancy and guarantee data integrity by separating entities like students, clubs, and mentors.

## Features
Step-by-Step Normalization: Practical implementation of 1NF, 2NF, and 3NF using MySQL.

Relational Integrity: Implementation of Primary and Foreign Key constraints to maintain data consistency.

Data Transformation: Utilization of STR_TO_DATE and JOIN operations to sanitize and query data.

Scalability: A modular architecture that allows for independent updates to student, mentor, or club details without affecting global records.

## Learning Outcome
By completing this task, I have gained proficiency in:

* Logical Modeling: Identifying functional dependencies and transitive dependencies.

* SQL DDL/DML: Writing complex scripts to restructure data on the fly.

* Data Validation: Ensuring that the transition from a flat file to a relational model preserves the original information while removing "Update" and "Deletion" anomalies.

## Normalization
Normalization is the process of organizing data to reduce duplication. We begin by creating our workspace:
```sql
CREATE DATABASE IF NOT EXISTS club_db;
```
**Expectecd Output**

<img src="/diagrams/CREATE.png" height="300" width="300">

**Queries to create unnormalized table**
Every piece of information is contained in a single table in the raw data. When a student joins a group, for example, the mentor's name is repeated, resulting in redundant information.

<img src="/diagrams/feeding rawdata.png" height="300" width="300">

**expected output**

<img src="/diagrams/unnormalized table.png" height="400" width="700">

### Second Normal Form
We eliminate Partial Functional Dependencies in order to achieve 2NF. We make sure that every non-key attribute depends entirely on the primary key. We separated the data into a Junction table for Memberships, Clubs, and Students.
```sql
CREATE TABLE Students_2NF AS 
SELECT DISTINCT StudentID, StudentName, Email FROM RawData;

CREATE TABLE Clubs_2NF AS 
SELECT DISTINCT ClubName, ClubRoom, ClubMentor FROM RawData;

CREATE TABLE Memberships_2NF AS 
SELECT StudentID, ClubName, STR_TO_DATE(JoinDate, '%m/%d/%Y') as JoinDate FROM RawData;
```
**Table of students**

<img src="/diagrams/student&apos;s table.png" height="300" width="300">

**Table of membership**

<img src="/diagrams/membership table.png" height="300" width="300">

**Table of Club**

<img src="/diagrams/club table.png" height="300" width="300">

### Third Normal Form
In 2NF, the ClubRoom and ClubMentor are still tied to the ClubName. However, a Transitive Dependency exists if a mentor's details depend on the club rather than the student. In 3NF, we move the Mentor into their own table.
```sql
-- STEP 3: THIRD NORMAL FORM (3NF)

-- 3a. Mentors Table (Separating Mentor from Club)
CREATE TABLE Mentors_3NF (
    MentorID INT AUTO_INCREMENT PRIMARY KEY,
    MentorName VARCHAR(100) UNIQUE
);

INSERT INTO Mentors_3NF (MentorName) 
SELECT DISTINCT ClubMentor FROM Clubs_2NF;

-- 3b. Final Clubs Table (Foreign key to Mentors)
CREATE TABLE Clubs_3NF (
    ClubID INT AUTO_INCREMENT PRIMARY KEY,
    ClubName VARCHAR(100),
    ClubRoom VARCHAR(50),
    MentorID INT,
    FOREIGN KEY (MentorID) REFERENCES Mentors_3NF(MentorID)
);

INSERT INTO Clubs_3NF (ClubName, ClubRoom, MentorID)
SELECT c.ClubName, c.ClubRoom, m.MentorID 
FROM Clubs_2NF c 
JOIN Mentors_3NF m ON c.ClubMentor = m.MentorName;

-- 3c. Final Memberships (Linking Students and Clubs)
CREATE TABLE Memberships_3NF AS 
SELECT m.StudentID, c.ClubID, m.JoinDate
FROM Memberships_2NF m
JOIN Clubs_3NF c ON m.ClubName = c.ClubName;
```
**expected output**

**3NF Table for Mentors**

<img src="/diagrams/mentors3nf.png" height="300" width="300">

**3NF Table for Memberships**

<img src="/diagrams/student&apos;s table.png" height="300" width="300">

**3NF Table for Club**

<img src="/diagrams/student&apos;s table.png" height="300" width="300">

## E-R Diagram

## basic operation
To verify the integrity of our 3NF schema, we perform standard CRUD (Create, Read, Update, Delete) operations.

By adding a new student to the students table, we will test the database. "Shreejan" will be added as a new student with studentID=9 and email=shreejan_2@gmail.com.
```sql
 INSERT INTO Students_2NF (StudentID, StudentName, Email) VALUES (9, 'Shreejan', 'shreejan_2@gmail.com');
```
<img src="/diagrams/adding data on student_2NF.png" height="300" width="300">

Additionally, a new club will be added to the Club table. Dance Club will be the club name, "R105" will be the clubroom, and 5 will be the clubID and mentorID, respectively.

<img src="/diagrams/new club added.png" height="300" width="300">

## join operation
All three tables will be joined here, and only StudentName, ClubName, and JoinDate will be displayed. This table then looks like this:

<img src="/diagrams/JOIN TABLE.png" height="300" width="300">

## Quick Start
```bash
#clone the repo
git clone https://github.com/dogb29022-ux/Task-3-Foundation-Computer-Science.git
cd Task-3-Foundation-Computer-Science
```
## usage and setup
## project structure
```sql
Task-3-Foundation-Computer-Science/
├── data/                       # Raw datasets and source files
│  
├── diagrams/                   # Visual documentation (ERDs and screenshots)
│   
├── scripts/                    # SQL implementation files
│  
├── .gitignore                  # Files to be ignored by Git
├── LICENSE                     # MIT License file
└── README.md                   # Project documentation (the file we are editing)
```

## Licence
This project is license under MIT License. See more about [License](https://github.com/dogb29022-ux/Cousework-Project-Code-Injector/blob/main/LICENSE) here.

## Author
* Shreejan Byanju - Intial Demonstration and Work