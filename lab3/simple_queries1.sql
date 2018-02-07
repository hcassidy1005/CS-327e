# list the prices for everyone named John
Select c.date, l.host_name, l.id, c.price
from Listings l right outer join Calendar c on l.id = c.listing_id
Where l.host_name = 'John'
order by c.date
limit 20;

# display the names of reviewers that reviewed hosts named john
Select l.host_name, r.reviewer_name
from Reviews r join Listings l on r.listing_id = l.id
where l.host_name = 'John'
order by r.reviewer_name
limit 20;

# display neighbourhoods that have listings with more than 10 beds
Select n.neighborhood, l.beds
from neighbourhoods n join listings l on n.neighborhood = l.neighborhood_cleansed 
where l.beds >= 10
order by n.neighborhood
limit 20;

# display the latitude of houses with a shared room option
Select sl.latitude, n.neighborhood
from neighbourhoods n join summary_listings sl on n.neighborhood = sl.neighborhood
where sl.room_type = 'Shared room'
limit 20;

# find hosts named melanie and hailey and display if they have available listings
Select l.host_name, l.id, c.available
from Listings l join Calendar c on c.listing_id = l.id
where l.host_name = 'Melanie' or l.host_name = 'Hailey'
order by c.date
limit 20;

# display available listings that have summary reviews and the date of the summary reviews
select sr.listing_id, sr.date, c.available, l.host_name
from summary_reviews sr join listings l on sr.listing_id = l.id
join calendar c on c.listing_id = l.id
where c.available = 't'
order by c.date
limit 20;




