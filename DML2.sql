drop database if exists company;
create database company;
use company;
create table customer
(
c_id varchar(4) primary key,
cust_name varchar(50),
city varchar(20),
grade int,
constraint customer_grade check(grade between 0 and 1000)
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

insert into customer values('C001','Saman','Moratuwa',50);
insert into customer values('C002','Saman','Kaluthara',100);
select * from customer;

insert into customer values('C003','Saman',null,100);
select * from salesman;
insert into salesman (s_id,FirstName,City,commission) values('5002','Anura','colombo',100.12);
insert into salesman values('123','anura','kumara','colombo',12),('133','anura','kumara','colombo',12)


insert into Order_Tab values('1110',12.11,'2022-01-11','C001','5002');
select * from Order_Tab

update customer set cust_name='Kasun' where grade=100;
update customer set grade=grade+50 where c_id='C001';
