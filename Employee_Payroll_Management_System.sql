--database creation payroll_database

create database payroll_database;


--Verify the current database is payroll_database
select current_database();



--Creation of Table employees
/*  employee_id as primary key and auto increment
	email id should be unique and cannot be null
	name should not be null
*/

create table employees (
						Employee_ID int generated always as identity primary key,
						Name varchar(50) not null,
						Department varchar(50),
						Email varchar(50) unique not null,
						Phone_No bigint,
						Joining_date date,
						Salary decimal(10,2),
						Bonus decimal(10,2),
						Tax_Percentage decimal(5,2)
);

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--#######################################################################
--Payroll Queries:
--#######################################################################

-- a) Retrieve the list of employees sorted by salary in descending order.










