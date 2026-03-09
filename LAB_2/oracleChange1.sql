-- CREATE TABLES
CREATE TABLE student (
    StudentId   NUMBER(10),
    Course_code NUMBER(10),
    DOB         DATE
);

CREATE TABLE student_course (
    id       NUMBER(10),
    name     VARCHAR2(30),
    Subjectt VARCHAR2(20)
);

-- INSERT INTO student
INSERT INTO student (StudentId, Course_code, DOB)
VALUES (1, 1123, TO_DATE('01-12-2025', 'DD-MM-YYYY'));

-- INSERT INTO student_course
INSERT INTO student_course (id, name, Subjectt)
VALUES (1, 'Samar Maharjan', 'MCCT');

-- COMMIT THE DATA
COMMIT;

-- SELECT DATA
SELECT * FROM student;
SELECT * FROM student_course;