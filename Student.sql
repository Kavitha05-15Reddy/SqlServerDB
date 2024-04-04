use Problems;
--2)Design a database schema for a student grade tracking system with tables 
--for students,courses and grades. Populate the tables with sample data. 
--Write SQL queries to:

--Fetch all grades for a specific student.
--Fetch grades for a particular course.
--Fetch the highest grade achieved in each course.
--Fetch the average grade for all students.

create table Student
(
	stuid int primary key,
	stuName varchar(50)
);

insert into Student values
(1,'raghu'),
(2,'eswar'),
(3,'hema'),
(4,'jaya'),
(5,'prema'),
(6,'ram');

select * from Student;

create table Course
(
	cid int primary key,
	cName varchar(50)
);

insert into Course values
(1,'python'),
(2,'java'),
(3,'C#'),
(4,'SQL'),
(5,'HTML'),
(6,'CSS');

select * from Course;

create table Grades
(
	gid int primary key,
	stuid int foreign key references Student(stuid),
	cid int foreign key references Course(cid),
	grade decimal(5,2)
);

insert into Grades values
(1, 5, 2, 90.0),
(2, 3, 5, 85.5),
(3, 6, 2, 72.0),
(4, 3, 4, 88.5),
(5, 1, 5, 61.0),
(6, 2, 3, 87.0);

select * from Grades;

--Fetch all grades for a specific student.
select grade
from Student,Grades
where Student.stuid = Grades.stuid and
	  stuName = 'hema'
group by grade;

--Fetch grades for a particular course.
select grade
from Grades,Course
where Course.cid = Grades.cid and
	  cName = 'java'
group by grade;

--Fetch the highest grade achieved in each course.
select max(grade) highest_grade,cName
from Grades,Course
where Course.cid = Grades.cid
group by cName;

--Fetch the average grade for all students.
select avg(grade) avg_grade
from Grades;

