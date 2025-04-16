with maxprice as (
    select 
        od.orderid, 
        max(od.price) as max_price
    from orderdetails od
    group by od.orderid
)
select 
    mp.orderid, 
    p.productname, 
    mp.max_price
from maxprice mp
join orderdetails od 
    on mp.orderid = od.orderid 
    and mp.max_price = od.price
join products p 
    on od.productid = p.productid