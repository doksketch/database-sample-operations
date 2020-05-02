use tourism;

-- Batch insert queries samples
insert into users_types values
	('1', 'customers'),
	('2', 'enterprises');
	
insert into customers (id, user_category_id, firstname, lastname, email, phone, password_hash, is_deleted) values 
	('21', '1', 'penelope', 'kreiger', 'dean.gerhold@example.org', '4', '9836504a445a7f5d246a2985ad8c800996bbc84a', 0),
	('22', '1', 'curt', 'weber', 'eliane.rempel@example.com', '445', '3f21a4a461cebb2881e276cb4d3e29cb76edd3d0', 0),
	('23', '1', 'amiya', 'hintz', 'po\'conner@example.org', '1', 'c1efe7a20807099773cfa64fb87e1bf007218369', 0),
	('24', '1', 'daniella', 'kuhlman', 'clifford.o\'conner@example.com', '3302324395', 'e274b3a22cd79ea06ed5f86f5fa9fc675e853818', 0),
	('25', '1', 'ettie', 'crooks', 'kaelyn.lehner@example.net', '799', '1db02b5475ec0a59300081ea0ace2a28ed65bb93', 0),
	('26', '1', 'meagan', 'krajcik', 'jeremy04@example.org', '0', 'f5ccf49a212cabfa8c2db82448827ed4ac6a0835', 0),
	('27', '1', 'tyreek', 'bailey', 'wschinner@example.org', '569534', '949a79796f91510a115aebd0408ace13f47244bc', 0),
	('28', '1', 'mariela', 'mcdermott', 'tate63@example.net', '95', 'fc6e2cc0a7fed59998fc0e5bc1f1ef4bcf6fd7b0', 0),
	('29', '1', 'kelley', 'conroy', 'barbara.bergstrom@example.org', '887841', '789aa85f6580c0e733b8640168c9912b7c4ec84a', 0),
	('32', '1', 'jack', 'jakubowski', 'mborer@example.com', '123079', '59d9580dbd40dde9e0fcc49aef288dd79ec13455', 0),
	('34', '1', 'marilou', 'monahan', 'rollin27@example.net', '302702', 'df1fce5ae8a18d7aa0899622dd74f88dd64acb52', 0),
	('37', '1', 'nathan', 'weissnat', 'mortiz@example.net', '9970511710', '2b6275eb6e989d59a5ca8358023aa0c4117311e4', 0),
	('38', '1', 'shawna', 'sauer', 'gladyce.heller@example.net', '6279042570', 'ffc2f702dc3ecde7f5a422145f18307c36978da1', 0),
	('39', '1', 'maybelle', 'bruen', 'halvorson.mafalda@example.com', '48', '1c40d82768a83c26f973da9ea9f1b6d68df6468b', 0),
	('40', '1', 'myah', 'o\'kon', 'johathan.schultz@example.org', '641', '1153d74a4f649c34a612da36bde7e440b7c6e251', 0);
	
insert into profiles (id, customer_id, gender, birthday, country, city, education, created_at, is_deleted) values 
	('1', '21', 'female', '2016-04-26', '66571', 'north mertie', '', '2004-04-30 17:18:44', 0),
	('2', '22', 'female', '2015-04-16', '71314223', 'east macy', '', '1996-09-22 21:30:26', 0),
	('3', '23', 'female', '1985-05-09', '32081528', 'lake kamrynfurt', '', '2002-05-05 15:50:22', 0),
	('4', '24', 'male', '1990-01-12', '4', 'emmyburgh', '', '2002-10-19 02:42:16', 0),
	('5', '25', 'male', '2003-09-23', '5041', 'kundeville', '', '1987-12-16 23:39:00', 0),
	('6', '26', 'male', '2019-01-07', '56907946', 'lake chelsey', '', '1974-01-08 03:59:36', 0),
	('7', '27', 'female', '2011-08-10', '', 'south jerad', '', '1985-06-18 13:18:54', 0),
	('8', '28', 'female', '2002-10-07', '9', 'erwinchester', '', '1995-04-13 20:11:52', 0),
	('9', '29', 'female', '2008-03-28', '900693', 'kiehnport', '', '2016-02-14 22:27:53', 0),
	('10', '32', 'male', '1994-02-06', '86964079', 'kenyaland', '', '1991-03-20 08:31:46', 0),
	('11', '34', 'female', '1996-04-12', '231', 'clarissaberg', '', '2014-02-09 04:18:29', 0),
	('12', '37', 'female', '1992-10-04', '18028588', 'justynland', '', '1991-10-19 15:42:54', 0),
	('13', '38', 'female', '2010-08-27', '34577657', 'alialand', '', '2019-09-09 14:14:23', 0),
	('14', '39', 'female', '2015-01-22', '55786412', 'schambergermouth', '', '1979-01-03 02:29:56', 0),
	('15', '40', 'female', '1980-05-21', '8131523', 'streichland', '', '1971-05-15 15:54:56', 0);
	
