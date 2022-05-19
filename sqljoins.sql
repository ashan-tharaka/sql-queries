drop database if exists Bank;
create database Bank;
use bank;

create table AccType
(
typeID varchar(5),
typeName varchar(20),
constraint AccType_pk primary key(typeID)
);

create table Account
(
accountNo varchar(5),
balance real,
typeID varchar(5),
constraint Account_pk primary key(accountNo)
);

insert into AccType values
('T001','Ordinary Savings'),
('T002','Max Bonus'),
('T003','Hit Saver');

insert into Account values
('A001',20000,'T001'),
('A002',30000,'T002'),
('A003',40000,'T001'),
('A004',50000,'T004'),
('A005',60000,'T005');


SELECT * FROM Account;
SELECT * FROM AccType;

-- inner join

SELECT *
FROM AccType AS t inner join Account AS a ON t.typeID=a.typeID
-- left outer join
SELECT *
FROM AccType AS t left outer join Account AS a ON t.typeID=a.typeID

-- right outer
SELECT *
FROM AccType AS t right outer join Account AS a ON t.typeID=a.typeID

-- full outer join
SELECT *
FROM AccType AS t left outer join Account AS a ON t.typeID=a.typeID
UNION
SELECT *
FROM AccType AS t right outer join Account AS a ON t.typeID=a.typeID;


-- unmatching tuples in left outer join
SELECT *
FROM AccType AS t left outer join Account AS a ON t.typeID=a.typeID
WHERE a.typeID is null

-- unmatching tuples in right outer join

SELECT *
FROM AccType AS t right outer join Account AS a ON t.typeID=a.typeID
WHERE t.typeID is null

-- unmatching tuples in  full outer join
SELECT *
FROM AccType AS t left outer join Account AS a ON t.typeID=a.typeID
WHERE a.typeID is null
UNION
SELECT *
FROM AccType AS t right outer join Account AS a ON t.typeID=a.typeID
WHERE t.typeID is null;

-- natural join
SELECT *
FROM AccType AS t  natural join Account AS a ;

SELECT Account AS a natural join AccType AS t;


-- cross join
SELECT *
FROM AccType AS t  cross join Account AS a ;

SELECT * FROM Account a cross join AccType t;
