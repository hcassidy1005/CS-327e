# Metric 1: find how many listings are avaiable and how many are booked each month of each year for each of the three cities 
select extract(month from c.date) as month, extract(year from c.date) as year, c.available, count(*) as Num_listings
from `brogrammers-193119.Austin.Calendar` c
group by month, year, c.available
order by year, month, c.available desc

select extract(month from c.date) as month, extract(year from c.date) as year, c.available, count(*) as Num_listings
from `brogrammers-193119.Boston.Calendar` c
group by month, year, c.available
order by year, month, c.available desc

select extract(month from c.date) as month, extract(year from c.date) as year, c.available, count(*) as Num_listings
from `brogrammers-193119.Denver.Calendar` c
group by month, year, c.available
order by year, month, c.available desc
# Analysis: 
# This metric shows that boston and denver airbnb are both growing in number but Austin on the other hand is not. 
# Austin's numbers were much bigger than Boston's and Denver's in 2016 and 2017 but have dropped this year in comparison. 

# Metric 2: find the average price of listings with different amounts of bedrooms and beds 
SELECT
  l.beds,
  l.bedrooms,
  AVG(l.price) as avg_price
FROM
  `brogrammers-193119.Austin.Listing` l
WHERE
  l.beds is not NULL and l.bedrooms is not NULL
GROUP BY
  l.beds,
  l.bedrooms 
ORDER BY 
  l.beds,l.bedrooms

SELECT
  l.beds,
  l.bedrooms,
  AVG(l.price) as avg_price
FROM
  `brogrammers-193119.Boston.Listing` l
WHERE
  l.beds is not NULL and l.bedrooms is not NULL
GROUP BY
  l.beds,
  l.bedrooms 
ORDER BY 
  l.beds,l.bedrooms

SELECT
  l.beds,
  l.bedrooms,
  AVG(l.price) as avg_price
FROM
  `brogrammers-193119.Denver.Listing` l
WHERE
  l.beds is not NULL and l.bedrooms is not NULL
GROUP BY
  l.beds,
  l.bedrooms 
ORDER BY 
  l.beds,l.bedrooms
# Analysis: 
# Austin has bigger available airbnbs (most bedrooms).
# Austin also has some of the most expensive airbnbs.
# A 5 bedroom, 11 bed listing cost on average $1384.75 in Austin and cost $200 on average in Boston and $847.50 on average in Denver

# Metric 3: Find the maxamimum amounnt of nights allowed for each listing that was booked
SELECT
  l.id AS listing_id,
  l.maximum_nights AS maximum_nights
FROM
  `brogrammers-193119.Austin.Listing` l
JOIN
  `brogrammers-193119.Austin.Calendar` c
ON
  l.id = c.listing_id
WHERE
  c.available = FALSE
GROUP BY
  l.id,
  l.maximum_nights

SELECT
  l.id AS listing_id,
  l.maximum_nights AS maximum_nights
FROM
  `brogrammers-193119.Boston.Listing` l
JOIN
  `brogrammers-193119.Boston.Calendar` c
ON
  l.id = c.listing_id
WHERE
  c.available = FALSE
GROUP BY
  l.id,
  l.maximum_nights

SELECT
  l.id AS listing_id,
  l.maximum_nights AS maximum_nights
FROM
  `brogrammers-193119.Denver.Listing` l
JOIN
  `brogrammers-193119.Denver.Calendar` c
ON
  l.id = c.listing_id
WHERE
  c.available = FALSE
GROUP BY
  l.id,
  l.maximum_nights
# Analysis:
# The max nights at an airbnb in Austin is 26,801 nights
# The maximum in Boston and Denver is 99,999,999 days 

# Metric 4: Find the average price for different review scores that listings recieved 
select l.review_scores_rating, avg(l.price) as average_price
from `brogrammers-193119.Austin.Listing` l 
where l.review_scores_rating is not NULL
group by l.review_scores_rating
order by l.review_scores_rating

select l.review_scores_rating, avg(l.price) as average_price
from `brogrammers-193119.Boston.Listing` l 
where l.review_scores_rating is not NULL
group by l.review_scores_rating
order by l.review_scores_rating

select l.review_scores_rating, avg(l.price) as average_price
from `brogrammers-193119.Denver.Listing` l 
where l.review_scores_rating is not NULL
group by l.review_scores_rating
order by l.review_scores_rating
# Analysis:
# The average price of a listing that gets 100 review score in Austin is $249.80
# The average price of a listing that gets 100 review score in Boston is $182.03
# The average price of a listing that gets 100 review score in Austin is $139.89