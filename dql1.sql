use company;
-- 1
select * from salesman
-- 2
select FirstName ,commission from salesman

--3
select concat(FirstName,' ',LastName) 'Full Name' ,commission from salesman
order by commission asc
--4

select distinct city from salesman where lastName='Perera'

-- 5

SELECT FirstName
FROM Salesman
WHERE FirstName like '%as%'



SELECT FirstName
FROM Salesman
WHERE FirstName like 'Ka%'

SELECT FirstName FROM Salesman WHERE City='Kandy' OR commission=0.21

-- 7
SELECT count(s_id) 'No of Salesman'

 FROM Salesman
WHERE commission=0.21

--8

SELECT s_id,commission*1000 'Total Earning'
FROM Salesman
