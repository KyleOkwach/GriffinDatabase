/*Griffin Library Management System*/
use griffin;

/*__BOOKS__*/
CREATE TABLE books(
	BookID INT(6) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    BookName VARCHAR(64) NOT NULL,
    Publisher VARCHAR(64),
    Author VARCHAR(64) NOT NULL,
    YearOfPublication date NOT NULL,
    ISBN varchar(32),
    Quantity int(20)
);/*Table with details of books in the library /drop table books;*/


