-- NO "CREATE DATABASE" OR "USE" IN ORACLE
-- CONNECT AS YOUR USER/SCHEMA DIRECTLY
-- CONNECT dbemp/password

-- CREATE EMPLOYEE TABLE
CREATE TABLE employee (
    EmployeeID  VARCHAR2(10),
    Firstname   VARCHAR2(20),
    Lastname    VARCHAR2(20),
    Gender      CHAR(1),
    DOB         DATE,
    Designation VARCHAR2(20),
    Department  VARCHAR2(20),
    Managerid   VARCHAR2(10),
    JoinedDate  DATE,
    Salary      NUMBER(10,0)
);

-- INSERT EMPLOYEE RECORD
INSERT INTO employee (
    EmployeeID, Firstname, Lastname, Gender,
    DOB, Designation, Department,
    Managerid, JoinedDate, Salary
)
VALUES (
    '003', 'Samar', 'Maharjan', 'M',
    TO_DATE('1996-04-02', 'YYYY-MM-DD'),
    'Manager', 'Software Engineering',
    '005',
    TO_DATE('2025-11-02', 'YYYY-MM-DD'),
    9000000
);

-- COMMIT TO SAVE
COMMIT;

-- SELECT ALL
SELECT * FROM employee;

-- 4. UPDATE GENDER WHERE EMPLOYEEID = 003
UPDATE employee
SET Gender = 'M'
WHERE EmployeeID = '003';
COMMIT;

-- 5. DISPLAY FIRSTNAME, CURRENT DATE, DOB AND AGE > 25
SELECT
    Firstname,
    SYSDATE AS CurrentDate,
    DOB,
    TRUNC(MONTHS_BETWEEN(SYSDATE, DOB) / 12) AS Age
FROM employee
WHERE TRUNC(MONTHS_BETWEEN(SYSDATE, DOB) / 12) > 25;

-- 6. FIND THE OLDEST EMPLOYEE
SELECT * FROM employee
WHERE DOB = (SELECT MIN(DOB) FROM employee);

-- 7. FIND THE YOUNGEST EMPLOYEE
SELECT * FROM employee
WHERE DOB = (SELECT MAX(DOB) FROM employee);

-- 8. MAXIMUM SALARY DEPARTMENT-WISE
SELECT Department, MAX(Salary) AS MaxSalary
FROM employee
GROUP BY Department;

-- 9. MINIMUM SALARY DEPARTMENT-WISE
SELECT Department, MIN(Salary) AS MinSalary
FROM employee
GROUP BY Department;

-- 10. LIST EMPLOYEES WHO ACT AS MANAGERS
SELECT * FROM employee
WHERE EmployeeID IN (SELECT Managerid FROM employee);

-- DESCRIBE TABLE (Oracle equivalent of DESC)
DESC employee;