USE `Griffin`;

CREATE VIEW `new_book` as
	select `BookName`, `ISBN`, `Author`, `Publisher`, `DOP`, count(`ISBN`) as `Quantity` from `Book`
    where `DOP` between'2000-01-01' and curdate()
    group by `ISBN`;/*Books published within the last Decade*/
    
CREATE VIEW `old_book` as
	select `BookName`, `ISBN`, `Author`, `Publisher`, `DOP`, count(`ISBN`) as `Quantity` from `Book`
    where `DOP` not between'2000-01-01' and curdate()
    group by `ISBN`;
    
CREATE VIEW `donated_books` as
	select * from `Book`
    where `Donated` in ('True');
    
CREATE VIEW `good_condition` as
	select * from `Book`
    where `GoodCondition?` in ('True');

CREATE VIEW `books_per_category` as/*counts amount of books in each category*/
	select `CategoryName`, count(`CategoryName`) as `Quantity` from `Book`
    group by `CategoryName`;
    
CREATE VIEW `staff_per_department` as
	select s.`DepartmentID`, d.`DepartmentName`, count(s.`DepartmentID`) as `Staff Working` 
    from `Department` d, `Staff` s
    where s.`DepartmentID` = d.`DepartmentID`
    group by s.`DepartmentID`;

CREATE VIEW `Overdue Books` as
	select b.`PeriodCode`, b.`BookID`, b.`MemberID`, b.`DateBorrowed`, b.`DateDue`
	from `Books Borrowed` b
	left join `Returned Books` r on b.`PeriodCode` = r.`PeriodCode`
	where r.`PeriodCode` is null and b.`DateDue` < curdate();
    

    