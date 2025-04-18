with grouped as (
    select 
        stepnumber, 
        status, 
        stepnumber - row_number() over (partition by status order by stepnumber) as groupid
    from groupings
)
select 
    min(stepnumber) as minstepnumber,
    max(stepnumber) as maxstepnumber,
    status,
    count(*) as consecutivecount
from grouped
group by status, groupid
order by minstepnumber