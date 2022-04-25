-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2022 at 09:28 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `griffin`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrow_receipt` (IN `id` VARCHAR(32))  BEGIN
	select * from `Books Borrowed`
		where `PeriodCode` in (`id`);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `check_condition` (IN `id` INT)  BEGIN
	select *
	from `good_condition`
		where `BookID` in (`id`);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `check_donated` (IN `id` INT)  BEGIN
	select *
	from `donated_books`
		where `BookID` in (`id`);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `count_per_category` (IN `cat` VARCHAR(32))  BEGIN
	select count(`BookID`) as Quantity
	from `Book`
		where `CategoryName` in (`cat`);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `count_staff` (IN `id` INT)  BEGIN
	select *
	from `staff_per_department`
		where `DepartmentID` in (`id`);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `has_overdue` (IN `id` VARCHAR(32))  BEGIN
	select * from `Overdue Books`
		where `MemberID` in (`id`);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `member_card` (IN `id` VARCHAR(32))  BEGIN
	select `FirstName`, `Surname`
	from `Member`
		where `MemberID` in (`id`);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pass_check` (IN `user` VARCHAR(32), `pass` VARCHAR(32))  BEGIN
	select *
	from `Administrators`
		where `username` in (`user`) and `password`in (`pass`);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `staff_card` (IN `id` VARCHAR(32))  BEGIN
	select s.`FirstName`, s.`Surname`, s.`DepartmentID`, d.`DepartmentName`, s.`DOB`
	from `Staff` s, `Department` d
		where s.`DepartmentID`= d.`DepartmentID`and `StaffID` in (`id`);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `staff_dept_list` (IN `id` INT)  BEGIN
	select `StaffID`, `FirstName`, `Surname`, `Email`, `PhoneNumber`
	from `staff`
		where `DepartmentID` in (`id`);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

CREATE TABLE `administrators` (
  `Username` varchar(32) NOT NULL,
  `Email` varchar(32) NOT NULL,
  `Password` varchar(32) NOT NULL
) ;

--
-- Dumping data for table `administrators`
--

INSERT INTO `administrators` (`Username`, `Email`, `Password`) VALUES
('Brando', 'jamesR@gmail.com', 'theworld18'),
('Butcher', 'billy03@gmail.com', '987654321'),
('Great', 'theegreat@gmail.com', 'Administrator69420'),
('Hemdem', 'hemdem@gmail.com', 'Passcode1290'),
('Mark', 'mark12@outlook.com', '12345678'),
('Milan', 'milanofficial@gmail.com', 'syssssadmin'),
('Reath', 'reath2@gmail.com', 'Access45612'),
('Tjay', 'tjay@gmail.com', 'Barney12345');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `BookID` int(11) NOT NULL,
  `BookName` varchar(32) NOT NULL,
  `ISBN` varchar(64) NOT NULL,
  `Author` varchar(32) NOT NULL,
  `Publisher` varchar(32) NOT NULL,
  `DOP` date NOT NULL,
  `Date Added` date DEFAULT NULL,
  `Cost` decimal(10,0) DEFAULT NULL,
  `Donated` varchar(5) DEFAULT NULL,
  `GoodCondition?` varchar(5) DEFAULT NULL,
  `CategoryName` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`BookID`, `BookName`, `ISBN`, `Author`, `Publisher`, `DOP`, `Date Added`, `Cost`, `Donated`, `GoodCondition?`, `CategoryName`) VALUES
