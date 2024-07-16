CREATE DATABASE SchoolSystem;
USE SchoolSystem;
CREATE TABLE Teachers(ID_teacher int primary key  ,
Tachear_name char(10) );
CREATE TABLE TeacherDetails(ID int primary key ,
salary int , ID_teacher int UNIQUE foreign key REFERENCES Teachers (ID_teacher));
CREATE TABLE Courses (CourseID int primary key  ,
CourseName varchar(15),
ID_teacher int  foreign key REFERENCES Teachers (ID_teacher)
);

Create TABLE Students(StudentID int primary key ,
StudentName varchar(15),
CourseID int foreign key REFERENCES Courses (CourseID) );

CREATE TABLE Coursesstudents (CourseID int foreign key REFERENCES Courses (CourseID),
StudentID int foreign key REFERENCES Students(StudentID)
 PRIMARY KEY (CourseID, StudentID));

INSERT INTO Teachers VALUES(1,'dima'),(2,'lujain'),(3,'rahaf'),(4,'ghaidaa'),(5,'suha');
INSERT INTO  TeacherDetails VALUES (1,1000,1),(2,1000,2),(3,500,3),(4,4000,4),(5,150,5);
INSERT INTO Courses VALUES (1,'c++',1),(2,'c#',2),(3,'Python',3),(4,'Html',4),(5,'asp.net',5);
INSERT INTO Students VALUES (1,'Mohammad',1),(2,'yaman',2),(3,'omar',3),(4,'anas',4),(5,'hosam',5);
INSERT INTO Coursesstudents VALUES (1,1),(2,2),(3,3),(4,4),(5,5);

SELECT * FROM Teachers;
SELECT * FROM TeacherDetails;
SELECT CourseName,Tachear_name FROM Courses JOIN Teachers ON Courses.ID_teacher=Teachers.ID_teacher;
SELECT * FROM Students;
SELECT * FROM Coursesstudents;


