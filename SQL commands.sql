create database Projects;
use Projects;

----DDL commnds(create,alter,drop,truncate,sp_rename)
create table Department
(
	deptId int primary key,
	deptName varchar(50)
);

create table Employee
(
	empId int primary key,
	empName varchar(50) not null,
	gender char(1) check(gender in('M','F')),
	email varchar(100) unique,
	age int check(age > 18),
	salary decimal(10,2) check(salary >=0),
	deptId int foreign key references Department(deptId)
);


-----DML commands(insert,update,delete)
insert into Department values(1,'Testing');
insert into Department values(2,'Developer');
insert into Department values(3,'Engineering');

insert into Employee values(1,'Sri','M','sri@gmail.com',25,25000,1);
insert into Employee values(2,'Tanu','F','tanu@gmail.com',22,30000,3);
insert into Employee values(3,'Ram','M','ram@gmail.com',24,20000,2);

insert into Employee values
(4,'Priya','F','priya@gmail.com',21,25000,1),
(5,'Krish','M','krish@gmail.com',27,25000,1),
(6,'Siri','F','siri@gmail.com',23,25000,1);

insert into Department values
(4,'HR'),
(5,'Manager'),
(6,'Employees');

update Employee set age = 26 where empId = 1;
update Employee set age = 25 , salary = 22000 where empId = 3;
update Employee set deptid = 3 where empId = 4;

alter table Employee add phone int;
alter table Employee add city varchar(50);
alter table Employee add job varchar(50);
alter table Employee alter column salary int; 
alter table Employee drop column phone;


update Employee set city = 'KA' where empId = 6;
update Employee set job = 'developer' where empId = 6;



----DQL commands(select)
select * from Department;
select * from Employee;

select * from
Employee,Department
where Employee.deptId = Department.deptId;


--drop table Department;
--truncate table Department;
--delete from Employee where empName = 'Tanu';
--exec sp_rename 'Employee', 'Staff';
--exec sp_rename 'Employee.fullName', 'empName';


-----TCL commands(commit,rollback,savepoint)
begin transaction;
update Employee set empName = 'Tanu' where empId = 2;
delete from Employee where empId = 3;

save transaction s1;
delete from Employee where empId = 1;

--commit;

begin transaction;
rollback;

begin transaction;
rollback transaction s1;

select * from Department;
select * from Employee;


-----DCL commmands(grant,revoke)
create login user1 with password='1234';
create user user1 for login user1;

grant select on Employee to user1;
revoke select on Employee from user1;


