update listing set amenities = regexp_replace(amenities, '{|}|"', '', 'g');

create table Amenity as select id as listing_id, regexp_split_to_table(amenities, ',') as amenity_name from listing; 

alter table Amenity add primary key(listing_id, amenity_name);
alter table Amenity add foreign key(listing_id) references listing(id);

alter table listing drop column amenities;