insert into enterprises_types (id, user_category_id, enterprise_category) values 
	('1', '2', 'museum'),
	('2', '2', 'theatre'),
	('3', '2', 'restaurant'),
	('4', '2', 'hotel'),
	('5', '2', 'cinema'),
	('6', '2', 'night club');

insert into enterprises_profiles (id, enterprise_category_id, official_name, brand_name, tax_id, registry_id, mailing_address, email, operation_country, operation_city, operation_street, operation_house_number, from_operation_hour, to_operation_hour, created_at, updated_at) values 
	('1', '3', 'ut', 'error', 1, 9186389, '', 'cremin.luigi@example.org', '258', 'south ubaldo', '', 3, '08:50:00', '21:50:00', '1992-12-24 15:29:43', '1982-12-07 23:54:34'),
	('2', '4', 'aliquam', 'dolores', 881010, 29, '', 'lysanne.gorczany@example.com', '687', 'port annie', '', 84, '06:00:00', '23:50:00', '2005-09-12 04:07:12', '2015-06-13 05:44:23'),
	('3', '3', 'dicta', 'sed', 0, 6042885, '', 'kamron.gleason@example.org', '15858774', 'mohrton', '', 42, '10:00:00', '23:00:00', '2007-04-30 01:24:35', '2003-03-30 06:28:21'),
	('4', '4', 'eaque', 'nisi', 969486563, 379613972, '', 'esperanza.lowe@example.org', '8', 'bradfort', '', 61, '05:00:00', '23:50:00', '2019-08-07 14:44:06', '2011-10-01 20:46:08'),
	('5', '4', 'nobis', 'et', 594933, 2833429, '', 'josiah59@example.net', '578553', 'port clemens', '', 0, '04:50:00', '23:50:00', '1972-01-24 11:00:01', '1977-10-13 03:06:35'),
	('6', '3', 'minima', 'cum', 90298348, 689, '', 'bret.jacobi@example.net', '17514791', 'nathenmouth', '', 0, '10:45:00', '23:50:00', '1974-05-18 02:20:20', '2014-12-23 22:26:17'),
	('7', '3', 'repellat', 'voluptatem', 951222399, 565, '', 'winfield.o\'conner@example.org', '177120', 'daughertystad', '', 91, '06:30:00', '22:50:00', '1997-09-16 01:37:51',  '1972-03-16 05:38:18'),
	('8', '3', 'dolorum', 'error', 913, 325, '', 'marshall26@example.net', '755952', 'ankundingland', '', 76, '10:00:00', '22:00:00', '2019-03-07 17:26:31', '2008-11-14 14:49:35'),
	('9', '3', 'a', 'dolorem', 51866, 2, '', 'olarson@example.net', '467313360', 'cathrineview', '', 36, '08:20:00', '21:50:00', '2019-08-12 06:50:36',  '2009-12-29 02:49:59'),
	('10', '4', 'iure', 'provident', 771, 35, '', 'tyrese.bednar@example.org', '4', 'south rachelburgh', '', 7, '02:00:00', '22:50:00', '2013-09-17 16:48:54', '2000-08-11 00:44:15');

