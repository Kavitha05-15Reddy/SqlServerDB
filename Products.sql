use Problems;
--5)Design a database schema for a product inventory system with tables 
--for products, categories, and suppliers. Populate the tables with sample data.
--Write SQL queries to:

--Fetch all product records.
--Fetch products belonging to a specific category.
--Fetch products with a price greater than a specified value.
--Fetch products with low stock quantities (e.g., less than 10 units).

create table Category
(
	cid int primary key,
	cname varchar(100)
);

insert into Category values
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books');

select * from Category;

create table Suppliers
(
	supid int primary key,
	supname varchar(100),
	supContact varchar(100)
);

insert into Suppliers values
(1,'E-Suppliers','7894562340'),
(2,'C-Suppliers','8945623408'),
(3,'B-Suppliers','945623567');

select * from Suppliers;

create table Products
(
	pId int primary key,
	pName varchar(100),
	pPrice decimal(10,2),
	stockQnty int,
	cid int foreign key references Category(cid),
	supid int foreign key references Suppliers(supid)
);

insert into Products values
(1,'Smartphone',599.99,50,1,1),
(2,'Laptop',999.99,30,1,1),
(3,'T-Shirt',19.99,100,2,2),
(4,'Jeans',39.99,80,2,2),
(5,'Python Book',29.99,20,3,3),
(6,'C# Book',34.99,15,3,3);

select * from Products;

--Fetch all product records.
select *
from Products;

--Fetch products belonging to a specific category.
select *
from Products
where cid = 2;

--Fetch products with a price greater than a specified value.
select *
from Products
where pPrice > 100;

--Fetch products with low stock quantities (e.g., less than 10 units).
select *
from Products
where stockQnty < 10;