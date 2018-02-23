#The Calendar.price field converted to a numeric type
update calendar set price = replace(price, '$', '');
update calendar set price = replace(price, ',', '');
alter table calendar alter column price type numeric(8, 2) using price::numeric(8, 2);