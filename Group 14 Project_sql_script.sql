create database p;
use p;

create table Charity_Emp
(
	EID varchar(20) Not null,
    E_Name varchar(45),
    E_Password varchar(45),
    E_Phone varchar(45),
    E_Task varchar(45),
    Status varchar(45),
    primary key(EID)
);
insert into Charity_Emp values('ce1','John','john123','1234567890','Donation Collection','Active'),
							('ce2','Emily','emily456','9876543210','Donor Relations','Active'),
                            ('ce3','David','david789','5555434440','Donation Distribution','Active'),
                            ('ce4','Sara','sarapass','9823467340','Volunteer Management','Inctive'),
                            ('ce5','Michael','michael123','1112223333','Event Coordination','Active'),
                            ('ce6','Jessica','jessica789','4445556566','Fundraising','Active'),
                            ('ce7','Cristopher','crispass','9999823476','Marketing and Communications','Active'),
                            ('ce8','Leo','leo357','7538904234','Social Media Management','Active'),
                            ('ce9','Olivia','olivia456','7778099093','Grant Writing','Active'),
                            ('ce10','Tokyo','tokyo135','8095623489','Volunteer Coordination','Active');
create table Admin
(
	Admin_ID varchar(20) Not null,
    A_UserName varchar(45),
    A_Password varchar(45),
    EID varchar(20),
    primary key(Admin_ID),
    foreign key (EID) references Charity_Emp(EID)
);
insert into Admin values('a1','adm1','passadm1','ce1'),
						('a2','adm2','passadm2','ce2'),
                        ('a3','adm3','passadm3','ce3'),
                        ('a4','adm4','passadm4','ce4'),
                        ('a5','adm5','passadm5','ce5'),
                        ('a6','adm6','passadm6','ce6'),
                        ('a7','adm7','passadm7','ce7'),
                        ('a8','adm8','passadm8','ce8'),
                        ('a9','adm9','passadm9','ce9'),
                        ('a10','adm10','passadm10','ce10');
create table Needy_people
(
	National_ID varchar(45) Not null,
    N_Name varchar(45),
    N_Phone varchar(45),
    N_Password varchar(45),
    Location varchar(45),
    Family_Member varchar(45),
    Income varchar(45),
    EID varchar(20),
    Admin_ID varchar(20),
    primary key(National_ID),
    foreign key (EID) references Charity_Emp(EID),
    foreign key (Admin_ID) references Admin(Admin_ID)
);
insert into Needy_people values('n1','Jack','1234876591','jack123','City A','4','1200','ce1','a1'),
							('n2','Anna','9871326450','anna967','City B','2','800','ce2','a2'),
                            ('n3','Danny','8952347612','danny579','City C','3','1500','ce3','a3'),
                            ('n4','Sana','8238594672','sana777','City A','1','600','ce4','a4'),
                            ('n5','Micky','9923658740','passmicky','City B','5','800','ce5','a5'),
                            ('n6','Jenny','9835784621','jenny459','City C','2','1000','ce6','a6'),
                            ('n7','Denver','7021334587','den795','City A','4','1400','ce7','a7'),
                            ('n8','Berlin','9821653490','bern647','City B','3','1200','ce8','a8'),
                            ('n9','Arturo','9734985123','arturo987','City C','2','900','ce9','a9'),
                            ('n10','Maria','5553279836','passm555','City A','6','2000','ce10','a10');
create table Donation_Boy
(
	DID varchar(45) Not null,
    Status varchar(45),
    Location varchar(45),
    EID varchar(20),
    Admin_ID varchar(20),
    primary key(DID),
    foreign key (EID) references Charity_Emp(EID),
    foreign key (Admin_ID) references Admin(Admin_ID)
);
insert into Donation_Boy values('db1','Active','City A','ce1','a1'),
							('db2','Active','City B','ce2','a2'),
                            ('db3','Active','City C','ce3','a3'),
                            ('db4','Active','City A','ce4','a4'),
                            ('db5','Active','City B','ce5','a5'),
                            ('db6','Active','City C','ce6','a6'),
                            ('db7','Active','City A','ce7','a7'),
                            ('db8','Active','City B','ce8','a8'),
                            ('db9','Active','City C','ce9','a9'),
                            ('db10','Active','City A','ce10','a10');
