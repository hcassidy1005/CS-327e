# query 1: Find all the dates of listings in the 78705 zipcode that are available
select l.name, c.date
from Calendar c join Listings l
on c.listing_id = l.id
where c.available = 't' and l.zipcode = '78705'
order by c.date
limit 20;


# query 2: Find all the listings that have a pool and are available on July 4th 2017
select l.name, c.date, l.amenities
from Calendar c join Listings l 
on c.listing_id = l.id
where c.available = 't' and c.date = '2017-07-04' and l.amenities like '%Pool%'
order by l.name
limit 20;

# query 3: Find all the listings that don't have reviews
select l.id, l.name 
from Listings l left join Reviews r
on l.id = r.listing_id
where r.listing_id is null
order by l.name
limit 20; 

# query 4: Find the entire house/apt airbnbs under 100 dollars that are available
select sl.name, sl.price
from Summary_Listings sl join Calendar c
on sl.id = c.listing_id
where sl.price <= 100 and c.available = 't' and sl.room_type = 'Entire home/apt'
order by sl.price
limit 20;


# query 5:


# query 6:



