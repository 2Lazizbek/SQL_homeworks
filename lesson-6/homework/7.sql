select 
    e.employeeid, 
    e.name, 
    d.departmentname, 
    p.projectname
from employees e
left join departments d 
    on e.departmentid = d.departmentid
left join projects p 
    on e.employeeid = p.employeeid