(1, 'Harry Potter', '9780747532743', 'J.K. Rowling', 'Bloomsbury', '1997-06-26', '2007-01-06', '1300', 'True', 'False', 'Fiction'),
(2, 'Berserk', '9780747531000', 'Kentaro Miura', 'Dark Horse Comics', '1989-10-21', '2007-01-08', '1300', 'False', 'True', 'Fiction'),
(3, 'Mathematics for simpletons', '9780747533001', 'Feng Ong', 'Tsar publishers', '2019-12-24', '2007-01-21', '700', 'False', 'New', 'Sciences'),
(4, 'The hobbit', '0618260307', 'Tolkien', 'Oxford University Press', '2006-03-22', '2007-02-27', '3250', 'True', 'False', 'Fiction'),
(5, 'Slinky Malinki', '090860604', 'Lynly Dodd', 'Macmillan ', '2006-07-12', '2007-02-27', '2500', 'False', 'False', 'Fiction'),
(6, 'Mechanical ', '8298286366', 'Bob kerr ', 'Penguin books ', '2010-08-10', '2016-09-20', '1920', 'False', 'True', 'Pure Sciences'),
(7, 'Blossoms of savannah ', '2325974786', 'Henry Olekulet', 'Kenya Literature ', '2017-05-30', '2018-02-27', '650', 'True', 'False', 'Language and Literature'),
(8, 'How to lie ', '7526666399', 'Darret Huff ', 'Harpercollins ', '2020-06-11', '2021-03-20', '1570', 'Tue', 'True', 'Psychology'),
(9, 'Berserk: The Golden Age Arc', '9781593070205', 'Kentaro Miura', 'Dark Horse Comics', '2004-10-13', '2007-02-27', '1700', 'False', 'True', 'Fiction'),
(10, 'Berserk: The Golden Age Arc', '9781593070205', 'Kentaro Miura', 'Dark Horse Comics', '2004-10-13', '2007-02-27', '1700', 'False', 'True', 'Fiction'),
(11, 'Berserk: The Golden Age Arc', '9781593070205', 'Kentaro Miura', 'Dark Horse Comics', '2004-10-13', '2007-02-27', '1700', 'False', 'True', 'Fiction'),
(12, 'Automate the Boring Stuff with P', '9781593279929', 'Al Sweigart', 'William Pollock Production', '2015-04-11', '2022-04-24', '3750', 'False', 'True', 'Computer Science'),
(38, 'The Book Thief', '9780375842207', 'Markus Zusak', 'Picedor', '2005-06-14', '2006-08-07', '1500', 'True', 'True', 'Fiction'),
(43, 'Law 101', '8902772839927', 'George Gen', 'Hammington', '2006-07-14', '2010-05-07', '1200', 'True', 'False', 'Law'),
(44, 'Experience of education', '89637382839927', 'Greg hail', 'Will', '2016-07-14', '2019-05-07', '1700', 'True', 'False', 'Education'),
(45, 'On doing Local History ', '99637578839927', 'Ava Mary', 'Camilla', '2016-11-14', '2020-07-07', '1270', 'False', 'True', 'Local History'),
(46, 'Science', '789027382839927', 'Denny sean', 'Angela', '2006-07-24', '2009-05-17', '2700', 'True', 'True', 'Auxiliary Sciences'),
(47, 'Science', '789027382839927', 'Denny sean', 'Angela', '2006-07-24', '2009-05-17', '2700', 'True', 'True', 'Auxiliary Sciences'),
(48, 'Science', '789027382839927', 'Denny sean', 'Angela', '2006-07-24', '2009-05-17', '2700', 'True', 'True', 'Auxiliary Sciences'),
(49, 'Science', '789027382839927', 'Denny sean', 'Angela', '2006-07-24', '2009-05-17', '2700', 'True', 'True', 'Auxiliary Sciences'),
(50, 'Science', '789027382839927', 'Denny sean', 'Angela', '2006-07-24', '2009-05-17', '2700', 'True', 'True', 'Auxiliary Sciences'),
(51, 'Science', '789027382839927', 'Denny sean', 'Angela', '2006-07-24', '2009-05-17', '2700', 'True', 'True', 'Auxiliary Sciences'),
(52, 'Science', '789027382839927', 'Denny sean', 'Angela', '2006-07-24', '2009-05-17', '2700', 'True', 'True', 'Auxiliary Sciences');

-- --------------------------------------------------------

--
-- Table structure for table `books borrowed`
--

