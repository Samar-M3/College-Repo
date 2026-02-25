create database company;
use company;

CREATE TABLE department (
    DNAME VARCHAR(50),
    DNUMBER INT PRIMARY KEY,
    MGRSSN VARCHAR(15),
    MGRSTARTDATE DATE
);

create table employee(
FNAME VARCHAR(255),
MINIT CHAR(1),
LNAME VARCHAR(20),
SSN VARCHAR(15) PRIMARY KEY,
BDATE DATE,
ADDRESS VARCHAR(30),
SEX CHAR(1),
SALARY INT,
SUPERSSON VARCHAR(15),
DNO INT,
FOREIGN KEY(DNO)
REFERENCES department(DNUMBER)
);

INSERT INTO department VALUES
('Research', 1, 'asfds', '2000-01-01'),
('Sales', 2, 'asdas', '2005-03-15'),
('HR', 3, 'asdasd', '2010-06-20');

INSERT INTO employee 
(FNAME, MINIT, LNAME, SSN, BDATE, ADDRESS, SEX, SALARY, SUPERSSON, DNO)
VALUES
('John', 'A', 'Smith', '1001', '1990-05-12', 'Kathmandu', 'M', 50000, NULL, 1),
('Sara', 'B', 'Johnson', '1002', '1992-08-21', 'Lalitpur', 'F', 60000, '1001', 2),
('Michael', 'C', 'Brown', '1003', '1988-03-15', 'Bhaktapur', 'M', 55000, '1001', 1),
('Emily', 'D', 'Davis', '1004', '1995-11-30', 'Pokhara', 'F', 48000, '1002', 3),
('David', 'E', 'Wilson', '1005', '1987-07-19', 'Biratnagar', 'M', 70000, NULL, 2),
('Sophia', 'F', 'Taylor', '1006', '1993-01-25', 'Butwal', 'F', 52000, '1005', 3),
('Daniel', 'G', 'Anderson', '1007', '1991-09-10', 'Chitwan', 'M', 58000, '1003', 1);

select * from department;	
select * from employee;

-- 10% salary raise for research department   
select E.FNAME, E.LNAME ,
E.SALARY*1.1 AS INCREASED_SALARY
FROM employee E
JOIN department D on E.DNO =D.DNUMBER
WHERE D.DNAME='Research';

-- salary statictics of accounts department sum. max,min, avg for department administration 
select 
sum(E.SALARY) AS TOTAL,
max(E.SALARY) AS MAX,
min(E.SALARY) AS MIN, 
avg(E.SALARY) AS AVERAGE
FROM employee E
join department D on E.DNO=D.DNUMBER
WHERE D.DNAME='HR';

-- employess controlled by department no 5
select FNAME,LNAME FROM employee E 
where exists (SELECT * 
FROM employee e where e.DNO=5 
);

-- departments having atleast 2 employee 

select D.DNAME, count(*) as emp_count
from employee E
join department D on E.DNO=D.DNUMBER
GROUP BY D.DNUMBER, D.DNAME
HAVING count(*)>=2;

-- employes born in 1990's
SELECT *
FROM employee
WHERE YEAR(BDATE) BETWEEN 1990 AND 1999;
