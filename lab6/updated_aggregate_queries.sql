# Query 1:
# count the number of listings each host has
select h.name, h.id, count(l.id)
from host h full outer join listing l on h.id = l.host_id
group by h.name, h.id
order by h.name

# Query 2:
# find max price for each zipcode where the price is greater than 1000
select n.zipcode, max(price) 
from listing l join neighborhood n on l.neighborhood = n.neighborhood_name and l.zipcode = n.zipcode
where l.price > 1000
group by n.zipcode;

# Query 3:
# show average reviews score rating for listings with prices greater than 1000
select id, price, avg(review_scores_rating)
from listing
where price > 1000
group by price, id
order by price asc;

#Query 4: List the listing ids and the total number of amenities they have in the database. Only include listings which have at least 10 amenities. 
select listing_id, count(*) as number_of_amenities
from Amenity 
group by listing_id 
having count(*) >= 10

#Query 5: List the number of reviews that each listing has sorted by the highest number of reviews to lowest. 
select l.id as listing_id, count(l.id) as number_of_reviews 
from review r left join listing l
on r.listing_id = l.id 
group by l.id 
order by count(l.id) desc 


#Query 6: Find how many listings are available on each date. Only show dates that have at least 10 listings available. Order by number of listings available.
select c.date, count(*)
from calendar c
where c.available = 't'
group by c.date
having count(*) >= 10 
order by count(*) desc 
