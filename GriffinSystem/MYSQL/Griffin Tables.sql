USE `griffin`;

CREATE TABLE `Administrators`(
	`Username` varchar(32) NOT NULL,
    `Email` varchar(32) NOT NULL,
    `Password` varchar(32) NOT NULL,
    check(char_length(`Password`)>=8),/*The password must be longer tha 8 characters*/
    PRIMARY KEY(`Username`)
);/*The database administrator credentials*/

CREATE TABLE `Book` (
	`BookID` INT NOT NULL AUTO_INCREMENT,
	`BookName` varchar(32) NOT NULL,
	`ISBN` varchar(64) NOT NULL,
	`Author` varchar(32) NOT NULL,
	`Publisher` varchar(32) NOT NULL,
	`DOP` DATE NOT NULL,
	`Date Added` varchar(32) NOT NULL DEFAULT 'currdate()',
	`Cost` DECIMAL,
	`Donated` varchar(5),
	`Condition(new)` varchar(5),
    `CategoryName` varchar(32) NOT NULL,
	PRIMARY KEY (`BookID`),
    FOREIGN KEY (`CategoryName`) REFERENCES `Category`(`CategoryName`)
);

CREATE TABLE `Member` (
	`MemberID` INT NOT NULL AUTO_INCREMENT,
	`FirstName` varchar(16) NOT NULL,
	`Surname` varchar(16) NOT NULL,
	`OtherNames` varchar(64) NOT NULL,
	`DOB` DATE NOT NULL,
	`PhoneNo` varchar(13) NOT NULL,
	`Email` varchar(20) NOT NULL,
	`CategoryName` varchar(32) NOT NULL,
	PRIMARY KEY (`MemberID`)
);

CREATE TABLE `Books Borrowed` (
	`PeriodCode` INT NOT NULL AUTO_INCREMENT,
	`BookID` INT NOT NULL,
	`MemberID` INT NOT NULL,
	`DateBorrowed` DATE NOT NULL,
	`DateDue` DATE NOT NULL,
	PRIMARY KEY (`PeriodCode`)
);

CREATE TABLE `Category` (
	`CategoryName` varchar(32) NOT NULL,
    `Description` varchar(255) NOT NULL,
	PRIMARY KEY (`CategoryName`)
);

CREATE TABLE `Staff` (
	`StaffID` INT NOT NULL auto_increment,
    `FirstName` varchar(16) NOT NULL,
    `Surname` varchar(32),
    `OtherNames` varchar(64),
    `Email` varchar(20) NOT NULL,
    `PhoneNumber` varchar(13) NOT NULL,
    `DOB` DATE NOT NULL,
    `DepartmentID` INT,
    PRIMARY KEY (`StaffID`),
    FOREIGN KEY (`DepartmentID`) references `Department`(`DepartmentID`)
);

CREATE TABLE `Department` (
	`DepartmentID` INT NOT NULL auto_increment,
	`DepartmentName` varchar(64) NOT NULL,
    PRIMARY KEY (`DepartmentID`)
);

CREATE TABLE `Returned Books` (
	`PeriodCode` INT NOT NULL AUTO_INCREMENT,
	`BookID` INT NOT NULL,
	`MemberID` INT NOT NULL,
	`DateBorrowed` DATE NOT NULL,
	`DateReturned` DATE NOT NULL,
	FOREIGN KEY (`PeriodCode`) REFERENCES `Books Borrowed`(`PeriodCode`)
);

/*Constraints*/
ALTER TABLE `Books Borrowed` ADD CONSTRAINT `Books Borrowed_fk0` FOREIGN KEY (`BookID`) REFERENCES `Book`(`BookID`);

ALTER TABLE `Books Borrowed` ADD CONSTRAINT `Books Borrowed_fk1`    FOREIGN KEY (`MemberID`) REFERENCES `Member`(`MemberID`);

/*Alterations*/
ALTER TABLE `Book` MODIFY `Condition(new)` varchar(5);
ALTER TABLE `Book` MODIFY `Donated` varchar(5);
ALTER TABLE `Book` MODIFY `Date Added` date;
ALTER TABLE `staff`  drop `OtherNames`;
ALTER TABLE `Member`  modify `OtherNames`varchar(64) default NULL;
ALTER TABLE `Book` CHANGE `Condition(Good)` `GoodCondition?` varchar(5);
ALTER TABLE `Staff`  add constraint check(char_length(`PhoneNumber`)>=13);