CREATE TABLE `books borrowed` (
  `PeriodCode` int(11) NOT NULL,
  `BookID` int(11) NOT NULL,
  `MemberID` int(11) NOT NULL,
  `DateBorrowed` date NOT NULL,
  `DateDue` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books borrowed`
--

INSERT INTO `books borrowed` (`PeriodCode`, `BookID`, `MemberID`, `DateBorrowed`, `DateDue`) VALUES
(1, 2, 2, '2009-01-12', '2009-01-19'),
(2, 4, 2, '2009-01-12', '2009-01-19'),
(3, 6, 1, '2009-01-14', '2009-01-21'),
(4, 1, 4, '2009-01-24', '2009-01-31'),
(5, 3, 7, '2009-02-02', '2009-02-09'),
(6, 11, 12, '2022-04-24', '2022-05-01'),
(7, 2, 10, '2022-04-24', '2022-05-01'),
(8, 2, 9, '2022-04-24', '2022-05-01'),
(9, 5, 15, '2022-04-24', '2022-05-01'),
(10, 5, 15, '2022-04-24', '2022-05-01'),
(11, 5, 15, '2022-04-24', '2022-05-01'),
(12, 8, 5, '2022-04-24', '2022-05-01'),
(13, 9, 5, '2022-04-24', '2022-05-01'),
(14, 3, 5, '2022-04-24', '2022-05-01'),
(15, 12, 8, '2022-04-24', '2022-05-01'),
(17, 12, 8, '2022-04-24', '2022-05-01'),
(18, 10, 3, '2022-04-25', '2022-05-02'),
(19, 2, 3, '2022-04-25', '2022-05-02'),
(20, 1, 7, '2022-04-25', '2022-05-02');

-- --------------------------------------------------------

--
-- Stand-in structure for view `books_per_category`
-- (See below for the actual view)
--
CREATE TABLE `books_per_category` (
`CategoryName` varchar(32)
,`Quantity` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryName` varchar(32) NOT NULL,
  `Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryName`, `Description`) VALUES
('Arts and Social Sciences', 'Books entailing artistic and social studies'),
('Auxiliary Sciences', 'Books that deal with the study of historical sources'),
('Computer Science', 'Books that deal with the study of the inner workings of a computer'),
('Education', 'Deals with the passing of knoowledge '),
('Fashion', 'Books covering topics in the field of fashion.'),
('Fiction', 'Books that are based on themes of fiction'),
('Fine Arts', 'Books that deals with creative arts'),
('Geography', 'Books that deal with the study of earth and relationship between people and environment'),
('Language and Literature', 'Books that deals with study of sounds,words'),
('Law', 'Books that cover the study of law'),
('Local History', 'Books that deals with everyday struggle and triumphs of ordinary people'),
('Medicine', 'Books that deal with the study of diagnosis, treatmentand prognosis of various diorders'),
('Military Science', 'Books that deal with the study of millitary process and behaviuors'),
('Music', 'Books that cover theoritical aspect of music '),
('Naval Science', 'Books that deal with the study of navy and marine corps organization'),
('Philosophy', 'Books that deals with knowledge and reality'),
('Political Science', 'Books that focuses on theory and practice of government and politics at the local state'),
('Psychology', 'Books that deal with the study of human mind and its function'),
('Pure Sciences', 'Books with scientific topics in a variety of fields'),
('Sciences', 'Books with scientific topics i a variety of fields'),
('Technology', 'Books that deal with the study of technology'),
('World History', 'Books that deal with the study of cross cultural events and phenomena');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DepartmentID` int(11) NOT NULL,
  `DepartmentName` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DepartmentID`, `DepartmentName`) VALUES
(1, 'Administration'),
(2, 'Processing'),
(3, 'Maintenance'),
(4, 'Digital Collections'),
(5, 'Cataloging'),
(6, 'Reference'),
(7, 'Acquisition'),
(8, 'Assignment'),
(9, 'Serial'),
(10, 'Circulation'),
(11, 'Security'),
(12, 'Janitorial'),
(13, 'Catering'),
(14, 'Information technology'),
(15, 'Research'),
(16, 'Special Collections');

-- --------------------------------------------------------

