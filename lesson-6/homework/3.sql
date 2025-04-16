select 
    e.employeeid, 
    e.name, 
    d.departmentname
from employees e
right join departments d 
    on e.departmentid = d.departmentid