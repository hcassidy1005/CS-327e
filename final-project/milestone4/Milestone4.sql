SELECT
  date_trunc(c.date, month) AS Date,
  l.zipcode AS Zipcode,
  l.bedrooms AS Bedrooms,
  percentile_cont(CASE
      WHEN c.price IS NULL THEN l.price
      ELSE c.price END,
    0.5) OVER (PARTITION BY date_trunc(c.date, month)) AS airbnb_price_day,
  percentile_cont(zillow.price,
    0.5) OVER (PARTITION BY zillow.date)AS zillow_price_month,
  (percentile_cont(zillow.price,
      0.5) OVER (PARTITION BY date_trunc(c.date, month)) / percentile_cont(CASE
        WHEN c.price IS NULL THEN l.price
        ELSE c.price END,
      0.5) OVER (partition by zillow.date)) AS crossover_pt
FROM
  `brogrammers-193119.Austin.Calendar` c
JOIN
  `brogrammers-193119.Austin.Listing` l
ON
  c.listing_id = l.id
JOIN (
  SELECT
    zipcode,
    date,
    price,
    1 AS bedrooms
  FROM
    `brogrammers-193119.zillow.Rental_Price_1Bedroom`
  UNION ALL
  SELECT
    zipcode,
    date,
    price,
    2 AS bedrooms
  FROM
    `brogrammers-193119.zillow.Rental_Price_2Bedroom`
  UNION ALL
  SELECT
    zipcode,
    date,
    price,
    3 AS bedrooms
  FROM
    `brogrammers-193119.zillow.Rental_Price_3Bedroom`
  UNION ALL
  SELECT
    zipcode,
    date,
    price,
    4 AS bedrooms
  FROM
    `brogrammers-193119.zillow.Rental_Price_4Bedroom`
  UNION ALL
  SELECT
    zipcode,
    date,
    price,
    5 AS bedrooms
  FROM
    `brogrammers-193119.zillow.Rental_Price_5Bedroom`) AS zillow
ON
  l.zipcode = zillow.zipcode
  AND l.bedrooms = zillow.bedrooms
  AND date_trunc(c.date, month)= date_trunc(zillow.date, month)
WHERE
  l.room_type = 'Entire home/apt';