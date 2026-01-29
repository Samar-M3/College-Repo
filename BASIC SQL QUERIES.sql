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
VALUES('003', 'Samar', 'Maharjan','M','1996-04-2','Manager','Software Engineering','005','2025-11-2','9000000');

select * from employee;

# 4.Update the gender of an employee whose 
#EmployeeID is 003.

update employee
set Gender ='M'
where EmployeeID ='003';

#5. display the firstname , current date, date of birth , and age of employee who are older than 25 years. 
select Firstname,
CURDATE() as CurrentDate, DOB ,
timestampdiff(YEAR,DOB,CURDATE())>20;

#6.	Write a query to find the oldest employee
select * from employee 
where DateofBirth = 
(select Min(DateofBirth) from employee);

#7.	Write a query to find the Youngest employee
select * from employee
where DOB = (select Max(DOB) from employee);

#8.	Display the maximum salary department-wise.
select department, Max(Salary) as Maxsalary
from employee Group By department;

#9.	Display the Min salary department-wise.
select department, Min(Salary) as Minsalary
from employee Group By department;

#10.	List the employees who act as managers .
select * from employee where
EmployeeID in (select ManagerID from employee);



