use Advance;
create table Employees 
(
    EmployeeID int,
    FirstName varchar(50),
    LastName varchar(50),
    Department varchar(50),
    Salary decimal(10, 2)
);
insert into Employees values
(1, 'John', 'Doe', 'HR', 50000),
(2, 'Alice', 'Smith', 'IT', 60000),
(3, 'Bob', 'Johnson', 'Marketing', 55000),
(4, 'Emily', 'Brown', 'Sales', 52000),
(5, 'Michael', 'Williams', 'IT', 58000);

select * from Employees;

--Clustered
create clustered index idx_employee_id_clustered
on Employees (EmployeeID);

select * from Employees where EmployeeID=1;

--Non-Clustered
create nonclustered index idx_department 
on Employees (Department);

select * from Employees where Department = 'IT';

--Unique
create unique index idx_email 
on Employees (LastName, FirstName);

select * from Employees where LastName = 'Smith' and FirstName = 'Alice';

--Single Column
create index idx_employee_id 
on Employees (EmployeeID);

select * from Employees where EmployeeID=5;

drop index idx_employee_id 
on Employees;

--Composite
create index idx_department_salary 
on Employees (Department, Salary);

select * from Employees where Department = 'IT' and Salary > 55000;



