#The Calendar.price field converted to a numeric type
update calendar set price = replace(price, '$', '');
update calendar set price = replace(price, ',', '');
alter table calendar alter column price type numeric(8, 2) using price::numeric(8, 2);

#The Host.response_rate field converted to a numeric type. Hint:remove "%" and update "N/A" to NULL.
update host set response_rate = replace(response_rate, '%', '');
update host set response_rate = replace(response_rate, 'N/A', null);
alter table host alter column response_rate type numeric(7, 2) using response_rate::numeric(7, 2);

#The Host.location field split into 3 fields: Host.city, Host.state, Host.country 
alter table host add column city varchar(500);
alter table host add column state varchar(500);
alter table host add column country varchar(500);
update host set city = split_part(location, ', ', 1);
update host set state = split_part(location, ', ', 2);
update host set country = split_part(location, ', ', 3);

#The Host.location field removed
alter table host drop column location; 

