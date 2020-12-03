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
    job_type_id int not null, 
    fabric_cost numeric not null,
    labour_cost numeric not null,
    date_completed Date not null,
    primary key (bill_id)
);

insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance) values (0, "PUNCY", "ADMIN", "N/A", "87688888888", "puncysstoreadmin@gmail.com", 1);
insert into logins (user_id, email, password_hash, salt) values (0, "puncysstoreadmin@gmail.com", '321d50fbd86dcbad1a0990e7c5974b3d573bd0f1d5208e24aa1007d7461e7869', 1234);
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

insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("REID", "MEYERS", "140 MCLEAN ROND-POINT", "8766106442", "reid.meyers@yahoo.com", 2, "1985/11/24");
insert into logins (user_id, email, password_hash, salt) values (1, "reid.meyers@yahoo.com", "1645954ee5a4a159719281b2d7b045a2e24ef898440ec9cd3215f2dbdc6e6ad0", 9298);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("FOSTER", "VILLARREAL", "366 HARDING HEATH", "8761077593", "foster.villarreal@hotmail.com", 2, "1989/5/3");
insert into logins (user_id, email, password_hash, salt) values (2, "foster.villarreal@hotmail.com", "8104881e8e690dc2bd4ba8348a05cf5ae8f678dec5685a9a282478dd6081f7d8", 2747);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("ALI", "HUTCHINSON", "361 ENGLISH MOOR", "8761879383", "ali.hutchinson@proton-mail.com", 2, "1988/7/13");
insert into logins (user_id, email, password_hash, salt) values (3, "ali.hutchinson@proton-mail.com", "2ff767f5379d12228aa78dde8a2773b64987ce4701cc24f351a12a0b338cc6a4", 1009);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("YAMILETH", "LITTLE", "62 COLLIER GLENWAY", "8768113056", "yamileth.little@organization.business.com", 2, "1964/11/17");
insert into logins (user_id, email, password_hash, salt) values (4, "yamileth.little@organization.business.com", "d23c5d2511c6957bc3d3261bd6697f888a31e48bc8489d4a36d07d6864e06cea", 9747);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("ANTOINETTE", "TAPIA", "387 NICHOLSON PARKWAY", "8769667218", "antoinette.tapia@parliament.gov.jm", 2, "1967/11/13");
insert into logins (user_id, email, password_hash, salt) values (5, "antoinette.tapia@parliament.gov.jm", "d67a29e90d0663129d978f177f6909aa73549b49070c4ca6f806027dedbdece9", 2296);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("MYLAH", "BENTLEY", "161 CLAY CLIFFS", "8768528465", "mylah.bentley@yahoo.com", 2, "1984/4/2");
insert into logins (user_id, email, password_hash, salt) values (6, "mylah.bentley@yahoo.com", "feaecbae793a8b5d0178e9780b8d4b3466fad136e41281c676a01f63e289f484", 7851);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("RILEY", "PAUL", "440 BUCKLEY STREET", "8766917813", "riley.paul@yahoo.com", 2, "1971/2/23");
insert into logins (user_id, email, password_hash, salt) values (7, "riley.paul@yahoo.com", "83cd2118324a25d694e3092bbaffcbcf755e0b5dfea7359e6351ee7e0b719411", 5373);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("BRAYDON", "SUMMERS", "473 HURLEY KEEP", "8764849689", "braydon.summers@school.address.edu", 2, "1969/6/21");
insert into logins (user_id, email, password_hash, salt) values (8, "braydon.summers@school.address.edu", "02ff82af52b8f89f1714ad3c36539f71ea1179f74074e6b3f71423a59659a8b5", 1653);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("BRAIN", "WRIGHT", "460 MIDDLETON TRAIL", "8762207696", "brain.wright@high_comiision.gov.uk", 2, "1995/2/25");
insert into logins (user_id, email, password_hash, salt) values (9, "brain.wright@high_comiision.gov.uk", "77c768c39be3967859bb513a945c549fd76d6f68a94fdb1d510462c445fb979c", 8966);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("AMELIA", "MAXWELL", "222 ARROYO BLUFF", "8767449557", "amelia.maxwell@yahoo.com", 2, "1988/12/15");
insert into logins (user_id, email, password_hash, salt) values (10, "amelia.maxwell@yahoo.com", "ff9374ecfb31b480fa58f3c9bd12fe186b3934dad054b64334e70e9161167a11", 7701);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("CELIA", "ALEXANDER", "9 BARAJAS MOUNTAIN", "8765093848", "celia.alexander@team.group.com", 2, "1966/9/15");
insert into logins (user_id, email, password_hash, salt) values (11, "celia.alexander@team.group.com", "bef0f5e6fddb71b0583fac5ba306c6eaaab4103a7042f42a67503d218b13d731", 6998);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("BRIGGS", "STEWART", "329 SPENCE INLET", "8765182610", "briggs.stewart@outlook.com", 2, "1988/8/15");
insert into logins (user_id, email, password_hash, salt) values (12, "briggs.stewart@outlook.com", "fa3bdd48c1de506e9c439ac853213d1bd97d53ae5f77bbb08dfcfd77b9d50d59", 723);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("BRIANNA", "STANLEY", "163 GATES BRIDGE", "8765151018", "brianna.stanley@church.religion.com", 2, "1974/7/15");
insert into logins (user_id, email, password_hash, salt) values (13, "brianna.stanley@church.religion.com", "2594fab607538bef33032c76b3e16dce9daccbe034514a9360e4efc6c12bc6fa", 9345);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("NIXON", "ARROYO", "307 MEZA FALL", "8769201328", "nixon.arroyo@proton-mail.com", 2, "1966/10/12");
insert into logins (user_id, email, password_hash, salt) values (14, "nixon.arroyo@proton-mail.com", "65d8da1a3bb4922384ed6bfd64d56a5206823e482600e6163115ea187028256c", 3530);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("HOMER", "HODGE", "202 TRAVIS SHOAL", "8766286775", "homer.hodge@gmail.com", 2, "1970/10/5");
insert into logins (user_id, email, password_hash, salt) values (15, "homer.hodge@gmail.com", "c4f4ada623ca5e2d562bda662050559806c62294ef3ffa6801182c48937f6ff2", 5622);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("IVAN", "SOLOMON", "392 MOLINA IMPASSE", "8762429349", "ivan.solomon@gmail.com", 2, "1979/11/21");
insert into logins (user_id, email, password_hash, salt) values (16, "ivan.solomon@gmail.com", "35b29a310a374d9400998c94420768426e5da88709ceb62b1e94ec19c13488ba", 2627);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("DENISE", "CONNER", "108 MCCLURE PARADE", "8766065837", "denise.conner@parliament.gov.jm", 2, "1964/1/10");
insert into logins (user_id, email, password_hash, salt) values (17, "denise.conner@parliament.gov.jm", "2b95ae7d289cee9ae66654955b453178400874a69c84603715b712ca01553c98", 3828);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("FINLEY", "PRINCE", "179 WANG RUN", "8760171032", "finley.prince@school.address.edu", 2, "1991/12/4");
insert into logins (user_id, email, password_hash, salt) values (18, "finley.prince@school.address.edu", "cf56a4ad39985464df970fb61a46509f5d41c7b9e024c531fb14104c66ff087d", 847);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("REMY", "CORDOVA", "105 MCKAY WAY", "8766973414", "remy.cordova@hotmail.com", 2, "1976/11/27");
insert into logins (user_id, email, password_hash, salt) values (19, "remy.cordova@hotmail.com", "b82f0e2024d334f4ef6326b88cef3a3d25d198c7af25b418202e153229718db6", 9847);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("EMILY", "LOPEZ", "283 AYERS ABBEY", "8761671021", "emily.lopez@gmail.com", 2, "1978/12/12");
insert into logins (user_id, email, password_hash, salt) values (20, "emily.lopez@gmail.com", "e7e40e6585434b9897b8926d154de2302965a0d7ae12ad95e7a1b1e1dfdfb35c", 2);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("LEANDRO", "FRENCH", "61 VAZQUEZ EXTENSION", "8762629705", "leandro.french@company.mail.com", 2, "1973/12/9");
insert into logins (user_id, email, password_hash, salt) values (21, "leandro.french@company.mail.com", "a06540a8f7bed90c55f1a90392a0788abcc519c05048107c93d6218af68f002c", 5041);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("THERESE", "CHAPMAN", "310 CLAYTON NOT", "8764686455", "therese.chapman@de.trash.co", 2, "2001/6/16");
insert into logins (user_id, email, password_hash, salt) values (22, "therese.chapman@de.trash.co", "882485938826993031d5c4f8b395ad539835cd01dbceb080a1dd458171d9d5fa", 9038);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("LAILA", "MICHAEL", "243 MCCALL MILL", "8763559146", "laila.michael@hotmail.com", 2, "1972/4/23");
insert into logins (user_id, email, password_hash, salt) values (23, "laila.michael@hotmail.com", "3c0b54754ea9bef771552c620b49c1a3ceeb84c061c56d2f1e2bd238009f1bb3", 7872);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("ARIAN", "JAMES", "394 DODSON EXTENSION", "8761401839", "arian.james@high_comiision.gov.uk", 2, "1974/9/7");
insert into logins (user_id, email, password_hash, salt) values (24, "arian.james@high_comiision.gov.uk", "c0a3edee7a847ba57c79f51eafe8d745fb23cf225a72ab1a17f0ab1b31f6e9ed", 6557);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("GABRIELLA", "GILLESPIE", "81 SHAH PINE", "8764264345", "gabriella.gillespie@outlook.com", 2, "1999/12/26");
insert into logins (user_id, email, password_hash, salt) values (25, "gabriella.gillespie@outlook.com", "6b52be9d8da811ee23827d5cd2f1a5201f65ca9a8287fdb43479218bb453f215", 3123);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("JAVON", "MONTGOMERY", "478 BARRON VILLAGE", "8765852675", "javon.montgomery@high_comiision.gov.uk", 2, "1989/7/20");
insert into logins (user_id, email, password_hash, salt) values (26, "javon.montgomery@high_comiision.gov.uk", "7d771904e193d87192b5bbd83690db27f09f3dc02bbad4cd307c079bd4e4785a", 3868);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("MARCOS", "FRANK", "10 BRUCE ROW", "8769176226", "marcos.frank@gmail.com", 2, "1978/6/28");
insert into logins (user_id, email, password_hash, salt) values (27, "marcos.frank@gmail.com", "0a063060231f7b84a884c3dbbea239ce85a95cd0b624907d251422f671b77e4f", 4767);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("JAYNE", "FARLEY", "361 HENSLEY RANGEE", "8764440446", "jayne.farley@outlook.com", 2, "1983/12/3");
insert into logins (user_id, email, password_hash, salt) values (28, "jayne.farley@outlook.com", "d11a597f6b9887ff825d39a55e34a65af50f95c947ef85d6f0d25dfc8476596f", 1048);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("SHMUEL", "NORRIS", "490 FOLEY LINE", "8763934497", "shmuel.norris@canadia.gov.ca", 2, "1984/2/8");
insert into logins (user_id, email, password_hash, salt) values (29, "shmuel.norris@canadia.gov.ca", "b3b4cb35ba69691635a4e6a590e56165fe6385548ab14cfc975565e31cbe7a0d", 2558);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("ROBERTO", "FLORES", "33 MARSH PRAIRIE", "8761654063", "roberto.flores@school.address.edu", 2, "1977/9/18");
insert into logins (user_id, email, password_hash, salt) values (30, "roberto.flores@school.address.edu", "5e4030878f0b6f5d04921c52602246eace380e33a548aab64e193d226c4baab9", 6674);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("CLAUDE", "RIVAS", "136 EIGTH COVE", "8763955738", "claude.rivas@live.com", 2, "1973/7/5");
insert into logins (user_id, email, password_hash, salt) values (31, "claude.rivas@live.com", "7c0559b69cacb5377b7663c4f2551b70b209eca58087a3e097049e6c1f6b3f75", 8864);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("KIM", "BUSH", "269 DAUGHERTY GATEWAY", "8760970868", "kim.bush@parliament.gov.jm", 2, "1984/1/2");
insert into logins (user_id, email, password_hash, salt) values (32, "kim.bush@parliament.gov.jm", "e5e16f2df40e57d209e6c76ff987df162c456fc695a57b5c1347536e35080eb6", 9801);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("GUILLERMO", "CLAYTON", "416 BERNAL RUN", "8764375945", "guillermo.clayton@company.mail.com", 2, "1975/10/17");
insert into logins (user_id, email, password_hash, salt) values (33, "guillermo.clayton@company.mail.com", "6fe080d1f9a25af48c550973962d31f7e25f94ce9a4c203fdff900da5b787726", 6078);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("ZECHARIAH", "PACHECO", "153 SOLIS OVERPASS", "8760166931", "zechariah.pacheco@de.trash.co", 2, "1976/7/9");
insert into logins (user_id, email, password_hash, salt) values (34, "zechariah.pacheco@de.trash.co", "08d16f2629e62a9f990ae3266e73944735ea290937cf9091b1bfb4cd6b8f188c", 7437);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("DOMINGO", "MORTON", "222 HOOD TRAIL", "8767976824", "domingo.morton@hotmail.com", 2, "1985/8/26");
insert into logins (user_id, email, password_hash, salt) values (35, "domingo.morton@hotmail.com", "a9e5fc8192b435623480b06a93d6b610765bd3afcdfaed02cae6b8dc76adf99b", 4970);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("JANINE", "ARMSTRONG", "487 SAVAGE CAUSEWAY", "8761120842", "janine.armstrong@company.mail.com", 2, "1971/5/26");
insert into logins (user_id, email, password_hash, salt) values (36, "janine.armstrong@company.mail.com", "755c61ff8b711c0e71645c339b385a941cedabca5813f2adcb3ab436eb722201", 7136);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("CHARLEY", "SCHMIDT", "79 TREVINO TURNABOUT", "8768678372", "charley.schmidt@canadia.gov.ca", 2, "1960/4/2");
insert into logins (user_id, email, password_hash, salt) values (37, "charley.schmidt@canadia.gov.ca", "c78a33947116720a9d093562eb64e31ec89768725a026172812afe805d3dc3bb", 2917);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("MERCY", "DIAZ", "364 LOWERY FORK", "8769128324", "mercy.diaz@yahoo.com", 2, "1964/7/19");
insert into logins (user_id, email, password_hash, salt) values (38, "mercy.diaz@yahoo.com", "2df7433c0c4f08614700d8a3a1dbb67c6ff6a12966f8a1e5639bc3c32571d066", 4171);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("AMIA", "WELCH", "457 GUEVARA CHARE", "8761466193", "amia.welch@live.com", 2, "1972/11/18");
insert into logins (user_id, email, password_hash, salt) values (39, "amia.welch@live.com", "83b223e8a1c3e4723e12e00bcdcfe0c18d36060ee66af38ccadfdd7eeec399a5", 7595);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("AUBRIELLA", "PAGE", "239 ROBLES PLACEWAY", "8765518509", "aubriella.page@riot.games.co", 2, "1982/10/19");
insert into logins (user_id, email, password_hash, salt) values (40, "aubriella.page@riot.games.co", "320f176571aba3b9683fdeaf9ae986b75823b0b03b003b6d449036dd93aac882", 6445);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("SAUL", "PINEDA", "417 GRIMES LODGE", "8767899498", "saul.pineda@organization.business.com", 2, "1964/7/1");
insert into logins (user_id, email, password_hash, salt) values (41, "saul.pineda@organization.business.com", "41de4aaf7f481c052fb2d69d8eb1cea9754aa80fbea1e19fe9b57465cf5f7b15", 1395);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("MINA", "GOOD", "428 EATON GREEN", "8765334574", "mina.good@canadia.gov.ca", 2, "1986/6/1");
insert into logins (user_id, email, password_hash, salt) values (42, "mina.good@canadia.gov.ca", "474765dcdd459fac0aae890fb0866e3d88e46352191c1cec14ae885eaba6615e", 3258);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("CATALEYA", "LE", "53 LUGO SENTIER", "8767639358", "cataleya.le@de.trash.co", 2, "1968/6/10");
insert into logins (user_id, email, password_hash, salt) values (43, "cataleya.le@de.trash.co", "c8af2f8ece702ddcbf0bdcbadb6c17101085f3ebf0298a0ca3822737a1afe17e", 3494);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("EVANGELINE", "GALLEGOS", "411 DICKSON ISLE", "8769882102", "evangeline.gallegos@team.group.com", 2, "1984/10/20");
insert into logins (user_id, email, password_hash, salt) values (44, "evangeline.gallegos@team.group.com", "3a27f92c166bfa4e45eb352f902f97a9584fcfe405484f77ec73fca4fcbbdbda", 118);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("MORGAN", "ATKINSON", "458 HULL REST", "8767293803", "morgan.atkinson@live.com", 2, "1989/9/5");
insert into logins (user_id, email, password_hash, salt) values (45, "morgan.atkinson@live.com", "51682c1defb8943c5d26250b2cf5f5c259f5b2dce04702866d18973c8fa19e74", 1911);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("IVANNA", "SOSA", "77 ZHANG CRESCENT", "8762444875", "ivanna.sosa@de.trash.co", 2, "1966/8/27");
insert into logins (user_id, email, password_hash, salt) values (46, "ivanna.sosa@de.trash.co", "b1bc5e70a34378a65198768454467963ff4355da8b953b39e03a35601b0a6da5", 406);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("ZACHERY", "MOSLEY", "136 PROCTOR RANGE", "8763814196", "zachery.mosley@parliament.gov.jm", 2, "2000/3/11");
insert into logins (user_id, email, password_hash, salt) values (47, "zachery.mosley@parliament.gov.jm", "fe1da5b5b5907c16327f4131d391de505cbe91a78b72aad8ea48abda3933a5d6", 8141);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("ROBBIE", "STANLEY", "245 CORONA TUNNEL", "8766415814", "robbie.stanley@gmail.com", 2, "1986/11/21");
insert into logins (user_id, email, password_hash, salt) values (48, "robbie.stanley@gmail.com", "f1aa03777e52a2b1be8a803f195307382b6f35ec2257374550404957f00adead", 9248);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("BRADLEY", "CARRILLO", "266 NOLAN LINE", "8762390695", "bradley.carrillo@live.com", 2, "1997/12/3");
insert into logins (user_id, email, password_hash, salt) values (49, "bradley.carrillo@live.com", "e43940bcb4213edb2b8f67bcf501ec8e29cc0148d746e8e983c24f887ce7ebc4", 929);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("DARIN", "WILKERSON", "350 HEATH RADIAL", "8761961638", "darin.wilkerson@canadia.gov.ca", 2, "1975/12/20");
insert into logins (user_id, email, password_hash, salt) values (50, "darin.wilkerson@canadia.gov.ca", "387d6543087aab28694190993b3564704a43583e20fb8a5ee92a542ff29c38c6", 4120);
