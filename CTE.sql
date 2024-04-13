use Problems;
use SubJoin;

---COMMON TABLE EXPRESSION
with New_CTE
as
(
	select * from Products
)
select count(*) from New_CTE;

with New_CTE
as
(
	select * from Products where pPrice > 100
)
select * from New_CTE where stockQnty > 10;

with New_CTE(P_Id,P_Name,P_Price)
as
(
	select pId,pName,pPrice from Products where pPrice < 50
)
select P_Id,P_Name,P_Price from New_CTE ;

with New_CTE
as
(
	select * from Employee
)
select * from New_CTE
--insert New_CTE values(7,'krish','developer')
--update New_CTE set empName = 'priya' where empId = 6
--delete New_CTE where empId=7

--Fetch employees who earn more than average salary of all employees
with average_salary(avg_sal)
as
(
	select avg(salary) from Employee
)
select * 
from Employee e,average_salary av
where e.salary > av.avg_sal;