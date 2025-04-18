;with fibonacci as (
    select 
        1 as n, 
        cast(1 as bigint) as fibonacci_number, 
        cast(0 as bigint) as prev_number
    union all
    select 
        n + 1, 
        fibonacci_number + prev_number, 
        fibonacci_number
    from fibonacci
    where n < 10
)
select 
    n, 
    fibonacci_number
from fibonacci
order by n