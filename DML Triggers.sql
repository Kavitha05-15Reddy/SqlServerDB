--Employee Table
create table Employee
(
	empId int primary key,
	empName varchar(100),
	age int,
	salary int,
	city varchar(100),
	department varchar(100)
)

insert into Employee values
(1,'smith',25,30000,'chicago','manager'),
(2,'scott',30,50000,'boston','developer'),
(3,'king',35,80000,'newyork','IT'),
(4,'miller',20,70000,'mumbai','HR'),
(5,'allen',26,60000,'dubai','sales');

select * from Employee

--Employee_audit Table
create table Employee_audit
(
	auditId int identity(1,1) primary key,
	empId int,
	empName varchar(100),
	age int,
	salary int,
	city varchar(100),
	department varchar(100),
	operation varchar(10),
    auditDate datetime default(getdate())
)

--Employee_Insert_Audit Trigger
create trigger Employee_Insert_Audit
on Employee
after insert
as
begin
	set nocount on;
	insert into Employee_audit (empId,empName,age,salary,city,department,operation)
	select empId,empName,age,salary,city,department,'Insert'
	from inserted;
end;

insert into Employee (empId,empName,age,salary,city,department) values
(8,'shiv',30,65000,'boston','HR');

select * from Employee_audit;
select * from Employee;

--Employee_Delete_Audit Trigger
create trigger Employee_Delete_Audit
on Employee
after delete
as
begin
	set nocount on;
	insert into Employee_audit (empId,empName,age,salary,city,department,operation)
	select empId,empName,age,salary,city,department,'Delete'
	from deleted;
end;

delete from Employee where empId=8;

select * from Employee_audit;
select * from Employee;
