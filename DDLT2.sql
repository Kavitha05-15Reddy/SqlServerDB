use db2;
go
create table test
(Id int)

--Event Group
create or alter trigger TrgEventGroup
on database
for DDL_Table_Events
as
begin
	print 'Event Group : you can not create,alter or drop a table in this database'
	rollback transaction
end;

create table test2
(Id int)

alter table test add TName varchar(100);

drop table test;