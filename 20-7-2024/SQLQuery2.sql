
CREATE DATABASE SchoolManagementSystem ;
use SchoolManagementSystem ;
CREATE TABLE Family_Info (
family_ID int identity (1,1),
father_name varchar(50),
phone_number varchar(50) NOT NULL,
Address  varchar(50) ,
constraint Family_Info_PK primary key(family_ID)
);

CREATE TABLE Students (
students_ID int identity(1,1),
students_name varchar(50) ,
birthDate date ,
Address  varchar(50) NOT NULL,
family_id int ,
constraint students_PK primary key (students_ID),
constraint students_FamilyInfo_FK foreign key (family_id) references Family_Info(family_ID) 
);

CREATE TABLE Courses (
courses_ID int identity(1,1),
courses_name varchar(50) not null,
course_resources varchar(50),
course_description varchar (50),
constraint Courses_PK primary key(courses_ID)
);


CREATE TABLE Classes (
class_ID int identity(1,1),
class_code varchar(50) NOT NULL ,
room_number int NOT NULL ,
schedule  varchar(50),
courses_id int ,
constraint Classes_PK primary key(class_ID),
constraint Classes_FK foreign key (courses_id) references Courses(courses_ID)
);

CREATE TABLE StudentsClasses (
students_id int ,
class_id int ,
constraint Students_Classes_FK1 foreign key (students_id) references Students(students_ID),
constraint Students_Classes_FK2 foreign key (class_id ) references  Classes(class_ID),
primary key (students_id,class_id)
);

CREATE TABLE Assignments(
assignments_ID  int identity(1,1),
assignments_name varchar(50) NOT NULL,
assignments_description varchar(50),
assignments_state VARCHAR(50) NOT NULL, 
class_id int,
constraint Assignments_PK primary key(assignments_ID),
constraint  Assignments_Classes_FK foreign key(class_id) references Classes(class_ID),
 CONSTRAINT Assignments_chk CHECK (assignments_state IN ('pass', 'failed'))
);

CREATE TABLE StudentsAssignments (
students_id int ,
assignments_id int,
constraint Students_Assignments_FK1 foreign key (students_id) references Students(students_ID),
constraint Students_Assignments_FK2 foreign key (assignments_id) references  Assignments(assignments_ID),
primary key (students_id,assignments_id)
);

CREATE TABLE Attendance (
attendance_ID int identity (1,1),
attendance_date date ,
absence_type varchar(50) NOT NULL,
reason varchar(50) NOT NULL,
students_id int,
class_id int,
duedate DATE ,
constraint  Attendance_PK primary key(attendance_ID),
constraint  Attendance_Students_FK foreign key(students_id) references Students(students_ID),
constraint  Attendance_Classes_FK foreign key(class_id) references Classes(class_ID),
 CONSTRAINT Attendance_chk CHECK (absence_type IN ('leaving', 'absence', 'late'))
);




INSERT INTO Family_Info (father_name, phone_number, Address)
OUTPUT inserted.father_name, inserted.phone_number, inserted.Address
VALUES 
    ('John Doe', '123-456-7890', '123 Elm Street'),
    ('Jane Smith', '234-567-8901', '456 Oak Avenue'),
    ('Michael Johnson', '345-678-9012', NULL), 
    ('Emily Davis', '987-654-3210', '101 Pine Street'),  
    ('David Brown', '456-789-0123', '202 Cedar Lane');


INSERT INTO Students (students_name, birthDate, Address, family_id)
OUTPUT inserted.students_name, inserted.birthDate, inserted.Address, inserted.family_id
VALUES ('Alice Johnson', '2005-01-15', '789 Pine Road', 1),
       ('Bob Brown', null, 'Unknown Address', 2),  
       ('Charlie Green', '2004-11-05', '123 Elm Street', 3),
       ('Diana White', '2005-08-16', '456 Oak Avenue', 4),
       ('Edward Black', null, '789 Maple Road', 5);


