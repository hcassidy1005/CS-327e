alter table Calendar add FOREIGN KEY (listing_id) REFERENCES Listings(id);
alter table Summary_listings add FOREIGN KEY (neighborhood) REFERENCES Neighbourhoods(neighborhood);
alter table Summary_Reviews add FOREIGN KEY (listing_id) REFERENCES Listings(id);
alter table Reviews add FOREIGN KEY (listing_id) REFERENCES Listings(id);