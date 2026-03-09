create database DB;

create table student(
StudentId int(10),
Course_code int(30),
DOB date
);

create table student_course(
id int(10),
name varchar(30),
Subjectt varchar(20)
);

INSERT into student(
StudentId,
Course_code,
DOB 
)
VALUES(01,1123, 01-12-2025);

INSERT into student_course(
id,
name,
Subjectt
)
VALUES(01,"Samar Maharjan", "MCCT");

select * from student;