INSERT INTO Courses (courses_name, course_resources, course_description)
OUTPUT inserted.courses_ID, inserted.courses_name, inserted.course_resources, inserted.course_description
VALUES 
    ('Mathematics', 'Textbook, Calculator', 'Basic and advanced mathematical concepts'),
    ('Science', NULL, 'Fundamental principles of physical '),  
    ('History', 'Lab Equipment, Textbook', 'Historical events and analysis from ancient '), 
    ('Literature', 'Novels, Anthologies', NULL),
	('Art', 'Painting Supplies, Sketchbooks', 'Introduction to various art techniques and history');
select  * from Courses;
INSERT INTO Classes (class_code, room_number, schedule, courses_id)
OUTPUT inserted.class_ID, inserted.class_code, inserted.room_number, inserted.schedule, inserted.courses_id
VALUES 
    ('MATH101', 101, 'Mon-Wed 10:00-11:30', 1),
    ('SCI202', 202, 'Tue-Thu 14:00-15:30', 2),
    ('HIST303', 303, null, 3),
    ('LIT404', 404, 'Wed-Fri 11:00-12:30', 4),
    ('ART505', 505, 'Mon-Wed 13:00-14:30', 5);

INSERT INTO StudentsClasses (students_id, class_id)
OUTPUT inserted.students_id, inserted.class_id
VALUES 
    (1, 1),  
    (1, 2),  
    (2, 3),  
    (3, 4), 
    (4, 5), 
    (5, 1), 
    (5, 3); 


INSERT INTO Assignments (assignments_name, assignments_description, assignments_state, class_id)
OUTPUT inserted.assignments_ID, inserted.assignments_name, inserted.assignments_description, inserted.assignments_state, inserted.class_id
VALUES 
    ('Homework 1', 'Basic algebra problems', 'pass', 1),
    ('Lab Report', 'Experiment results and analysis', 'failed', 2),
    ('Essay 1', null, 'pass', 3),
    ('Reading Assignment', 'Literary analysis of novel', 'pass', 4),
    ('Project 1', 'Art project on modern techniques', 'failed', 5);


INSERT INTO StudentsAssignments (students_id, assignments_id)
OUTPUT inserted.students_id, inserted.assignments_id
VALUES 
    (1, 1),  
    (1, 2), 
    (2, 3),  
    (3, 4), 
    (4, 5), 
    (5, 1),  
    (5, 3); 


INSERT INTO Attendance (attendance_date, absence_type, reason, students_id, class_id, duedate)
OUTPUT inserted.attendance_ID, inserted.attendance_date, inserted.absence_type, inserted.reason, inserted.students_id, inserted.class_id, inserted.duedate
VALUES 
    ('2024-07-01', 'absence', 'Sick leave', 1, 1, NULL),
    ('2024-07-01', 'late', 'Traffic jam', 2, 2, '2024-07-02'),
    ('2024-07-02', 'leaving', 'Family event', 3, 3, NULL),
    ('2024-07-03', 'absence', 'Medical appointment', 4, 4, '2024-07-04'),
    ('2024-07-04', 'late', 'Overslept', 5, 5, NULL);



SELECT students_name FROM Students WHERE birthDate='2004-11-05';
SELECT * FROM Courses WHERE courses_name='Literature';
ALTER TABLE Students ADD  Email varchar(15) null;
SELECT * FROM  Students;

INSERT INTO Students (students_name, birthDate, Address, family_id)
OUTPUT inserted.students_name, inserted.birthDate, inserted.Address, inserted.family_id
VALUES ('DIMA', '1998-01-16', 'IRBID', NULL);

SELECT students_name FROM Students where family_id is not null;
SELECT students_name FROM Students S join Attendance A ON S.students_ID=A.students_id 
JOIN Classes C  ON A.class_id=C.class_ID JOIN Courses CS on C.courses_id =CS.courses_ID WHERE courses_name='Art';


SELECT distinct S.students_name from Students S JOIN StudentsAssignments SA on S.students_ID=SA.students_id
JOIN  Assignments A ON SA.assignments_id=A.assignments_ID where( A.assignments_state ='pass' AND A.assignments_ID = 3);


SELECT S.students_name, A.attendance_date, A.reason
FROM Students S
JOIN Attendance A ON S.students_ID = A.students_id
WHERE A.absence_type = 'leaving'
  AND A.attendance_date BETWEEN'2024-07-01' AND '2024-07-08';