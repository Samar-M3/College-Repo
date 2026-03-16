CREATE DATABASE Tech_Solutionsssss;
USE Tech_Solutionss;

CREATE TABLE IF NOT EXISTS department(
    DID INT PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS employee(
    empID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Gender CHAR(1),
    Salary INT,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES department(DID)
);

CREATE TABLE IF NOT EXISTS project(
    projectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Budget INT
);

CREATE TABLE IF NOT EXISTS work_on(
    empID INT,
    projectID INT,
    PRIMARY KEY (empID, projectID),
    FOREIGN KEY (empID) REFERENCES employee(empID),
    FOREIGN KEY (projectID) REFERENCES project(projectID)
);

-- Insert departments
INSERT INTO department (DID, DeptName, Location) VALUES
(1, 'Human Resources', 'Kathmandu'),
(2, 'IT', 'Pokhara'),
(3, 'Finance', 'Lalitpur'),
(4, 'Marketing', 'Bhaktapur');

-- Insert employees
INSERT INTO employee (empID, FirstName, LastName, Gender, Salary, DeptID) VALUES
(101, 'Ram', 'Sharma', 'M', 50000, 1),
(102, 'Sita', 'Karki', 'F', 60000, 2),
(103, 'Hari', 'Thapa', 'M', 55000, 2),
(104, 'Gita', 'Gurung', 'F', 52000, 3),
(105, 'Ramesh', 'Adhikari', 'M', 58000, 4);

-- Insert projects
INSERT INTO project (projectID, ProjectName, StartDate, EndDate, Budget) VALUES
(201, 'Website Development', '2025-01-10', '2025-06-10', 500000),
(202, 'Mobile App', '2025-02-01', '2025-07-01', 800000),
(203, 'Accounting System', '2025-03-15', '2025-08-15', 600000);

-- Insert work_on records
INSERT INTO work_on (empID, projectID) VALUES
(101, 201),
(102, 201),
(103, 202),
(104, 203),
(105, 202);

-- Increase salary by 10% for empID 102
UPDATE employee
SET Salary = Salary * 1.10
WHERE empID = 102;

-- Delete project with projectID = 202 
DELETE FROM project
WHERE projectID = 202;

-- Select all employees
SELECT * FROM employee;

-- Select employees with salary > 50000
SELECT * FROM employee
WHERE Salary > 50000;

select FirstName, LastName, Salary from employee
order by salary;

select * from department 
where DeptName="IT";

select d.deptName, Count(e.empID) as TotalEmployees
from Employee e
join Department d on e.deptID=d.DID
group by d.deptname;

select e.FirstName, e.LastName, d.DeptName
from Employee e
join department d on e.DeptID=d.DID;


select e.FirstName,e.LastName, p.ProjectName
from Employee e
join work_on w on e.empID=w.empID
join project p on w.projectID=p.projectID;

SELECT Department, COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY Department
ORDER BY EmployeeCount DESC
LIMIT 1;

SELECT *
FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee);

CREATE VIEW highsalaryemployees AS
SELECT *
FROM Employee
WHERE Salary > 60000;


create unique index idx_lastname_unique
on employee (LastnName);