insert into media (id, media_id, filename, description, photo_album, file_size, created_at, updated_at) values 
	('1', '3', 'explicabo', 'fugiat dolor nobis qui rerum illum expedita earum. libero rerum omnis quas aut hic quam praesentium. dolorum voluptatibus ratione sit animi quo. nostrum id vitae explicabo voluptate.', '', 0, '1986-04-15 22:12:50', '1993-04-06 02:56:27'),
	('2', '4', 'aut', 'quia maiores possimus quod explicabo. esse sint odio alias et ratione. cupiditate voluptatem veniam blanditiis ea.', '7', 536460525, '1977-07-20 04:53:33', '1984-03-27 02:19:30'),
	('3', '3', 'culpa', 'aut officiis iure consequuntur sint ut. suscipit possimus magnam enim consequatur saepe necessitatibus voluptatum aut. sed reprehenderit sed magnam similique qui consequatur. recusandae qui aliquam minus molestiae et.', '',  0, '1981-06-01 22:36:12', '1981-03-13 07:05:38'),
	('4', '4', 'aliquid', 'nostrum est vitae eum reprehenderit. perspiciatis iusto placeat magnam amet quia saepe. delectus sint esse rerum quod. ut quibusdam qui occaecati consequatur ut repellendus.', '',  0, '1991-10-25 08:07:08', '1977-08-04 07:57:52'),
	('5', '4', 'et', 'aut distinctio suscipit quaerat perferendis. magnam ut ab voluptas. impedit dolor architecto dolorem et aut. aut quas maiores qui laboriosam dicta.', '',  0, '2016-12-10 03:17:29', '1980-02-21 15:34:30'),
	('6', '3', 'dolor', 'consequatur fugit odio commodi earum dolore fuga. cumque aliquam sed corporis magnam beatae. velit voluptatum nihil vero. fuga consequatur voluptas dolores aliquid dolore laudantium sint dolorum.', '',  0, '2002-08-13 04:31:55', '2000-03-26 18:14:20'),
	('7', '3', 'dolorem', 'excepturi omnis delectus accusamus fugit. est voluptas accusamus similique reprehenderit facilis. laborum assumenda sunt molestiae omnis dolores ratione. repudiandae sequi non iste. quidem blanditiis non amet placeat.', '',  0, '1981-11-19 10:01:03', '1997-04-15 04:54:20'),
	('8', '3', 'et', 'voluptas voluptatibus et harum tempora corporis. rem ullam praesentium aperiam voluptatem ullam praesentium ex.', '',  0, '1981-09-07 11:13:08', '1988-11-09 04:37:06'),
	('9', '3', 'laboriosam', 'nesciunt sint repellendus inventore aut earum occaecati voluptas possimus. eius facere itaque veritatis sit qui dicta. temporibus error omnis est atque aliquid. non nostrum dolores provident aut et.', '',  0, '1980-12-04 16:41:22', '1986-10-07 11:28:25'),
	('10', '4', 'qui', 'debitis molestias at labore ea nihil qui. quas culpa et debitis aut atque. vitae dolor qui aut quisquam ad quia officiis qui.', '',  0, '2011-01-21 23:42:40', '1984-05-28 23:50:12');

insert into restaurants (id, restaurants_id, enterprise_profile_id, restaurants_media_id, average_check, restaurant_category, restaurant_feature) values 
	('29', '3', '1', '1', 1500, ('russian cuisine'), ('for business')),
	('30', '3', '3', '3', 2000, ('pizza'), ('for friends')),
	('31', '3', '6', '6', 700, ('cafe'), ('for friends')),
	('32', '3', '7', '7', 900, ('sushi,seafood'), ('romantic')),
	('33', '3', '8', '8', 1700, ('italian cuisine'), ('for families with childrens,romantic')),
	('34', '3', '9', '9', 3000, ('stake house'), ('picturistique view,for business'));

insert into hotels (id, hotels_id, hotels_media_id, enterprise_profile_id, parking, wifi, room_type, room_price, pets, hotel_services, hotel_safety, average_check) values 
	('15', '4', '2', '2', ('in stock,not free,guarded,covered'), ('in stock,not free'), '4 places', '7541.87', 1, ('luggage storage,laundry'), ('fire estinguishers,cctv'), 25000),
	('16', '4', '4', '4', ('in stock,free,not guarded,outdoors'), ('in stock,free'), '2 places', '5001.55', 1, ('luggage storage'), ('fire estinguishers,cctv'), 40000),
	('17', '4', '5', '5', ('in stock,free,guarded,covered'), ('in stock,free'), '4 places', '8000.30', 1, ('luggage storage,laundry'), ('fire estinguishers,cctv'), 55500),
	('18', '4', '10', '10', ('not in stock'), ('in stock,free'), '1 place', '1930.99', 1, null, ('fire estinguishers'), 5700);

