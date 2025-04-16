select 
    e.employeeid, 
    e.name, 
    d.departmentname
from employees e
full outer join departments d 
    on e.departmentid = d.departmentid