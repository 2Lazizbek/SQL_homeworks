with rankedproducts as (
    select 
        category,
        productname,
        price,
        stock,
        row_number() over (partition by category order by price desc) as rn
    from products
)
select distinct 
    rp.category,
    rp.productname,
    rp.price,
    iif(rp.stock = 0, 'out of stock', iif(rp.stock between 1 and 10, 'low stock', 'in stock')) as inventorystatus
from rankedproducts rp
where rn = 1
order by price desc
offset 5 rows