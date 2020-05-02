use tourism;

-- Stored procedures, views, functions and triggers samples.

-- Stored procedures samples.
-- Landing page. Proposals with enterprise categories, brand names and photos.
-- 6 position on page in random order.

drop procedure if exists sp_enterprise_offers;

delimiter $$
$$
create procedure sp_enterprise_offers()
begin
	select 
		enterprise_category,
		brand_name,
		photo_album
	from enterprises_types
	join enterprises_profiles on enterprise_category_id = enterprises_types.id
	join media on media_id = enterprises_profiles.id
	order by rand()
	limit 6;
end$$
delimiter ;

call sp_enterprise_offers();

-- Calculate the value of cashback for restaurats and hotels where payment status is 'confirmed'
drop procedure if exists tourism.sp_update_total_hotels_cashback;

delimiter $$
$$
create procedure tourism.sp_update_total_hotels_cashback()
begin
	start transaction;
		update hotels_cashback as hc
		join hotels_payments as hp on hotels_payment_id = hp.id
		set
			total_hotel_cashback = bill*hotels_cashback
			where payment_status = 'confirmed';
	commit;
end$$
delimiter ;

call tourism.sp_update_total_hotels_cashback();

-- Calculate the billings for hotels.
drop procedure if exists tourism.sp_update_hotels_billings;

delimiter $$
$$
create procedure tourism.sp_update_hotels_billings()
begin
	start transaction;
		update hotels_billings as hb
		join hotels_cashback as hc on hotels_cashback_id = hc.id 
		set
			total_bill = total_hotel_cashback / 2;
	commit;
end$$
delimiter ;

call tourism.sp_update_hotels_billings();


-- Views samples. 
-- We need some tables for recommendation system development.
-- Table with the values of enterprises visited with tourists' characteristics.
create or replace view v_tourists_visited
as
	select
		gender,
		birthday,
		country,
		city, 
		education,
		concat(firstname, ' ', lastname) as name,
		bill,
		payment_status
	from profiles
	join customers on profile_id = customers.id 
	join restaurants_bookings on customer_id = customers.id
	join restaurants_payments on restaurants_bookings_id = restaurants_bookings.id
	where payment_status = 'confirmed'
union all
	select
		gender,
		birthday,
		country,
		city, 
		education,
		concat(firstname, ' ', lastname) as name,
		bill,
		payment_status
	from profiles
	join customers on profile_id = customers.id 
	join hotels_bookings on customer_id = customers.id
	join hotels_payments on hotels_bookings_id = hotels_bookings.id
	where payment_status = 'confirmed'
	
select *
from v_tourists_visited

-- Similarly make the view with enterprise features.
-- Unlike tourists, each category of enterprises has it's own features.
-- Union-quury didn't works. Join-query cannot be used.
-- Therefore, for each category of enterprises make it's own view. 
create or replace view v_restaurants_visited
as
	select
		brand_name,
		concat(concat(operation_country, ' ', operation_city), ' ', 
		concat(operation_street, ' ', operation_house_number)) as adress,
		concat(from_operation_hour, ' ', to_operation_hour) as operation_hour,
		average_check,
		restaurant_category,
		restaurant_feature,
		bill
	from enterprises_profiles
	join restaurants on enterprise_profile_id = enterprises_profiles.id 
	join restaurants_bookings on restaurant_profile_id = restaurants.id 
	join restaurants_payments on restaurants_bookings_id = restaurants_bookings.id
	where payment_status = 'confirmed'
	
select * 
from  v_restaurants_visited


create or replace view v_hotels_visited
as
	select
		brand_name,
		concat(concat(operation_country, ' ', operation_city), ' ', 
		concat(operation_street, ' ', operation_house_number)) as adress,
		concat(from_operation_hour, ' ', to_operation_hour) as operations_hours,
		parking,
		wifi,
		room_type,
		room_price,
		pets,
		hotel_services,
		hotel_safety,
		average_check,
		bill
	from enterprises_profiles
	join hotels on enterprise_profile_id = enterprises_profiles.id 
	join hotels_bookings on hotel_profile_id = hotels.id 
	join hotels_payments on hotels_bookings_id = hotels_bookings.id
	where payment_status = 'confirmed'

select *
from v_hotels_visited

-- Functions.
-- Calculate the average revenue per user(ARPU) for hotel by it's brand name.

drop function if exists func_hotel_arpu;

delimiter $$
$$
create function func_hotel_arpu(check_brand_name varchar(100))
returns decimal reads sql data
begin
	declare average_revenue decimal;
	declare total_customers decimal;

	set average_revenue = (
		select 
		avg(bill)
		from v_hotels_visited
		where brand_name = check_brand_name);
	
	set total_customers = (
		select 
			count(distinct(customer_id))
		from enterprises_profiles
		join hotels on enterprise_profile_id = enterprises_profiles.id
		join hotels_bookings on hotel_profile_id = hotels.id
		join customers on customer_id = customers.id
		where brand_name = check_brand_name
			and booking_status <> 'rejected');
	
	return average_revenue / total_customers;
end$$
delimiter ;

select func_hotel_arpu('et') as hotel_arpu;

-- Triggers.
-- Check the birthday value. The date of birthday cannot be later than current date.
drop trigger if exists tourism.tr_check_birhday;

delimiter $$
$$
create definer=`root`@`localhost` trigger `tr_check_birhday` before update on `profiles` 
for each row 
begin 
	if new.birthday >= now() then
		signal sqlstate '45000' set message_text = 'invalid birhday value';
	end if;
end$$
delimiter ;
-- P.S. A similar check of the birday date value can be done for other tables with 'created_at' field.






	