--
-- Stand-in structure for view `donated_books`
-- (See below for the actual view)
--
CREATE TABLE `donated_books` (
`BookID` int(11)
,`BookName` varchar(32)
,`ISBN` varchar(64)
,`Author` varchar(32)
,`Publisher` varchar(32)
,`DOP` date
,`Date Added` date
,`Cost` decimal(10,0)
,`Donated` varchar(5)
,`GoodCondition?` varchar(5)
,`CategoryName` varchar(32)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `good_condition`
-- (See below for the actual view)
--
CREATE TABLE `good_condition` (
`BookID` int(11)
,`BookName` varchar(32)
,`ISBN` varchar(64)
,`Author` varchar(32)
,`Publisher` varchar(32)
,`DOP` date
,`Date Added` date
,`Cost` decimal(10,0)
,`Donated` varchar(5)
,`GoodCondition?` varchar(5)
,`CategoryName` varchar(32)
);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `MemberID` int(11) NOT NULL,
  `FirstName` varchar(16) NOT NULL,
  `Surname` varchar(16) NOT NULL,
  `DOB` date NOT NULL,
  `PhoneNo` varchar(13) NOT NULL,
  `Email` varchar(20) NOT NULL
) ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`MemberID`, `FirstName`, `Surname`, `DOB`, `PhoneNo`, `Email`) VALUES
(1, 'Joseph', 'Joestar', '1990-10-05', '+254786123458', 'jojo69@gmail.com'),
(2, 'Dio', 'Brando', '1945-06-06', '+254712346592', 'world12@gmail.com'),
(3, 'Ronald', 'James', '1973-01-24', '+254786123458', 'ronnie@outlook.com'),
(4, 'Mike', 'Shinoda', '1982-12-13', '+254724561232', 'glassCastle@gmail.co'),
(5, 'Chester', 'Bennington', '1974-02-15', '+254708457324', 'parkL@ymail.com'),
(6, 'Matthew', 'Ngoi', '2001-10-30', '+254748502133', 'dh16@gmail.com'),
(7, 'Zakariah', 'Abdisalan', '1998-08-05', '+254784592301', 'dox45@gmail.com'),
(8, 'Ayub', 'Abdidek', '2004-11-05', '+254723419023', 'AbdiA11@gmail.com'),
(9, 'Isaac', 'Mills', '1999-08-05', '+254723151783', 'isaacmills@gmail.com'),
(10, 'Sasha', 'Terry', '2000-04-07', '+254714737391', 'sashaterry@gmail.com'),
(11, 'Kimberly', 'Felix', '2001-11-03', '+254715277462', 'Kimberlyfe@gmail.com'),
(12, 'Justin', 'Wood', '1998-07-15', '+254753682825', 'justinwood@gmail.com'),
(13, 'Steve', 'Adams', '1997-04-04', '+254736278182', 'steveadams@gmail.com'),
(14, 'Jackson', 'Ndolo', '2002-03-12', '+254732055621', 'NdoloJ@gmail.com'),
(15, 'Donavan', 'Nduta', '1992-04-03', '+254712435120', 'dj66@gmail.com'),
(16, 'John', 'Green', '1990-06-15', '+254726627382', 'johngreen@ymail.com'),
(17, 'Dylan', 'Felix', '1995-07-16', '+254725267353', 'dylanfe@gmail.com'),
(18, 'Tabnit', 'Ali', '1989-02-22', '+254734562343', 'tDyes@outlook.com'),
(19, 'Anna', 'White', '2000-06-14', '+254727289200', 'annaFFF@gmail.com'),
(20, 'Sheila', 'Peters', '1999-04-07', '+254726627382', 'sheila@gmail.com');

-- --------------------------------------------------------

