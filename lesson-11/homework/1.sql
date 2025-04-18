create table #employeetransfers (
    employeeid int constraint pk_employeetransfers primary key,
    name varchar(50),
    department varchar(50),
    salary decimal(10,2)
)

insert into #employeetransfers (employeeid, name, department, salary)
select 
    employeeid,
    name,
    case department
        when 'hr' then 'it'
        when 'it' then 'sales'
        when 'sales' then 'hr'
    end as department,
    salary
from employees

select * from #employeetransfers