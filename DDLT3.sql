create or alter trigger TrgServerAll
on all server
for DDL_Table_Events
as
begin
	print 'you can not create,alter or drop a table in any database'
	rollback transaction
end;

use db1;
go
create table test2
(Id int)

use db2;
go
create table test2
(Id int)