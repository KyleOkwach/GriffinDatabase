USE `griffin`;

/*ADMINISTRATOR TUPLES*/
INSERT INTO `Administrators` values
	('Brando','jamesR@gmail.com','theworld18'),
	('Butcher','billy03@gmail.com','987654321'),
	('Mark','mark12@outlook.com','12345678');
INSERT INTO `Administrators` values
	('Milan', 'milanofficial@gmail.com', 'syssssadmin'),
    ('Tjay', 'tjay@gmail.com', 'Barney12345'),
    ('Reath', 'reath2@gmail.com', 'Access45612'),
    ('Great', 'theegreat@gmail.com', 'Administrator69420'),
    ('Hemdem', 'hemdem@gmail.com', 'Passcode1290');

/*MEMBER TUPLES*/
INSERT INTO `Member`(FirstName,Surname,OtherNames,DOB,PhoneNO,Email) values
	('','','',''),
	('','','','');

/*CATEGORY TUPLES*/
INSERT INTO `Category` values
	('Fiction','Books that are based on themes of fiction');
INSERT INTO `Category` values
	('Arts and Social Sciences','Books entailing artistic and social studies'),
    ('Sciences','Books with scientific topics i a variety of fields');
INSERT INTO `Category` values
    ('Pure Sciences','Books with scientific topics in a variety of fields'),
	('Philosophy','Books that deals with knowledge and reality'),
    ('Local History','Books that deals with everyday struggle and triumphs of ordinary people'),
    ('Political Science','Books that focuses on theory and practice of government and politics at the local state'),
    ('Law','Books that cover the study of law'),
    ('Education','Deals with the passing of knoowledge '),
    ('Music','Books that cover theoritical aspect of music '),
    ('Fine Arts','Books that deals with creative arts'),
    ('Language and Literature','Books that deals with study of sounds,words'),
    ('Computer Science','Books that deal with the study of the inner workings of a computer'),
    ('Medicine','Books that deal with the study of diagnosis, treatmentand prognosis of various diorders'),
    ('Technology','Books that deal with the study of technology'),
    ('Geography','Books that deal with the study of earth and relationship between people and environment'),
    ('World History','Books that deal with the study of cross cultural events and phenomena'),
    ('Military Science','Books that deal with the study of millitary process and behaviuors'),
    ('Naval Science','Books that deal with the study of navy and marine corps organization'),
    ('Auxiliary Sciences','Books that deal with the study of historical sources'),
    ('Psychology','Books that deal with the study of human mind and its function');
INSERT INTO `Member`(`FirstName`, `Surname`, `DOB`, `PhoneNo`, `Email`) values
	('Joseph','Joestar','1990-10-5','+254786123458','jojo69@gmail.com');
INSERT INTO `Member`(`FirstName`, `Surname`, `DOB`, `PhoneNo`, `Email`) values
	('Dio','Brando','1945-6-6','+254712346592','world12@gmail.com'),
    ('Ronald','James','1973-1-24','+254786123458','ronnie@outlook.com'),
    ('Mike','Shinoda','1982-12-13','+254724561232','glassCastle@gmail.com'),
    ('Chester','Bennington','1974-2-15','+254708457324','parkL@ymail.com'),
    ('Matthew','Ngoi','2001-10-30','+254748502133','dh16@gmail.com'),
    ('Zakariah','Abdisalan','1998-8-5','+254784592301','dox45@gmail.com'),
    ('Ayub','Abdidek','2004-11-5','+254723419023','AbdiA11@gmail.com');
INSERT INTO `Department`(`DepartmentName`) values
	('Administration'),
    ('Processing'),
    ('Maintenance'),
    ('Digital Collections'),
    ('Cataloging'),
    ('Reference');

INSERT INTO `Staff`(`FirstName`,`Surname`,`Email`,`PhoneNumber`,`DOB`,`DepartmentID`) values
	('George','Githambo','gg45@gmail.com','+254724356712','2000-03-24','1');
    
INSERT INTO `Staff`(`FirstName`,`Surname`,`Email`,`PhoneNumber`,`DOB`,`DepartmentID`) values
    ('Jonathan','Joestar','jojo10@gmail.com','+254745762319','1968-09-21','1'),
    ('David','Might','dight@gmail.com','+254732457834','1990-01-10','2'),
    ('Alex','Curlton','Aleton@gmail.com','+254798073456','1998-12-20','6'),
    ('Maxwell','Ngure','MaxI@gmail.com','+254732456723','2000-12-25','3'),
    ('Damian','Daniel','DamD@outlook.com','+254734876510','2000-01-02','6');

INSERT INTO `Book`(`BookName`,`ISBN`,`Author`,`Publisher`,`DOP`,`Date Added`,`Cost`,`Donated`,`GoodCondition?`,`CategoryName`) values
	('The hobbit','0618260307','Tolkien','Oxford University Press','22-03-2006','27-2-2007','3250','True','False','Fiction'),
    ('Slinky Malinki','090860604','Lynly Dodd','Macmillan ','12-07-2006','27-2-2007','2500','False','False','Fiction'),
    ('Mechanical ','8298286366','Bob kerr ','Penguin books ','10-08-2010','20-9-2016','1920','False','True','Pure Sciences'),
    ('Blossoms of savannah ','2325974786','Henly Olekulet','Kenya Literature ','30-05-2017','27-02-2018','650','True','False','Language and Literature'),
    ('How to lie ','7526666399','Darret Huff ','Harpercollins ','11-06-2020','20-3-2021','1570','Tue','True','Psychology');