--
-- Stand-in structure for view `new_book`
-- (See below for the actual view)
--
CREATE TABLE `new_book` (
`BookName` varchar(32)
,`ISBN` varchar(64)
,`Author` varchar(32)
,`Publisher` varchar(32)
,`DOP` date
,`Quantity` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `old_book`
-- (See below for the actual view)
--
CREATE TABLE `old_book` (
`BookName` varchar(32)
,`ISBN` varchar(64)
,`Author` varchar(32)
,`Publisher` varchar(32)
,`DOP` date
,`Quantity` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `overdue books`
-- (See below for the actual view)
--
CREATE TABLE `overdue books` (
`PeriodCode` int(11)
,`BookID` int(11)
,`MemberID` int(11)
,`DateBorrowed` date
,`DateDue` date
);

-- --------------------------------------------------------

--
-- Table structure for table `returned books`
--

CREATE TABLE `returned books` (
  `PeriodCode` int(11) NOT NULL,
  `BookID` int(11) NOT NULL,
  `MemberID` int(11) NOT NULL,
  `DateBorrowed` date NOT NULL,
  `DateReturned` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `returned books`
--

INSERT INTO `returned books` (`PeriodCode`, `BookID`, `MemberID`, `DateBorrowed`, `DateReturned`) VALUES
(1, 2, 2, '2009-01-12', '2009-01-14'),
(2, 4, 2, '2009-01-12', '2009-01-14'),
(5, 3, 7, '2009-02-02', '2009-02-11'),
(11, 15, 5, '2022-04-24', '2022-04-24'),
(12, 5, 8, '2022-04-24', '2022-04-24'),
(13, 5, 19, '2022-04-24', '2022-04-24'),
(17, 8, 12, '2022-04-24', '2022-04-24');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffID` int(11) NOT NULL,
  `FirstName` varchar(16) NOT NULL,
  `Surname` varchar(32) DEFAULT NULL,
  `Email` varchar(20) NOT NULL,
  `PhoneNumber` varchar(13) NOT NULL,
  `DOB` date NOT NULL,
  `DepartmentID` int(11) DEFAULT NULL
) ;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffID`, `FirstName`, `Surname`, `Email`, `PhoneNumber`, `DOB`, `DepartmentID`) VALUES
(1, 'George', 'Githambo', 'gg45@gmail.com', '+254724356712', '2000-03-24', 1),
(2, 'Jonathan', 'Joestar', 'jojo10@gmail.com', '+254745762319', '1968-09-21', 1),
(3, 'David', 'Might', 'dight@gmail.com', '+254732457834', '1990-01-10', 2),
(4, 'Alex', 'Curlton', 'Aleton@gmail.com', '+254798073456', '1998-12-20', 6),
(5, 'Maxwell', 'Ngure', 'MaxI@gmail.com', '+254732456723', '2000-12-25', 3),
(6, 'Damian', 'Daniel', 'DamD@outlook.com', '+254734876510', '2000-01-02', 6),
(7, 'Steve', 'Adams', 'steveadams@gmail.com', '+254756348956', '1997-04-04', 3),
(8, 'Isaac', 'Mills', 'isaacmills@outlook.c', '+254756342121', '1999-08-05', 2),
(9, 'Kimberly', 'Alex', 'kimlyfe@gmail.com', '+254756475621', '2001-11-03', 4),
(10, 'Christopher', 'Colombus', 'ChrisColombo@gmail.c', '+254745673417', '1986-03-12', 8),
(11, 'Joyner', 'Lucas', 'jLucas@outlook.com', '+254724671254', '1995-05-04', 10),
(12, 'Collins', 'Mark', 'collinsmark@gmail.co', '+254754872466', '2000-07-05', 11),
(13, 'Jayden', 'Buki', 'jaydenb@gmail.com', '+254755769843', '1999-11-07', 1),
(14, 'Johnson', 'Wells', 'johnwells@yahoo.com', '+254736472831', '2000-12-06', 9),
(15, 'Paul', 'Peter', 'paul12@gmail.com', '+254732658352', '1997-11-08', 10),
(16, 'Hannah', 'Montana', 'montana@gmail.com', '+254732739872', '0097-07-03', 11),
(17, 'Mary', 'Doe', 'maryd@gmail.com', '+254782575344', '1999-08-04', 12),
(18, 'Joseph', 'Kamau', 'kamau@gmail.com', '+254719161019', '2002-03-06', 13),
(19, 'Marcus', 'Ndegwa', 'ssmarcus@gmail.con', '+254790234213', '2000-02-23', 2),
(20, 'Donald', 'Musasia', 'dms@gmail.con', '+254790232140', '2001-03-20', 5),
(21, 'Donald', 'Musasia', 'dms@gmail.con', '+254790232140', '2001-03-20', 5),
(22, 'Maxon', 'Mundia', 'maxMun@ymail.com', '+254712342110', '1998-02-22', 9);

-- --------------------------------------------------------

--
-- Stand-in structure for view `staff_per_department`
-- (See below for the actual view)
--
CREATE TABLE `staff_per_department` (
`DepartmentID` int(11)
,`DepartmentName` varchar(64)
,`Staff Working` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `books_per_category`
--
DROP TABLE IF EXISTS `books_per_category`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `books_per_category`  AS SELECT `book`.`CategoryName` AS `CategoryName`, count(`book`.`CategoryName`) AS `Quantity` FROM `book` GROUP BY `book`.`CategoryName` ;

-- --------------------------------------------------------

--
-- Structure for view `donated_books`
--
DROP TABLE IF EXISTS `donated_books`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `donated_books`  AS SELECT `book`.`BookID` AS `BookID`, `book`.`BookName` AS `BookName`, `book`.`ISBN` AS `ISBN`, `book`.`Author` AS `Author`, `book`.`Publisher` AS `Publisher`, `book`.`DOP` AS `DOP`, `book`.`Date Added` AS `Date Added`, `book`.`Cost` AS `Cost`, `book`.`Donated` AS `Donated`, `book`.`GoodCondition?` AS `GoodCondition?`, `book`.`CategoryName` AS `CategoryName` FROM `book` WHERE `book`.`Donated` = 'True' ;

-- --------------------------------------------------------

--
-- Structure for view `good_condition`
--
DROP TABLE IF EXISTS `good_condition`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `good_condition`  AS SELECT `book`.`BookID` AS `BookID`, `book`.`BookName` AS `BookName`, `book`.`ISBN` AS `ISBN`, `book`.`Author` AS `Author`, `book`.`Publisher` AS `Publisher`, `book`.`DOP` AS `DOP`, `book`.`Date Added` AS `Date Added`, `book`.`Cost` AS `Cost`, `book`.`Donated` AS `Donated`, `book`.`GoodCondition?` AS `GoodCondition?`, `book`.`CategoryName` AS `CategoryName` FROM `book` WHERE `book`.`GoodCondition?` = 'True' ;

-- --------------------------------------------------------

--
-- Structure for view `new_book`
--
DROP TABLE IF EXISTS `new_book`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `new_book`  AS SELECT `book`.`BookName` AS `BookName`, `book`.`ISBN` AS `ISBN`, `book`.`Author` AS `Author`, `book`.`Publisher` AS `Publisher`, `book`.`DOP` AS `DOP`, count(`book`.`ISBN`) AS `Quantity` FROM `book` WHERE `book`.`DOP` between '2000-01-01' and curdate() GROUP BY `book`.`ISBN` ;

-- --------------------------------------------------------

--
-- Structure for view `old_book`
--
DROP TABLE IF EXISTS `old_book`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `old_book`  AS SELECT `book`.`BookName` AS `BookName`, `book`.`ISBN` AS `ISBN`, `book`.`Author` AS `Author`, `book`.`Publisher` AS `Publisher`, `book`.`DOP` AS `DOP`, count(`book`.`ISBN`) AS `Quantity` FROM `book` WHERE `book`.`DOP` not between '2000-01-01' and curdate() GROUP BY `book`.`ISBN` ;

-- --------------------------------------------------------

--
-- Structure for view `overdue books`
--
DROP TABLE IF EXISTS `overdue books`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `overdue books`  AS SELECT `b`.`PeriodCode` AS `PeriodCode`, `b`.`BookID` AS `BookID`, `b`.`MemberID` AS `MemberID`, `b`.`DateBorrowed` AS `DateBorrowed`, `b`.`DateDue` AS `DateDue` FROM (`books borrowed` `b` left join `returned books` `r` on(`b`.`PeriodCode` = `r`.`PeriodCode`)) WHERE `r`.`PeriodCode` is null AND `b`.`DateDue` < curdate() ;

-- --------------------------------------------------------

--
-- Structure for view `staff_per_department`
--
DROP TABLE IF EXISTS `staff_per_department`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `staff_per_department`  AS SELECT `s`.`DepartmentID` AS `DepartmentID`, `d`.`DepartmentName` AS `DepartmentName`, count(`s`.`DepartmentID`) AS `Staff Working` FROM (`department` `d` join `staff` `s`) WHERE `s`.`DepartmentID` = `d`.`DepartmentID` GROUP BY `s`.`DepartmentID` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`BookID`),
  ADD KEY `CategoryName` (`CategoryName`);

--
-- Indexes for table `books borrowed`
--
ALTER TABLE `books borrowed`
  ADD PRIMARY KEY (`PeriodCode`),
  ADD KEY `Books Borrowed_fk1` (`MemberID`),
  ADD KEY `Books Borrowed_fk0` (`BookID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryName`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DepartmentID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`MemberID`);

--
-- Indexes for table `returned books`
--
ALTER TABLE `returned books`
  ADD KEY `PeriodCode` (`PeriodCode`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`),
  ADD KEY `DepartmentID` (`DepartmentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `BookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `books borrowed`
--
ALTER TABLE `books borrowed`
  MODIFY `PeriodCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `DepartmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `MemberID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returned books`
--
ALTER TABLE `returned books`
  MODIFY `PeriodCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `StaffID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`CategoryName`) REFERENCES `category` (`CategoryName`);

--
-- Constraints for table `books borrowed`
--
ALTER TABLE `books borrowed`
  ADD CONSTRAINT `Books Borrowed_fk0` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`),
  ADD CONSTRAINT `Books Borrowed_fk1` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`);

--
-- Constraints for table `returned books`
--
ALTER TABLE `returned books`
  ADD CONSTRAINT `returned books_ibfk_1` FOREIGN KEY (`PeriodCode`) REFERENCES `books borrowed` (`PeriodCode`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
