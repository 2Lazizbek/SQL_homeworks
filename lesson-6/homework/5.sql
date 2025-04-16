select 
    d.departmentname, 
    sum(e.salary) as totalsalary
from employees e
left join departments d 
    on e.departmentid = d.departmentid
group by d.departmentname