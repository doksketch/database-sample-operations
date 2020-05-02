use tourism;

-- Update values in restaurants and hotels bookings tables where booking status is "prepayment received"
update restaurants_bookings
set
	prepayment = rand()
where
	booking_status = 'prepayment received';
	
update hotels_bookings
set
	prepayment = rand()
where
	booking_status = 'prepayment received';

-- The same operations can be implemented using a stored procedure
drop procedure if exists tourism.sp_restaurants_prepayment;

delimiter $$
$$
create procedure sp_update_prepayment()
begin
	start transaction;
	update restaurants_bookings
		set
			prepayment = rand()
		where
			booking_status = 'prepayment received';
	commit;
	start transaction;
		update hotels_bookings
		set
			prepayment = rand()
		where
			booking_status = 'prepayment received';
	commit;
end$$
delimiter ;

	
-- Update payment values in hotels and restaurants payments tables where payment status is "confirmed"
update restaurants_payments 
set
	bill = rand()
where 
	payment_status = 'confirmed';
	
update hotels_payments 
set
	bill = rand()
where 
	payment_status = 'confirmed';

-- The same operations can be implemented using a stored procedure
drop procedure if exists tourism.sp_update_bills;

delimiter $$
$$
create procedure sp_update_bills()
begin
	start transaction;
		update restaurants_payments 
		set
			bill = rand()
		where 
			payment_status = 'confirmed';
	commit;
	start transaction;
		update hotels_payments 
		set
			bill = rand()
		where 
			payment_status = 'confirmed';
	commit;
end$$
delimiter ;


	

	

