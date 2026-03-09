-- NO "USE" IN ORACLE, CONNECT AS THE USER INSTEAD
-- CONNECT emp1/password

-- UPDATE
UPDATE employee
SET Firstname = 'Jij', Lastname = 'Williams'
WHERE EmployeeID = 001;

-- DELETE
DELETE FROM employee
WHERE EmployeeID = 001;

-- INSERT
INSERT INTO employee (
    EmployeeID,
    Firstname,
    Lastname,
    Gender,
    DOB,
    Designation,
    Department,
    Managerid,
    JoinedDate,
    Salary
)
VALUES (
    003,
    'Samar',
    'Maharjan',
    'M',
    TO_DATE('1996-04-02', 'YYYY-MM-DD'),
    'Manager',
    'Software Engineering',
    005,
    TO_DATE('2025-11-02', 'YYYY-MM-DD'),
    9000000
);

-- COMMIT TO SAVE CHANGES
COMMIT;

-- SELECT WITH LIKE
SELECT * FROM employee
WHERE Firstname LIKE '%r';

-- SELECT WITH JOIN (fixed)
SELECT employee.EmployeeID, customer.CustomerID
FROM employee
JOIN customer ON employee.EmployeeID = customer.CustomerID;