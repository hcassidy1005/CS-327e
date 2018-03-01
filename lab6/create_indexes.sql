# query 1 index 
create index hostid_hostname_idx on host(id, name); 

# query 2 index
create index neighborhood_zip_idx on neighborhood(zipcode);

# query 3 index 
create index listing_price_idx on listing(price); 

# query 4 index 
create index amenity_listingid_idx on amenity(listing_id); 

# query 5 index 
create index review_listingid_idx on review(listing_id); 

# query 6 index 
create index calender_date_available_idx on calendar(date, available); 