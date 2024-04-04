use Problems;
--4)Set up a database schema for a customer order management system with tables 
--for customers, orders, and order items. Populate the tables with sample data. 
--Write SQL queries to:

--Fetch all orders placed by a specific customer.
--Fetch orders containing a particular product.
--Fetch orders placed within a certain date range.
--Fetch orders with a total value exceeding a specified amount.

create table Customer
(
	cid int primary key,
	cname varchar(50)
);

insert into Customer values
(1,'chiru'),
(2,'mahi'),
(3,'devi'),
(4,'vani'),
(5,'krish');

select * from Customer;

create table Orders
(
	oid int primary key,
	oDate date,
	totalAmt decimal(10,2),
	cid int foreign key references Customer(cid)
);

insert into Orders values
(1,'2024-02-5',1500.00,2),
(2,'2024-03-2',2000.00,4),
(3,'2024-01-15',2500.00,1),
(4,'2024-02-10',2000.00,3),
(5,'2024-03-17',3500.00,2),
(6,'2024-02-20',5000.00,5),
(7,'2024-03-25',1000.00,3);

select * from Orders;

create table OrderItems
(
	oItemId int primary key,
	productName varchar(50),
	quantity int,
	price decimal(10,2),
	oid int foreign key references Orders(oid)
);

insert into OrderItems values
(1,'jeans',2,500,2),
(2,'smartwatch',1,1500,1),
(3,'laptop',1,5000,5),
(4,'furniture',5,3500,2),
(5,'tab',2,2000,3);

select * from OrderItems;

--Fetch all orders placed by a specific customer.
select *
from Orders
where cid = 2;

--Fetch orders containing a particular product.
select * 
from OrderItems
where productName = 'jeans';

--Fetch orders placed within a certain date range.
select * 
from Orders
where oDate between '2024-02-5' and '2024-03-2';

--Fetch orders with a total value exceeding a specified amount.
select * 
from Orders
where totalAmt > 2000;