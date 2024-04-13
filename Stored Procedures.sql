use Projects;

--STORED PROCEDURES:

--CREATE
create procedure GetEmpList
as
begin
	select * from Employee;
end;

--EXECUTE
GetEmpList
execute GetEmpList
exec GetEmpList

--DROP
drop proc GetEmpList;

--ALTER
alter procedure GetEmpList
as
begin
	select * from Employee where empId = 5;
	select * from Employee where salary > 30000;
	select * from Employee where city = 'AP';
end;
execute GetEmpList;

--PARAMETERS(INPUT,DEFAULT,OUTPUT)
alter procedure GetEmpList
@emp_Id int = 5,
@emp_salary decimal = 30000,
@emp_city varchar(50) = 'AP'
as
begin
	select * from Employee where empId = @emp_Id;
	select * from Employee where salary > @emp_salary;
	select * from Employee where city = @emp_city;
end;
--DEFAULT
execute GetEmpList
--INPUT
execute GetEmpList 2, 40000, 'KA'

alter procedure GetEmpList
@min_sal decimal,
@max_sal decimal,
@name varchar(100)
as
begin
	select * 
	from Employee 
	where salary between @min_sal and @max_sal and
	empName like '%'+@name+'%'; 
end;
--NAMED
execute GetEmpList @min_sal=10000, 
				   @max_sal=50000,
				   @name = 'a';
--TEXT
execute GetEmpList 10000,30000,'i';

--UPDATE
create or alter procedure GetDeptList
@Id int,
@Name varchar(50)
as
begin
	if exists(select 1 from Department where deptId = @Id)
		begin
			update Department set deptName = @Name where deptId = @Id;
		end
	else
		begin
			insert into Department(deptId,deptName) values (@Id,@Name);
		end
end;

exec GetDeptList 7,'manager'
select * from Department

create  or alter procedure GetDeptList
@Id int,
@Name varchar(100),
@action varchar(100)
as
begin
	if @action='Insert'
		begin
			insert into Department(deptId,deptName) values (@Id,@Name);
		end
	else if @action='Update'
		begin
			update Department set deptName = @Name where deptId = @Id;
		end
	else if @action='Delete'
		begin
			delete from Department where deptId= @Id;
		end
	else
		begin
			print 'Invalid action';
		end
end;

execute GetDeptList 8,'developer','Insert'
execute GetDeptList 8,'developer','Delete'
execute GetDeptList 7,'Sales','Update'
select * from Department

--IF_ELSE
declare @salary decimal = 50000;
if @salary > 10000
	begin
		print 'salary greater than 10000';
	end
else
	begin
		print 'salary less than 10000';
	end

--WHILE
declare @count int = 0;
while @count < 10
begin
	--print @count;
	set @count = @count+1;
	if @count = 5
		continue;
	print @count;
end

--OUTPUT parameters

--Try_Catch
create or alter procedure Divide
@num1 int,
@num2 int,
@res int output
as
begin
	begin try
		set @res=@num1/@num2;
	end try
	begin catch
		select
			ERROR_MESSAGE() as Error_msg,
			ERROR_NUMBER() as Error_num,
			ERROR_LINE() as Error_lines
	end catch
end
--execution
declare @r int;
exec Divide 4,0,@r output;
print @r

--ENCRYPTION
alter procedure AddDigit
@Num1 int,
@Num2 int,
@Result int output
with encryption
as
begin 
	set @Result = @Num1 + @Num2;
end
--Declare
Declare @Res int 
execute AddDigit 2, 2, @Res output;
select @Res;
