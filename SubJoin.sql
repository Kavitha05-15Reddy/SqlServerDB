create database SubJoin;
use SubJoin;

create table Department
(
	deptNo int primary key,
	DName varchar(100)
);

insert into Department values
(1,'HR'),
(2,'Finance'),
(3,'IT'),
(4,'Marketing'),
(5,'Operations'),
(6,'Sales');

select * from Department;
create table Employee
(
	EId int primary key,
	EName varchar(100) not null,
	job varchar(100),
	salary int,
	hireDate date,
	city varchar(100),
	deptNo int foreign key references Department(deptNo),
	MId int
);

insert into Employee values
(1,'smith','manager',50000,'2020-04-08','New York',1,Null),
(2,'jhon','Accountant',60000,'2022-03-24','Chicago',2,6),
(3,'david','developer',80000,'2024-01-01','London',3,6),
(4,'miller','Engineer',70000,'2023-08-05','paris',3,3),
(5,'allen','Analyst',40000,'2018-07-15','Mumbai',5,3),
(6,'martin','manager',55000,'2021-09-25','Chicogo',4,1),
(7,'scott','clerk',10000,'2020-10-22','Dubai',6,9),
(8,'adams','developer',90000,'2019-05-16','New York',3,9),
(9,'james','manager',85000,'2023-02-27','London',6,1),
(10,'king','Assistant',20000,'2022-12-01','Mumbai',4,1);

alter table Employee add MId int;

update Employee set MId = 1 where EId = 10 ;

select * from Employee;

