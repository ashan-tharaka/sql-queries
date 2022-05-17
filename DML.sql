use company;
select * from customer
update customer  set cust_name="ashen",city="Matara" where cust_name="Saman";
update customer set city="Matara" where grade>100;
update customer set city=null where c_id="C001";
insert into customer values('C004',"Amal","wennappuwa",34)
,('C005',"Amal","wennappuwa",34),
('C006',"Amal","wennappuwa",34);
delete from customer where c_id="C002"
delete from customer where grade=100;

select * from Order_Tab
update Order_Tab set customer_id=null where customer_id='C001';
delete from customer where c_id="C001";
