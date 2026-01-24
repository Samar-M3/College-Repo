# create a database named dbemp and switch to it.-- 
create database dbemp1;
use dbemp1;

# Create an emplouyee table with appropriate data types and constraint for employee details.
Create table employee(
EmployeeID varchar(10),
Firstname varchar(20),
Lastname varchar(20),
Gender char(1),
DOB date,
designation varchar(20),
department varchar(20),
Managerid varchar(10),
JoinedDate date,
Salary decimal(10,0)
);

# Insert atlease two employee reocrds into the employee table 
Insert into employee(
EmployeeID ,
Firstname ,
Lastname ,
Gender ,
DOB ,
designation,
department ,
Managerid ,
JoinedDate ,
Salary 
)
VALUES('001', 'Samar', 'Maharjan','M','1996-04-2','Manager','Software Engineering','005','2025-11-2','9000000');

select * from employee;