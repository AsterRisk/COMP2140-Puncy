drop database if exists puncys_store;
create database puncys_store;
use puncys_store;

drop table if exists users;
drop table if exists logins;
drop table if exists orders;
drop table if exists measurements;

create table users
(
    user_id int not null unique,
    first_name varchar(15) not null,
    last_name varchar(15) not null,
    tele_num varchar (15) unique,
    address varchar (50),
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
    order_id int not null unique,
    state varchar(10) not null,
    measurements int,
    date_placed Date not null,
    due_date Date,
    est_cost NUMERIC,
    primary key (order_id)
);

create table measurements
(
    measurement_id int not null unique,
    user_id int not null,
    job_type varchar (10) not null,
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

insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (1, "AVI", "MORALES", "327 CONLEY ROW", "8761530239", "avi.morales@company.mail.com", 2);
insert into logins (user_id, email, password_hash, salt) values (1, "avi.morales@company.mail.com", "42ac647047724ce0db3248d6b89200d4fd2c5182a3662c46560ef3c7dbb03d66", 7450);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (2, "BRANDY", "DYER", "152 CORTEZ ISLE", "8769303313", "brandy.dyer@high_comiision.gov.uk", 2);
insert into logins (user_id, email, password_hash, salt) values (2, "brandy.dyer@high_comiision.gov.uk", "8b2064a113c128386305519a165170d809782cc216a1b006e0007eb0fded929d", 5315);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (3, "JULIETTE", "GARDNER", "370 VALENCIA STROLL", "8762984658", "juliette.gardner@team.group.com", 2);
insert into logins (user_id, email, password_hash, salt) values (3, "juliette.gardner@team.group.com", "b74d9463b3bd8e3a8ce8059abd976eee7901d364fdda138bac656d6344b9b1f1", 5069);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (4, "HAROLD", "ROBINSON", "224 DILLON SUBDIVISION", "8760723984", "harold.robinson@riot.games.co", 2);
insert into logins (user_id, email, password_hash, salt) values (4, "harold.robinson@riot.games.co", "0aed17f273afa1b4f01f0cfdf900dad5c76bb930d751412fb28592bd8e62689d", 4020);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (5, "MADELYN", "DUARTE", "199 CUEVAS PROMENADE", "8769596601", "madelyn.duarte@school.address.edu", 2);
insert into logins (user_id, email, password_hash, salt) values (5, "madelyn.duarte@school.address.edu", "d4ef8f91265e3078ac2cb49d58733bb796eb5c4d9cb0fa2ce6fd7c610e84750c", 7486);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (6, "NALANI", "FRIEDMAN", "24 PARRISH RUE", "8765355068", "nalani.friedman@canadia.gov.ca", 2);
insert into logins (user_id, email, password_hash, salt) values (6, "nalani.friedman@canadia.gov.ca", "52adec9ecb2948668ced6175d4e1a2fe94c24456a63a240c8265bdc98ebd8e2b", 9433);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (7, "JAZIEL", "CONLEY", "216 MORTON FIELD", "8761900045", "jaziel.conley@high_comiision.gov.uk", 2);
insert into logins (user_id, email, password_hash, salt) values (7, "jaziel.conley@high_comiision.gov.uk", "f1712a4790229f9a8324ae3e20ec716ee99fb3e0fde431a7a250745bec40d5ce", 8427);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (8, "CLAYTON", "LOVE", "16 ANTHONY C�TE", "8763814840", "clayton.love@organization.business.com", 2);
insert into logins (user_id, email, password_hash, salt) values (8, "clayton.love@organization.business.com", "5f1a04dd0c3f6e3f0cdc8f87fd7a2cf57d719a97e21f5d021dd9f0ecf6b13298", 3702);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (9, "KATIE", "FERGUSON", "183 WALTER OAKS", "8761119117", "katie.ferguson@outlook.com", 2);
insert into logins (user_id, email, password_hash, salt) values (9, "katie.ferguson@outlook.com", "78e701ddcec22bf818cfa0b88bca22fabf4971929a3403cf9947b9ef89f70eae", 7063);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (10, "BRYCE", "QUINN", "103 KIRBY PRIVATE", "8762339627", "bryce.quinn@company.mail.com", 2);
insert into logins (user_id, email, password_hash, salt) values (10, "bryce.quinn@company.mail.com", "bb386506266d6d9c6ea2c06bc53bc0932f9d7124523b19261f381313e05380a8", 5494);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (11, "BROOKLYN", "BRANDT", "92 CRANE SQUARE", "8762579991", "brooklyn.brandt@school.address.edu", 2);
insert into logins (user_id, email, password_hash, salt) values (11, "brooklyn.brandt@school.address.edu", "c4596e20a25f354c82834ba9053937ecf9f09e17b26ffa35bfcf7b40ffa82a84", 5477);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (12, "DIANNE", "STEVENS", "492 SPARKS PATH", "8763378298", "dianne.stevens@high_comiision.gov.uk", 2);
insert into logins (user_id, email, password_hash, salt) values (12, "dianne.stevens@high_comiision.gov.uk", "8957b9f6264078d700c0f86713b374b1b88edc180aec425ee4caeabf04b248b2", 5567);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (13, "ARTURO", "HO", "381 JOHNS GARDENS", "8767426891", "arturo.ho@yahoo.com", 2);
insert into logins (user_id, email, password_hash, salt) values (13, "arturo.ho@yahoo.com", "2befe290308603b0790f05c2c1cfbd05321dbfc2d3ff3c5ad071f914d6d0f44b", 2966);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (14, "ROMAN", "MURRAY", "66 RANGEL MOUNTAIN", "8767964641", "roman.murray@outlook.com", 2);
insert into logins (user_id, email, password_hash, salt) values (14, "roman.murray@outlook.com", "ccb2b7975acacb2d363f8bd6e9a427c2be740652bc0bbb6c10074c05f368b53f", 2692);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (15, "NELSON", "SWEENEY", "232 BERNARD LOOP", "8766068654", "nelson.sweeney@live.com", 2);
insert into logins (user_id, email, password_hash, salt) values (15, "nelson.sweeney@live.com", "551ee76bf7147115ae265a1b3c37ce8eff1efa599046612d3a6372146752e618", 9648);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (16, "MCKENNA", "CANTRELL", "276 PARK TRACK", "8764663732", "mckenna.cantrell@high_comiision.gov.uk", 2);
insert into logins (user_id, email, password_hash, salt) values (16, "mckenna.cantrell@high_comiision.gov.uk", "f2c1aacdbdac1be9761c38d17ecfd56e99f8a6d871b8b3c35c139127a6d126ec", 7774);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (17, "ADRIENNE", "KNIGHT", "360 NIELSEN COURS", "8768739411", "adrienne.knight@gmail.com", 2);
insert into logins (user_id, email, password_hash, salt) values (17, "adrienne.knight@gmail.com", "37f05a75c73f9f741d6176a18f4a796d3d13c7e9eea2ef770f2c103aa52961ec", 4947);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (18, "KASSANDRA", "VALENZUELA", "423 DYER ALLEY", "8763051737", "kassandra.valenzuela@hotmail.com", 2);
insert into logins (user_id, email, password_hash, salt) values (18, "kassandra.valenzuela@hotmail.com", "67fc3ad95c1e243bafba1fe43ed0ec53feea02c6ba735b52b284ff60df7a4607", 1276);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (19, "MINA", "PEARSON", "480 MACIAS SHOAL", "8768346893", "mina.pearson@yahoo.com", 2);
insert into logins (user_id, email, password_hash, salt) values (19, "mina.pearson@yahoo.com", "f8c04379a3bfb54b9010974ce52b2c306ff0ca33cd4f1190ee3acab1efd06d4a", 9107);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (20, "ALI", "DURAN", "414 SHIELDS MONTEE", "8769039868", "ali.duran@proton-mail.com", 2);
insert into logins (user_id, email, password_hash, salt) values (20, "ali.duran@proton-mail.com", "fe0c204464fc3ba16beeed4023a4af5945a6a4d3e28ed316b33ec4182abb20e4", 7911);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (21, "ALYSSA", "REILLY", "51 ONEAL ANNEX", "8762501381", "alyssa.reilly@organization.business.com", 2);
insert into logins (user_id, email, password_hash, salt) values (21, "alyssa.reilly@organization.business.com", "bbbfe4bb436c6090bd8a59839efaebf5708c37c82711dc02437c845902f6263b", 8007);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (22, "NICKOLAS", "GALVAN", "478 LUNA GARDENS", "8765494763", "nickolas.galvan@hotmail.com", 2);
insert into logins (user_id, email, password_hash, salt) values (22, "nickolas.galvan@hotmail.com", "406ac035522128e8602eb207d045ab73c9ea8ce8cc730327a71684f313cece52", 8511);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (23, "JANA", "MCDANIEL", "244 MAPLE BOULEVARD", "8765923175", "jana.mcdaniel@live.com", 2);
insert into logins (user_id, email, password_hash, salt) values (23, "jana.mcdaniel@live.com", "59e6f0c2cd98e016f770d4b904809d5477fdb532de09d3e1e0dd3ae503a776fb", 4884);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (24, "MANUEL", "WALL", "314 MAYO BEND", "8762073306", "manuel.wall@live.com", 2);
insert into logins (user_id, email, password_hash, salt) values (24, "manuel.wall@live.com", "6b7c532300519e74e39b598137f09ef28457ca5ab851d74461d5ce08ca9684b3", 1866);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (25, "ROCHELLE", "BRIDGES", "441 XIONG ALLEY", "8767012149", "rochelle.bridges@live.com", 2);
insert into logins (user_id, email, password_hash, salt) values (25, "rochelle.bridges@live.com", "db6dfe52901fa929d53ebb3392cfeecd2a316bbb775d64d6ba50ad03cc9ff869", 2678);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (26, "CRISTIANO", "ZIMMERMAN", "350 DEJESUS COURSE", "8766598747", "cristiano.zimmerman@riot.games.co", 2);
insert into logins (user_id, email, password_hash, salt) values (26, "cristiano.zimmerman@riot.games.co", "f597faddacdbcd487292a58053affb67289aa82365180f741106fc8cd4c50101", 7644);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (27, "HEATHER", "DAY", "481 SINGH CLUB", "8763395857", "heather.day@riot.games.co", 2);
insert into logins (user_id, email, password_hash, salt) values (27, "heather.day@riot.games.co", "de43da8a1da7ec5e053900c2d70b4fc14b0dee875fc5db9ed9bb74e96181fb46", 3055);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (28, "KYLEE", "BRADFORD", "1 BENJAMIN TRACE", "8767561487", "kylee.bradford@gmail.com", 2);
insert into logins (user_id, email, password_hash, salt) values (28, "kylee.bradford@gmail.com", "d95fbdc314fdbbb29efc21e145035a6658468ea0d9974db83c713deb9e49241f", 6254);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (29, "KARINA", "BURTON", "497 DICKSON COUR", "8764022692", "karina.burton@gmail.com", 2);
insert into logins (user_id, email, password_hash, salt) values (29, "karina.burton@gmail.com", "bab958a89178c6de7457eb5d1c995cc1887845b5608b83b760836d654ab201b6", 6306);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (30, "MOHAMED", "BURTON", "435 KRUEGER RIGHT", "8767558826", "mohamed.burton@gmail.com", 2);
insert into logins (user_id, email, password_hash, salt) values (30, "mohamed.burton@gmail.com", "2a8922194f7b3837d662a80e68df1198dc5293868965f518e1a2c7fbbdb425fc", 2027);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (31, "CARLOS", "POLLARD", "482 ELM PASS", "8766888954", "carlos.pollard@de.trash.co", 2);
insert into logins (user_id, email, password_hash, salt) values (31, "carlos.pollard@de.trash.co", "50f066cfb8f5c61c58086f142a7cbb723f0c0ef512c6125c9677ef830eaa9225", 6076);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (32, "MACY", "HENDERSON", "78 ROMAN ROUTE", "8762589337", "macy.henderson@church.religion.com", 2);
insert into logins (user_id, email, password_hash, salt) values (32, "macy.henderson@church.religion.com", "0406d2d6f1603bee41822abea1fb17aa42c13ffc6d1f8ff3948a9035fb79f8dc", 3086);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (33, "EMILIO", "LOVE", "408 DURHAM PRAIRIE", "8761351210", "emilio.love@parliament.gov.jm", 2);
insert into logins (user_id, email, password_hash, salt) values (33, "emilio.love@parliament.gov.jm", "d010e19c20d1aa7872953def037d8ebe38b31f2eaa8191a6e88f033c7f478fa6", 2135);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (34, "JOANNA", "CALHOUN", "37 ZAMORA FOREST", "8769759981", "joanna.calhoun@yahoo.com", 2);
insert into logins (user_id, email, password_hash, salt) values (34, "joanna.calhoun@yahoo.com", "52d08ae795e857b469851afab3a60d953160879e10c2a9fa05105eca93a264be", 2032);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (35, "VIENNA", "WOODWARD", "407 NICHOLSON LOAF", "8763939965", "vienna.woodward@parliament.gov.jm", 2);
insert into logins (user_id, email, password_hash, salt) values (35, "vienna.woodward@parliament.gov.jm", "0a7bd7b390e32642cfa935990385148a1012986e82ded9776e0d5a38fd51e6e5", 4174);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (36, "JILL", "HAWKINS", "201 VIEW FALL", "8767591338", "jill.hawkins@parliament.gov.jm", 2);
insert into logins (user_id, email, password_hash, salt) values (36, "jill.hawkins@parliament.gov.jm", "e43cc9f5baffe64ae7dffc5376f0450641e017aa3de7c12c44540b749e26582b", 9601);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (37, "ELI", "SCHMIDT", "412 LAMB STANDARD", "8769123528", "eli.schmidt@parliament.gov.jm", 2);
insert into logins (user_id, email, password_hash, salt) values (37, "eli.schmidt@parliament.gov.jm", "c0fd906afa9b718b84fb2d36ee54ee3f5090330975e1c8b245881962fa2bb150", 6012);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (38, "ELISEO", "BURNS", "151 REYNA SKYWAY", "8762768592", "eliseo.burns@congress.gov.usa", 2);
insert into logins (user_id, email, password_hash, salt) values (38, "eliseo.burns@congress.gov.usa", "13b2b686883d14027f9b0e8f7ce181a883ed66a2b18fd1575787d53cdd06bc6b", 917);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (39, "SKYLER", "PHAN", "195 HARDIN SHOAL", "8761668578", "skyler.phan@canadia.gov.ca", 2);
insert into logins (user_id, email, password_hash, salt) values (39, "skyler.phan@canadia.gov.ca", "b0b403bc0bbe943a9087c2f373e069406f69d7f8fa0fddbadaa1757477c6cc19", 2929);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (40, "MARYAM", "HARDY", "310 SERRANO DAM", "8760735801", "maryam.hardy@riot.games.co", 2);
insert into logins (user_id, email, password_hash, salt) values (40, "maryam.hardy@riot.games.co", "2d0c32c8e1b44824755e8cd62d74989565c6667d6a60722b3c9a08e8466ce2ba", 9305);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (41, "AMIRA", "VAUGHN", "69 MONTOYA LANE", "8760280809", "amira.vaughn@school.address.edu", 2);
insert into logins (user_id, email, password_hash, salt) values (41, "amira.vaughn@school.address.edu", "eaebd7a7cb86ab846f92bb4a787df714e9d45626d9dec99df50e4b02f33b77d7", 1241);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (42, "KEENAN", "SHEPHERD", "7 DEJESUS FLAT", "8769817202", "keenan.shepherd@hotmail.com", 2);
insert into logins (user_id, email, password_hash, salt) values (42, "keenan.shepherd@hotmail.com", "98051b4aea4632039f69c5d2582186c420af9c7fbe417d2167c268cc8c02d8ee", 6996);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (43, "CHRISTI", "AVERY", "80 HODGE OVAL", "8765179451", "christi.avery@proton-mail.com", 2);
insert into logins (user_id, email, password_hash, salt) values (43, "christi.avery@proton-mail.com", "8be6472c9207a818c70595d88fc9222234223a14a76a3757762eb47117558184", 7524);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (44, "BRIAR", "ANTHONY", "276 MCBRIDE LAKE", "8768795081", "briar.anthony@congress.gov.usa", 2);
insert into logins (user_id, email, password_hash, salt) values (44, "briar.anthony@congress.gov.usa", "0cfeaaa8559590f5c1f46c4322273bebd44f84976695549ff07cf2afe4fee185", 5565);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (45, "GERARDO", "TRUJILLO", "387 RIVERS TOUR", "8762406810", "gerardo.trujillo@canadia.gov.ca", 2);
insert into logins (user_id, email, password_hash, salt) values (45, "gerardo.trujillo@canadia.gov.ca", "4aba14c14917de715f9b4d17cd76422dba5a23d1c7c726edc159179e0f268178", 9509);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (46, "KAIA", "BOOTH", "85 GAINES BRANCH", "8762417841", "kaia.booth@yahoo.com", 2);
insert into logins (user_id, email, password_hash, salt) values (46, "kaia.booth@yahoo.com", "4aae76bccc84d05863d8da0f8233a503bc3a0f896c30569a0c3756ceca56d4dd", 6005);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (47, "ZAIRE", "COLLINS", "253 WHITAKER STREET", "8767959828", "zaire.collins@outlook.com", 2);
insert into logins (user_id, email, password_hash, salt) values (47, "zaire.collins@outlook.com", "f58f2743378da25ca06d9ef2869d51bb4fedfddbcbe36226022fabdf5cb1c99f", 594);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (48, "LUCIANO", "DONOVAN", "71 KIRK PLACEWAY", "8764604975", "luciano.donovan@church.religion.com", 2);
insert into logins (user_id, email, password_hash, salt) values (48, "luciano.donovan@church.religion.com", "594d80442bc8279a1c67cd1a18938f7e81e6c29c9264758c7d27af0b1598dbc5", 3271);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (49, "JAMAL", "CONLEY", "482 ESPARZA STREET", "8765629579", "jamal.conley@yahoo.com", 2);
insert into logins (user_id, email, password_hash, salt) values (49, "jamal.conley@yahoo.com", "5c0a63d3f0356487bef90c9d2fed17bb408cfab3f301a3349d0ffbd411393adc", 8550);
insert into users (user_id, first_name, last_name, address, tele_num, email, clearance) values (50, "CORNELIA", "HOLLOWAY", "144 BRANDT STREAM", "8768261801", "cornelia.holloway@company.mail.com", 2);
insert into logins (user_id, email, password_hash, salt) values (50, "cornelia.holloway@company.mail.com", "e8494237b4b2da25ea988cf2c44bb28d7e7fde2dc13fb9e779b92c005a3e2298", 3597);
