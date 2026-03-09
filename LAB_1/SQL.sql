use dbemp1;




update employee
set Firstname="jij", Lastname="williams" WHERE EmployeeID=001;

DELETE FROM employee
where EmployeeID=001;

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

select * from employee 
where Firstname LIKE '%r';

select employee.EmployeeID,customer.customerID where employee.EmployeeID=customer.customerID;