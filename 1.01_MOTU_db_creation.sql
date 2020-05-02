-- The database creation
drop database if exists tourism;
create database tourism;
use tourism;

-- Tables creation. 
-- Types of users
drop table if exists user_type;
create table user_type (
	id SERIAL primary key,
	user_category enum('customers', 'enterprises')
);

-- Basic information about tourists
drop table if exists customers;
create table customers (
	id SERIAL primary key,
	user_category_id bigint unsigned default 1,
	firstname varchar(100) not null,
	lastname varchar(100) not null,
	email varchar(100) not null,
	phone bigint unsigned not null unique,
	password_hash varchar(100) not null,
	is_deleted tinyint default 0,
	
	foreign key(user_category_id) references user_type(id)
);

-- Tourists' characteristics
drop table if exists customers_profiles;
create table profiles (
	id SERIAL primary key,
	customer_id bigint unsigned not null,
	gender enum ('male', 'female'),
	birthday date not null,
	country varchar(100) not null,
	city varchar(100) not null,
	education varchar(100) not null,
	created_at datetime default now(),
	is_deleted tinyint default 0,
	
	foreign key(customer_id) references customers(id)
);

-- Types of enterprises table
drop table if exists enterprise_type;
create table enterprise_type (
	id SERIAL primary key,
	user_category_id bigint unsigned default 2,
	enterprise_category enum('restaurant', 'museum', 'cinema', 'theatre', 'night club', 'hotel'),

	index(enterprise_category),
	foreign key(user_category_id) references user_type(id)
);

-- Basic information about enterprises
drop table if exists enterprise_profile;
create table enterprise_profile (
	id SERIAL primary key,
	enterprise_category_id bigint unsigned not null,
	official_name varchar(100) not null,
	brand_name varchar(100) not null,
	tax_id int(10) not null unique,
	registry_id int(13) not null unique,
	mailing_address varchar(150) not null,
	email varchar(100) not null,
	operations_country varchar(100) not null,
	operations_city varchar(100) not null,
	operations_street varchar(100) not null,
	operations_house_number int(3) not null,
	from_operations_hours time,
	to_operations_hours time,
	created_at datetime default now(),
	updated_at datetime on update now(),
	
	index(brand_name,operations_country, operations_city, operations_street),
	foreign key (enterprise_category_id) references enterprise_type(id)
);

-- The table with photos and text files
drop table if exists media;
create table media (
	id SERIAL primary key,
    media_id bigint unsigned not null,
    filename varchar(255),
    description text,
    photo_albums longblob,
    file_size int,
    created_at datetime default now(),
    updated_at datetime on update now(),
    
    foreign key (media_id) references enterprise_profile(id)
);

-- Restaurants' features
drop table if exists restaurants;
create table restaurants (
	id SERIAL primary key,
	restaurants_id bigint unsigned not null, 
	enterprise_profile_id bigint unsigned not null,
	restaurants_media_id bigint unsigned not null,
	average_check int(4) unsigned,
	restaurants_categories set('russian cuisine', 'cafe', 'sushi', 'stake house', 'seafood',
							'pizza', 'chinese cuisine', 'italian cuisine'),
	restaurants_features set('for families with childrens', 'romantic', 'picturistique view',
							'for business', 'for friends'),
	
	foreign key(restaurants_id) references enterprise_type(id),
	foreign key(restaurants_media_id) references media(id),
	foreign key(enterprise_profile_id) references enterprise_profile(id)
);

-- Hotels' features
drop table if exists hotels;
create table hotels (
	id SERIAL primary key,
	hotels_id bigint unsigned not null, 
	hotels_media_id bigint unsigned not null,
    enterprise_profile_id bigint unsigned not null,
	parking set('in stock', 'not in stock', 'free', 'not free', 'guarded', 'not guarded', 'covered', 'outdoors'),
	wifi set('in stock', 'not in stock', 'free', 'not free'),
	room_type enum('1 place', '2 places', '3 places', '4 places'),
	room_price decimal(15,2),
	pets tinyint(1) default 1,
	hotel_services set('luggage storage', 'laundry'),
	hotel_safety set('fire estinguishers', 'CCTV'),
	average_check int(5) unsigned,
	
	foreign key(hotels_id) references enterprise_type(id),
	foreign key(hotels_media_id) references media(id),
	foreign key(enterprise_profile_id) references enterprise_profile(id)
);

