drop database if exists kati ;

create database kati;
use kati;

create table ypallhlos(
	id varchar(20),
    onoma varchar(20),
    epwnymo varchar(25),
    eidikothta  varchar(20),
    bdate date,
    hlikia integer,
    thlefwno varchar(20),
    odos varchar(20),
    ari8mos integer,
    polh varchar(20),
    kostos integer,
    Hm_prosl date,
    primary key (id));
    
create table ypal_mhxanikos(
	id varchar(20),
    eth_pros integer,
    Hm_Ask_Epag date,
    primary key(id),
    CONSTRAINT foreign key(id) references ypallhlos(id));
    
create table ypal_doikhtikos(
	titlo varchar(20),
	etos_kthshs integer,
    id varchar(20),
    primary key (id),
	CONSTRAINT foreign key(id) references ypallhlos(id));

create table prostateuomena_melh(
	id varchar(10),
    onoma varchar(10),
    fulo char(1),
    hlikia integer,
    primary key(id),
    CONSTRAINT foreign key(id) references ypallhlos(id));

create table ypal_dioik_logistes(
	id varchar(10),
    ep_egg_oik_epik integer,
    primary key(id),
    CONSTRAINT foreign key(id) references ypallhlos(id));

create table ypal_doik_grammateis(
	id varchar(10),
    ar_seminariwn integer,
    primary key(id),
    CONSTRAINT foreign key(id) references ypallhlos(id));
    
create table grafeia(
	id varchar(20),
    arithmos_gr integer,
    onoma varchar(20),
    thlefwna varchar(15),
    odos varchar(15),
    arithmos integer,
    polh varchar(10),
    primary key(id,arithmos_gr),
    CONSTRAINT foreign key(id) references ypallhlos(id));
    
create table pelates(
	afm double,
    odos varchar(15),
    aritmos integer,
    TK integer,
    polh varchar(10),
    primary key(afm));
		    
create table pel_etairies(
	afm_et double,
    epwnimia varchar(15),
    primary key (afm_et),
    CONSTRAINT foreign key(afm_et) references pelates(afm));
    
create table pel_fusika_proswpa(
	afm_fus double,
    idd double,
    onoma varchar(20),
    epitheto varchar(25),
    primary key(afm_fus),
    CONSTRAINT foreign key(afm_fus) references pelates(afm));
 
create table pwlhseis_proiontwn(
	arithmos_p integer,
    hm_diek date,
    hmerominia date,
    primary key(arithmos_p));

create table diadromes(
	ar_d integer,
    afhtiria varchar(10),
    proorismos varchar(10),
    kostos float,
    timh float,
    Hm_ent date,
    diarkeia integer,
    primary key (ar_d));
    
create table autokinhta(
	ari8mos_a integer,
    hm_kukl date,
    kub integer,
    primary key (ari8mos_a));

create table aut_forthga(
	ari8mos_a integer,
    xwritikithta integer,
    primary key (ari8mos_a),
    CONSTRAINT foreign key(ari8mos_a) references autokinhta(ari8mos_a));

create table aut_epivatika(
	ari8mos_a integer,
    ar_8esewn integer,
    primary key (ari8mos_a),
	CONSTRAINT foreign key(ari8mos_a) references autokinhta(ari8mos_a));

create table e3uphretei( 
	id varchar(10),
    paravolh_h_paradosh date,
    afm double,
    ari8mos_a integer,
    primary key (paravolh_h_paradosh,afm));

create table zhtaei(
	ari8mos_gr integer,
    afm double,
    primary key (ari8mos_gr,afm));
    
create table exei(
	afm double,
    ari8mos_p integer,
    ar_d integer,
    primary key (afm,ari8mos_p,ar_d));

create table einai(
	id varchar(10),
    afm double,
    ari8mos_p integer,
    ar_d integer,
    primary key(id,afm,ari8mos_p));
    
create table pragmatopoieitai(
	ari8mos_a integer,
    ar_d integer,
    kostos float,
    primary key(ari8mos_a,ar_d,kostos));
    
alter table ypal_doikhtikos add foreign key (id) references ypallhlos(id);

alter table ypal_mhxanikos add foreign key (id) references ypallhlos(id);

alter table ypal_dioik_logistes add foreign key (id) references ypallhlos(id);

alter table ypal_doik_grammateis add foreign key (id) references ypallhlos(id);

alter table prostateuomena_melh add foreign key (id) references ypallhlos(id);

alter table e3uphretei add foreign key (id) references ypallhlos(id);

alter table e3uphretei add foreign key (ari8mos_a) references autokinhta(ari8mos_a);

