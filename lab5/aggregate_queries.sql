# Query 1:
# count the number of listings each host has
select h.name, h.id, count(l.id)
from host h full outer join listing l on h.id = l.host_id
group by h.name, h.id
order by h.name
limit 20;


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
