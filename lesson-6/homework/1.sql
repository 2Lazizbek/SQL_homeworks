select 
    e.employeeid, 
    e.name, 
    d.departmentname
from employees e
inner join departments d 
    on e.departmentid = d.departmentid