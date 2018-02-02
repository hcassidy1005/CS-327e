create table Reviews(
listing_id varchar(20),
id int primary key,
date date,
reviewer_id int,
reviewer_name varchar(50),
comments varchar (20000)
);