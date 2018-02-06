
# inner joins
select p.name, p.price, s.address, s.zip
from Product p join Product_store ps on p.sku = ps.sku
join Store s on ps.store = s.id 
join Subcategory su on p.subcategory_id = su.subcategory_id
where su.subcategory_name = "Apple"
order by p.name

#outer joins 
select p.sku, p.name, p.price 
from Product p left join Product_Store ps on p.sku = ps.sku
where ps.store is null
order by p.sku 