-- *********************************************
-- * SQL MySQL generation                      
-- *--------------------------------------------
-- * DB-MAIN version: 11.0.2              
-- * Generator date: Sep 14 2021              
-- * Generation date: Tue Mar 29 14:40:23 2022 
-- * LUN file: F:\SSD\Pratique\Projet\P_042\DB-Main_Smartphone.lun 
-- * Schema: Smartphone_MLD 
-- ********************************************* 


-- Database Section
-- ________________ 


CREATE DATABASE IF NOT EXISTS db_Smartphones DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci; 

CREATE USER IF NOT EXISTS 'dbUser_Smartphones'@'localhost' IDENTIFIED BY '.Etml-';
GRANT SELECT, INSERT, UPDATE, DELETE ON `db_Smartphones`.* TO 'dbUser_Smartphones'@'localhost';


-- Tables Section
-- _____________ S

create table Choisir (
     idCommande int(11) NOT NULL,
     idPhone int(11) NOT NULL,
     constraint ID_Choisir_ID primary key (idCommande, idPhone));

create table t_client (
     idClient int(11) NOT NULL,
     cliName varchar(50) not null,
     cliFirstName varchar(50) not null,
     cliAdresse varchar(30) not null,
     cliPhone int(11) NOT NULL,
     constraint ID_t_client_ID primary key (idClient));

create table t_commande (
     idCommande int(11) NOT NULL,
     comNumber int(11) NOT NULL,
     comDate date NOT NULL DEFAULT '0000-00-00',
     idClient int(11) NOT NULL,
     constraint ID_t_commande_ID primary key (idCommande));

create table t_phone (
     idPhone int(11) NOT NULL,
     phoName varchar(25) not null,
     phoBrand varchar(25) not null,
     phoColor varchar(20) not null,
     phoOs varchar(10) not null,
     phoSize int(11) NOT NULL,
     phoCpu varchar(50) not null,
     phoStorage int(11) not null,
     phoPriceMSRP decimal(7,2) not null,
	phoPrice decimal(7,2) not null,
     phoDefinition varchar(15) not null,
     phoScreenSize decimal(2,1) not null,
     phoCores int(11) not null,
     phoAutonomy int(11) not null,
     phoRam int(11) not null,
     phoScreenTechnology varchar(10) not null,
     phoConnectivity int(11) not null,
     phoCameraQuality int(11) not null,
     constraint ID_t_phone_ID primary key (idPhone));
-- Constraints Section
-- ___________________ 

alter table Choisir add constraint FKCho_t_p_FK
     foreign key (idPhone)
     references t_phone (idPhone);

alter table Choisir add constraint FKCho_t_c
     foreign key (idCommande)
     references t_commande (idCommande);

-- Not implemented
-- alter table t_commande add constraint ID_t_commande_CHK
--     check(exists(select * from Choisir
--                  where Choisir.idCommande = idCommande)); 

alter table t_commande add constraint FKpasser_FK
     foreign key (idClient)
     references t_client (idClient);


-- Index Section
-- _____________ 

create unique index ID_Choisir_IND
     on Choisir (idCommande, idPhone);

create index FKCho_t_p_IND
     on Choisir (idPhone);

create unique index ID_t_client_IND
     on t_client (idClient);

create unique index ID_t_commande_IND
     on t_commande (idCommande);

create index FKpasser_IND
     on t_commande (idClient);

create unique index ID_t_phone_IND
     on t_phone (idPhone);

INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (1,'Apple','iPhone 13 PRO MAX',128,'iOS 15','Green','Apple A15 Bionic','1 259.00 CHF','1 229.00 CHF','1284x2778',6.7,6,4352,6,'Super Retina XDR OLED',5,12);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (2,'Apple','iPhone 13',128,'iOS 15','Blue','Apple A15 Bionic','1 029.00 CHF','769.00 CHF','1170x2532',6.1,6,3227,4,'Super Retina XDR OLED',5,12);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (3,'Apple','iPhone 12 PRO MAX',128,'iOS 14','Gray','Apple A14 Bionic','1 259.00 CHF','1 177.00 CHF','1284x2778',6.7,6,3689,6,'Super Retina XDR OLED',5,12);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (4,'Apple','iPhone 12',64,'iOS 14','Blue','Apple A14 Bionic','935.00 CHF','742.00 CHF','1170x2532',6.1,6,2815,4,'Super Retina XDR OLED',5,12);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (5,'Apple','iPhone 11 PRO MAX',64,'iOS 13','Gold','Apple A13 Bionic','1 259.00 CHF','1 249.00 CHF','1242x2688',6.5,6,3969,4,'OLED',4,12);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (6,'Apple','iPhone 11',64,'iOS 13','purple','Apple A13 Bionic','809.00 CHF','549.00 CHF','828x1792',6.1,6,3110,4,'IPS LCD',4,12);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (7,'Apple','iPhone 8',64,'iOS 11','Silver','Apple A11 Bionic','820.00 CHF','250.00 CHF','750x1334',4.7,6,1821,4,'LED-backlit IPS LCD"',4,12);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (8,'Samsung','Galaxy Note20',128,'Android 10 Q','gray','Exynos 990','1 073.00 CHF','715.00 CHF','1080x2400',6.7,8,4300,8,'AM-OLED',5,64);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (9,'Samsung','Galaxy S22',64,'Android 10 Q','Phantom White','Exynos 2200','879.00 CHF','791.95 CHF','2340x1080',6.1,8,3700,8,'AM-OLED',5,50);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (10,'Samsung','Galaxy Z Flip 3',128,'Android 11','Cream','Qualcomm Snapdragon 888','1 049.00 CHF','639.00 CHF','2640x1080',6.7,8,3300,8,'AM-OLED',5,12);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (11,'Samsung','S22+',128,'Android 12','Green','Samsung Exynose 2200','1 079.00 CHF','971.00 CHF','2340x1080',6.6,8,3700,8,'Dynamic AMOLED 2X',5,16);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (12,'Samsung','S21+',128,'Android 11','Silver','Exynos 2100','1 035.00 CHF','697.00 CHF','2400x1080',6.2,8,4000,8,'Dynamic AMOLED 2X',5,12);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (13,'Samsung','Z Fold 3',256,'Android 11','Black','Snapdragon 888','1 899.00 CHF','1 227.00 CHF','2208x1768',7.6,8,4400,12,'Foldable Dynamic AMOLED',5,12);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (14,'Samsung','A71',128,'Android 10 Q','White','Snapdragon 730','399.00 CHF','379.00 CHF','2400x1080',6.7,8,4500,8,'Super AMOLED Plus',5,64);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (15,'Xiaomi','Poco M4 Pro',128,'Android 11','Blue','Mediatek Dimensity 810','293.90 CHF','199.00 CHF','2400x1080',6.6,8,5000,6,'LCD IPS',4,50);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (16,'Google','Pixel 5a',128,'Android 12','Mostly black','Snapdragon 765G','599.00 CHF','599.00 CHF','2400x1080',6.3,8,4680,6,'OLED',5,13);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (17,'Google','Pixel 4a',128,'Android 10 Q','Black','Snapdragon 730G','399.00 CHF','359.00 CHF','1080x2340',5.8,8,3140,6,'OLED',5,13);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (18,'Xiaomi','Redmi Note 10S',128,'Android 10','Starlight Purple','Mediatek Helio G95','417.00 CHF','220.00 CHF','2400x1080',6.43,6,3140,8,'OLED',5,16);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (19,'Mircosoft','Surface Duo 2',128,'Android 11','Obsidian','Snapdragon 730G','1 616.00 CHF','1 522.00 CHF','2688x1892',8.3,8,4449,8,'AMOLED',5,12);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (20,'Mircosoft','Surface Duo',64,'Android 10 Q','Black','Snapdragon 855','701.00 CHF','858.00 CHF','2700x1800',8.1,8,3577,6,'AMOLED',5,11);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (21,'Motorola','Moto G31',128,'Android 11','Mineral grey','Mediatek Helio G85','216.00 CHF','211.00 CHF','2400x1080',6.4,8,5000,4,'AMOLED',5,48);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (22,'OnePlus','Nord CE 5G',128,'Android 11','Silver ray','Qualcomm Snapdragon 750G','398.00 CHF','348.00 CHF','2400x1080',6.43,8,4500,6,'Fluid AMOLED',5,64);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (23,'Xiaomi','CC11',128,'Android 11','Blue','Qualcomm Snapdragon 778G','399.00 CHF','322.00 CHF','2400x1080',6.55,8,4250,8,'OLED',5,16);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (24,'Xiaomi','Black Shark 4S',128,'Android 11','Mirror Black','Qualcomm Snapdragon 870','659.00 CHF','578.00 CHF','1080x2400',6.67,8,4500,12,'Super AMOLED',5,48);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (25,'OnePlus','10 Pro',128,'Android 11','Volcanic Black','Qualcomm Snapdragon 720G','998.00 CHF','899.00 CHF','1440x3216',6.7,8,5000,8,'LTPO2 Fluid AMOLED',5,48);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (26,'Huawei','P20 Lite',64,'Android 8.0 Oreo','Platinum gold','HiSilicon Kirin 659','399.90 CHF','373.00 CHF','1080x2280',5.8,8,3000,4,'LTPS IPS LCD',4,16);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (27,'OnePlus','Nord 2 5G',128,'Android 11','Gray sierra','Qualcomm Snapdragon 750G','429.00 CHF','344.00 CHF','1080x2400',6.43,8,4500,12,'Fluid AMOLED',4,50);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (28,'Samsung','Galaxy A13',128,'Android 11','White','Mediatek Dimensity 810','199.00 CHF','179.00 CHF','1080x2408',6.6,8,5000,6,'AMOLED',4,64);
INSERT INTO t_phone(idPhone,phoBrand,phoName,phoStorage,phoOs,phoColor,phoCpu,phoPriceMSRP,phoPrice,phoDefinition,phoScreenSize,phoCores,phoAutonomy,phoRam,phoScreenTechnology,phoConnectivity,phoCameraQuality) VALUES (29,'Motorola','Moto E30',32,'Android 11','Digital blue','Unisoc Tiger T700','199.00 CHF','134.00 CHF','720x1600',6.5,8,5000,2,'IPS LCD',4,48);

