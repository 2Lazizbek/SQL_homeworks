with top_employees as (
    select employeeid, department, salary
    from employees
    where salary >= (
        select top 1 salary
        from (
            select salary
            from employees
            order by salary desc
            offset (cast((select count(*) from employees) * 0.1 as int) - 1) rows
            fetch next 1 rows only
        ) as sub
    )
)
select 
    department,
    avg(salary) as averagesalary,
    case 
        when avg(salary) > 80000 then 'high'
        when avg(salary) between 50000 and 80000 then 'medium'
        else 'low'
    end as salarycategory
from top_employees
group by department
order by averagesalary desc
offset 2 rows fetch next 5 rows only