use Advance;

select * from Student;
select * from Student_Marks;

--Single_table
create or alter view StuView
as
select RollNo,SName from Student;

select * from  StuView;

--Mutliple_tables
create or alter view StuMarksView
as
select s1.RollNo,s1.SName,s1.city,s2.Eng,s2.Math,s2.Science
from Student s1,Student_Marks s2
where s1.RollNo = s2.RollNo;

select * from StuMarksView;

create or alter view VStudent
as
select * from Student;

select * from VStudent;

alter table Student add Country varchar(100);

--Refresh view
exec sp_refreshview 'VStudent';

alter table Student drop column Country ;

--SchemaBinding
create view SchemaBindingView
with SchemaBinding
as
select RollNo,SName,city
from dbo.Student;

alter table Student drop column city;
alter table Student alter column city varchar(4000);

--RowLevel security
create view RowLevel
as
select * from Student where RollNo > 3;

select * from RowLevel;

--ColumnLevel security
create view ColumnLevel
as
select RollNo,SName  from Student 

select * from ColumnLevel;

--Updating views(insert,update,delete)
create view Demo
as
select * from Student;

select * from Demo;
insert into Demo values(7,'Siri','Mumbai')
update Demo set SName='Harish' where RollNo=6
delete from Demo where RollNo=4

sp_helptext 'StuView';

drop view StuView;
