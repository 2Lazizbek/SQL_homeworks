select 
    case 
        when status in ('shipped', 'delivered') then 'completed'
        when status = 'pending' then 'pending'
        when status = 'cancelled' then 'cancelled'
    end as orderstatus,
    count(*) as totalorders,
    sum(totalamount) as totalrevenue
from orders
where orderdate between '2023-01-01' and '2023-12-31'
group by 
    case 
        when status in ('shipped', 'delivered') then 'completed'
        when status = 'pending' then 'pending'
        when status = 'cancelled' then 'cancelled'
    end
having sum(totalamount) > 5000
order by totalrevenue desc