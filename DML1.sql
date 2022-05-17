create database company2
use company2
create table Customer
(
c_id varchar(4) primary key,
cust_name varchar(20),
city varchar(20),
grade int,
check (grade>0 and grade<1000)


)
create table Salesman
(
s_id varchar(4) primary key,
FirstName varchar(20),
LastName varchar(20),
City varchar(20),
commission float)

create table Order_Tab
(
ord_no varchar(4) primary key,
purch_amt real,
ord_date date,
customer_id varchar(4),
salesman_id varchar(4) default '5001',
check (purch_amt>0),
constraint ord_tab_fk1 foreign key(customer_id) references Customer(c_id) on delete set null on update cascade,
constraint ord_tab_fk2 foreign key(salesman_id) references Salesman(s_id) on delete restrict on update set null



)
alter table Customer add column customer_age int after cust_name
alter table Order_Tab rename column ord_date to ordered_date
alter table Salesman drop column city
drop table Customer
drop table Order_Tab
drop database Company2
