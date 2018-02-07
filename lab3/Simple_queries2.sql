# query 1: Find the dates of listings in the 78705 zipcode that are available
select l.name, c.date
from Calendar c join Listings l
on c.listing_id = l.id
where c.available = 't' and l.zipcode = '78705'
order by c.date
limit 20;

# query 2: Find listings that have a pool and are available on July 4th 2017
select l.name, c.date, l.amenities
from Calendar c join Listings l 
on c.listing_id = l.id
where c.available = 't' and c.date = '2017-07-04' and l.amenities like '%Pool%'
order by l.name
limit 20;

# query 3: Find listings that don't have reviews
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
order by c.date
limit 20;

# query 5: Find listings that have the word Excellent in their review 
select l.name
from Listings l join Reviews r
on l.id = r.listing_id
where r.comments like '%excellent%' or r.comments like '%Excellent%' or r.comments like '%EXCELLENT%'
limit 20; 


# query 6: Find listing that have the word awful in their review 
select l.name
from Listings l join Reviews r
on l.id = r.listing_id
where r.comments like '%awful%' or r.comments like '%Awful%' or r.comments like '%AWFUL%'
limit 20; 