insert into restaurants_bookings (id, customer_id, restaurant_profile_id, prepayment, booking_status, restaurant_booking_created_at, restaurant_booking_updated_at, restaurant_booking_closed_at) values 
	('1', '21', '29', null, 'in processing', '2011-05-25 21:30:39', '1984-01-16 05:33:34', '1993-04-08 12:20:29'),
	('2', '22', '30', null, 'prepayment received', '1997-01-25 16:40:13', '2007-04-11 02:47:57', '2013-03-18 19:20:19'),
	('3', '23', '31', null, 'regected', '1999-08-25 19:07:43', '1979-07-14 19:58:02', '1992-04-12 06:32:43'),
	('4', '24', '32', null, 'on position', '1994-11-19 03:59:29', '2013-09-02 09:07:55', '2012-04-01 18:14:03'),
	('5', '25', '33', null, 'prepayment received', '1996-01-13 05:06:46', '1970-07-26 18:44:19', '2006-01-18 06:41:40'),
	('6', '26', '34', null, 'regected', '1995-06-19 12:39:25', '2015-04-30 18:41:04', '2009-06-25 02:43:11'),
	('7', '27', '33', null, 'in processing', '1977-08-21 08:00:50', '1997-09-06 14:12:29', '1971-06-07 20:10:25'),
	('8', '28', '30', null, 'confirmed', '2013-08-08 07:16:50', '2019-08-04 09:59:50', '1987-07-12 12:52:09'),
	('9', '29', '29', null, 'prepayment received', '2019-07-04 14:41:38', '1980-04-01 12:10:00', '2014-04-16 19:20:31'),
	('10', '32', '29', null, 'on position', '2017-04-19 02:25:22', '2004-01-13 12:05:53', '2001-12-17 23:51:48'),
	('11', '34', '33', null, 'prepayment received', '2000-11-11 20:04:43', '1995-08-16 11:13:59', '2015-06-29 19:20:57'),
	('12', '37', '31', null, 'on position', '1986-03-03 22:48:51', '1983-08-31 08:40:00', '1986-05-13 02:13:35'),
	('13', '38', '31', null, 'prepayment received', '1976-07-04 17:06:13', '2003-08-09 14:16:28', '2003-11-09 21:14:35'),
	('14', '39', '32', null, 'prepayment received', '1995-02-07 05:03:21', '1993-01-05 18:19:02', '1975-04-27 03:47:43');

insert into hotels_bookings (id, customer_id, hotels_profile_id, prepayment, booking_status, hotel_booking_created_at, hotel_booking_updated_at, hotel_booking_closed_at) values 
	('1', '21', '15', null, 'on position', '2004-10-20 12:29:14', '2006-04-17 22:38:28', '1986-04-15 17:27:22'),
	('2', '22', '16', null, 'prepayment received', '2000-07-01 10:56:17', '1992-06-22 10:34:21', '2009-07-02 01:53:10'),
	('3', '23', '17', null, 'regected', '2011-09-16 00:54:43', '2009-11-27 01:22:06', '2003-12-14 19:27:20'),
	('4', '24', '18', null, 'closed', '1994-06-28 23:31:47', '2006-06-28 14:29:53', '2015-07-14 05:21:49'),
	('5', '25', '16', null, 'regected', '2017-08-22 20:54:07', '1996-02-10 17:19:28', '1976-12-23 19:42:44'),
	('6', '26', '17', null, 'closed', '2010-07-01 16:45:16', '2000-12-08 09:02:28', '1980-07-30 12:52:44');

insert into restaurants_payments (id, restaurants_bookings_id, bill, payment_status, restaurant_payment_created_at, restaurant_payment_updated_at) values 
	('1', '1', null, 'confirmed', '1991-04-12 04:00:51', '2014-06-22 06:24:05'),
	('2', '2', null, 'confirmed', '1974-06-14 13:48:19', '2013-10-24 08:32:54'),
	('3', '3', null, 'in processing', '1976-10-11 11:32:41', '2006-11-03 00:17:55'),
	('4', '4', null, 'regected', '1995-05-19 19:10:16', '2006-03-04 17:16:04'),
	('5', '5', null, 'regected', '2004-08-01 01:39:25', '2010-01-28 12:59:05'),
	('6', '6', null, 'regected', '1980-09-18 16:43:11', '1997-06-08 11:03:52'),
	('7', '7', null, 'in processing', '1978-06-01 02:04:19', '1997-07-29 23:40:35'),
	('8', '8', null, 'regected', '2018-06-29 21:23:50', '2016-03-19 23:50:50'),
	('9', '9', null, 'confirmed', '1972-07-19 02:10:09', '2014-04-06 23:00:35'),
	('10', '10', null, 'regected', '2015-10-13 08:41:14', '2002-09-24 06:45:18'),
	('11', '11', null, 'confirmed', '2012-02-15 11:17:57', '2013-03-23 18:06:33'),
	('12', '12', null, 'confirmed', '1993-01-19 20:40:49', '1973-12-10 04:55:13'),
	('13', '13', null, 'in processing', '2007-09-25 17:56:43', '2016-12-07 18:49:48'),
	('14', '14', null, 'confirmed', '2000-03-02 03:28:45', '1980-10-14 15:37:12');

