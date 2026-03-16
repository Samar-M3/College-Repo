#TRANSACTION
-- create a database named bankdb and create a table accounts with the fields account_id, aaccount_holder, balance.
SET SQL_SAFE_UPDATES = 0;
create database BankDB;
use BankDB;

create table accounts (
account_id int primary key,
account_holder varchar(100),
balance decimal(10,2)
);

INSERT INTO accounts (account_id, account_holder, balance) VALUES
(1, 'Samar Maharjan', 5000.75),
(2, 'Ram Sharma', 12000.50),
(3, 'Shyam Sharma', 980.25),
(4, 'Hari Thapa', 150000.00),
(5, 'Gita Gurung', 750.60),
(6, 'Nabin Rai', 4300.10),
(7, 'Anita Shrestha', 22000.99),
(8, 'Bikash Tamang', 100.00),
(9, 'Prakash Bhandari', 8750.45);


-- write aa trnastion that transfer rs 5000 from ram's account to shyam's account

start transaction;
update accounts
set balance=balance - 5000
where account_id=1;

update accounts
set balance=balance+5000 
where account_id=2;
commit;

select * from accounts;

-- write a transaction that transfer rs 1000 from shyams account to sita account and demostrate the use of rollback
start transaction;
update accounts
set balance=balance - 500
where account_id=2;

update accounts
set balance=balance-500
where account_id=3;
rollback;

-- write a trasaciton that demonstrates the use of SAVEPOINT while updating account balances
start transaction;
update accounts
set balance=balance-2000
where account_id=7;

savepoint sp1;

update accounts 
set balance=balance+2000
where account_id=2;
rollback to sp1;
commit;






