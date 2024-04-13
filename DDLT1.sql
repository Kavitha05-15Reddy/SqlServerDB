use db1;
go
create table test
(Id int)
--Event type
create or alter trigger TrgPreventCADT
on database
for create_table,alter_table,drop_table
as
begin
	print 'you can not create or alter or drop a table in this database'
	rollback transaction
end;

create table test3
(Id int)

alter table test add TName varchar(100);

drop table test;

