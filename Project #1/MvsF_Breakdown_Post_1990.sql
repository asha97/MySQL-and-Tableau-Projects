-- solution to task 1

-- Create a visualization that provides a breakdown between the male and female employees 
-- working in the company each year, starting from 1990. 

select 
emp_no, from_date, to_date

from 
t_dept_emp; 

-- second part of the solution 

select
year(d.from_date) as calendar_year,
gender, 
count(e.emp_no) as num_of_employees

-- using aliases
from
t_employees e 

-- joining
join 
t_dept_emp d on d.emp_no = e.emp_no

-- grouping
group by calendar_year, e.gender
having calendar_year >= 1990;

-- data acquired from this query is going to be brought to tableau 
-- export into .csv file 
