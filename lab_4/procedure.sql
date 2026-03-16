#TRIGGERS

-- create a table employees with the fileds:emp_id, name, salary.
use BankDB;
create table employees(
emp_id int primary key,
name varchar(100),
salary decimal(10,2)
);

-- create another table salary_log to record employee salary changes 
-- with fields: log_id, emp_id, old_salary, new_salary,updated_at.
create table salary_log(
log_id int primary key,
emp_id int,
old_salary decimal(10,2),
new_salary decimal(10,2),
updated_at timestamp default current_timestamp
);

-- create a before insert trigger on employees that prevents inseting employees whose salary is less than 10000
Delimiter $$
create trigger check_salary
before insert on employees
for each row
begin
if new.salary<10000 then 
signal sqlstate '45000'
set message_text="salary must be atleast 10000";
end if;
end $$
DELIMITER $$

CREATE TRIGGER log_salary_update
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO salary_log(emp_id, old_salary, new_salary, updated_at)
    VALUES (OLD.emp_id, OLD.salary, NEW.salary, NOW());
END$$

DELIMITER ;


-- stored procedure
-- create a stored procedure that retrieves all records from the employees table.
delimiter $$
create procedure getEmployees()
begin
select * from employees;
end $$
Delimiter ;
call getEmployees();

-- create a stored procedure that inserts a new employee into the employees table suing parameters
Delimiter $$
create procedure addEmployee(
In p_id int,
In p_name varchar(100),
In p_salary decimal(10,2))
begin
insert into employees values(p_id, p_name,p_salary);
end $$
Delimiter ;
call addEmployee(1,'Hari',20000);

-- create a stored procedure that updated the salary of an employee based on employee ID.
delimiter $$
create procedure updateSalary(
in p_id int,
in new_salary decimal(10,2))
begin 
update employees
set salary=new_salary
where emp_id=p_id;
end $$
Delimiter ;
call updateSalary(1,30000);


-- create a stored procedure that transfers money between two accounts using a trasaction.
Delimiter $$
create procedure transfermoney(
in from_account int,
in to_account int,
in amount decimal)
begin
start transaction;
update accounts
set balance=balance - amount
where account_id=from_account;

update accounts
set balance=balance+amount
where account_id=to_account;
commit;
end

$$
Delimiter ;









	
