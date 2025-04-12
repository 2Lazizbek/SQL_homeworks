-- 1
select 
    employeeid, 
    name, 
    department, 
    salary, 
    rank() over (order by salary desc) as salary_rank
from employees;

-- 2
with ranked_employees as (
    select 
        employeeid, 
        name, 
        department, 
        salary, 
        rank() over (order by salary desc) as salary_rank
    from employees
)
select 
    re1.employeeid, 
    re1.name, 
    re1.department, 
    re1.salary, 
    re1.salary_rank
from ranked_employees re1
join ranked_employees re2 
    on re1.salary_rank = re2.salary_rank 
    and re1.employeeid != re2.employeeid;

-- 3
select 
    employeeid, 
    name, 
    department, 
    salary
from (
    select 
        employeeid, 
        name, 
        department, 
        salary, 
        rank() over (partition by department order by salary desc) as dept_rank
    from employees
) ranked
where dept_rank <= 2

-- 4
select 
    employeeid, 
    name, 
    department, 
    salary
from (
    select 
        employeeid, 
        name, 
        department, 
        salary, 
        rank() over (partition by department order by salary asc) as dept_rank
    from employees
) ranked
where dept_rank = 1

-- 5
select 
    employeeid, 
    name, 
    department, 
    salary, 
    sum(salary) over (partition by department order by employeeid) as running_total
from employees

-- 6
select 
    employeeid, 
    name, 
    department, 
    salary, 
    sum(salary) over (partition by department) as total_salary
from employees

-- 7
select 
    employeeid, 
    name, 
    department, 
    salary, 
    avg(salary) over (partition by department) as avg_salary
from employees

-- 8
select 
    employeeid, 
    name, 
    department, 
    salary, 
    salary - avg(salary) over (partition by department) as salary_diff
from employees

-- 9
select 
    employeeid, 
    name, 
    department, 
    salary, 
    avg(salary) over (
        order by employeeid 
        rows between 1 preceding and 1 following
    ) as moving_avg_salary
from employees

-- 10
select 
    employeeid, 
    name, 
    department, 
    salary, 
    sum(salary) over (
        order by hiredate desc 
        rows between current row and 2 following
    ) as last_three_hired_sum
from employees

-- 11
select 
    employeeid, 
    name, 
    department, 
    salary, 
    avg(salary) over (
        order by employeeid 
        rows between unbounded preceding and current row
    ) as running_avg_salary
from employees

-- 12
select 
    employeeid, 
    name, 
    department, 
    salary, 
    max(salary) over (
        order by employeeid 
        rows between 2 preceding and 2 following
    ) as max_salary_window
from employees

-- 13
select 
    employeeid, 
    name, 
    department, 
    salary, 
    (salary / sum(salary) over (partition by department)) * 100 as percent_contribution
from employees