alter table e3uphretei add foreign key (afm) references pelates(afm);

alter table pel_fusika_proswpa add foreign key (afm_fus) references pelates(afm);

alter table grafeia add foreign key (id) references ypal_doikhtikos(id);

alter table zhtaei add foreign key (afm) references pelates(afm);

alter table pel_etairies add foreign key (afm_et) references pelates(afm);

alter table exei add foreign key (afm) references pelates(afm);

alter table exei add foreign key (ari8mos_p) references pwlhseis_proiontwn(arithmos_p);

alter table exei add foreign key (ar_d) references diadromes(ar_d);

alter table aut_forthga add foreign key (ari8mos_a) references autokinhta(ari8mos_a);

alter table aut_epivatika add foreign key (ari8mos_a) references autokinhta(ari8mos_a);

alter table pragmatopoieitai add foreign key (ari8mos_a) references aut_forthga(ari8mos_a);

alter table pragmatopoieitai add foreign key (ar_d) references diadromes(ar_d);

alter table einai add foreign key (id) references ypallhlos(id);

alter table einai add foreign key (afm) references pelates(afm);

alter table einai add foreign key (ari8mos_p) references pwlhseis_proiontwn(arithmos_p);

alter table einai add foreign key (ar_d) references diadromes(ar_d);



insert into ypallhlos values('AM 12313','Stefanos','Hidiroglou','mhxanikos','2000-05-10',19,'6978249835','bronthsioy',22,'heraklion','1387.04','2018-01-20');
insert into ypallhlos values('AM 45654','eleni','panagoulh','dioikhtikos','2000-07-19',19,'6980984537','bagies',13,'heraklion','1050.11','2015-06-20');
insert into ypallhlos values('AM 17607','paraskeuh','papadopoylos','dioikhtikos','1969-01-22',50,'6987425654','diomidi',2,'athina','1164.13','1990-09-27');
insert into ypallhlos values('AM 43645','anna','papazogloy','dioikhtikos','1974-10-07',45,'698556673','giannikoy',5,'athina','836.08','1998-04-14');
insert into ypallhlos values('AM 14688','dhmhtrhs','roysi','mhxanikos','1960-11-22',59,'6915456538','kalokairinoy',5,'heraklion','1079.31','1995-09-01');

insert into ypal_doikhtikos values('logisths',2018,'AM 14688');
insert into ypal_doikhtikos values('logisths',1990,'AM 43645');
insert into ypal_doikhtikos values('grammateas',1980,'AM 45654');

insert into ypal_mhxanikos values('AM 12313',2018,'2014-08-11');
insert into ypal_mhxanikos values('AM 14688',2016,'2017-06-04');

insert into ypal_dioik_logistes values('AM 45654',4);
insert into ypal_dioik_logistes values('AM 43645',1);

insert into ypal_doik_grammateis values('AM 17607',15);

insert into prostateuomena_melh values('AM 45654','eleni','f',6);
insert into prostateuomena_melh values('AM 12313','takis','m',11);
insert into prostateuomena_melh values('AM 17607','iwanna','f',12);
insert into prostateuomena_melh values('AM 14688','maria','f',4);
insert into prostateuomena_melh values('AM 43645','nikos','m',16);

insert into pelates values(1178534785,'skhnhs',5,51600,'athina');
insert into pelates values(1155116611,'nikhs',12,97546,'iwannina');
insert into pelates values(1122664488,'spatioy',5,12300,'thesniki');
insert into pelates values(1196447853,'kaminia',6,65444,'drama');
insert into pelates values(1160278915,'kaloy',34,64200,'kavala');

insert into pel_fusika_proswpa values(1178534785,999,'xristina','antonioy');
insert into pel_fusika_proswpa values(1122664488,856,'zoympoylia','baritimidoy');
insert into pel_fusika_proswpa values(1155116611,878,'sofi','alioy');
insert into pel_fusika_proswpa values(1160278915,456,'marika','athanasiadoy');
insert into pel_fusika_proswpa values(1196447853,367,'xristos','tsirantonaki');

insert into grafeia values('AM 14688',13,'merimna','3456278654','aristoy',7,'athina');
insert into grafeia values('AM 45654',2,'dioikisis',9807654321,'papauanasioy',8,'athina');
insert into grafeia values('AM 43645',6,'ka8odigisis',1234567654,'aristoy',9,'athina');
    
insert into zhtaei values(3,1178534785);
insert into zhtaei values(5,1155116611);
insert into zhtaei values(3,1122664488);
insert into zhtaei values(4,1196447853);
insert into zhtaei values(10,1160278915);
    
