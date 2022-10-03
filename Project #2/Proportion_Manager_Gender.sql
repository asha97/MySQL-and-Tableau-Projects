
-- select the database that you wanna use 
use employees_mod;

-- Compare the number of male managers to the number of female managers from different departments for each year, 
-- starting from 1990.
-- need info about name gender, emp no, from and to date, as well as year

select 
    d.dept_name,
    ee.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    e.calendar_year,
    
-- look if employee still active
    case
        when year(dm.to_date) >= e.calendar_year and 
        year(dm.from_date) <= e.calendar_year then 1
        else 0
    end as active
    
-- joining 
from
    (select 
        year(hire_date) as calendar_year
    from
        t_employees
    group by calendar_year) e
        cross join
    t_dept_manager dm
        join
    t_departments d on dm.dept_no = d.dept_no
        join
    t_employees ee on dm.emp_no = ee.emp_no
order by dm.emp_no, calendar_year;