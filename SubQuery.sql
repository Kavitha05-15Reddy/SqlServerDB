use SubJoin;
use Projects;
--NON-CORRELATED:
--same department
select *
from Employee
where deptNo in(select deptno
				from Employee
				where EName = 'miller');
--same job
select *
from Employee
where job in(select job
				from Employee
				where EName = 'martin');

--max salary
select * 
from Employee
where salary in (select max(salary)
			     from Employee);

select EName,salary,deptNo
from Employee
where deptNo = 4 and
	  salary > (select salary
				from Employee
				where EName = 'scott') and
	 salary < (select salary
				from Employee
				where EName = 'king');

select Employee.*,salary*12 annual_salary
from Employee
where hireDate > (select hireDate
				  from Employee
				  where EName='smith') and
	  hireDate < (select hireDate
				  from Employee
				  where EName='miller') and
	  salary > all(select salary
	            from Employee
				where EName in ('scott','king'));

--CORRELATED
--Find Employees with Salaries Higher Than Their Managers:
select Ename,salary
from Employee E1
where salary > (select salary
	            from Employee E2
				where E1.MId = E2.EId);

--Find Departments with No Employees:
select deptNo
from Department d
where not exists(select *
				 from Employee e
				 where d.deptNo = e.deptNo);
select *
from Employee e
where exists(select DName
				 from Department d
				 where d.deptNo = e.deptNo);

--Select the names and ages of all employees who are between the ages of 25 and 35: 
select empName,age
from Employee
where age between 25 and 35;
--Select the names and salaries of all employees who make more than $60,000 and 
--work in the "IT" department: 
select empName,salary
from Employee e,Department d
where e.deptId = d.deptId and
	  salary > 60000 and
	  deptName = 'IT';
--Select the total salary of all employees: 
select sum(salary) total_salry
from Employee;
--Select the names of all employees who do not have a salary value: 
select empName
from Employee
where salary is null;
--Select the names and ages of all employees, sorted by age in ascending order: 
select empName,age
from Employee
order by age asc;
--Select the top 2 departments with the highest total salary:
with dept_total_sal
as(select d.deptName,sum(salary) total_salary
   from Employee e,Department d
   group by d.deptName)
select top 2 deptName,total_salary
from dept_total_sal
order by total_salary;
