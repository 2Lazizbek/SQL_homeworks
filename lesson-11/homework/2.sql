declare @missingorders table (
    orderid int primary key,
    customername varchar(100),
    product varchar(50),
    quantity int
)

insert into @missingorders (orderid, customername, product, quantity)
select 
    o1.orderid,
    o1.customername,
    o1.product,
    o1.quantity
from orders_db1 o1
left join orders_db2 o2
    on o1.orderid = o2.orderid
where o2.orderid is null

select * from @missingorders