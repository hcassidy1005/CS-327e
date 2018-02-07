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

# query 7: list the prices for everyone named John
Select c.date, l.host_name, l.id, c.price
from Listings l right outer join Calendar c on l.id = c.listing_id
Where l.host_name = 'John'
order by c.date
limit 20;

# query 8: display the names of reviewers that reviewed hosts named john
Select l.host_name, r.reviewer_name
from Reviews r join Listings l on r.listing_id = l.id
where l.host_name = 'John'
order by r.reviewer_name
limit 20;

# query 9: display neighbourhoods that have listings with more than 10 beds
Select n.neighborhood, l.beds
from neighbourhoods n join listings l on n.neighborhood = l.neighborhood_cleansed 
where l.beds >= 10
order by n.neighborhood
limit 20;

# query 10: display the latitude of houses with a shared room option
Select sl.latitude, n.neighborhood
from neighbourhoods n join summary_listings sl on n.neighborhood = sl.neighborhood
where sl.room_type = 'Shared room'
limit 20;

# query 11: find hosts named melanie and hailey and display if they have available listings
Select l.host_name, l.id, c.available
from Listings l join Calendar c on c.listing_id = l.id
where l.host_name = 'Melanie' or l.host_name = 'Hailey'
order by c.date
limit 20;

# query 12: display available listings that have summary reviews and the date of the summary reviews
select sr.listing_id, sr.date, c.available, l.host_name
from summary_reviews sr join listings l on sr.listing_id = l.id
join calendar c on c.listing_id = l.id
where c.available = 't'
order by c.date
limit 20;

