drop database if exists puncys_store;
create database puncys_store;
use puncys_store;

drop table if exists users;
drop table if exists logins;
drop table if exists orders;
drop table if exists measurements;
drop table if exists job_presets;
drop table if exists appointments;
drop table if exists bills;

create table users
(
    user_id int not null unique AUTO_INCREMENT,
    first_name varchar(15) not null,
    last_name varchar(15) not null,
    tele_num varchar (15) unique,
    home_address varchar (50),
    email varchar (45) not null unique,
    dob Date not null,
    profile_pic_address varchar(50),
	clearance int not null,
    primary key (user_id)
);

create table logins
(
    user_id int not null unique, 
    email varchar(45) not null UNIQUE,
    password_hash varchar(65) not null,
    salt int not null,
    primary key (user_id, email)
);

create table orders
(
    order_id int not null unique AUTO_INCREMENT,
    user_id int not null,
    first_name varchar (15) not null,
    last_name varchar (15) not null,
    state varchar(10) not null,
    contact_num varchar(10),
    delivery_address varchar(50),
    type varchar(12) not null,
    measurements_id int,
    media_addr varchar(40),
    date_placed Date,
    due_date Date,
    est_cost NUMERIC,
    providing_fabric boolean not null,
    primary key (order_id)
);
 
create table job_presets
(
    preset_id int not null AUTO_INCREMENT,
    type varchar(12) unique not null,
    garment_price numeric not null,    
    media_address varchar(45),
    primary key (preset_id)
);

create table measurements
(
    measurement_id int not null AUTO_INCREMENT,
    user_id int not null,
    job_type varchar (10) not null,
    name varchar(20) not null,
    leng int,
    waist int,
    hip int,
    ankle int,
    round_leg int,
    bust int, 
    sleeve int,
    bicep int,
    armhole int,
    neck int,
    shoulder int,
    across_back int,
    bust_point int,
    round_knee int,
    primary key (measurement_id)
);

create table appointments (
    user_id int not null,
    app_date date not null,  
    app_time time not null,
    primary key (app_date, app_time)
);

create table bills
(
    bill_id int not null AUTO_INCREMENT,
    user_id int not null,
    order_id int not null,
    job_type varchar(12), 
    fabric_cost numeric not null,
    labour_cost numeric not null,
    total_cost numeric not null,
    date_completed Date not null,
    primary key (bill_id)
);

insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance) values (0, "PUNCY", "ADMIN", "N/A", "87688888888", "puncysstoreadmin@gmail.com", 1);
insert into logins (user_id, email, password_hash, salt) values (1, "puncysstoreadmin@gmail.com", '321d50fbd86dcbad1a0990e7c5974b3d573bd0f1d5208e24aa1007d7461e7869', 1234);
insert into measurements (user_id, name) values (0, "Appt. Needed.");

