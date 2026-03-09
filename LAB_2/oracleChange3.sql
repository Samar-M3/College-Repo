-- NO "USE" IN ORACLE, CONNECT AS THE USER INSTEAD
-- CONNECT db/password

-- CREATE TABLE (Oracle uses "IF NOT EXISTS" alternative)
BEGIN
   EXECUTE IMMEDIATE '
       CREATE TABLE dept (
           EmployeeID  VARCHAR2(10),
           Firstname   VARCHAR2(20),
           Lastname    VARCHAR2(20),
           Gender      CHAR(1),
           DOB         NUMBER
       )';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/

-- RENAME TABLE (dept to department)
RENAME dept TO department;

-- SELECT
SELECT * FROM department;

-- ADD COLUMN
ALTER TABLE department
ADD PINCODE NUMBER DEFAULT 0 NOT NULL;

-- RENAME COLUMN (change Firstname to DEPT_NAME)
ALTER TABLE department
RENAME COLUMN Firstname TO DEPT_NAME;

-- MODIFY COLUMN TYPE
ALTER TABLE department
MODIFY Gender NUMBER(20);

-- DROP TABLE
DROP TABLE department;