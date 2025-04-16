select 
    c.customerid, 
    c.customername, 
    sum(od.quantity * od.price) as totalspent
from customers c
left join orders o 
    on c.customerid = o.customerid
left join orderdetails od 
    on o.orderid = od.orderid
group by c.customerid, c.customername