CREATE DATABASE JaradatTech ;
USE JaradatTech ;
CREATE TABLE Authors (
authorID int primary key Identity (1,1),
authorName varchar(50)
);
CREATE TABLE Sections (
sectionID int primary key identity(1,1),
sectionName varchar(50)
);

CREATE TABLE Employees(
employeeID int primary key Identity (1,1),
employeeName varchar(50)

);

CREATE TABLE Category(
categoryID  int primary key identity(1,1),
categoryName varchar(50),
--bookID	int foreign key REFERENCES Books(bookID ),

);

CREATE TABLE USERS(
userID int primary key Identity (1,1),
userName varchar(50),
employeeID	int foreign key REFERENCES Employees(employeeID ),
);
CREATE TABLE Books (
bookID int primary key identity(1,1),
bookName varchar(50),
copies int ,
authorID int foreign key REFERENCES Authors(authorID),
sectionID int foreign key REFERENCES Sections(sectionID ),
--categoryID int foreign key REFERENCES Category(categoryID ),
--userID int foreign key REFERENCES USERS(USERSID ),

);


CREATE TABLE  CategoryBooks(
categoryID int foreign key REFERENCES Category(categoryID ),
bookID	int foreign key REFERENCES Books(bookID ),

);

CREATE TABLE USERSBOOKS(
bookID	int foreign key REFERENCES Books(bookID) ,
userID int foreign key REFERENCES USERS(userID),
);
INSERT INTO Authors (authorName) VALUES 
('J.K. Rowling'),
('George R.R. Martin'),
('J.R.R. Tolkien'),
('Agatha Christie'),
('Stephen King');

INSERT INTO Sections (sectionName) VALUES 
('Fiction'),
('Non-Fiction'),
('Science Fiction'),
('Mystery'),
('Horror');

INSERT INTO Employees (employeeName) VALUES 
('Ayman'),
('Suha'),
('Sara'),
('Ayah'),
('Rahaf');

INSERT INTO Category (categoryName) VALUES 
('Adventure'),
('Fantasy'),
('Historical'),
('Thriller'),
('Romance');

INSERT INTO USERS (userName, employeeID) VALUES 
('Dima', 1),
('Lujain', 2),
('Yaman', 3),
('Batool', 4),
('Hosam', 5);

INSERT INTO Books (bookName, copies, authorID, sectionID) VALUES 
('Harry Potter', 5, 1, 1),
('Game of Thrones', 3, null, 1),
('The Hobbit', null, 3, 3),
('Murder on the Orient Express', 2, 4, 4),
('The Shining',null,null, 5);

INSERT INTO CategoryBooks (categoryID, bookID) VALUES 
(1, 1),
(2, 2),
(2, 3),
(4, 4),
(5, 5);

INSERT INTO USERSBOOKS (bookID, userID) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

SELECT * FROM Books;
SELECT * FROM Authors;
SELECT * FROM Category;
SELECT * FROM USERS;
SELECT * FROM CategoryBooks ;

SELECT Books.bookName, Authors.authorName
FROM Books
 JOIN Authors ON Books.authorID = Authors.authorID;

 SELECT  Books.bookName,Books.copies,Authors.authorID
FROM Books
LEFT JOIN Authors ON Books.authorID = Authors.authorID;

SELECT Books.bookName,Books.copies, Authors.authorName
FROM Books
RIGHT JOIN Authors ON Books.authorID = Authors.authorID;

SELECT Books.bookName, Books.copies,Authors.authorName
FROM Books
FULL OUTER JOIN Authors ON Books.authorID = Authors.authorID;

SELECT Books.bookName,Books.copies, Category.categoryName
FROM Books
 JOIN CategoryBooks ON Books.bookID = CategoryBooks.bookID  JOIN Category ON CategoryBooks.categoryID = Category.categoryID;


SELECT Books.bookName,Books.copies, Category.categoryName
FROM Books
LEFT JOIN CategoryBooks ON Books.bookID = CategoryBooks.bookID LEFT JOIN Category ON CategoryBooks.categoryID = Category.categoryID;


SELECT Books.bookName,Books.copies, Category.categoryName
FROM Books
RIGHT JOIN CategoryBooks ON Books.bookID = CategoryBooks.bookID RIGHT JOIN Category ON CategoryBooks.categoryID = Category.categoryID;

SELECT Books.bookName,Books.copies, Category.categoryName
FROM Books
FULL OUTER JOIN CategoryBooks ON Books.bookID = CategoryBooks.bookID FULL OUTER JOIN Category ON CategoryBooks.categoryID = Category.categoryID;