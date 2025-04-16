select distinct 
    c.customerid, 
    c.customername
from customers c
join orders o 
    on c.customerid = o.customerid
join orderdetails od 
    on o.orderid = od.orderid
join products p 
    on od.productid = p.productid
where p.category = 'stationery'