# Employee Payroll Management System (PostgreSQL)
## Project Overview

The Employee Payroll Management System is a PostgreSQL-based project designed to store, manage, and analyze employee salary and payroll-related data.
It demonstrates strong SQL concepts such as table creation, constraints, data validation, aggregation, window functions, updates, and analytical reporting.


### Database Name
payroll_database

### Employees Table Structure

```

create table employees (
						Employee_ID int generated always as identity primary key,
						Name varchar(50) not null,
						Department varchar(50) not null,
						Email varchar(50) unique not null,
						Phone_No bigint unique,
						Joining_date date not null,
						Salary decimal(10,2) not null check (Salary >= 0),
						Bonus decimal(10,2) not null check (Bonus >= 0),
						Tax_Percentage decimal(5,2) DEFAULT 0 CHECK (Tax_Percentage BETWEEN 0 AND 100)
);
```

The project includes 10+ employee records for:
Sales
IT
Finance
HR
Ensuring realistic payroll conditions for testing queries.

## Payroll Queries

### a) Retrieve the list of employees sorted by salary in descending order.
```
select employee_id, name, department, salary
from employees
order by salary desc;
```

### b) Find employees with a total compensation (SALARY + BONUS) greater than $100,000.
```
select employee_id, name, department, (salary + bonus) as Total_Salary 
from employees
where (salary + bonus) > 100000
order by Total_Salary desc;
```

### c) Update the bonus for employees in the ‘Sales’ department by 10%.
```
update employees set bonus = bonus * 1.10
where department = 'Sales';

select employee_id, name, department, bonus as New_bonus
from employees where department = 'Sales';
```

### d) Calculate the net salary after deducting tax for all employees.
```
select 	employee_id, name, department, salary, bonus, tax_percentage,
		(salary + bonus) as Gross_Salary,
		round((salary * (tax_percentage / 100)),2) as Tax_deductions,
		round((salary + bonus) * (1 - tax_percentage / 100) , 2) as Net_Salary
from employees
order by Net_Salary desc, name;
```
	
### e) Retrieve the average, minimum, and maximum salary per department.
```
select department, count(*) as Employee_Count, round(avg(salary), 2) as Average_Salary,
		min(salary) as Minimum_Salary, max(salary) as Maximum_Salary
from employees
group by department
order by Average_Salary desc, department;
```

## Advanced Queries:

### a) Retrieve employees who joined in the last 6 months.
```
select employee_id, name, department, joining_date
from employees
where joining_date >= (current_date - interval '6 months')
order by joining_date desc, name;
```

### b) Group employees by department and count how many employees each has.
```
select department, count(*) as employee_count
from employees
group by department
order by employee_count desc, department;
```

### c) Find the department with the highest average salary.

### v1 using limit
```
select department, count(*) as employee_count,  round(avg(salary), 2) as Average_Salary
from employees
group by department
order by Average_Salary desc
limit 1;
```

### v2 using window function
```
select department, employee_count, Average_Salary
from (
	select department, count(*) as employee_count, round(avg(salary), 2) as Average_Salary,
	rank() over (order by avg(salary) desc) as rnk
	from employees
	group by department
)ranked
where rnk = 1;
```

### d) Identify employees who have the same salary as at least one other employee.

### v1 using sub query
```
select employee_id, name, department, salary
from employees
where salary in (
		select salary from employees
		group by salary
		having count(*) > 1
)
order by salary desc, name;
```

### v2 using window function
```
select employee_id, name, department, salary
from (
		select employee_id, name, department, salary,
				count(*) over (partition by salary) as sal_match
		from employees
) sal
where sal_match > 1
order by salary desc, name;
```
