create database Problems;
use Problems;
--1)Set up a database schema for tracking employee attendance with tables for employees 
--and attendance records. Populate the tables with sample data.
--Write SQL queries to:
--Fetch attendance records for a specific employee.
--Fetch attendance records for a particular date.
--Fetch employees with perfect attendance (no absences).
--Fetch employees with a certain number of absences.
create table Employee
(
	empId int primary key,
	empName varchar(50) not null,
	deptName varchar(50) not null
);

select * from Employee;

create table AttendenceRecords
(
	recordId int primary key,
	dateOfJoining date,
	absences int,
	empId int foreign key references Employee(empId)
);

select * from AttendenceRecords;

insert into Employee values
(1,'kiran','developer'),
(2,'sravya','testing'),
(3,'pranav','clerk'),
(4,'gayi','manager'),
(5,'harish','engineer'),
(6,'tanu','testing');

insert into AttendenceRecords values
(1,'2024/03/05',3,5),
(2,'2024/02/04',2,4),
(3,'2024/01/06',5,1),
(4,'2024/03/07',0,6),
(5,'2024/02/02',3,3),
(6,'2024/01/08',4,2);

--Fetch attendance records for a specific employee.
select * 
from Employee,AttendenceRecords
where Employee.empId = AttendenceRecords.empId and
	  empName ='harish';

--Fetch attendance records for a particular date.
select * 
from Employee,AttendenceRecords
where Employee.empId = AttendenceRecords.empId and
	  dateOfJoining = '2024/01/06';

--Fetch employees with perfect attendance (no absences).
select * 
from Employee,AttendenceRecords
where Employee.empId = AttendenceRecords.empId and
	  absences = 0;

--Fetch employees with a certain number of absences.
select empName,absences
from Employee,AttendenceRecords
where Employee.empId = AttendenceRecords.empId
group by empName,absences;


