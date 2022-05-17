drop database if exists myDb;
create database myDb;
use myDb;
create table Employee
(
Eid varchar(5),
Ename varchar(20),
Salary real,
Designation varchar(15),
constraint Emp_pk primary key (Eid)
);
insert into Employee values('E001','Saman',70000,'Executive');
insert into Employee values('E002','Kamal',65000,'Cleark');
insert into Employee values('E003','Aruni',90000,'Executive');
insert into Employee values('E004','Jagath',150000,'Manager');
insert into Employee values('E005','Nimal',48000,'Cleark');
insert into Employee values('E006','Sandun',95000,'Manager');
insert into Employee values('E007','Bimal',60000,'Cleark');
insert into Employee values('E008','Oshadee',120000,'Manager');
insert into Employee values('E009','Sarath',71000,'Executive');
insert into Employee values('E010','Kasuni',69000,'Cleark');

SELECT * FROM Employee;
SELECT Salary FROM Employee;

SELECT AVG(Salary) FROM Employee;

SELECT min(Salary) FROM Employee;
SELECT max(Salary) FROM Employee;
SELECT sum(Salary) FROM Employee;
SELECT count(Salary) FROM Employee;

SELECT Designation,AVG(Salary) FROM Employee group by Designation
SELECT Designation,MAX(Salary) FROM Employee group by Designation
SELECT Designation,MIN(Salary) FROM Employee group by Designation
SELECT Designation,SUM(Salary) FROM Employee group by Designation
SELECT Designation,COUNT(Salary) FROM Employee group by Designation


SELECT Designation,AVG(Salary) FROM Employee
 group by Designation
 HAVING AVG(Salary)>70000
 
 SELECT * FROM Employee;
 
 -- average=83800
 
 SELECT AVG(Salary) FROM Employee;
 
SELECT * FROM Employee 
WHERE Salary>(SELECT AVG(Salary) FROM Employee);


SELECT * FROM Employee e1
WHERE Salary>(SELECT AVG(Salary) FROM Employee e2 WHERE e2.Designation=e1.Designation);

 