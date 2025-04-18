with numbers as (
    select 1 as num
    union all
    select num + 1
    from numbers
    where num < 10
),
factorials as (
    select 
        num, 
        cast(1 as bigint) as factorial
    from numbers
    where num = 1
    union all
    select 
        n.num, 
        f.factorial * n.num
    from numbers n
    join factorials f 
        on n.num = f.num + 1
)
select 
    num, 
    factorial
from factorials
order by num