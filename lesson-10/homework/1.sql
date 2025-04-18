with all_days as (
    select num
    from shipments
    union all
    select 0 as num
    from (values (1),(2),(3),(4),(5),(6),(7)) as zeros(n)
),
ordered_days as (
    select 
        num,
        row_number() over (order by num) as rn
    from all_days
)
select 
    avg(1.0 * num) as median
from ordered_days
where rn in (20, 21)