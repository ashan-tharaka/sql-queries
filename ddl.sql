drop database if exists company1;
create database company1;
use company1;
create table Customer(
c_id varchar(10) primary key,
cust_name varchar(20),
city varchar(20),
grade int,
constraint customer_grade check(grade between 0 and 1000)
);
create table Salesman(
s_id varchar(10) primary key,
FirstName varchar(20),
LastName varchar(20),
City varchar(20),
commission real

);

create table Order_tab (
ord_no varchar(10) primary key,
purch_amt real,
ord_date date,
customer_id varchar(20),
salesman_id varchar(10) default '5001',
constraint check(purch_amt>0 and purch_amt<1000),
constraint ord_tab_fk1 foreign key(customer_id) 
references customer(c_id) on update set default on delete set default,
constraint ord_tab_fk2 foreign key(salesman_id) 
references salesman(s_id) on delete restrict on update set default


);
ALTER TABLE customer
ADD customer_age int;


ALTER TABLE Order_tab
RENAME COLUMN ord_date TO ordered_date;


ALTER TABLE salesman
DROP COLUMN city;
DROP TABLE Order_tab;

DROP TABLE customer;

DROP database company1;

