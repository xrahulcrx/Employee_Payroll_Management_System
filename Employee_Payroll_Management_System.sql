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
						Department varchar(50) not null,
						Email varchar(50) unique not null,
						Phone_No bigint,
						Joining_date date not null,
						Salary decimal(10,2) not null check (Salary >= 0),
						Bonus decimal(10,2) not null check (Salary >= 0),
						Tax_Percentage decimal(5,2) DEFAULT 0 CHECK (tax_percentage BETWEEN 0 AND 100)
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
				('Amit Sharma','IT','amit.sharma@company.com', 9876543210, '2022-03-15', 95000.00, 15000.00, 12.5);




select * from employees;

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--#######################################################################
--Payroll Queries:
--#######################################################################

-- a) Retrieve the list of employees sorted by salary in descending order.

select employee_id, name, department, salary
from employees
order by salary desc;


-- b) Find employees with a total compensation (SALARY + BONUS) greater than $100,000.

select employee_id, name, department, (salary + bonus) as Total_Salary 
from employees
where (salary + bonus) > 100000
order by Total_Salary desc;


-- c) Update the bonus for employees in the ‘Sales’ department by 10%.

update employees set bonus = bonus * 1.10
where department = 'Sales';

select employee_id, name, department, bonus as New_bonus
from employees where department = 'Sales';


-- d) Calculate the net salary after deducting tax for all employees.

select 	employee_id, name, department, salary, bonus, tax_percentage,
		(salary + bonus) as Gross_Salary,
		round((salary * (tax_percentage / 100)),2) as Tax_deductions,
		round((salary + bonus) * (1 - tax_percentage / 100) , 2) as Net_Salary
from employees
order by Net_Salary desc;
	
-- e) Retrieve the average, minimum, and maximum salary per department.

select department, count(*) as Employee_Count, round(avg(salary), 2) as Average_Salary,
		min(salary) as Minimum_Salary, max(salary) as Maximum_Salary
from employees
group by department
order by Average_Salary desc;

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

--###################################################################################
--Advanced Queries:
--###################################################################################

