insert into pel_etairies values(1178534785,'Α.Ε');
insert into pel_etairies values(1155116611,'Ε.Ε');
insert into pel_etairies values(1122664488,'Ο.Ε');
insert into pel_etairies values(1196447853,'Α.Ε');
insert into pel_etairies values(1160278915,'Ε.Ε');

insert into pwlhseis_proiontwn values(15,'2018-06-06','2018-06-06');
insert into pwlhseis_proiontwn values(23,'2015-05-05','2017-05-05' );
insert into pwlhseis_proiontwn values(3,'2015-01-15','2016-05-01');
insert into pwlhseis_proiontwn values(24,'2013-05-21','2019-01-06');
insert into pwlhseis_proiontwn values(1,'2011-07-09','2015-08-18');

insert into diadromes values(2,'athina','hrakleio',111.1,444.4,'2015-06-14',23.2);
insert into diadromes values(3,'xania','rethimno',50.0,222.2,'2016-04-14',1.5);
insert into diadromes values(4,'thesniki','shteia',60.2,555.5,'2017-09-19',30.4);
insert into diadromes values(5,'panormo','anwgeia',100.2,165.7,'2019-02-26',90.5);
insert into diadromes values(6,'kissamos','kolympari',30.7,148.9,'2018-12-20',1.1);

insert into exei values (1178534785,15,2);
insert into exei values (1122664488,3,4);
insert into exei values (1160278915,1,6);

insert into autokinhta values(0192,'2015-12-12',150);
insert into autokinhta values(5045,'2014-09-21',120);
insert into autokinhta values(4169,'2011-10-13',50);
insert into autokinhta values(1550,'2009-03-15',250);
insert into autokinhta values(8582,'2005-11-11',200);

insert into aut_forthga values(0192,100);
insert into aut_forthga values(5045,200);
insert into aut_forthga values(4169,550);
insert into aut_forthga values(1550,200);
insert into aut_forthga values(8582,712);

insert into aut_epivatika values(0192,2);
insert into aut_epivatika values(5045,4);
insert into aut_epivatika values(4169,5);
insert into aut_epivatika values(1550,5);
insert into aut_epivatika values(8582,4);

insert into pragmatopoieitai values(0192,2,121.3);
insert into pragmatopoieitai values(5045,4,154.6);
insert into pragmatopoieitai values(4169,5,321.1);
insert into pragmatopoieitai values(1550,5,165.4);
insert into pragmatopoieitai values(8582,4,256.7);

insert into einai values('AM 12313',1178534785,15,2);
insert into einai values('AM 45654',1160278915,23,4);
insert into einai values('AM 17607',1155116611,3,5);
insert into einai values('AM 43645',1122664488,24,6);
insert into einai values('AM 14688',1196447853,1,5);

insert into e3uphretei values('AM 12313','2017-06-12',1178534785,0192);
insert into e3uphretei values('AM 45654','2016-04-29',1155116611,5045);
insert into e3uphretei values('AM 17607','2016-10-11',1122664488,4169);
insert into e3uphretei values('AM 43645','2012-03-03',1196447853,1550);
insert into e3uphretei values('AM 14688','2019-12-12',1160278915,8582);

SELECT * FROM diadromes;
SELECT * FROM ypallhlos;

UPDATE ypallhlos, prostateuomena_melh
SET kostos = kostos + kostos * 0.1
WHERE Hm_prosl < '1999-01-01' AND ypallhlos.id = prostateuomena_melh.id;


DELETE FROM kati.diadromes
WHERE Hm_ent < '2017-11-22'; 
                                                                     
SELECT * FROM diadromh;
SELECT * FROM ypallhlos;

select paravolh_h_paradosh
from ypallhlos,pelates,e3uphretei,pel_fusika_proswpa
where ((ypallhlos.onoma='dhmhtrhs'and ypallhlos.epwnymo='roysi')
or (pel_fusika_proswpa.onoma='manos' and pel_fusika_proswpa.epitheto='papas'))
and e3uphretei.id=ypallhlos.id and e3uphretei.afm=pelates.afm and
pelates.afm=pel_fusika_proswpa.afm_fus;

select onoma,epwnymo
from ypallhlos  
where polh='heraklion' and bdate>'1970-01-01' and bdate<'1980-12-31';

select onoma,bdate
from ypallhlos
where polh='xania' or polh='rethimno';

select epwnimia, exei.ar_d, diadromes.ar_d
from pelates,pel_etairies,exei,diadromes
where Hm_ent>'2018-01-01' and Hm_ent<'2018-12-31'
and pelates.afm=pel_etairies.afm_et and exei.afm=pel_etairies.afm_et and exei.ar_d=diadromes.ar_d;