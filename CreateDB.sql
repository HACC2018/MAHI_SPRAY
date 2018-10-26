
Create table FARMER
(
account		int primary,
password	varchar2(10),
name		Varchar2(30),
address1	varchar2(30),
address2	varchar2(30),
city		varchar2(20),
state		varchar2(2),
zipcode		varchar2(10),
email		varchar2(30)
)

Create table PESTCERTIF
(
certifnum	int primary,
account		int,
workerid	int,
Pesticide	varchar2(30),
method		varchar2(125),
dateissued	date,
dateexpires	date,
)

Create table LOCATION
(
localid		int,
account		int,
address1	varchar2(30),
address2	varchar2(30),
city		varchar2(20),
state		varchar2(2),
acreage		int
)
create index LOCATIONIDX unique on LOCATION
( localid, account)


Create table FIELD
(
fieldid		int 
localid		int,
account		int,
acreage		int,
shape		varchar2(50),  
/* shape could contain data that allows screen-drawing */
)
create index FIELDIDX unique on FIELD
( fieldid, localid, account)

create table CROP
(
cropid		int,
fielid		int,
localid		int,
account		int,
croptype	varchar2(20),
planted		date,
harvested	date
)
create index CROPIDX unique on CROP
( cropid, fieldid, localid, account)

create table PESTAPPLY
(
transactid	int,
cropid		int,
fielid		int,
localid		int,
account		int,
pesttype	varchar2(30),
pesticide	varchar2(30),
method		varchar2(125),
worker		id,
Applied		date
)
create index PESTAPPLYIDX unique on PESTAPPLY
( transactid, cropid, fieldid, localid, account)