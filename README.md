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

<img src="/diagrams/unnormalized table.png" height="300" width="300">

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
<img src="/diagrams/membership table.png" height="300" width="300">
<img src="/diagrams/club table.png" height="300" width="300">

### Third Normal Form
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