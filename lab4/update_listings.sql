create table Listing_backup as select from * listings;
alter table Listing_backup add primary key(id);

alter table Listings drop column calendar_update;

alter table Listings drop column calander_last_scraped;

alter table Listings drop column avalibility_30;

alter table Listings drop column avalibility_60;

alter table Listings drop column avalibility_90;

alter table Listings drop column neighborhood_cleansed;

alter table Listings drop column neighborhood_group_cleansed;

alter table Summary_Listings drop neighborhood_group;

alter table Listings rename column neighbourhood to neighborhood;

alter table Listings add foreign key(neighborhood, zipcode) references Neighborhood(neighborhood_name, zipcode);

alter table Summary_Listings rename column zipcode to neighborhood;

alter table Summary_listings rename to Summary_listing;

alter table listings rename to listing

alter table Summary_listings drop CONSTRAINT summary_listings_neighborhood_fkey;


alter table listing drop column host_url;
alter table listing drop column host_name;
alter table listing drop column host_since;
alter table listing drop column host_location;
alter table listing drop column host_about;
alter table listing drop column host_response_time;
alter table listing drop column host_response_rate;
alter table listing drop column host_acceptance_rate;
alter table listing drop column host_is_superhost;
alter table listing drop column host_thumbnail_url;
alter table listing drop column host_picture_url;
alter table listing drop column host_neighborhood;
alter table listing drop column host_listings_count;
alter table listing drop column host_total_listings_count;
alter table listing drop column host_verifications;
alter table listing drop column host_has_profile_pic;
alter table listing drop column host_identity_verified;
alter table listing drop column calculated_host_listings_count;

update listing set street2 = street;
update listing set price2 = price;
update listing set weekly_price2 = weekly_price;
update listing set monthly_price2 = monthly_price;
update listing set security_deposit2 = security_deposit;
update listing set cleaning_fee2 = cleaning_fee;

update listing set street2 = split_part(street2, ', ', 1);

update listing set price2 = replace(price2, '$', '');
update listing set price2 = replace(price2, ',', '' );
update listing set weekly_price2 = replace(weekly_price2, '$', '' );
update listing set weekly_price2 = replace(weekly_price2, ',', '' );
update listing set monthly_price2 = replace(montly_price2, '$', '' );
update listing set monthly_price2 =replace(monthly_price2, ',', '' );
update listing set security_deposit2 = replace(security_deposit2, '$', '' );
update listing set security_deposit2 = replace(security_deposit2, ',', '' );
update listing set cleaning_fee2 = replace(cleaning_fee2, '$', '' );
update listing set cleaning_fee2 = replace(cleaning_fee2, ',', '' );

alter table listing alter column price2 type numeric(7, 2) using price2::numeric(7, 2);
alter table listing alter column weekly_price2 type numeric(7, 2) using weekly_price2::numeric(7, 2);
alter table listing alter column monthly_price2 type numeric(7, 2) using monthly_price2::numeric(7, 2);
alter table listing alter column security_deposit2 type numeric(7, 2) using security_deposit2::numeric(7, 2);


alter table listing drop column street;
alter table listing drop column price;
alter table listing drop column weekly_price;
alter table listing drop column monthly_price;
alter table listing drop column security_deposit;
alter table listing drop column cleaning_fee;

alter table listing rename column street2 to street;
alter table listing rename column price2 to price;
alter table listing rename column weekly_price2 to weekly_price; 
alter table listing rename column monthly_price2 to monthly_price;
alter table listing rename column security_deposit2 to security_deposit;
alter table listing rename column celaning_fee2 to cleaning_fee;

