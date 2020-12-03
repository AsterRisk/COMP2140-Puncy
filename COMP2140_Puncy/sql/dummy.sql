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

insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("CRYSTAL", "LYNN", "80 CLEMENTS LIGNE", "8769197668", "crystal.lynn@live.com", 2, "1981/10/18");
insert into logins (user_id, email, password_hash, salt) values (1, "crystal.lynn@live.com", "6c12ba1edc1f38798af538385664ddf66ab2b3bee552a3b3895eb419daffdc6d", 3135);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("ALARIC", "NOVAK", "52 VANCE FARM", "8765718720", "alaric.novak@company.mail.com", 2, "1965/1/20");
insert into logins (user_id, email, password_hash, salt) values (2, "alaric.novak@company.mail.com", "11dcd0ac6a3bf5a5dc84b508ca9f620e6a5a9620fce8e2120b8de4022c4e73d8", 6307);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("ANNA", "GARCIA", "457 CHANG TAILER", "8762456099", "anna.garcia@outlook.com", 2, "1976/12/6");
insert into logins (user_id, email, password_hash, salt) values (3, "anna.garcia@outlook.com", "a8502b3c5e73a5f7fe5b7342f97ec2728b613169a8bb4e0491ff1f5f795ce9ca", 9947);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("MAXIMUS", "HAYDEN", "167 HOWE CRESCENT", "8764718851", "maximus.hayden@de.trash.co", 2, "1983/2/26");
insert into logins (user_id, email, password_hash, salt) values (4, "maximus.hayden@de.trash.co", "aa7d66e88c5485c448bcee57ddd7738d49d4717181552dd5951320e1c34a2dfb", 3834);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("FIONA", "UNDERWOOD", "273 MELENDEZ ISLAND", "8767513340", "fiona.underwood@hotmail.com", 2, "1962/2/3");
insert into logins (user_id, email, password_hash, salt) values (5, "fiona.underwood@hotmail.com", "3cabf362ba3079e253bbd07deb63cd460dc8d4de52084072247596df0d4234dc", 8805);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("ANNABEL", "CASTRO", "128 BARR STREAM", "8762198577", "annabel.castro@de.trash.co", 2, "1984/5/25");
insert into logins (user_id, email, password_hash, salt) values (6, "annabel.castro@de.trash.co", "c12d03dcedbcbd281de55c7d2ca121209227134b78acb6c5e606ede0a419de11", 1728);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("ANGEL", "DODSON", "332 LYNN CASTLE", "8768484839", "angel.dodson@organization.business.com", 2, "1979/10/1");
insert into logins (user_id, email, password_hash, salt) values (7, "angel.dodson@organization.business.com", "0e0dbfcb332eba9a14c59f63d3f1caa1b6a9401f81ed4be1341ea9155691c0ed", 3476);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("SHANA", "BENJAMIN", "109 RANGEL MOTORWAY", "8763756257", "shana.benjamin@live.com", 2, "1963/6/21");
insert into logins (user_id, email, password_hash, salt) values (8, "shana.benjamin@live.com", "71d76b40cc637c40c2c1a23056964b49607aa2c8bffade48a016946f657ef7b7", 4698);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("CONRAD", "MCCALL", "431 BRANDT QUAI", "8768706218", "conrad.mccall@church.religion.com", 2, "1975/12/11");
insert into logins (user_id, email, password_hash, salt) values (9, "conrad.mccall@church.religion.com", "c24d1a83501e652a0a80f408ebeffce3bd2343d9d120d4cbaa8b992847323b30", 6594);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("DOREEN", "PIERCE", "399 PINE LINK", "8762429095", "doreen.pierce@high_comiision.gov.uk", 2, "1985/1/25");
insert into logins (user_id, email, password_hash, salt) values (10, "doreen.pierce@high_comiision.gov.uk", "e4db90186b137c0edf58f55da284fb9134001a7ff6bfb2be1b72751c5b65b9e1", 9084);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("JESSICA", "BANKS", "7 REYNA LINE", "8769714113", "jessica.banks@congress.gov.usa", 2, "1980/12/5");
insert into logins (user_id, email, password_hash, salt) values (11, "jessica.banks@congress.gov.usa", "3058b6bafa49652974c53bdf66f3a70cb166620ad948029688baf92f7fdcc1ae", 3696);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("BERTHA", "JACOBS", "90 REYNA PATH", "8763665171", "bertha.jacobs@hotmail.com", 2, "1961/1/9");
insert into logins (user_id, email, password_hash, salt) values (12, "bertha.jacobs@hotmail.com", "559b25a338a8f71f208c829f3c8588f366e13195f641b9fd50149b1af6302961", 6136);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("FISHER", "ROSALES", "252 CARDENAS POINT", "8761507620", "fisher.rosales@church.religion.com", 2, "1984/8/3");
insert into logins (user_id, email, password_hash, salt) values (13, "fisher.rosales@church.religion.com", "b22694474c9d912f9c2f328f2a795cc3e5c9418a6e73837d41d1a4f204156a4f", 6757);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("CANDICE", "DUDLEY", "330 WIGGINS END", "8761453583", "candice.dudley@yahoo.com", 2, "1988/5/10");
insert into logins (user_id, email, password_hash, salt) values (14, "candice.dudley@yahoo.com", "2f3c27c0af1a5c0434915f8d6e8847842ae814b4b9257802290093f00a976ac8", 6862);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("MARCUS", "HOLMES", "189 HARRELL ABBEY", "8760638416", "marcus.holmes@riot.games.co", 2, "1997/5/18");
insert into logins (user_id, email, password_hash, salt) values (15, "marcus.holmes@riot.games.co", "c3886d9ccd746e23bcb801b64774eb30d2f20460dee2eea4ce246572fe07d59c", 6480);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("CLINT", "LANDRY", "188 WALTER MISSION", "8762532545", "clint.landry@canadia.gov.ca", 2, "1970/1/11");
insert into logins (user_id, email, password_hash, salt) values (16, "clint.landry@canadia.gov.ca", "2fbd244f2078556b59814a1083b3137225351f53ebb639812c55dbe5cb3b8397", 2158);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("MADELYN", "MACDONALD", "478 NAVARRO RISE", "8768020173", "madelyn.macdonald@gmail.com", 2, "1994/9/17");
insert into logins (user_id, email, password_hash, salt) values (17, "madelyn.macdonald@gmail.com", "efa162754f32d56490bcb80a43e0bc336e64a7d64b5e411cee9294a7668f4d9d", 8174);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("KATHERINE", "VAUGHN", "438 MONTOYA TURNPIKE", "8762099892", "katherine.vaughn@school.address.edu", 2, "1982/2/10");
insert into logins (user_id, email, password_hash, salt) values (18, "katherine.vaughn@school.address.edu", "f9265e4d6ff8a68cf2e61546bacae93bfdec13ddd8c4e8e9f158dbeff9636c38", 3621);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("ABRIL", "GUERRERO", "159 TRUONG BURROW", "8761043290", "abril.guerrero@riot.games.co", 2, "1981/8/21");
insert into logins (user_id, email, password_hash, salt) values (19, "abril.guerrero@riot.games.co", "b477e5f2597ff4cb751beea8fc7b5f85ba3d9eb358672e56ee3e3196bf1a06e4", 2850);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("GREGORY", "VALDEZ", "487 DONOVAN RUELLE", "8769777693", "gregory.valdez@proton-mail.com", 2, "1961/8/11");
insert into logins (user_id, email, password_hash, salt) values (20, "gregory.valdez@proton-mail.com", "085d4804fcec4dc31e3622af817f4745f8249d5bd31d8efa942eeffd971ed0ab", 4051);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("MIRA", "SELLERS", "192 HAYDEN CAUSEWAY", "8766930864", "mira.sellers@proton-mail.com", 2, "1960/8/15");
insert into logins (user_id, email, password_hash, salt) values (21, "mira.sellers@proton-mail.com", "b51786160e431c15f08df70f0210ed8c267cb5143989735b63787ee641ff089d", 9990);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("EFFIE", "ANDERSEN", "266 FINLEY CLOSE", "8769824069", "effie.andersen@live.com", 2, "1981/7/22");
insert into logins (user_id, email, password_hash, salt) values (22, "effie.andersen@live.com", "9d7d6ea462f219caeeec75418b03c6aaad94f325f8032490fe14a76315ce9b16", 805);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("JAMIR", "VO", "49 PECK CHEMIN", "8769782917", "jamir.vo@church.religion.com", 2, "1972/3/28");
insert into logins (user_id, email, password_hash, salt) values (23, "jamir.vo@church.religion.com", "b91dddcd1a7705afbcb6d23bdd672a83d2060533305ec07b2470beb15f82e196", 8589);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("GABRIELA", "PATEL", "14 PALACIOS BY-PASS", "8766920725", "gabriela.patel@team.group.com", 2, "1986/3/25");
insert into logins (user_id, email, password_hash, salt) values (24, "gabriela.patel@team.group.com", "a2582826dfd83a5a44c060e0d6531fcbc345c57b86fe4c4cc041ddedb8aac058", 9910);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("KIM", "STARK", "54 KAUR VALE", "8769015678", "kim.stark@de.trash.co", 2, "1998/2/25");
insert into logins (user_id, email, password_hash, salt) values (25, "kim.stark@de.trash.co", "10408286ec7420e1ea05cd3f53d7715c5adcd634d127be4c4095f5ae1b0c9036", 7581);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("ANDERS", "BURTON", "314 IBARRA PLAIN", "8767814471", "anders.burton@outlook.com", 2, "1975/5/25");
insert into logins (user_id, email, password_hash, salt) values (26, "anders.burton@outlook.com", "e3aa387119e4500a9b0673b886542ac1e70e42078f9f4e381f6887f7eef88b17", 7340);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("ALEXIS", "CARLSON", "147 SAWYER VIA", "8761013985", "alexis.carlson@yahoo.com", 2, "1968/6/21");
insert into logins (user_id, email, password_hash, salt) values (27, "alexis.carlson@yahoo.com", "d630b326759d2d861e837b84b131e2f3a53724bab5363078590fb7755641adea", 7120);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("LAYTON", "FROST", "448 DORSEY IMPASSE", "8765834440", "layton.frost@company.mail.com", 2, "1989/2/24");
insert into logins (user_id, email, password_hash, salt) values (28, "layton.frost@company.mail.com", "80a71faed3f49b38058048a0629e4ddc862f5c67c8bd2ca7de808207713a9c9d", 4709);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("JEWELL", "SOLOMON", "492 TANNER NOT", "8765049237", "jewell.solomon@outlook.com", 2, "2002/1/3");
insert into logins (user_id, email, password_hash, salt) values (29, "jewell.solomon@outlook.com", "68f6c60a4164fb5a0a502419f1a610b4fe13b78bb32589f373d2c325966b1710", 4503);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("MILAN", "MORRISON", "270 JEFFERSON RUE", "8767820223", "milan.morrison@congress.gov.usa", 2, "1994/12/25");
insert into logins (user_id, email, password_hash, salt) values (30, "milan.morrison@congress.gov.usa", "a771f825fa8b62199a2f4792f42cf80c42cbe580e53539e98deb94b20b98ac09", 6330);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("KINSLEY", "SANTOS", "178 FRIEDMAN DIVIDE", "8762277789", "kinsley.santos@de.trash.co", 2, "1968/3/2");
insert into logins (user_id, email, password_hash, salt) values (31, "kinsley.santos@de.trash.co", "2120b5c7051e9fb7112135e250f2815a5f69d37a28711ba9e28959fc1f4088b2", 1897);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("MAGDALENA", "TYLER", "166 ROCHA RIGHT", "8763799320", "magdalena.tyler@congress.gov.usa", 2, "1967/8/10");
insert into logins (user_id, email, password_hash, salt) values (32, "magdalena.tyler@congress.gov.usa", "634aaa34020aa1f3e748af48acb1f53ed8d48e83bca91d8332f92b15c4c4f6c3", 2759);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("LONDYN", "MACDONALD", "499 DUDLEY MEADOW", "8769529012", "londyn.macdonald@yahoo.com", 2, "1975/8/8");
insert into logins (user_id, email, password_hash, salt) values (33, "londyn.macdonald@yahoo.com", "a5c04240e764a761f84760a893c104fb2977f57dd588b63fb73d7c5eaf800dc0", 6135);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("BAYLOR", "TATE", "395 REYNA NECK", "8764016552", "baylor.tate@church.religion.com", 2, "1993/9/28");
insert into logins (user_id, email, password_hash, salt) values (34, "baylor.tate@church.religion.com", "7f83fe696ff978e9d12385a7dbc42b5e33a9b32d6a820ce2d21f93d83b832574", 1570);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("LYNDA", "MAYER", "168 GALINDO FALL", "8763210302", "lynda.mayer@hotmail.com", 2, "1972/9/4");
insert into logins (user_id, email, password_hash, salt) values (35, "lynda.mayer@hotmail.com", "f29b2f47df56a57906140c377bceafca644bac24ac0dbd30bdf1ebb4e7dce719", 125);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("CHLOE", "CUNNINGHAM", "332 KAUR TRACE", "8764855142", "chloe.cunningham@company.mail.com", 2, "1977/9/19");
insert into logins (user_id, email, password_hash, salt) values (36, "chloe.cunningham@company.mail.com", "13a1784bdf3ba4df9de9e018c97d81094862bbc59001c09bff56a3606058a251", 8926);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("CAIDEN", "MCGUIRE", "31 BULLOCK NECK", "8764348713", "caiden.mcguire@gmail.com", 2, "1984/11/28");
insert into logins (user_id, email, password_hash, salt) values (37, "caiden.mcguire@gmail.com", "fb0ec2d9379c9b0433dc140698c8925bf9b1bec163ee1c869736ca553b27a4f0", 3014);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("CLAUDIA", "GREGORY", "433 MACIAS RIDGE", "8763344853", "claudia.gregory@yahoo.com", 2, "1971/9/15");
insert into logins (user_id, email, password_hash, salt) values (38, "claudia.gregory@yahoo.com", "f8268636febde80666003b9d1e7ee55de5baa1a0de4936ffaf0f507ddaa76299", 6228);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("JAMIE", "PATTERSON", "209 FRANK BY-PASS", "8762702077", "jamie.patterson@team.group.com", 2, "1990/9/3");
insert into logins (user_id, email, password_hash, salt) values (39, "jamie.patterson@team.group.com", "9644f6b094ab4caafacbabbd62aa10bc37cc026509127a8051fe141c237a4a30", 9395);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("KYNLEE", "CUMMINGS", "50 WIGGINS THROUGHWAY", "8765428032", "kynlee.cummings@outlook.com", 2, "1994/10/19");
insert into logins (user_id, email, password_hash, salt) values (40, "kynlee.cummings@outlook.com", "6e77acb2b706c31521cd73b53c31272ed7798bcfa041556bd427298963a297c9", 7458);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("LANDYN", "RICHMOND", "284 HAIL NECK", "8760583042", "landyn.richmond@congress.gov.usa", 2, "1992/10/16");
insert into logins (user_id, email, password_hash, salt) values (41, "landyn.richmond@congress.gov.usa", "547856284d519ed6c2cfcfbec79ca03420a06087519275be7a78a148f1646e9e", 7425);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("ALEENA", "FIGUEROA", "26 RANDALL TOWERS", "8760737604", "aleena.figueroa@company.mail.com", 2, "1975/2/1");
insert into logins (user_id, email, password_hash, salt) values (42, "aleena.figueroa@company.mail.com", "7e5d404521006de27c9766578b0a2227dc7b4d20d42674e1f9264b5b7db55bd6", 2258);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("BODHI", "CASEY", "28 HERMAN TAILER", "8764497319", "bodhi.casey@gmail.com", 2, "1996/6/14");
insert into logins (user_id, email, password_hash, salt) values (43, "bodhi.casey@gmail.com", "e738da2a01a2d9cce8246cf156321453eb369fb3d40fd795244ca0384af3b23c", 6875);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("BENNETT", "GARDNER", "170 DAUGHERTY COURSE", "8761132832", "bennett.gardner@outlook.com", 2, "1984/9/5");
insert into logins (user_id, email, password_hash, salt) values (44, "bennett.gardner@outlook.com", "33c4c2569ac76f0cf1968ff06fbb6cbb2678dbcc965d05188b4d1d40e3df8141", 7954);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("HECTOR", "VILLEGAS", "295 JEFFERSON SPRINGS", "8764389411", "hector.villegas@riot.games.co", 2, "1984/6/20");
insert into logins (user_id, email, password_hash, salt) values (45, "hector.villegas@riot.games.co", "2a593294f8bdaee003538571aca79b907fd70f3592e287c0df87f4937ebfce0a", 9822);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("SHANA", "VENTURA", "172 DICKSON GROVE", "8766115016", "shana.ventura@proton-mail.com", 2, "1979/12/1");
insert into logins (user_id, email, password_hash, salt) values (46, "shana.ventura@proton-mail.com", "df4b7562f536da7c61f15550d5a42bb2021bb932f6859d910ebedd81a10ca382", 6839);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("ROWAN", "DAY", "417 GRIMES LODGE", "8763995987", "rowan.day@organization.business.com", 2, "1968/6/24");
insert into logins (user_id, email, password_hash, salt) values (47, "rowan.day@organization.business.com", "bb1139fbbf48203214fb23bb64bb2e4f742440e2e537566c92bc24072c5d5a50", 256);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("WESLEY", "GILES", "246 OWEN TOWNLINE", "8762408795", "wesley.giles@yahoo.com", 2, "1973/2/19");
insert into logins (user_id, email, password_hash, salt) values (48, "wesley.giles@yahoo.com", "efbd3eb5ce11e9bf38b4828eeb7affcfba852b9dc2bd19aaf84643bc1647640e", 3703);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("PIPER", "ANDRADE", "30 CLAY ESTATES", "8765748844", "piper.andrade@parliament.gov.jm", 2, "2000/9/5");
insert into logins (user_id, email, password_hash, salt) values (49, "piper.andrade@parliament.gov.jm", "24bbb517b3e04b74908cc844dda083a84b3fe7d0c108bf379afcdbb76f9b16e9", 5045);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("RANDAL", "WILLIAMSON", "64 MULLEN CUL-DE-SAC", "8767695380", "randal.williamson@de.trash.co", 2, "1995/10/2");
insert into logins (user_id, email, password_hash, salt) values (50, "randal.williamson@de.trash.co", "2a0da62aa6b9dd544f1765e274a01453115ce8a287ea6369b5bfc20fefd732ca", 1885);