INSERT INTO `Book`(`BookName`,`ISBN`,`Author`,`Publisher`,`DOP`,`Date Added`,`Cost`,`Donated`,`GoodCondition?`,`CategoryName`) values
	('Berserk: The Golden Age Arc','9781593070205','Kentaro Miura','Dark Horse Comics','2004-10-13','2007-2-27','1700','False','True','Fiction'),
    ('Berserk: The Golden Age Arc','9781593070205','Kentaro Miura','Dark Horse Comics','2004-10-13','2007-2-27','1700','False','True','Fiction'),
    ('Berserk: The Golden Age Arc','9781593070205','Kentaro Miura','Dark Horse Comics','2004-10-13','2007-2-27','1700','False','True','Fiction')
    ('The Book Thief', '9780375842207', 'Markus Zusak', 'Picedor',  '2005-06-14', '2006-08-07', 1500, 'True', 'True', 'Fiction'),;

INSERT INTO `Books Borrowed`(`BookID`,`MemberID`,`DateBorrowed`,`DateDue`) values
	(2,2,'2009-01-12','2009-01-19'),
    (4,2,'2009-01-12','2009-01-19'),
    (6,1,'2009-01-14','2009-01-21'),
    (1,4,'2009-01-24','2009-01-31'),
	(3,7,'2009-02-02','2009-02-09');
INSERT INTO `Member`(`FirstName`, `Surname`, `DOB`, `PhoneNo`, `Email`) values
	('Isaac', 'Mills', '1999-08-05', '+254723151783', 'isaacmills@gmail.com'),
    ('Sasha',  'Terry', '2000-04-07', '+254714737391', 'sashaterry@gmail.com'),
    ('Kimberly', 'Felix',  '2001-11-03', '+254715277462', 'Kimberlyfe@gmail.com'),
    ('Justin',  'Wood', '1998-07-15', '+254753682825', 'justinwood@gmail.com'),
    ('Steve',  'Adams', '1997-04-04', '+254736278182', 'steveadams@gmail.com');

INSERT INTO `Books Borrowed`(`BookID`,`MemberID`,`DateBorrowed`,`DateDue`) values
	(1,2,'2009-02-05','2009-02-12'),
    (4,2,'2009-02-05','2009-02-12'),
    (6,1,'2009-02-05','2009-02-12'),
    (1,4,'2009-02-05','2009-02-12'),
	(3,7,'2009-02-05','2009-02-12');
INSERT INTO `Returned Books`(`PeriodCode`,`BookID`,`MemberID`,`DateBorrowed`,`DateReturned`) values
	('1','2','2','2009-01-12','2009-01-14'),
    ('2','4','2','2009-01-12','2009-01-14'),
    ('5','3','7','2009-02-02','2009-02-11');
    
INSERT INTO `Book`(`BookName`,`ISBN`,`Author`,`Publisher`,`DOP`,`Date Added`,`Cost`,`Donated`,`GoodCondition?`,`CategoryName`) values
    ('Law 101','8902772839927', 'George Gen', 'Hammington', '2006-07-14', '2010-05-07', 1200, 'True', 'False', 'Law'),
    ('Experience of education','89637382839927', 'Greg hail', 'Will', '2016-07-14', '2019-05-07', 1700, 'True', 'False', 'Education'),
    ('On doing Local History ','99637578839927', 'Ava Mary', 'Camilla', '2016-11-14', '2020-07-07', 1270, 'False', 'True', 'Local History'),
	('Science','789027382839927', 'Denny sean', 'Angela', '2006-07-24', '2009-05-17', 2700, 'True', 'True', 'Auxiliary Sciences');

INSERT INTO `Book`(`BookName`,`ISBN`,`Author`,`Publisher`,`DOP`,`Date Added`,`Cost`,`Donated`,`GoodCondition?`,`CategoryName`) values
	('Science','789027382839927', 'Denny sean', 'Angela', '2006-07-24', '2009-05-17', 2700, 'True', 'True', 'Auxiliary Sciences'),
    ('Science','789027382839927', 'Denny sean', 'Angela', '2006-07-24', '2009-05-17', 2700, 'True', 'True', 'Auxiliary Sciences'),
    ('Science','789027382839927', 'Denny sean', 'Angela', '2006-07-24', '2009-05-17', 2700, 'True', 'True', 'Auxiliary Sciences'),
    ('Science','789027382839927', 'Denny sean', 'Angela', '2006-07-24', '2009-05-17', 2700, 'True', 'True', 'Auxiliary Sciences'),
    ('Science','789027382839927', 'Denny sean', 'Angela', '2006-07-24', '2009-05-17', 2700, 'True', 'True', 'Auxiliary Sciences'),
    ('Science','789027382839927', 'Denny sean', 'Angela', '2006-07-24', '2009-05-17', 2700, 'True', 'True', 'Auxiliary Sciences');
    
select * from category;
select * from Administrators;
select * from Book;