insert into hotels_payments (id, hotels_bookings_id, bill, payment_status, hotel_payment_created_at, hotel_payment_updated_at) values 
	('35', '1', null, 'regected', '2002-07-24 15:15:01', '2016-07-04 20:01:40'),
	('36', '2', null, 'in processing', '2003-11-28 13:48:31', '1991-11-30 14:23:57'),
	('37', '3', null, 'confirmed', '2002-03-30 15:01:36', '1992-09-11 23:01:51'),
	('38', '4', null, 'confirmed', '1997-07-16 15:02:23', '1980-03-26 20:31:40'),
	('39', '5', null, 'regected', '1996-09-30 11:35:06', '1985-04-12 01:41:55'),
	('40', '6', null, 'in processing', '1975-11-11 07:25:16', '1990-03-26 08:02:39');

insert into restaurants_cashback (id, restaurants_payment_id, restaurants_cashback, total_restaurant_cashback, created_at) values 
	('41', '1', '0.15', null, '2018-10-11 20:14:19'),
	('42', '2', '0.15', null, '2014-02-05 01:49:44'),
	('43', '3', '0.15', null, '1975-11-24 10:27:54'),
	('44', '4', '0.15', null, '1982-01-27 18:45:31'),
	('45', '5', '0.15', null, '2019-12-31 02:22:10'),
	('46', '6', '0.15', null, '1997-02-09 03:04:57'),
	('47', '7', '0.15', null, '2011-07-13 04:47:58'),
	('48', '8', '0.15', null, '1983-12-08 07:49:09'),
	('49', '9', '0.15', null, '2006-08-13 13:46:59'),
	('50', '10', '0.15', null, '1979-10-30 12:28:32'),
	('51', '11', '0.15', null, '1986-05-26 22:28:00'),
	('52', '12', '0.15', null, '1987-04-10 08:13:52'),
	('53', '13', '0.15', null, '2014-11-09 12:34:03'),
	('54', '14', '0.15', null, '1986-08-27 21:05:21');

insert into hotels_cashback (id, hotels_payment_id, hotels_cashback, total_hotel_cashback, created_at) values 
	('51', '35', '0.15', null, '2013-04-06 22:14:43'),
	('52', '36', '0.15', null, '1974-08-01 07:54:24'),
	('53', '37', '0.15', null, '1998-04-21 06:19:32'),
	('54', '38', '0.15', null, '1995-11-19 02:31:06'),
	('55', '39', '0.15', null, '2001-05-07 06:13:05'),
	('56', '40', '0.15', null, '1994-11-16 05:45:52');

insert into restaurants_billings (id, restaurants_cashback_id, total_bill, is_paid, created_at, closed_at) values 
	('1', '41', null, 0, '2020-01-06 22:10:33', '2020-01-06 22:10:33'),
	('2', '42', null, 0, '2020-02-25 22:06:40', '2020-02-25 22:06:40'),
	('3', '43', null, 0, '2020-03-21 20:35:59', '2020-03-21 20:35:59'),
	('4', '44', null, 0, '2020-02-02 11:34:15', '2020-02-02 11:34:15'),
	('5', '45', null, 0, '2020-02-13 08:30:34', '2020-02-13 08:30:34'),
	('6', '46', null, 0, '2020-04-02 08:48:30', '2020-04-02 08:48:30'),
	('7', '47', null, 0, '2020-02-04 15:01:43', '2020-02-04 15:01:43'),
	('8', '48', null, 0, '2020-03-16 07:53:13', '2020-03-16 07:53:13'),
	('9', '49', null, 0, '2020-03-23 04:36:46', '2020-03-23 04:36:46'),
	('10', '50', null, 0, '2020-02-10 06:54:24', '2020-02-10 06:54:24'),
	('11', '51', null, 0, '2020-01-09 04:01:51', '2020-01-09 04:01:51'),
	('12', '52', null, 0, '2020-04-01 08:41:27', '2020-04-01 08:41:27'),
	('13', '53', null, 0, '2020-02-24 07:14:38', '2020-02-24 07:14:38'),
	('14', '54', null, 0, '2020-03-05 18:01:07', '2020-03-05 18:01:07');

insert into hotels_billings (id, hotels_cashback_id, total_bill, is_paid, created_at, closed_at) values 
	('1', '51', null, 0, '2020-03-26 03:59:52', '2020-03-26 03:59:52'),
	('2', '52', null, 0, '2020-03-04 00:54:30', '2020-03-26 03:59:52'),
	('3', '53', null, 0, '2020-04-12 06:37:25', '2020-04-12 06:37:25'),
	('4', '54', null, 0, '2020-02-19 21:26:59', '2020-02-19 21:26:59'),
	('5', '55', null, 0, '2020-02-05 01:22:28', '2020-02-05 01:22:28'),
	('6', '56', null, 0, '2020-01-27 04:51:29', '2020-01-27 04:51:29');


