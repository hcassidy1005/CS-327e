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

