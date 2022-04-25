USE Griffin;

show tables;
drop table staff;
drop procedure count_per_category;

select * from administrators;
call pass_check('Bendo', 'theworld18');
call count_per_category('History');
call member_card(2);
call staff_card(1);

select * from `new_book`;
select * from `old_book`;
select * from `donated_books`;

select * from `Category`;
select * from `Member`;
select * from `Staff`;
select * from `staff_per_department`;
select * from `books_per_category`;
select * from `Department`;
select * from `Overdue Books`;
select * from `Book`;
select * from `Books Borrowed`;
select * from `Returned Books`;
select * from `Department`;

call has_overdue(10);
call borrow_receipt(1);
call check_donated(2);
call count_staff(1);
call staff_dept_list(1);
call check_condition(7);

SHOW FULL TABLES WHERE TABLE_TYPE LIKE 'VIEW';
show procedure status where db='griffin';


