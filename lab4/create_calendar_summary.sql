create table Calendar_Summary as select id as listing_id, calendar_update, 
	calander_last_scraped as from_date, avalibility_30, avalibility_60, avalibility_90 from Listings;

alter table Calendar_Summary add primary key(listing_id, from_date);

alter table Calendar_Summary add foreign key(listing_id) references Listings;

alter table Listings drop column calendar_update;

alter table Listings drop column calander_last_scraped;

alter table Listings drop column avalibility_30;

alter table Listings drop column avalibility_60;

alter table Listings drop column avalibility_90;
