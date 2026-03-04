CREATE DATABASE IF NOT EXISTS club_db;
USE club_db;

CREATE TABLE RawData (
    StudentID INT,
    StudentName VARCHAR(100),
    Email VARCHAR(100),
    ClubName VARCHAR(100),
    ClubRoom VARCHAR(50),
    ClubMentor VARCHAR(100),
    JoinDate VARCHAR(20)
);

INSERT INTO RawData VALUES
(1, 'Asha', 'asha@email.com', 'Music Club', 'R101', 'Mr. Raman', '1/10/2024'),
(2, 'Bikash', 'bikash@email.com', 'Sports Club', 'R202', 'Ms. Sita', '1/12/2024'),
(1, 'Asha', 'asha@email.com', 'Sports Club', 'R202', 'Ms. Sita', '1/15/2024'),
(3, 'Nisha', 'nisha@email.com', 'Music Club', 'R101', 'Mr. Raman', '1/20/2024'),
(4, 'Rohan', 'rohan@email.com', 'Drama Club', 'R303', 'Mr. Kiran', '1/18/2024'),
(5, 'Suman', 'suman@email.com', 'Music Club', 'R101', 'Mr. Raman', '1/22/2024'),
(2, 'Bikash', 'bikash@email.com', 'Drama Club', 'R303', 'Mr. Kiran', '1/25/2024'),
(6, 'Pooja', 'pooja@email.com', 'Sports Club', 'R202', 'Ms. Sita', '1/27/2024'),
(3, 'Nisha', 'nisha@email.com', 'Coding Club', 'Lab1', 'Mr. Anil', '1/28/2024'),
(7, 'Aman', 'aman@email.com', 'Coding Club', 'Lab1', 'Mr. Anil', '1/30/2024');


-- STEP 2: SECOND NORMAL FORM (2NF)
-- 2a. Student Table (Depends on StudentID)
CREATE TABLE Students_2NF AS 
SELECT DISTINCT StudentID, StudentName, Email FROM RawData;

-- 2b. Club Table (Depends on ClubName)
CREATE TABLE Clubs_2NF AS 
SELECT DISTINCT ClubName, ClubRoom, ClubMentor FROM RawData;

-- 2c. Membership Table (The Link)
SELECT StudentID, ClubName, STR_TO_DATE(JoinDate, '%m/%d/%Y') as JoinDate FROM RawData;


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