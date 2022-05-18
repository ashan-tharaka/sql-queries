use company;
select * from customer;
select * from salesman;
select * from Orders;
SELECT COUNT(*)
FROM Orders
WHERE ord_date="2015-08-17";

SELECT purch_amt,customer_id,ord_date
FROM Orders
WHERE (purch_amt,customer_id)IN
(
SELECT MAX(purch_amt),customer_id
FROM Orders 
GROUP BY customer_id);

SELECT purch_amt,customer_id,ord_date
FROM Orders
WHERE (purch_amt,ord_date)IN
(
SELECT MAX(purch_amt),ord_date
FROM Orders
GROUP BY ord_date
HAVING purch_amt>2000);
