with hierarchy as (
    select 
        employeeid, 
        managerid, 
        jobtitle, 
        0 as depth
    from employees
    where managerid is null
    union all
    select 
        e.employeeid, 
        e.managerid, 
        e.jobtitle, 
        h.depth + 1
    from employees e
    join hierarchy h 
        on e.managerid = h.employeeid
)
select 
    employeeid, 
    managerid, 
    jobtitle, 
    depth
from hierarchy
order by employeeid