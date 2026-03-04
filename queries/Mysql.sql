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