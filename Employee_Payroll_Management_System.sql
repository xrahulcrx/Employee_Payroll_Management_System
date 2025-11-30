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



-- Sample Data to be entered

insert into employees (Name, Department, Email, Phone_no, Joining_date, Salary, Bonus, Tax_percentage) values
				('John Miller', 'Sales', 'john.miller@example.com', 9876543210, '2025-01-10', 85000.00, 15000.00, 12.5),
				('Sarah Johnson', 'IT', 'sarah.johnson@example.com', 9234567890, '2024-11-05', 95000.00, 10000.00, 15.0),
				('Michael Davis', 'HR', 'michael.davis@example.com', 9123456789, '2024-09-12', 70000.00, 5000.00, 10.0),
				('Emily Clark', 'Finance', 'emily.clark@example.com', 9988776655, '2024-08-22', 120000.00, 20000.00, 18.0),
				('David Wilson', 'Sales', 'david.wilson@example.com', 9345678901, '2025-02-18', 88000.00, 12000.00, 12.5),
				('Sophia Martinez', 'IT', 'sophia.martinez@example.com', 9456781230, '2024-12-01', 105000.00, 15000.00, 15.0),
				('Daniel Brown', 'Finance', 'daniel.brown@example.com', 9678901234, '2024-10-30', 115000.00, 18000.00, 18.0),
				('Olivia Taylor', 'HR', 'olivia.taylor@example.com', 9789012345, '2025-03-05', 68000.00, 3000.00, 10.0),
				('James Anderson', 'Sales', 'james.anderson@example.com', 9567890123, '2024-07-14', 90000.00, 10000.00, 12.5),
				('Ava Thomas', 'IT', 'ava.thomas@example.com', 9890123456, '2024-06-20', 95000.00, 9000.00, 15.0);



--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------










