select 
    e.employeeid, 
    e.name, 
    d.departmentname
from employees e
left join departments d 
    on e.departmentid = d.departmentid