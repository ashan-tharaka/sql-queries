create database passpaper;
use passpaper;
create table STUDENT
(
StudentId varchar(7) not null,
FirstName varchar(255),
LastName varchar(255),
Age int,
Phone int,
constraint primaryKey primary key(StudentId)
);


insert into STUDENT values('185221A','Nimal','Silva',27,0771234567);
insert into STUDENT values('185222B','Kamal','Silva',28,0776543211);
insert into STUDENT values('185223C','Ajith','Perera',26,0728765456);
insert into STUDENT values('185224D','Isuru','Nishantha',26,0718789898);

SELECT * FROM STUDENT;

update STUDENT set LastName="Sirimewan" WHERE FirstName="Kamal";

SELECT StudentId FROM STUDENT WHERE LastName LIKE "%tha";

SELECT FirstName,LastName FROM STUDENT WHERE FirstName LIKE '__ma_';

-- vi
create table RESULT(
StudentId varchar(7),
Subject varchar(255),
FinalResult int,
primary key(StudentId,Subject),
constraint result_fk1 foreign key(StudentId) references STUDENT(StudentId) on delete CASCADE


);

insert into RESULT values("185221A","Database",90);
insert into RESULT values("185222B","Java",75);
insert into RESULT values("185222B","Statistics",80);
insert into RESULT values("185224D","Java",80);
insert into RESULT values("185221A","Java",92);


SELECT * FROM RESULT;
SELECT distinct s.StudentId,s.FirstName,r.Subject,r.FinalResult
FROM STUDENT s LEFT OUTER JOIN RESULT r 
ON s.StudentId=r.StudentId WHERE r.StudentId is not null;


SELECT Subject,COUNT(StudentId) as "No of Students"
FROM RESULT
WHERE FinalResult>75
group by Subject;


-- b
SELECT e.Emp_name,d.Dept_name 
FROM EMPLOYEE e,DEPARTMENT d,RESGISTER r
WHERE e.Emp_id=r.Emp_id AND d.Dept_id=r.Dept_id
group by e.Emp_id;


-- ii
SELECT e.Emp_name
FROM EMPLOYEE e,DEPARTMENT d,RESGISTER r
WHERE e.Emp_id=r.Emp_id AND d.Dept_id=r.Dept_id
AND r.Emp_id is null;
