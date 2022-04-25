USE `griffin`;
drop procedure pass_check;

/*USER LOGIN PROCEDURES*/
DELIMITER &&
CREATE PROCEDURE pass_check(IN `user` varchar(32), `pass` varchar(32))
BEGIN
	select *
	from `Administrators`
		where `username` in (`user`) and `password`in (`pass`);
END&&
DELIMITER ;

/*COUNT BOOKS IN A CATEGORY*/
DELIMITER &&
CREATE PROCEDURE count_per_category(IN `cat` varchar(32))
BEGIN
	select count(`BookID`) as Quantity
	from `Book`
		where `CategoryName` in (`cat`);
END&&
DELIMITER ;

/*MEMBER ID GENERATOR*/
DELIMITER &&
CREATE PROCEDURE member_card(IN `id` varchar(32))
BEGIN
	select `FirstName`, `Surname`
	from `Member`
		where `MemberID` in (`id`);
END&&
DELIMITER ;

/*STAFF ID GENERATOR*/
DELIMITER &&
CREATE PROCEDURE staff_card(IN `id` varchar(32))
BEGIN
	select s.`FirstName`, s.`Surname`, s.`DepartmentID`, d.`DepartmentName`, s.`DOB`
	from `Staff` s, `Department` d
		where s.`DepartmentID`= d.`DepartmentID`and `StaffID` in (`id`);
END&&
DELIMITER ;

/*BORROW RECEIPT GENERATOR*/
DELIMITER &&
CREATE PROCEDURE borrow_receipt(IN `id` varchar(32))
BEGIN
	select * from `Books Borrowed`
		where `PeriodCode` in (`id`);
END&&
DELIMITER ;

/*CHECKS IF MEMBER HAS OVERDUE BOOK*/
DELIMITER &&
CREATE PROCEDURE has_overdue(IN `id` varchar(32))
BEGIN
	select * from `Overdue Books`
		where `MemberID` in (`id`);
END&&
DELIMITER ;

/*CHECK IF BOOK IS DONATED*/
DELIMITER &&
CREATE PROCEDURE check_donated(IN `id` INT)
BEGIN
	select *
	from `donated_books`
		where `BookID` in (`id`);
END&&
DELIMITER ;

/*CHECK IF BOOK IS IN GOOD CONDITION*/
DELIMITER &&
CREATE PROCEDURE check_condition(IN `id` INT)
BEGIN
	select *
	from `good_condition`
		where `BookID` in (`id`);
END&&
DELIMITER ;

/*CHECK STAFF IN INDIVIDUAL DEPARTMENTS*/
DELIMITER &&
CREATE PROCEDURE count_staff(IN `id` INT)
BEGIN
	select *
	from `staff_per_department`
		where `DepartmentID` in (`id`);
END&&
DELIMITER ;

/*SHOW ALL STAFF IN INDIVIDUAL DEPARTMENTS*/
DELIMITER &&
CREATE PROCEDURE staff_dept_list(IN `id` INT)
BEGIN
	select `StaffID`, `FirstName`, `Surname`, `Email`, `PhoneNumber`
	from `staff`
		where `DepartmentID` in (`id`);
END&&
DELIMITER ;
