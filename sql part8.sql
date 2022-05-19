drop database if exists uniDb;
create database uniDb;
use uniDb;
create table Student
(
studentID varchar(5),
regNo char(7),
studentName varchar(20),
age int,
gpa real,
constraint student_pk primary key(studentId)
);
create table Module
(
moduleID varchar(5),
moduleName varchar(15),
credit int,
constraint modulePK primary key(moduleID)
);
create table Register
(
studentID varchar(5),
moduleID varchar(5),
registerDate date,
constraint registerPK primary key(studentID,moduleID),
constraint registerFK1 foreign key(studentID) references Student(studentID),
constraint registerFK2 foreign key(moduleID) references Module(moduleID)
);
insert into Student values('S001','194123K','Saman',21,2.9);
insert into Student values('S002','195023R','Kamal',20,3.3);
insert into Student values('S003','185025J','Aruni',22,3.2);
insert into Student values('S004','194152P','Kosala',25,1.9);
insert into Student values('S005','174193E','Oshadee',21,2.8);
insert into Module values('M001','DBMS',3);
insert into Module values('M002','Hardware',2.5);
insert into Module values('M003','Software',3.5);
insert into Module values('M004','Programming',4);
insert into Module values('M005','Maths for IT',4);
insert into Register values('S001','M001','2021-03-01');
insert into Register values('S001','M002','2021-03-02');
insert into Register values('S001','M004','2021-03-05');
insert into Register values('S002','M001','2021-02-01');
insert into Register values('S002','M003','2021-01-05');
insert into Register values('S002','M004','2021-03-01');
insert into Register values('S002','M002','2021-02-06');
insert into Register values('S004','M001','2021-03-01');
insert into Register values('S004','M002','2021-03-08');
insert into Register values('S004','M003','2021-03-11');


SELECT studentName FROM Student WHERE   POSITION("5" IN regNo)=3;
-- 2
SELECT distinct s.studentName FROM Student s,Module m ,Register r 
WHERE s.studentID=r.studentID AND m.moduleID=r.moduleID AND (m.moduleName='DBMS' OR m.moduleName='Software');

-- 3
SELECT  s.studentName FROM Student s,Module m ,Register r 
WHERE s.studentID=r.studentID AND m.moduleID=r.moduleID 
AND m.moduleName='Hardware' AND s.studentName =(
SELECT  distinct s.studentName FROM Student s,Module m ,Register r 
WHERE s.studentID=r.studentID AND m.moduleID=r.moduleID 
AND m.moduleName='Software' );

SELECT studentName FROM Student 
WHERE studentID=(
SELECT  r.studentID FROM Register r INNER JOIN Module m
ON r.moduleID=m.moduleID WHERE m.moduleName="Software" AND m.moduleName="Hardware");

--  4
SELECT m.moduleName FROM Module m LEFT OUTER JOIN Register r
ON m.moduleID=r.moduleID WHERE r.moduleID is null;



-- 5
SELECT studentName FROM Student where gpa<
(
SELECT AVG(gpa) FROM Student
);