insert into job_presets (type, garment_price) values ("dummy", 0);
insert into job_presets (type, garment_price, media_address) values ("Shirt-XS", 2500, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Shirt-S", 2750,"n/a");
insert into job_presets (type, garment_price, media_address) values ("Shirt-M", 3000, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Shirt-L", 3250,"n/a");
insert into job_presets (type, garment_price, media_address) values ("Shirt-XL", 3500, "n/a");

insert into job_presets (type, garment_price, media_address) values ("Shorts-XS", 2500, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Shorts-S", 2750, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Shorts-M", 3000, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Shorts-L", 3250, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Shorts-XL", 3500, "n/a");

insert into job_presets (type, garment_price, media_address) values ("Pants-XS", 2500, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Pants-S", 2750, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Pants-M", 3000, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Pants-L", 3250, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Pants-XL", 3500, "n/a");

insert into job_presets (type, garment_price, media_address) values ("Skirt-XS", 2500, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Skirt-S", 2750, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Skirt-M", 3000, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Skirt-L", 3250, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Skirt-XL", 3500, "n/a");

insert into job_presets (type, garment_price, media_address) values ("Blouse-XS", 2500, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Blouse-S", 2750, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Blouse-M", 3000, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Blouse-L", 3250, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Blouse-XL", 3500, "n/a");

insert into measurements (user_id, job_type, name, leng, waist, hip, bust, sleeve, bicep, armhole, neck, shoulder, across_back, bust_point) values (0, "Shirt-XS", "Default", 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
insert into measurements (user_id, job_type, name, leng, waist, hip, bust, sleeve, bicep, armhole, neck, shoulder, across_back, bust_point) values (0, "Shirt-S", "Default", 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
insert into measurements (user_id, job_type, name, leng, waist, hip, bust, sleeve, bicep, armhole, neck, shoulder, across_back, bust_point) values (0, "Shirt-M", "Default", 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
insert into measurements (user_id, job_type, name, leng, waist, hip, bust, sleeve, bicep, armhole, neck, shoulder, across_back, bust_point) values (0, "Shirt-L", "Default", 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
insert into measurements (user_id, job_type, name, leng, waist, hip, bust, sleeve, bicep, armhole, neck, shoulder, across_back, bust_point) values (0, "Shirt-XL", "Default", 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

insert into measurements (user_id, job_type, name, leng, waist, hip, round_knee, round_leg) values (0, "Shorts-XS", "Default", 1, 1, 1, 1, 1);
insert into measurements (user_id, job_type, name, leng, waist, hip, round_knee, round_leg) values (0, "Shorts-S", "Default", 1, 1, 1, 1, 1);
insert into measurements (user_id, job_type, name, leng, waist, hip, round_knee, round_leg) values (0, "Shorts-M", "Default", 1, 1, 1, 1, 1);
insert into measurements (user_id, job_type, name, leng, waist, hip, round_knee, round_leg) values (0, "Shorts-L", "Default", 1, 1, 1, 1, 1);
insert into measurements (user_id, job_type, name, leng, waist, hip, round_knee, round_leg) values (0, "Shorts-XL", "Default", 1, 1, 1, 1, 1);

insert into measurements (user_id, job_type, name, leng, waist, hip, round_knee, ankle, round_leg) values (0, "Pants-XS", "Default", 1, 1, 1, 1, 1, 1);
insert into measurements (user_id, job_type, name, leng, waist, hip, round_knee, ankle, round_leg) values (0, "Pants-S", "Default", 1, 1, 1, 1, 1, 1);
insert into measurements (user_id, job_type, name, leng, waist, hip, round_knee, ankle, round_leg) values (0, "Pants-M", "Default", 1, 1, 1, 1, 1, 1);
insert into measurements (user_id, job_type, name, leng, waist, hip, round_knee, ankle, round_leg) values (0, "Pants-L", "Default", 1, 1, 1, 1, 1, 1);
insert into measurements (user_id, job_type, name, leng, waist, hip, round_knee, ankle, round_leg) values (0, "Pants-XL", "Default", 1, 1, 1, 1, 1, 1);

insert into measurements (user_id, job_type, name, leng, waist, hip) values (0, "Skirt-XS", "Default", 1, 1, 1);
insert into measurements (user_id, job_type, name, leng, waist, hip) values (0, "Skirt-S", "Default", 1, 1, 1);
insert into measurements (user_id, job_type, name, leng, waist, hip) values (0, "Skirt-M", "Default", 1, 1, 1);
insert into measurements (user_id, job_type, name, leng, waist, hip) values (0, "Skirt-L", "Default", 1, 1, 1);
insert into measurements (user_id, job_type, name, leng, waist, hip) values (0, "Skirt-XL", "Default", 1, 1, 1);

insert into measurements (user_id, job_type, name, leng, waist, hip, bust, sleeve, bicep, armhole, neck, shoulder, across_back, bust_point) values (0, "Blouse-XS", "Default", 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
insert into measurements (user_id, job_type, name, leng, waist, hip, bust, sleeve, bicep, armhole, neck, shoulder, across_back, bust_point) values (0, "Blouse-S", "Default", 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
insert into measurements (user_id, job_type, name, leng, waist, hip, bust, sleeve, bicep, armhole, neck, shoulder, across_back, bust_point) values (0, "Blouse-M", "Default", 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
insert into measurements (user_id, job_type, name, leng, waist, hip, bust, sleeve, bicep, armhole, neck, shoulder, across_back, bust_point) values (0, "Blouse-L", "Default", 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
insert into measurements (user_id, job_type, name, leng, waist, hip, bust, sleeve, bicep, armhole, neck, shoulder, across_back, bust_point) values (0, "Blouse-XL", "Default", 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

