CREATE DATABASE SEDCACADEMYDB

USE SEDCACADEMYDB

CREATE TABLE Students(
Id int NOT NULL,
FirstName nvarchar(50) NOT NULL,
DateOFBirth date NOT NULL,
EnrolledDate date NOT NULL,
Gender nchar(1) NOT NULL,
NationalIdNumber nvarchar(20) NULL,
StudentCardNumber nvarchar(20) NULL
)

CREATE TABLE Teachers(
Id int NOT NULL,
FirstName nvarchar(50) NOT NULL,
DateOFBirth date NOT NULL,
AcademicRank nvarchar(50) NOT NULL,
HireDate date NOT NULL
)

CREATE TABLE Grade(
Id int NOT NULL,
StudentId nvarchar(20) NULL,
CourseId nvarchar(20) NULL,
TeacherId nvarchar(20) NULL,
Grade int NOT NULL,
Comment nvarchar(MAX) NULL,
CreatedDate date NOT NULL
)

CREATE TABLE Course(
Id int NOT NULL,
[Name] nvarchar(100) NOT NULL,
Credit nvarchar(50) NOT NULL,
AcademicYear nvarchar(50) NOT NULL,
Semester nvarchar(50) NOT NULL,
)

CREATE TABLE GradeDetails(
Id int NOT NULL,
Grade int NOT NULL,
AchievementTypeId int NOT NULL,
AchievementPoints int NOT NULL,
AchievementMaxPoints int NOT NULL,
AchievementDate date NOT NULL
)

CREATE TABLE AchievementType(
Id int NOT NULL,
[Name] nvarchar(100) NOT NULL,
[Description] nvarchar(MAX) NULL,
ParticipationRate nvarchar(50) NULL
)