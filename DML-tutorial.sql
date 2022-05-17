-- DDL workings
drop database if exists company;
create database company;
use company;

create table customer
(
c_id varchar(4) primary key,
cust_name varchar(50),
city varchar(20),
grade int,
constraint customer_grade check (grade between 0 and 1000)
);

create table Salesman
(
s_id varchar(4),
FirstName varchar(10),
LastName varchar(10),
City varchar(10),
commission real,
constraint Salesman_pk primary key(s_id)
);

create table order_tab
(
ord_no varchar(4),
purch_amt real,
ord_date date,
customer_id varchar(4) default 'C005',
salesman_id varchar(4) default '5001',
constraint order_tab_purch_amt_check check (purch_amt>0),
constraint order_tab_pk primary key (ord_no),
constraint ord_tab_fk1 foreign key(customer_id) references customer(c_id) on update set default on delete set default,
constraint ord_tab_fk2 foreign key(salesman_id) references salesman(s_id) on delete restrict on update set default
);


-- DML Workings

insert into customer values('C001','Saman','Moratuwa','50');
insert into customer values('C002','Kamal','Kalutara',100);
insert into customer values('C003','Nimal',null,50);
insert into customer values('C004','Aruni','Jaffna',120);
insert into customer values('C005','Heshan','Kanddy',80);

insert into salesman values('S001','Anura','Perera','Jaffna',0.21);
insert into salesman (s_id,FirstName,City,commission) values('S002','Nipuni','Colombo',0.15);
insert into salesman (FirstName,s_id,City,commission) values('Prabath','S003','Ratnapura',0.10);

insert into salesman values
('S004','Kasuni','Fernando','Matara',0.20), 
('S005','Jagath','Peries','Galle',0.16);


insert into order_tab values('T001',3000,'2022-01-21','C001','S001');
insert into order_tab values('T002',4000,'2022-01-29','C001','S002');

insert into order_tab values
('T003',4000,'2022-01-21','C002','S003'),
('T004',5000,'2022-02-02','C003','S001'),
('T005',1000,'2022-04-12','C003','S001');


select * from customer;
select * from salesman;
select * from order_tab;

update customer set cust_name='Kasun' where city is null;
update customer set grade=grade+50 where c_id='C002';

update Customer set cust_name='Ashen', city='Matara' where c_id='C003';

update customer set city='Matara' where grade=50;

update customer set city='Kalutara' where grade>50;

update customer set c_id='C006' where c_id='C001';

delete from customer where c_id='C001';

delete from customer where grade>50;

update order_tab set customer_id=null where customer_id='C001';

delete from order_tab where customer_id='C001'



