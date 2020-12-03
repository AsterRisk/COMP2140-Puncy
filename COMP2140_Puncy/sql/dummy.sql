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

insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("HUMBERTO", "CUEVAS", "171 HARRINGTON GLENWAY", "8768786785", "humberto.cuevas@parliament.gov.jm", 2, "1971/5/3");
insert into logins (user_id, email, password_hash, salt) values (1, "humberto.cuevas@parliament.gov.jm", "6ae94f400a7214a1244d081f2cc0d1f0a87ad7801dd0741b664f42d6ba4162fa", 9157);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("CARY", "BAUER", "326 AYALA CONCESSION", "8761089592", "cary.bauer@high_comiision.gov.uk", 2, "1983/4/22");
insert into logins (user_id, email, password_hash, salt) values (2, "cary.bauer@high_comiision.gov.uk", "10050477da27f1dc4a1b126b05b7c391af31e6ec42e97af526192127fd5a9f4b", 8012);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("VEDA", "GUZMAN", "292 NUNEZ TWO", "8765668767", "veda.guzman@gmail.com", 2, "1996/4/23");
insert into logins (user_id, email, password_hash, salt) values (3, "veda.guzman@gmail.com", "31d44cbd85fb72cc6e879094d1bbba76d47bfa9ea64beba52204a73cdc28b16b", 7020);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("DALLAS", "PRATT", "207 WOODARD COURSE", "8760240914", "dallas.pratt@proton-mail.com", 2, "2002/7/22");
insert into logins (user_id, email, password_hash, salt) values (4, "dallas.pratt@proton-mail.com", "d7d9d60f56b5c2a4ab67cd5d802f07bd06cc9c2f39dcee4ef5770b64ac122b11", 4622);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("EMERIE", "ROJAS", "295 MAYNARD BLUFF", "8767987426", "emerie.rojas@yahoo.com", 2, "1961/3/14");
insert into logins (user_id, email, password_hash, salt) values (5, "emerie.rojas@yahoo.com", "988bf70c624d2c56e7bac750a8271a7c4f8155922c50da0b8085fb12ab731b22", 9237);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("SALMA", "LARSON", "32 PINEDA FORD", "8761204434", "salma.larson@de.trash.co", 2, "1973/7/8");
insert into logins (user_id, email, password_hash, salt) values (6, "salma.larson@de.trash.co", "1c52c50ee867a52d1beb84d7f9dc967b5ae62eb124837efc09b4cbcd9582f248", 7854);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("EDDY", "ROSALES", "319 PENNINGTON CROSSROADS", "8768359012", "eddy.rosales@outlook.com", 2, "1979/5/23");
insert into logins (user_id, email, password_hash, salt) values (7, "eddy.rosales@outlook.com", "bdd62ee8defb3f1ce0df0f0463b0b37e46d0b16af9fb1884f2663bb93d5f0b7f", 6885);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("HANS", "ESQUIVEL", "245 GALLEGOS OVERPASS", "8763195355", "hans.esquivel@live.com", 2, "1987/8/21");
insert into logins (user_id, email, password_hash, salt) values (8, "hans.esquivel@live.com", "417069c6169ce78eea869515d38cee9e38a1629e8f4dcc4c0a9078fa97a65599", 4511);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("THEODORE", "MEADOWS", "352 HESTER BROOK", "8766742609", "theodore.meadows@yahoo.com", 2, "2000/12/9");
insert into logins (user_id, email, password_hash, salt) values (9, "theodore.meadows@yahoo.com", "a3da3e77b7eb3ce3a5f618763e0657b4757e23ec6066a7d1ff9b2546a36fe516", 505);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("GLENDA", "BRANDT", "141 SHAFFER BOX", "8765637531", "glenda.brandt@school.address.edu", 2, "2001/5/26");
insert into logins (user_id, email, password_hash, salt) values (10, "glenda.brandt@school.address.edu", "6bc3cb04486d9d04abf9b9594d9af83a905058b9d1409a38c55fbb9d0bc293f3", 5474);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("MIAH", "EVANS", "155 JEFFERSON TRACE", "8765244194", "miah.evans@high_comiision.gov.uk", 2, "2000/8/5");
insert into logins (user_id, email, password_hash, salt) values (11, "miah.evans@high_comiision.gov.uk", "3bfbf5e2bdd740bceba7d9c2f2de79ebb892da16b30a99af3256e504c92d4cb7", 4789);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("BREANNA", "MADDOX", "78 ALFARO BYWAY", "8767731923", "breanna.maddox@proton-mail.com", 2, "1964/4/8");
insert into logins (user_id, email, password_hash, salt) values (12, "breanna.maddox@proton-mail.com", "4652d574396d2d5720820505faae9f104d55c49f2ea9b249003ca6c1ef397056", 7777);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("MADALYNN", "MCKINNEY", "488 WYATT TOWERS", "8768768384", "madalynn.mckinney@live.com", 2, "1987/6/12");
insert into logins (user_id, email, password_hash, salt) values (13, "madalynn.mckinney@live.com", "a24e49c81deb29983d4b774f179e1ab0796bcc69e2482bacbaf3eac8ff76ec85", 450);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("FRED", "ROBINSON", "299 MEADOWS BOULEVARD", "8768203554", "fred.robinson@hotmail.com", 2, "1989/8/25");
insert into logins (user_id, email, password_hash, salt) values (14, "fred.robinson@hotmail.com", "9a30e66ad25e4aa82b744175ba9016fcc116a521a9edfc71ab08ca9ee5d04bca", 3508);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("KAYA", "ROMERO", "499 ALLISON CIRCUIT", "8764946213", "kaya.romero@proton-mail.com", 2, "1981/6/23");
insert into logins (user_id, email, password_hash, salt) values (15, "kaya.romero@proton-mail.com", "b624af1461cc06b47b5294678bc81c68f0980295eb97aaca4c06542c7b630b96", 4551);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("JOCELYN", "MASON", "74 FLYNN FORK", "8768831755", "jocelyn.mason@outlook.com", 2, "1990/4/8");
insert into logins (user_id, email, password_hash, salt) values (16, "jocelyn.mason@outlook.com", "2537e59fc4074cded966e122da282383406ddb01c7787639e5add0e9b4bb52d2", 8110);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("ELDON", "EVERETT", "113 MAIN HOLLOW", "8761326961", "eldon.everett@de.trash.co", 2, "1988/1/6");
insert into logins (user_id, email, password_hash, salt) values (17, "eldon.everett@de.trash.co", "d494cc6559bb1a4708ee32c416ddfe91d386e5532b41c027b4f83b74d52746aa", 4660);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("TERRI", "SCOTT", "311 VAUGHAN RANG", "8762511257", "terri.scott@outlook.com", 2, "2001/8/13");
insert into logins (user_id, email, password_hash, salt) values (18, "terri.scott@outlook.com", "1815811340137a952a8ff0f55b6bedbd0ab4d6f2a6b87faefa0721592a7d890a", 4022);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("BERNIE", "HARDING", "468 CHRISTIAN RUE", "8762242412", "bernie.harding@outlook.com", 2, "1976/12/12");
insert into logins (user_id, email, password_hash, salt) values (19, "bernie.harding@outlook.com", "8d2b1a8b18f7966e3668b2c8cd2804c5534c1a5d796e7ed13fe66604fb3557df", 9186);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("GIOVANNA", "AHMED", "218 FOURTH FRONT", "8761602427", "giovanna.ahmed@yahoo.com", 2, "1969/1/1");
insert into logins (user_id, email, password_hash, salt) values (20, "giovanna.ahmed@yahoo.com", "1aa3e7574e285341a608adf3190f459e642cd5b541cda58496d3c15355e3d7ba", 6429);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("DEWAYNE", "RYAN", "51 POOLE DRIVE", "8766863643", "dewayne.ryan@parliament.gov.jm", 2, "1984/2/7");
insert into logins (user_id, email, password_hash, salt) values (21, "dewayne.ryan@parliament.gov.jm", "76def2b34fc1d88af12128e7761856bb0565df05031c2cc8e85b5df69d4a6c14", 1218);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("KAI", "GUTIERREZ", "49 LEACH FORGE", "8763572349", "kai.gutierrez@de.trash.co", 2, "1967/11/19");
insert into logins (user_id, email, password_hash, salt) values (22, "kai.gutierrez@de.trash.co", "ff2cc1d6e980afb3696a2b79f5421fc5a6cf0a9f2fb6798d7a8afac56e89c025", 6800);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("MARIAM", "SCHWARTZ", "494 HUMPHREY LINE", "8766843195", "mariam.schwartz@organization.business.com", 2, "1976/11/21");
insert into logins (user_id, email, password_hash, salt) values (23, "mariam.schwartz@organization.business.com", "879f37143ed1faae686021525d97ed8533383f64a79a309968594a8ea4a04ed8", 3509);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("YAHIR", "CONTRERAS", "302 CABRERA SPRINGS", "8763697409", "yahir.contreras@hotmail.com", 2, "1987/3/16");
insert into logins (user_id, email, password_hash, salt) values (24, "yahir.contreras@hotmail.com", "ba4f0ef1a3a145e469a3ab6aa10e74ff89a347ed64279d2f44c050ebbbf39ffa", 1476);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("FAITH", "MAYO", "161 HORN UNDERPASS", "8768840898", "faith.mayo@proton-mail.com", 2, "1997/11/12");
insert into logins (user_id, email, password_hash, salt) values (25, "faith.mayo@proton-mail.com", "d94dc44767ddde72abaaf629e1fa23be55e81a34045e9203b8b3bc42b013cc13", 4675);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("SKYLAR", "CORONA", "259 POTTS TWO", "8766168798", "skylar.corona@high_comiision.gov.uk", 2, "1985/10/22");
insert into logins (user_id, email, password_hash, salt) values (26, "skylar.corona@high_comiision.gov.uk", "4c9e99b0548d723bc5ea61509bdad4bd6916d946d3832f7124ee89d13569fc9e", 1174);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("TALON", "FRAZIER", "67 BROCK CHEMIN", "8762071471", "talon.frazier@outlook.com", 2, "1995/2/15");
insert into logins (user_id, email, password_hash, salt) values (27, "talon.frazier@outlook.com", "a8f33b8630935de70854722f333397e52a82e154aa232a93e15538668f664be8", 8163);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("PATRICK", "NICHOLSON", "31 SEXTON CROISSANT", "8760395225", "patrick.nicholson@church.religion.com", 2, "1961/3/24");
insert into logins (user_id, email, password_hash, salt) values (28, "patrick.nicholson@church.religion.com", "47d3054d2d2a29dee3a58c53636b71ac1661a6535874748213b03cdfaf76c4e7", 7036);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("LORNA", "ENGLISH", "98 MOON CROSSROADS", "8766755695", "lorna.english@outlook.com", 2, "1968/3/25");
insert into logins (user_id, email, password_hash, salt) values (29, "lorna.english@outlook.com", "d525fde241454e336651b599a10d145f2b5ec8986a65d7f43405726823275d4e", 5573);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("RIVKA", "BENSON", "211 BENITEZ CLIFFS", "8760894475", "rivka.benson@yahoo.com", 2, "1964/2/23");
insert into logins (user_id, email, password_hash, salt) values (30, "rivka.benson@yahoo.com", "8d82fc51aa0bc70d110820f8d72fd1774bafa6211d21a051e275976e617989d8", 3698);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("EDWARD", "MCCARTHY", "496 MONTOYA COMMON", "8763636822", "edward.mccarthy@organization.business.com", 2, "1994/8/3");
insert into logins (user_id, email, password_hash, salt) values (31, "edward.mccarthy@organization.business.com", "16b2bc2de2848e1298b07ba8769ef9330363087b9fdb02f8d8b2bb28286051f4", 9853);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("ARLO", "FRANCIS", "291 MCCLURE PIKE", "8768581850", "arlo.francis@parliament.gov.jm", 2, "2000/11/8");
insert into logins (user_id, email, password_hash, salt) values (32, "arlo.francis@parliament.gov.jm", "c1b929f7b9ebaec20bee3cc932f15b0d40cf368600ed85c05aa7f400c76088e1", 5009);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("OAKLEE", "GILL", "138 ROBERSON TOUR", "8766630645", "oaklee.gill@school.address.edu", 2, "2002/1/14");
insert into logins (user_id, email, password_hash, salt) values (33, "oaklee.gill@school.address.edu", "85880e7b495914d47f90635de3ac3285dea747eded81de14227266ee77033f24", 5767);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("KALEL", "HUTCHINSON", "76 BOOTH PORT", "8760264083", "kalel.hutchinson@live.com", 2, "1969/8/27");
insert into logins (user_id, email, password_hash, salt) values (34, "kalel.hutchinson@live.com", "385845710085ba7d4ca1f8ac18c9c712dba83dff21f9ce28cd1c1157f6865b13", 7065);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("HANNA", "SPARKS", "309 MIRANDA COURSE", "8760163479", "hanna.sparks@church.religion.com", 2, "2001/10/10");
insert into logins (user_id, email, password_hash, salt) values (35, "hanna.sparks@church.religion.com", "19ff9ebb886b781b525af2b26c98af1aa32a94444af3e11d917808be2048461a", 7208);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("MALCOLM", "LUCAS", "383 MCINTYRE MEADOW", "8764185853", "malcolm.lucas@school.address.edu", 2, "1992/12/15");
insert into logins (user_id, email, password_hash, salt) values (36, "malcolm.lucas@school.address.edu", "83b06f5b8e5198ed4932a59e3fd508f3a03933cd282904797ba978d9f0ecac78", 8805);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("TOBY", "DURAN", "26 BAUER STRAVENUE", "8762240089", "toby.duran@school.address.edu", 2, "1964/2/14");
insert into logins (user_id, email, password_hash, salt) values (37, "toby.duran@school.address.edu", "55aac1d3341ac96bc28288f3c09742f5f239b0aea8b08459c869f75e78da169b", 5261);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("KYLER", "CASTRO", "72 MORA PIKE", "8761483696", "kyler.castro@company.mail.com", 2, "1994/7/16");
insert into logins (user_id, email, password_hash, salt) values (38, "kyler.castro@company.mail.com", "c02c9c7f1b0bffa38279450687e13bb4cfcd2d5cfe81b0574b24c16bef6f5355", 8135);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("DRAVEN", "DALTON", "137 VILLA MILL", "8767566504", "draven.dalton@gmail.com", 2, "1987/5/10");
insert into logins (user_id, email, password_hash, salt) values (39, "draven.dalton@gmail.com", "e5e71153143f51c5e4961e420b1aa71e5e1bb64df8ec5103435c5ed31b11718f", 9134);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("SABRINA", "HUGHES", "431 WARE CRESCENT", "8763572969", "sabrina.hughes@church.religion.com", 2, "1962/2/23");
insert into logins (user_id, email, password_hash, salt) values (40, "sabrina.hughes@church.religion.com", "312b8e91dbe482204e6569e336362b5f05828b06bdaf30a4549b317f7b1a0404", 5859);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("MILEY", "KIRBY", "432 HANNA PRAIRIE", "8762511659", "miley.kirby@riot.games.co", 2, "1976/10/25");
insert into logins (user_id, email, password_hash, salt) values (41, "miley.kirby@riot.games.co", "e2f5bb4f5e47bfb32a802af28b08667f688fc48e31c88b581ccb90888ff87562", 7409);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("FRANKIE", "OCONNELL", "152 CLARKE BAYOU", "8769527996", "frankie.oconnell@organization.business.com", 2, "1980/1/19");
insert into logins (user_id, email, password_hash, salt) values (42, "frankie.oconnell@organization.business.com", "652ffc2a69df64820bf434c53b264f437967a2cebddc1bf21e40bc9be7fb5180", 8177);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("JUSTICE", "LOVE", "380 ACEVEDO CAPE", "8768316552", "justice.love@church.religion.com", 2, "2001/12/11");
insert into logins (user_id, email, password_hash, salt) values (43, "justice.love@church.religion.com", "64bdd609b91b313cf63e4e176fb73e186e7251cc6734401135712bfe22d89425", 3781);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("STEWART", "LYNN", "4 BRANCH SKYWAY", "8762579480", "stewart.lynn@outlook.com", 2, "1997/12/17");
insert into logins (user_id, email, password_hash, salt) values (44, "stewart.lynn@outlook.com", "90b861a77b93af4ba785767a73ab7071f6567646f6314dae095e54f8dbcd4ffe", 3709);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("DAVINA", "KIRK", "358 HARTMAN ANNEX", "8763880289", "davina.kirk@outlook.com", 2, "1977/2/21");
insert into logins (user_id, email, password_hash, salt) values (45, "davina.kirk@outlook.com", "6710b0e188320352b0e853bda601caf2ac1c1e582cd756b192fb7142cfccd888", 673);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("ALANNA", "HOLMES", "138 AHMED RANG", "8767296057", "alanna.holmes@company.mail.com", 2, "1984/7/13");
insert into logins (user_id, email, password_hash, salt) values (46, "alanna.holmes@company.mail.com", "3018fcfc61c79ce8c573bb3c4763782a97a7ae39b650fc95f9de4ba006bd57f9", 5049);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("SAMANTHA", "GENTRY", "461 POOLE FALL", "8768263602", "samantha.gentry@live.com", 2, "1999/9/2");
insert into logins (user_id, email, password_hash, salt) values (47, "samantha.gentry@live.com", "6bd00c6640770847e8276d7a51c4651474ae604d92fd7af4450b6304500b8da8", 9118);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("MEGAN", "TYLER", "6 MULLEN SPUR", "8765225399", "megan.tyler@gmail.com", 2, "1991/1/16");
insert into logins (user_id, email, password_hash, salt) values (48, "megan.tyler@gmail.com", "94c431aed4b75a030f65d8478cde98c36804f5a7c2c197ff00d96d57984e1541", 4182);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("REIGN", "JACOBSON", "248 BEST PIKE", "8768677391", "reign.jacobson@church.religion.com", 2, "1977/6/24");
insert into logins (user_id, email, password_hash, salt) values (49, "reign.jacobson@church.religion.com", "6c88cf52bb24d1953fb4c547e300cc307aa261d96d8f39314ff35bca5a82b0d3", 3581);
insert into users (first_name, last_name, home_address, tele_num, email, clearance, dob) values ("BERT", "JIMENEZ", "378 VELASQUEZ STRAVENUE", "8768323149", "bert.jimenez@parliament.gov.jm", 2, "1985/7/8");
insert into logins (user_id, email, password_hash, salt) values (50, "bert.jimenez@parliament.gov.jm", "09c9b558211c1d6f602264e7c637605023dbcac65fec196082c54cfcb5064131", 5609);
