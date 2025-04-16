with latestorders as (
    select 
        o.customerid, 
        max(o.orderdate) as latest_orderdate
    from orders o
    group by o.customerid
)
select 
    c.customerid, 
    c.customername, 
    o.orderid, 
    o.orderdate
from customers c
join orders o 
    on c.customerid = o.customerid
join latestorders lo 
    on o.customerid = lo.customerid 
    and o.orderdate = lo.latest_orderdate