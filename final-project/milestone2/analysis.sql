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