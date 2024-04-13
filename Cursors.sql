use AdvanceTC;

create table Student_Details
(
	RollNo int primary key,
	StuName varchar(100),
	Science int,
	Math int,
	Eng int
)

insert into Student_Details values
(1,'smith',34,78,54),
(2,'miller',43,87,78),
(3,'scott',45,32,67),
(4,'king',12,22,34),
(5,'allen',89,65,32),
(6,'adams',21,35,40);

select * from Student_Details

--Create a cursor
declare 
@RollNo int ,
@StuName varchar(100),
@Science int,
@Math int,
@Eng int

declare
@Total int,
@Average int

declare Student_Cursor cursor 
for 
select RollNo,StuName,Science,Math,Eng
from Student_Details;

open Student_Cursor;

fetch next from Student_Cursor into
@RollNo,@StuName,@Science,@Math,@Eng

while @@FETCH_STATUS=0
begin
	 print concat('RollNo:',@RollNo);
	 print concat('Name:',@StuName);
	 print concat('Science_Marks:',@Science);
	 print concat('Math_Marks:',@Math);
	 print concat('Englich_Marks:',@Eng);

	 set @Total = @Science+@Math+@Eng;
	 print concat('Total:',@Total);

	 set @Average = @Total/3;
	 print concat('Average:',@Average);

	 print '-----------------------------';

	 fetch next from Student_Cursor into
	 @RollNo,@StuName,@Science,@Math,@Eng
end

close Student_Cursor;

deallocate Student_Cursor;