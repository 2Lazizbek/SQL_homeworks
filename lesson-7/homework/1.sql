select 
    c.customerid, 
    c.customername, 
    o.orderid, 
    o.orderdate
from customers c
left join orders o 
    on c.customerid = o.customerid