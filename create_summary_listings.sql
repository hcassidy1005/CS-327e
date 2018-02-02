create table Summary_Listings(
id int primary key,
name varchar(400),
host_id int,
host_name varchar(50),
neighborhood_group varchar(50),
neighborhood int,
latitude numeric(23, 20),
longitude numeric(23, 20),
room_type varchar(20),
price int,
minimum_nights int,
number_of_reviews int,
last_review date,
reviews_per_month numeric(4, 2),
calculated_host_listings_count int,
availability_365 int

);