create table Donation
(
	DID varchar(45) Not null,
    D_Type varchar(45),
    EID varchar(20),
    primary key(DID),
    foreign key (EID) references Charity_Emp(EID)
);
insert into Donation values('d1','Money','ce1'),
						('d2','Food','ce2'),
                        ('d3','Clothing','ce3'),
                        ('d4','Household Items','ce4'),
                        ('d5','Medical Supplies','ce5'),
                        ('d6','Toys','ce6'),
                        ('d7','Books','ce7'),
                        ('d8','Electronics','ce8'),
                        ('d9','Furniture','ce9'),
                        ('d10','School Supplies','ce10');
create table Donator
(
	National_ID varchar(45) Not null,
    D_Name varchar(45),
    D_phone varchar(45),
    D_Password varchar(45),
    Location varchar(45),
    DID varchar(45),
    primary key (National_ID),
    foreign key (DID) references Donation(DID)
);
insert into Donator values('n11','Scarlett','9127432492','scar3749','City A','d1'),
						('n12','Dakota','9128457842','dac3839','City B','d2'),
                        ('n13','Jessica','9059437580','jessi438','City C','d3'),
                        ('n14','Angelina','8329482303','angel4893','City A','d4'),
                        ('n15','Alena','8374823485','alen3498','City B','d5'),
                        ('n16','Sophia','9643293289','sophie8954','City C','d6'),
                        ('n17','Alexis','9778654567','alex5847','City A','d7'),
                        ('n18','David','7999345843','david756','City B','d8'),
                        ('n19','Sara','7543897580','sara6327','City C','d9'),
                        ('n20','Sana','6748357483','sana8438','City A','d10');
create table Type
(
	TID varchar(20) Not null,
    T_Name varchar(45),
    DID varchar(45),
    primary key (TID),
    foreign key (DID) references Donation(DID)
);
insert into Type values('t1','Monetary Donation','d1'),
					('t2','Food Donation','d2'),
                    ('t3','Clothing Donation','d3'),
                    ('t4','Household Items Donation','d4'),
                    ('t5','Medical Supplies Donation','d5'),
                    ('t6','Toy Donation','d6'),
                    ('t7','Book Donation','d7'),
                    ('t8','Electronics Donation','d8'),
                    ('t9','Furniture Donation','d9'),
                    ('t10','School Supplies Donation','d10');
create table Items
(
	Total varchar(45) Not null,
    DID varchar(45),
    TID varchar(20),
    primary key (Total),
    foreign key (DID) references Donation(DID),
    foreign key (TID) references Type(TID)
);
insert into Items values('50','d1','t1'),
						('100','d2','t2'),
                        ('75','d3','t3'),
                        ('30','d4','t4'),
                        ('80','d5','t5'),
                        ('20','d6','t6'),
                        ('40','d7','t7'),
                        ('15','d8','t8'),
                        ('60','d9','t9'),
                        ('10','d10','t10');
                        

select * from Donator where Location ='City A';
select * from Needy_people where Location='City B' and Income='800';
select * from Needy_people where Location = 'City B' or Family_Member='3';
delete from Charity_Emp where Status = 'Inactive';

SET SQL_SAFE_UPDATES=0;
update Items set Total = '90' where DID = 'd9';
alter table Items add total_variety varchar(45);
delete from Type;

select D_Type from Donation order by D_Type desc;

select count(*) N_Name, Location from Needy_people group by Location;

select Type.TID, T_Name, Items.Total, Items.TID
from Type Join Items ON Type.TID = Items.TID;

select * from Donation inner join Type ON Donation.DID = Type.DID;
select * from Charity_Emp right join Donation ON Charity_Emp.EID = Donation.EID;
select * from Charity_Emp left join Admin ON Charity_Emp.EID = Admin.EID;
select * from Donation cross join Items ON Donation.DID = Items.DID;

select * from Needy_people
Inner Join Charity_Emp ON Needy_people.EID = Charity_Emp.EID
Inner Join Admin ON Charity_Emp.EID = Admin.EID;

select Charity_Emp.EID,Admin.Admin_ID,Needy_people.National_ID,Donation_Boy.DID,Donation.DID,Donator.National_ID,Type.TID,Items.Total 
from Charity_Emp 
Join Needy_people ON Charity_Emp.EID = Needy_people.EID
Join Admin ON Charity_Emp.EID = Admin.EID
Join Donation_Boy ON Charity_Emp.EID = Donation_Boy.EID
Join Donation ON Charity_Emp.EID = Donation.EID
Join Donator ON Donation.DID = Donator.DID
Join Type ON Donation.DID = Type.DID
Join Items ON Donation.DID = Items.DID;