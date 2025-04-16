with customer_categories as (
    select distinct 
        c.customerid, 
        c.customername, 
        p.category
    from customers c
    join orders o 
        on c.customerid = o.customerid
    join orderdetails od 
        on o.orderid = od.orderid
    join products p 
        on od.productid = p.productid
)
select 
    cc.customerid, 
    cc.customername
from customer_categories cc
group by cc.customerid, cc.customername
having count(case when cc.category != 'electronics' then 1 end) = 0
   and count(case when cc.category = 'electronics' then 1 end) > 0