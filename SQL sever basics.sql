use Projects;
-----Quering data(select)
select * 
from Employee;

-----Filtering data(distinct,where,and,or,in,between,like,alias)
select distinct city, gender
from Employee;

select * 
from Employee
where age > 25;

select empName,gender
from Employee
where gender = 'F';

select empName,age,city
from Employee
where age > 24 and city = 'AP';

select empName,deptId,gender
from Employee
where (deptId = 2 or deptId = 4 or deptId = 6) and (gender = 'M' or gender = 'F');

select empName,deptId,gender
from Employee
where deptId in (2,4,6) and gender in ('M','F');

select empName,salary,age
from Employee
where (salary between 25000 and 35000) and (age between 22 and 26);

select empName 
from Employee
where empName like 'S%';

select empName 
from Employee
where empName like '%i';

select empName 
from Employee
where empName like 'S%i';

select empName 
from Employee
where empName like '_a%';

select empName 
from Employee
where empName like '[R-S]%';

select empName 
from Employee
where empName like '[^R-S]%';

select email
from Employee
where email like '%@@%' escape '@';

select empName, salary, salary*12 as 'annual salary' 
from Employee;

-----Sorting data(order by)
select empName
from Employee
order by empName asc; 

select salary
from Employee
order by salary desc; 

-----Limiting rows(offset fetch, select top)
select empName
from Employee
order by empName 
offset 3 rows
fetch next 3 rows only;

select top 3 *
from Employee;

-----Grouping data(group by,having,grouping sets,cube,rollup)
select max(salary) max_salary,
	   min(salary) min_salary,
	   avg(salary) avg_salary,
	   sum(salary) sum_salary,
	   count(*) no_employees,
	   deptId
from Employee
group by deptId;

select count(*) no_employees,job
from Employee
group by job
order by job;

select max(salary) max_salary,
	   min(salary) min_salary,job
from Employee
group by job
having min(salary) > 10000 and max(salary) < 50000
order by job;

select count(*) no_employees,deptId
from Employee
where empName like '%a%'
group by deptId
having count(*) >= 1
order by deptId; 

select deptId,job,sum(salary) total_salary
from Employee
group by grouping sets((deptId),(job))
order by deptId,job;

select deptId,job,sum(salary) total_salary
from Employee
group by cube (deptId,job)
order by deptId,job;

select deptId,job,sum(salary) total_salary
from Employee
group by rollup (deptId,job)
order by deptId,job;

-----Set operators
select deptName 
from Department
union
select job
from Employee; 

select deptName 
from Department
unionall
select job
from Employee; 

select deptName 
from Department
intersect
select job
from Employee; 

select deptName 
from Department
except
select job
from Employee; 