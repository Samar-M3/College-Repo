use db;

create table if not exists dept(
EmployeeID varchar(10),
Firstname varchar(20),
Lastname varchar(20),
Gender char(1),
DOB int
);
rename table dept to department;

select * from department;

alter table department 
add column PINCODE int not null default 0;

alter table department 
change Firstname DEPT_NAME varchar(20);

alter table department
modify Gender int(20);

drop table department;




