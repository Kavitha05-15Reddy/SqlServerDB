create database Advance;
use Advance;
--Used-Defined-Functions

--scalar-valued:
create or alter function AddDigit(@num1 int,@num2 int)
returns int
as
begin
	declare @result int;
	set @result = @num1 + @num2;
	return @result
end

select dbo.AddDigit(2,4)

create table Student_Marks
(
	RollNo int primary key,
	Science int,
	Math int,
	Eng int
)

insert into Student_Marks values
(1,34,78,54),
(2,43,87,78),
(3,45,32,67),
(4,12,22,34),
(5,89,65,32),
(6,21,35,40);

select * from Student_Marks

create table Student
(
	RollNo int primary key,
	SName varchar(100),
	city varchar(100)
)

insert into Student values
(1,'krish','Mumbai'),
(2,'Sri','Chicago'),
(3,'Ram','Newyork'),
(4,'Prem','Dubai'),
(5,'Shiv','Bostan'),
(6,'Hari','Chicago');

select * from Student

create or alter function GetTotal(@RollNo int)
returns int
as
begin
	declare @result int;
	select @result = (Science+Math+Eng) from Student_Marks where RollNo=@RollNo;
	return @result
end

create or alter function GetAvg(@RollNo int)
returns int
as
begin
	declare @result int;
	select @result = (Science+Math+Eng)/3 from Student_Marks where RollNo=@RollNo;
	return @result
end

select  RollNo, Science, Math, Eng, 
		dbo.GetTotal(RollNo) as Total,
		dbo.GetAvg(RollNo) as Average 
		from Student_Marks;

--Table-valued:
--Inline:
create or alter function GetStuList(@total int)
returns table
as
return select * from  Student_Marks where (Science+Math+Eng) > @total;

select * from dbo.GetStuList(150);

--Multi-Statement:
alter function GetAllStudents(@RollNo int)
returns @MarkSheet table (RollNo int,
						  SName varchar(50), 
						  Eng int, 
						  Math int, 
						  Science int,
						  Average decimal(4,2))
as
begin
	declare @StName varchar(100);
	select @StName = Sname from Student where RollNo=@RollNo

	declare @Per decimal(4,2);
	select @Per = (Science+Math+Eng)/3  from Student_Marks where RollNo=@RollNo

	insert into @MarkSheet 
	select RollNo,@StName,Eng,Math,Science,@Per from Student_Marks where RollNo=@RollNo

return
end

select * from dbo.GetAllStudents(1)

drop function GetAllStudents

create or alter function Example(@input int)
returns varchar(50)
as
begin
	declare @res varchar(50)
		if @input=1
			return 'East'
		else if @input=2
			return 'West'
		else
			return null
	return @res
end

select dbo.Example(1)