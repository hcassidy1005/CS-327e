create table Host as select distinct host_id as id, 
	host_url as url, 
	host_name as name, 
	host_since as since, 
	host_location as location, 
	host_about as about, 
	host_response_time as response_time, 
	host_response_rate as response_rate,
	host_acceptance_rate as acceptance_rate, 
	host_is_superhost as is_superhost, 
	host_thumbnail_url as thumnail_url, 
	host_picture_url as pisture_url, 
	host_neighborhood as neighborhood, 
	host_listings_count as listings_count, 
	host_total_listings_count as total_listings_count, 
	host_verifications as verifications, 
	host_has_profile_pic as has_profile_pic, 
	host_identity_verified as identity_verified, 
	calculated_host_listings_count as calculated_listings_count from Listing;

alter table host add primary key(id);
alter table listing add foreign key (host_id) references Host(id);
