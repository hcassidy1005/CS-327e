create table Neighborhood as select distinct neighborhood as neighborhood_name, neighborhood_cleansed as zipcode from Listings;
 
delete from Neighborhood where neighborhood_name is null;

delete from Neighborhood where zipcode is null;

alter table Neighborhood add primary key(neighborhood_name, zipcode);

alter table Listings drop column neighborhood_cleansed;

alter table Listings drop column neighborhood_group_cleansed;

alter table Summary_Listings drop neighborhood_group;

drop table Neighbourhoods;

alter table Listings rename column neighbourhood to neighborhood;

alter table Listings add foreign key(neighborhood, zipcode) references Neighborhood(neighborhood_name, zipcode);

alter table Summary_Listings rename column zipcode to neighborhood;


