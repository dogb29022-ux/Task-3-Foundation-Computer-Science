# Task-3-Foundation-Computer-Science
## overview
## Features
## Learning Outcome

## Normalization
```sql
CREATE DATABASE IF NOT EXISTS club_db;
```
**Expectecd Output**

<img src="/diagrams/CREATE.png" height="300" width="300">

**Queries to create unnormalized table**

<img src="/diagrams/feeding rawdata.png" height="300" width="300">

**expected output**

<img src="/diagrams/unnormalized table.png" height="400" width="700">

### Second Normal Form
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

## basic operation
## join operation
## Quick Start
```bash
#clone the repo
git clone https://github.com/dogb29022-ux/Task-3-Foundation-Computer-Science.git
cd Task-3-Foundation-Computer-Science
```
## usage and setup
## project structure
## Licence
## Author