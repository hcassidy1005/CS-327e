create table Listings (
   id int primary key,
   listing_url varchar(200),
   scrape_id varchar(30),
   last_scraped date,
   name varchar(100),
   summary text,
   space text,
   discription text,
   experiences_offered varchar(50),
   neighborhood_overview varchar(1000),
   notes varchar(1000),
   transit varchar(5000),
   access varchar(5000),
   interaction varchar(5000),
   house_rules varchar(5000),
   thumbnail_url varchar(5000),
   medium_url varchar(5000),
   picture_url varchar(5000),
   xl_picture_url varchar(5000),
   host_id int,
   host_url varchar(100),
   host_name varchar(50),
   host_since date,
   host_location varchar(1000),
   host_about varchar(12000),
   host_response_time varchar(50),
   host_response_rate varchar(10),
   host_acceptance_rate varchar(10),
   host_is_superhost boolean,
   host_thumbnail_url varchar(5000),
   host_picture_url varchar(5000),
   host_neighborhood varchar(50),
   host_listings_count int,
   host_total_listings_count int,
   host_verifications varchar(500),
   host_has_profile_pic boolean,
   host_identity_verified boolean,
   street varchar(100),
   neighborhood varchar(50),
   neighborhood_cleansed int,
   neighborhood_group_cleansed int, 
   city varchar(20),
   state varchar(2),
   zipcode varchar(20), 
   market varchar(20),
   smart_location varchar(30),
   country_code varchar(2),
   country varchar(20),
   latitude numeric(17,15),
   longitude numeric(18,15),
   is_location_exact boolean,
   property_type varchar(20),
   room_type varchar(20),
   accommodates int,
   bathrooms numeric(2,1),
   bedrooms int, 
   beds int, 
   bed_type varchar(20),
   amenities varchar(5000),
   square_feet int,
   price varchar(10),
   weekly_price varchar(15),
   monthly_price varchar(15),
   security_deposit varchar(10),
   cleaning_fee varchar(10),
   guests_included int,
   extra_people varchar(10),
   minimum_nights int,
   maximun_nights int,
   calendar_update varchar(20),
   has_availability boolean,
   avalibility_30 int,
   avalibility_60 int, 
   avalibility_90 int,
   avalibilty_365 int,
   calander_last_scraped date,
   number_of_reviews int, 
   first_review date,
   last_review date,
   review_scores_rating int,
   review_scores_accuracy int,
   review_scores_cleanliness int,
   review_scores_checkin int, 
   review_scores_communication int, 
   review_scores_location int, 
   review_scores_value int, 
   requires_license boolean,
   license varchar(1000),
   jurisdiction_names varchar(100),
   instant_bookable boolean,
   cancellation_policy varchar(100),
   require_guest_profile_picture boolean,
   require_guest_phone_verification boolean,
   calculated_host_listings_count int,
   reviews_per_month numeric(4,2)

);