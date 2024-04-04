use Problems;
--3)Create a database schema for a library catalog system with tables 
--for books, authors, and genres(category). Populate the tables with sample data.
--Write SQL queries to:

--Fetch all books in the catalog.
--Fetch books by a specific author.
--Fetch books in a particular genre.
--Fetch books published after a certain year.

create table Authors
(
	aid int primary key,
	aname varchar(50)
);

insert into Authors values
(1,'srisri'),
(2,'valmiki'),
(3,'pothana'),
(4,'tikkana');

select * from Authors;

create table Genres
(
	gid int primary key,
	gname varchar(50)
);

insert into Genres values
(1, 'Epic'),
(2, 'Poetry'),
(3, 'Religious'),
(4, 'Fiction');

select * from Genres;

create table Books
(
	bid int primary key,
	btitle varchar(50),
	pyear int,
	aid int foreign key references Authors(aid),
	gid int foreign key references Genres(gid)
);

insert into Books values
(1,'Mahabharatham',1945,1,1),
(2,'Ramayanam',400,2,1),
(3,'Bhagavatham',1450,3,3),
(4,'Parijathapaharanam',1300,4,2);

select * from Books;

--Fetch all books in the catalog.
select * 
from Books;

--Fetch books by a specific author.
select *
from Books,Authors
where Books.aid = Authors.aid and
	  aname = 'valmiki';

--Fetch books in a particular genre.
select *
from Books,Genres
where Books.gid = Genres.gid and
	  gname = 'Epic';

--Fetch books published after a certain year.
select * 
from Books
where pyear > 1300;