-- Restaurants bookings by tourists
drop table if exists restaurants_bookings;
create table restaurants_bookings (
	id SERIAL primary key,
	customer_id bigint unsigned not null,
	restaurants_profile_id bigint unsigned not null,
	prepayment decimal (15, 2) unsigned,
	booking_status enum('confirmed', 'in processing', 'regected', 'prepayment received', 'on position', 'closed'),
	created_at datetime default now(),
	updated_at datetime on update now(), 
	closed_at datetime default now(),
	
	foreign key(customer_id) references customers(id),
	foreign key(restaurants_profile_id) references restaurants(id)
);

-- Holtels bookings by tourists
drop table if exists hotels_bookings;
create table hotels_bookings (
	id SERIAL primary key,
	customer_id bigint unsigned not null,
	hotels_profile_id bigint unsigned not null,
	prepayment decimal (15, 2) unsigned,
	booking_status enum('confirmed', 'in processing', 'regected', 'prepayment received', 'on position', 'closed'),
	created_at datetime default now(),
	updated_at datetime on update now(),
	closed_at datetime default now(),
	
	foreign key(customer_id) references customers(id),
	foreign key(hotels_profile_id) references hotels(id)
);

-- Tourists payments to restaurants
drop table if exists restaurants_payments;
create table restaurants_payments (
	id SERIAL primary key,
	restaurants_bookings_id bigint unsigned not null, -- add values only where restaurants bookings status is 'closed'
	bill decimal(15, 2) unsigned,
	payment_status enum('confirmed', 'in processing', 'regected'),
	created_at datetime default now(),
	updated_at datetime on update now(), 
	
	foreign key(restaurants_bookings_id) references restaurants_bookings(id)
);

-- Tourists payments to hotels
drop table if exists hotels_payments;
create table hotels_payments (
	id SERIAL primary key,
	hotels_bookings_id bigint unsigned not null, -- add values only where hotels bookings status is 'closed'
	bill decimal(15, 2) unsigned,
	payment_status enum('confirmed', 'in processing', 'regected'),
	created_at datetime default now(),
	updated_at datetime on update now(), 
	
	foreign key(hotels_bookings_id) references hotels_bookings(id)
);

-- Cashback calculation 
drop table if exists restaurants_cashback;
create table restaurants_cashback (
	id SERIAL primary key,
	restaurants_payment_id bigint unsigned not null, -- add values only where restaurants payments status is 'confirmed'
	restaurants_cashback float unsigned default 0.15, -- cashback rate
	total_restaurants_cashback decimal(15, 2) unsigned, -- total casback value group by restaurants
	created_at datetime default now(),
	
	foreign key(restaurants_payment_id) references restaurants_payments(id)
);

drop table if exists hotels_cashback;
create table hotels_cashback (
	id SERIAL primary key,
	hotels_payment_id bigint unsigned not null, -- add values only where hotels payments status is 'confirmed'
	hotels_cashback float unsigned default 0.15, -- cashback rate
	total_hotels_cashback decimal(15, 2), -- total caschback value group by hotels
	created_at datetime default now(),
	
	foreign key(hotels_payment_id) references hotels_payments(id)
);

-- Commission calculation
drop table if exists restaurants_billings;
create table restaurants_billings (
	id SERIAL primary key,
	restaurants_cashback_id bigint unsigned not null, 
	total_bill decimal (15, 2), -- total bill value is equal to the half of cashback value 
	is_paid tinyint default 0,
	created_at datetime default now(),
	closed_at datetime default now(),
	
	foreign key(restaurants_cashback_id) references restaurants_cashback(id)
);	

drop table if exists hotels_billings;
create table hotels_billings (
	id SERIAL primary key,
	hotels_cashback_id bigint unsigned not null, 
	total_bill decimal(15, 2), -- total bill value is equal to the half of cashback value
	is_paid tinyint default 0,
	created_at datetime default now(),
	closed_at datetime default now(),
	
	foreign key(hotels_cashback_id) references hotels_cashback(id)
);




