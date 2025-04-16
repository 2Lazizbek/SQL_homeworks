select 
    o.orderid, 
    p.productname, 
    od.quantity
from orders o
join orderdetails od 
    on o.orderid = od.orderid
join products p 
    on od.productid = p.productid