-- Section 1
-- Q1

create database Vaccination;
use Vaccination;
-- Q2
create table Vaccination_table
(
vac_id varchar(4),
vac_name varchar(20),
quantity int,
expiry_date date,
primary key(vac_id)


);
-- Q3
insert into Vaccination_table values ("P001","AstraZeneca",10000,"2021-12-20");
insert into Vaccination_table (vac_id,vac_name,quantity) values ("P002","Pfizer",400);

insert into Vaccination_table values ("P003","Sinopharm",50000,"2022-11-30");

-- Q4
create table Patient
(
patient_id varchar(10),
first_name varchar(20),
last_name varchar(20),
gender varchar(10),
vaccination_id varchar(4),
constraint registerFK1 foreign key(vaccination_id) references Vaccination_table(vac_id),
primary key(patient_id)
);

-- Q5

insert into Patient values("1234","ashan","tharaka","male","P001");

-- Q6
ALTER TABLE Patient
ADD date_of_birth date;


-- Q7

UPDATE Vaccination_table
SET vac_name="Sputnik"
WHERE vac_id="P002";

-- SECTION 2
-- Q1
SELECT * FROM Vaccination_table
WHERE quantity>3000;

-- Q2
SELECT v.vac_name 
FROM Vaccination_table v INNER JOIN Patient p
ON v.vac_id=p.vaccination_id
WHERE p.first_name="Kanthi" AND p.last_name="Perera";

-- Q3
SELECT vac_id,vac_name
FROM Vaccination_table
WHERE expiry_date is not null;

-- Q4
SELECT first_name,last_name
FROM Patient
WHERE first_name LIKE "ban%";

-- Q5
SELECT first_name,last_name
FROM Patient
GROUP  BY gender
ORDER BY last_name;


-- Q6
SELECT *
FROM Patient
WHERE vaccination_id
=
(SELECT vac_id FROM Vaccination_table
WHERE vac_name="Pfizer");



-- Q7
SELECT CONCAT(first_name,' ', last_name)
AS full_name
FROM Patient
WHERE date_of_birth LIKE "______8___";
