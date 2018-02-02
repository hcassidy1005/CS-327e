create table Reviews(
	listing_id int,
	id int primary key,
	date date,
	reviewer_id int,
	reviewer_name varchar(50),
	comments varchar (20000)
);