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
    user_id int not null,
    order_id int not null unique AUTO_INCREMENT,
    state varchar(10) not null,
    measurements int,
    date_placed Date,
    due_date Date,
    est_cost NUMERIC,
    providing_fabric boolean not null,
    primary key (order_id)
);

create table job_presets
(
    type varchar(12) unique not null,
    garment_price numeric not null, 
    preset_id int not null AUTO_INCREMENT,
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
    bust_pt int,
    round_knee int,
    primary key (measurement_id)
);

create table appointments (
    app_id int not null AUTO_INCREMENT,
    user_id int not null,
    app_date date not null,  
    app_time time not null,
    primary key (app_id)
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

insert into job_presets (type, garment_price, preset_id, media_address) values ("Shirt-XS", 2500, 1, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Shirt-S", 2750,"n/a");
insert into job_presets (type, garment_price, media_address) values ("Shirt-M", 3000, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Shirt-L", 3250,"n/a");
insert into job_presets (type, garment_price, media_address) values ("Shirt-XL", 3500, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Shorts-XS", 2500, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Shorts-S", 2750, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Shorts-M", 3000, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Shorts-L", 3250, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Shorts-XL", 3500, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Dress-XS", 2500, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Dress-S", 2750, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Dress-M", 3000, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Dress-L", 3250, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Dress-XL", 3500, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Pants-XS", 2500, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Pants-S", 2750, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Pants-M", 3000, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Pants-L", 3250, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Pants-XL", 3500, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Uniform-XS", 2500, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Uniform-S", 2750, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Uniform-M", 3000, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Uniform-L", 3250, "n/a");
insert into job_presets (type, garment_price, media_address) values ("Uniform-XL", 3500, "n/a");

insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (1, "DENA", "HAMILTON", "55 CHURCH PARK", "8769646388", "dena.hamilton@congress.gov.usa", 2, "1983/6/25");
insert into logins (user_id, email, password_hash, salt) values (1, "dena.hamilton@congress.gov.usa", "6949b6bc873be02f7ec205da9de8c5305fb8b2b1fa838e044e743563befa885a", 3769);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (2, "BERT", "OSBORNE", "189 WINTERS BLUFF", "8765933532", "bert.osborne@organization.business.com", 2, "1997/6/18");
insert into logins (user_id, email, password_hash, salt) values (2, "bert.osborne@organization.business.com", "6696bdcca57e87e22ab2f0ce09d496be9db354d30c1bca1320c4ecff30f4aea3", 8853);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (3, "KEN", "ROSARIO", "166 EVERETT WALL", "8764462936", "ken.rosario@company.mail.com", 2, "1989/2/28");
insert into logins (user_id, email, password_hash, salt) values (3, "ken.rosario@company.mail.com", "e181fb7bdab5197ece697be1b14796d644a18694a49808e41ff0831cc0f2bdba", 4212);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (4, "SAWYER", "CLAY", "336 FROST GLENWAY", "8766857562", "sawyer.clay@organization.business.com", 2, "1995/11/19");
insert into logins (user_id, email, password_hash, salt) values (4, "sawyer.clay@organization.business.com", "f1b1586482b4c4209519a8a4af9fab2e2c1b4e7fdae10f7e1d9cecc0e39eee85", 7314);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (5, "VIVAAN", "FLETCHER", "250 KANE LIGHT", "8763282047", "vivaan.fletcher@outlook.com", 2, "1974/11/10");
insert into logins (user_id, email, password_hash, salt) values (5, "vivaan.fletcher@outlook.com", "097e85063100c3b34a9565508b0de2e314a853f6149983617d74858935fa1afc", 7833);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (6, "PABLO", "BOOTH", "82 SOSA LINK", "8766251210", "pablo.booth@live.com", 2, "1997/12/15");
insert into logins (user_id, email, password_hash, salt) values (6, "pablo.booth@live.com", "4f81ac0a16a9a7fb1b6699e8e44782853d1200b2631a8c4553bd77db9f371f33", 9411);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (7, "ADDISON", "KANE", "177 HURST ROAD", "8765067103", "addison.kane@school.address.edu", 2, "1970/5/1");
insert into logins (user_id, email, password_hash, salt) values (7, "addison.kane@school.address.edu", "3daa85f837ab9554901e35d8c095125339bd9f0f239b7e421944da5b169f7b6a", 6421);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (8, "RENA", "BRYAN", "462 RIVERS SHORES", "8767162120", "rena.bryan@school.address.edu", 2, "1990/9/9");
insert into logins (user_id, email, password_hash, salt) values (8, "rena.bryan@school.address.edu", "25dee976783a46ca7f07cc93021625009ab447e43b34eb47150df5f08a738d37", 6320);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (9, "BETHANY", "ALI", "392 FIRST AUTOROUTE", "8762128769", "bethany.ali@riot.games.co", 2, "1968/12/22");
insert into logins (user_id, email, password_hash, salt) values (9, "bethany.ali@riot.games.co", "e1f2591c8b45cf5fcc32f5be6c3c0f96b47d800e7ea23dabb4b8a969b399d790", 782);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (10, "ROSEMARY", "SHARP", "319 RUBIO BURG", "8763736338", "rosemary.sharp@church.religion.com", 2, "1994/10/4");
insert into logins (user_id, email, password_hash, salt) values (10, "rosemary.sharp@church.religion.com", "4f99bf66bc85951c8d2022d1a8b992c04a12b4ef2e5e8295c20b3a11419e5db6", 6470);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (11, "ADONIS", "FRANKLIN", "293 ASHLEY UNION", "8763816296", "adonis.franklin@de.trash.co", 2, "1994/6/6");
insert into logins (user_id, email, password_hash, salt) values (11, "adonis.franklin@de.trash.co", "c353b7cfb0ee7f5f57bffa106c25408b9d839f0738051f25376b50ac57ba77e9", 6529);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (12, "CASH", "DEJESUS", "42 LI CHARE", "8761078492", "cash.dejesus@church.religion.com", 2, "1971/2/22");
insert into logins (user_id, email, password_hash, salt) values (12, "cash.dejesus@church.religion.com", "bd26c1462349241f67e8fd22b2fbd1097203df0ab07d7d80c7b50c9b51aff4fa", 228);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (13, "GERMAN", "HUDSON", "42 HOOD WYND", "8766526245", "german.hudson@organization.business.com", 2, "1992/3/8");
insert into logins (user_id, email, password_hash, salt) values (13, "german.hudson@organization.business.com", "6d74170c16858379ba5f27876cf6a7380d471d9f5e0f59a0fe9a54e792adf7a2", 5523);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (14, "AMIYAH", "COCHRAN", "143 BRYAN FLAT", "8765589262", "amiyah.cochran@school.address.edu", 2, "1964/10/24");
insert into logins (user_id, email, password_hash, salt) values (14, "amiyah.cochran@school.address.edu", "9d8f26be27aaf8fc775d3ac67eb4b6cbd19328b52f6151c5173ec9b1800a24ad", 9031);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (15, "HOPE", "AUSTIN", "126 RUSSO SUBDIVISION", "8763854930", "hope.austin@church.religion.com", 2, "1977/1/16");
insert into logins (user_id, email, password_hash, salt) values (15, "hope.austin@church.religion.com", "53f33a91f7c44c2181928de091ebb9d165ab79ceee8481ed4b8ea346e0ba2253", 6034);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (16, "DILAN", "JACKSON", "248 OROZCO WOLD", "8764742471", "dilan.jackson@outlook.com", 2, "1990/1/15");
insert into logins (user_id, email, password_hash, salt) values (16, "dilan.jackson@outlook.com", "53e7caea110ecd7058605d969509e875c94ec9481dee3f281786b272e22405d8", 1004);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (17, "STEVE", "MARQUEZ", "331 DICKERSON PATHWAY", "8761979164", "steve.marquez@congress.gov.usa", 2, "1964/2/19");
insert into logins (user_id, email, password_hash, salt) values (17, "steve.marquez@congress.gov.usa", "375a701d6811feb212559b2d4a98eee38d9763d4802b0ba86293305fdc0cf951", 7353);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (18, "CHERYL", "GARRISON", "128 ESPARZA SKYWAY", "8761066755", "cheryl.garrison@live.com", 2, "1963/11/27");
insert into logins (user_id, email, password_hash, salt) values (18, "cheryl.garrison@live.com", "94905991624d41d1ede7350a56debf68787331b4d56240a7a028f9bb9d3d92e3", 4527);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (19, "GEORGE", "TRUJILLO", "427 HINTON BRANCH", "8769721172", "george.trujillo@hotmail.com", 2, "1969/10/20");
insert into logins (user_id, email, password_hash, salt) values (19, "george.trujillo@hotmail.com", "2ff77dcf9daab296773dbc5f464a6e512e5b0ae803765bc669d1dc293b18c20d", 2430);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (20, "EMERALD", "OCONNOR", "317 SCHWARTZ GROVE", "8761767567", "emerald.oconnor@proton-mail.com", 2, "1978/11/9");
insert into logins (user_id, email, password_hash, salt) values (20, "emerald.oconnor@proton-mail.com", "42e6a2da92c31134f37a778f9a56c14b805cc9264aa9d2af61b4a9440374bd71", 9526);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (21, "GUADALUPE", "BERNARD", "216 HILL PARADE", "8761749213", "guadalupe.bernard@congress.gov.usa", 2, "1967/5/13");
insert into logins (user_id, email, password_hash, salt) values (21, "guadalupe.bernard@congress.gov.usa", "74511346ec4982868280d8a759f37a9ab5f8da6fe26bb8c9df66234a4a62205d", 4567);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (22, "SAMARA", "MEJIA", "226 DURHAM CANYON", "8760391906", "samara.mejia@school.address.edu", 2, "1988/7/14");
insert into logins (user_id, email, password_hash, salt) values (22, "samara.mejia@school.address.edu", "00521fa7f2ff516e09c798d49f9b772c097dbb97df3af113a10429e3d384dd71", 1120);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (23, "RUTH", "PENA", "396 BEARD PROMENADE", "8763914404", "ruth.pena@organization.business.com", 2, "1970/7/14");
insert into logins (user_id, email, password_hash, salt) values (23, "ruth.pena@organization.business.com", "af1de2edef5c7c5b9d7c8f904c562dc0c264f82ee057e5fe139559be2a916b60", 808);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (24, "MARY", "STEVENS", "416 AGUIRRE VILLAGE", "8768868164", "mary.stevens@canadia.gov.ca", 2, "1973/4/25");
insert into logins (user_id, email, password_hash, salt) values (24, "mary.stevens@canadia.gov.ca", "9c2a189a559d30e98966f4525c224d0955456575f8d05bf2eb8661ee197c40f6", 1996);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (25, "LEIA", "SANTANA", "413 WOODARD SUMMIT", "8767112849", "leia.santana@yahoo.com", 2, "1967/11/2");
insert into logins (user_id, email, password_hash, salt) values (25, "leia.santana@yahoo.com", "c203ff10274ba1989f6ac19f53cfc19284090a4779180d01d750911e8bd0c4c2", 7645);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (26, "LANEY", "NICHOLSON", "221 HORNE WYND", "8764018986", "laney.nicholson@gmail.com", 2, "1989/5/4");
insert into logins (user_id, email, password_hash, salt) values (26, "laney.nicholson@gmail.com", "e8e0df7c3223c09a2ea4ed4e9136a0bc935887ad77c5076a64fc8183963acbb4", 9030);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (27, "IVA", "VU", "320 SINGLETON ÎLE", "8763966818", "iva.vu@organization.business.com", 2, "1976/9/21");
insert into logins (user_id, email, password_hash, salt) values (27, "iva.vu@organization.business.com", "9994b823468d84c964754f8ab3d105737aff59387e1f737f3bb49e427923773f", 6126);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (28, "COLTON", "CHANDLER", "179 STRONG PLAIN", "8767878422", "colton.chandler@yahoo.com", 2, "1960/4/19");
insert into logins (user_id, email, password_hash, salt) values (28, "colton.chandler@yahoo.com", "dc2f33b2a3790d02d773c14040120ac38ea7e61c1b14ea7afeab22ec5639b952", 9787);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (29, "MERCEDES", "ARNOLD", "271 CHERRY NENE", "8766731116", "mercedes.arnold@team.group.com", 2, "1968/6/1");
insert into logins (user_id, email, password_hash, salt) values (29, "mercedes.arnold@team.group.com", "7f32b92349e2aa599286df68cbb971437f2d73ee1fb94da1fbdde3103febf086", 4100);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (30, "JANESSA", "FROST", "477 MCKAY RISE", "8767387087", "janessa.frost@congress.gov.usa", 2, "1999/2/7");
insert into logins (user_id, email, password_hash, salt) values (30, "janessa.frost@congress.gov.usa", "15454d3b64a0f7be9c022f44fecadea6d1acf783185fe155c76352ed806b8ad2", 4960);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (31, "NORMA", "MADDOX", "45 VANCE HIGHLANDS", "8764419001", "norma.maddox@riot.games.co", 2, "1999/2/23");
insert into logins (user_id, email, password_hash, salt) values (31, "norma.maddox@riot.games.co", "c0c3463ccaf9949e0e8a5e2796a9269cad09413398e352943005371fbd1c2aef", 7158);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (32, "KINSLEY", "MAYER", "393 CAMACHO CARRE", "8766687192", "kinsley.mayer@canadia.gov.ca", 2, "1996/8/12");
insert into logins (user_id, email, password_hash, salt) values (32, "kinsley.mayer@canadia.gov.ca", "50c6164cc12b66acf8df774f0579e34d2e5a11ac0b8a25c1d53684b18087a2ee", 321);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (33, "ANNETTE", "PATRICK", "68 RASMUSSEN ISLAND", "8767271536", "annette.patrick@company.mail.com", 2, "1990/8/8");
insert into logins (user_id, email, password_hash, salt) values (33, "annette.patrick@company.mail.com", "4aeeff16969f7e64c9e48947b5d6d09f2efbba8570988885ea8770b682b63d05", 668);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (34, "CAYSON", "WOODARD", "202 MEZA FALL", "8768613765", "cayson.woodard@de.trash.co", 2, "1987/3/1");
insert into logins (user_id, email, password_hash, salt) values (34, "cayson.woodard@de.trash.co", "3d47e67dcc919022e1e2ba27b10a2316c54ca184348633f4c55a688d43b5b929", 6391);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (35, "ELLISON", "CUEVAS", "138 BERG CÔTE", "8765098357", "ellison.cuevas@outlook.com", 2, "1989/6/20");
insert into logins (user_id, email, password_hash, salt) values (35, "ellison.cuevas@outlook.com", "c3592649a499f3c91a54276813095bf5f1ad41a1d9b323769f3bf76d668abe70", 5104);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (36, "LORA", "BUTLER", "15 PECK STANDARD", "8761617475", "lora.butler@high_comiision.gov.uk", 2, "1975/5/25");
insert into logins (user_id, email, password_hash, salt) values (36, "lora.butler@high_comiision.gov.uk", "d71efccc43ce3fdc499a1ad5c39fcef0e7be6a57b28749136ed41446839d6d30", 3550);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (37, "DARREN", "CARTER", "460 CLEMENTS PINE", "8762203396", "darren.carter@riot.games.co", 2, "1970/10/19");
insert into logins (user_id, email, password_hash, salt) values (37, "darren.carter@riot.games.co", "a5931b724a70c7c4c2b1f616677fb204cbfc62e47b84534328a91a59ef524f68", 4173);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (38, "LESLEY", "ALI", "204 BELTRAN RUE", "8764239844", "lesley.ali@yahoo.com", 2, "1986/5/14");
insert into logins (user_id, email, password_hash, salt) values (38, "lesley.ali@yahoo.com", "3e202d09fe657f61834362b4424efe0ac7afbe43aba2906720bc5f087292f20b", 1801);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (39, "TERI", "OLIVER", "439 CHUNG QUAY", "8764228397", "teri.oliver@yahoo.com", 2, "1989/3/22");
insert into logins (user_id, email, password_hash, salt) values (39, "teri.oliver@yahoo.com", "77a06154810e64df2cdab32d30054f9ed70951fee828eaf7aa5db792013ecd1d", 9268);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (40, "CHARLEE", "SNOW", "457 CONTRERAS TAILER", "8767617844", "charlee.snow@yahoo.com", 2, "1987/5/19");
insert into logins (user_id, email, password_hash, salt) values (40, "charlee.snow@yahoo.com", "8bd5a2b70f7f04b2132a967786d2cabd8f20669a619a78dd948149160a41c879", 9519);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (41, "MICHELLE", "BRYANT", "283 WEISS PLACE", "8769510784", "michelle.bryant@live.com", 2, "1989/4/22");
insert into logins (user_id, email, password_hash, salt) values (41, "michelle.bryant@live.com", "f917a42103c77e567a396c9f78b92f31ad47a1ba3daae189b37b817f00ce2fa0", 8426);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (42, "KASSIDY", "HARRELL", "253 VAZQUEZ DELL", "8765590393", "kassidy.harrell@organization.business.com", 2, "1994/10/18");
insert into logins (user_id, email, password_hash, salt) values (42, "kassidy.harrell@organization.business.com", "cf50c8afa0bfc1b1810c1888d3155aea1bb19acf74600d4dbd7abd59522a73f9", 7719);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (43, "DEAN", "YANG", "243 FRIEDMAN MEADOW", "8766217321", "dean.yang@outlook.com", 2, "1975/9/14");
insert into logins (user_id, email, password_hash, salt) values (43, "dean.yang@outlook.com", "be75f4a0249d694d6f6fac144d9d1db0e79439fa04e15b25a1a356257273391e", 6855);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (44, "DANICA", "BOYER", "198 SOLIS RONDE", "8766730916", "danica.boyer@proton-mail.com", 2, "1983/5/15");
insert into logins (user_id, email, password_hash, salt) values (44, "danica.boyer@proton-mail.com", "129d99ec908bb79b112d96ad4d45dc33a6ec9b480bae9912ab5d5039b9ca9843", 6531);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (45, "FERN", "CANNON", "287 ESPARZA CONCESSION", "8769317957", "fern.cannon@hotmail.com", 2, "1969/3/1");
insert into logins (user_id, email, password_hash, salt) values (45, "fern.cannon@hotmail.com", "f5d53422d9f4fe97ca5dd3ee0770fa10d47e56d658c1d16db1b931e8ab3e96df", 8991);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (46, "JORDAN", "TRUJILLO", "45 AGUIRRE AVENUE", "8766800830", "jordan.trujillo@live.com", 2, "1961/2/28");
insert into logins (user_id, email, password_hash, salt) values (46, "jordan.trujillo@live.com", "ba0756efe9705a371013b5f6704ae8915f8e1bc9d159a075ee738010a67d03ec", 3524);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (47, "ALIANA", "BARRERA", "325 SANFORD WALL", "8768184677", "aliana.barrera@church.religion.com", 2, "1975/6/5");
insert into logins (user_id, email, password_hash, salt) values (47, "aliana.barrera@church.religion.com", "9625c8f3c40c66978e790b4996b60d876fef2213fa31b7368ab43ec0ccd37f3f", 4478);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (48, "REBECCA", "HANSON", "149 GOLDEN ESTATES", "8763741163", "rebecca.hanson@company.mail.com", 2, "2000/3/12");
insert into logins (user_id, email, password_hash, salt) values (48, "rebecca.hanson@company.mail.com", "ee89d6e33f7123fb0b51e557b41730218c5cb26a9e8e2cf0cc91eab4ce15c7c9", 6352);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (49, "QUINCY", "LIVINGSTON", "338 PHAN CIRCUIT", "8769984422", "quincy.livingston@gmail.com", 2, "1987/9/12");
insert into logins (user_id, email, password_hash, salt) values (49, "quincy.livingston@gmail.com", "67c5579a6c58bb984e36b59922fdc8c6960a0ee59afb1d0ceb180c6319aa9926", 8329);
insert into users (user_id, first_name, last_name, home_address, tele_num, email, clearance, dob) values (50, "MARGARITA", "BALLARD", "216 PARSONS COURSE", "8766129349", "margarita.ballard@outlook.com", 2, "1962/9/23");
insert into logins (user_id, email, password_hash, salt) values (50, "margarita.ballard@outlook.com", "1c64e1b9b429504720e5a7acee78ab78fa3f07104096f5f6807f3d3ad6ede4f6", 3516);
