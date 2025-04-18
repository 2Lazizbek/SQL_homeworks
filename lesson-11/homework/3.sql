create view vw_monthlyworksummary
as
with employee_totals as (
    select 
        w.employeeid,
        w.employeename,
        w.department,
        sum(w.hoursworked) as totalhoursworked
    from worklog w
    group by w.employeeid, w.employeename, w.department
)
select 
    et.employeeid,
    et.employeename,
    et.department,
    et.totalhoursworked,
    sum(et.totalhoursworked) over (partition by et.department) as totalhoursdepartment,
    avg(1.0 * et.totalhoursworked) over (partition by et.department) as avghoursdepartment
from employee_totals et