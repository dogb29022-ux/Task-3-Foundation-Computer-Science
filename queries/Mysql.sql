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
