use tourism;
-- Queries samples

-- Find the quantity of male tourists
select 
	count(profile_id) as total_male 
from profiles 
where gender = 'male';

-- Tourist wants to view names of hotels at Port Annie city
select brand_name from enterprises_profiles
	where enterprise_category_id = '4'
	and operation_city = 'Port Annie';

-- Sort in ascend order enterprises by the quantity of operation hours 
select
	brand_name,
	official_name,
	timediff(to_operation_hour, from_operation_hour) as total_operation_hours
from enterprises_profiles
order by total_operation_hours

-- Find the average age of male and female tourists
select 
	gender,
	avg(timestampdiff(year, birthday, now())) as average_age
from profiles 
group by gender;

-- Find the adults and minors tourists
select
	firstname,
	lastname,
	timestampdiff(year, birthday, now()) as age,
	case when timestampdiff(year, birthday, now()) >= 18 then 'совершеннолетний'
		 when timestampdiff(year, birthday, now()) < 18 then 'несовершеннолетний'
	end as status
from profiles
join customers on profile_id = customers.id
order by status; 

-- Sort in ascend order the age of minors after the age of adults
select
	timestampdiff(year, birthday, now()) as age
from profiles
order by
	if(age >= 18,1,0)desc, age asc;

-- Find the quantity of enterprises group by hotels and restaurants 
select
	enterprise_category,
	count(*) as total
from enterprises_profiles
join enterprises_types on enterprise_category_id = enterprises_types.id
group by enterprise_category;

-- Find the quantity of tourists older than average
select
	count(age) as total_older
from 
	(select 
		timestampdiff(year, birthday, now()) as age
	from profiles
	having age > (select 
					avg(timestampdiff(year, birthday, now()))
				from profiles)
	order by age) as age;

-- Find the the first client registered. Also find it's type and email.  
select
	email,
	created_at,
	user_category
from users_types
join customers on user_category_id = users_types.id
join profiles on profile_id = customers.id
union
select
	email,
	created_at,
	user_category
from  enterprises_profiles
join enterprises_types on enterprise_category_id = enterprises_types.id 
join users_types on user_category_id = users_types.id
order by created_at
limit 1;

-- Identify the day and month of tourists' birthdays where firstname starts with 'M'.
select
	concat(monthname(profiles.birthday), ' ', day(profiles.birthday)) as Birhday,
	concat (customers.firstname, ' ', customers.lastname) as Name
from profiles
join customers on profile_id = customers.id
where firstname like 'M%'

-- Identify the tourist, who spent the most money on hotels
select
	firstname,
	lastname,
	max(bill) as total
from customers
join hotels_bookings on customers.id = customer_id
join hotels_payments on hotels_bookings_id = hotels_bookings.id
		
-- Tourist wants to scan all hotels and it's types sorted by room price in ascend order
select 
	brand_name,
	room_type,
	room_price,
	description,
	photo_album
from enterprises_profiles
join hotels on enterprise_profile_id = enterprises_profiles.id
join media on hotels_media_id = media.id
order by room_price;

-- Identify how much money spent Jack Jakubowski on restaurants.
select
	sum(bill) as Jack_Jakubowskis_costs	
from restaurants_payments
join restaurants_bookings on restaurants_bookings_id = restaurants_bookings.id 
join customers on customer_id = customers.id
where firstname = 'Jack' and lastname = 'Jakubowski';

-- Tourist wants to visit with friends the cheapest restaurant.
select
	brand_name,
	operation_country, 
	operation_city, 
	operation_street,
	description,
	photo_album,
	min(average_check)
from enterprises_profiles
join restaurants on enterprise_profile_id = enterprises_profiles.id
join media on restaurants_media_id = media.id 
where restaurant_feature = 'for friends';

-- Find the quantity of customers for each type of hotels.
select
	count(distinct(customer_id)) as total_customers,
	room_type
from hotels_payments
join hotels_bookings on hotels_bookings_id = hotels_bookings.id
join hotels on hotel_profile_id = hotels.id
where booking_status <> 'regected'
group by room_type
order by total_customers desc;

-- Find the contacts of tourists who visit restaurants more often that in average
select 
	count(*) as total_restaurants_bookings,
	concat (customers.email, '-----', customers.phone) as contacts
	from restaurants_bookings
	join customers on customer_id = customers.id
	group by contacts
having total_restaurants_bookings > (
select avg(total_restaurants_bookings)
from (
	select 
	count(*) as total_restaurants_bookings,
	concat (customers.email, '-----', customers.phone) as contacts
	from restaurants_bookings
	join customers on customer_id = customers.id
	group by contacts) as list)
	
-- Find the contacts of tourists who didn't visit hotels more than 3 years
select
	email,
	phone
from customers
join hotels_bookings on customer_id = customers.id
where year(curdate()) - year(hotel_booking_closed_at) > 3; 

-- Compare the quantity of tourists who booked restaurant and who used it's booking
select
	count(*) as total_customers_bookings,
	booking_status
from customers 
join restaurants_bookings 
on  customers.id = restaurants_bookings.customer_id
where booking_status = 'confirmed' 
	or booking_status = 'on position'
group by booking_status
order by total_customers_bookings desc;

-- Identify the restaurant with the maximum quantity of clients.
select
	count(distinct(customer_id)) as total_customers,
	brand_name
from restaurants_bookings
join restaurants on restaurant_profile_id = restaurants.id
join enterprises_profiles on enterprise_profile_id = enterprises_profiles.id
where booking_status <> 'rejected'
group by restaurant_profile_id
order by total_customers desc
limit 1;

