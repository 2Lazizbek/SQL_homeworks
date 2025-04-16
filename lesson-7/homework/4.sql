select 
    c.customerid, 
    c.customername
from customers c
join orders o 
    on c.customerid = o.customerid
group by c.customerid, c.customername
having count(o.orderid) > 1