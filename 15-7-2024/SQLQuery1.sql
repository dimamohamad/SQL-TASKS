--CREATE DATABASE Library;
USE Library;
--CREATE TABLE Books (
--BooksID int primary key,
--Title varchar(30) null,
--AuthorID int  null,
--PublishedYear int null,
--CopiesAvailable int ,
--BookCategory varchar(10)
--);
--CREATE TABLE Authors (
--AuthorID int primary key ,
--FirstName varchar(15) null,
--LastName varchar(15) null,
--BirthYear  varchar(4) 
--);

--INSERT INTO Books VALUES (1,'Norwegian Wood',0,1987,500,'Romance'),(2,'The Autumn of the Patriarch',1,1975,300,'Fiction'),(3,'Pride and Prejudice',2,1813,250,'Romance'),(4,'Animal Farm',3,1945,300,'Fiction'),(5,'Americanah',4,2013,600,'Contempor');
--INSERT INTO Authors VALUES (0,'Haruki','Murakami','1949'),(1,'Gabriel','Marquez','1927'),(2,'Jane','Austen','1775'),(3,'George','Orwell','1903'),(4,'Chimamanda','Adichie','1977');

SELECT * FROM Books;
SELECT * FROM Authors;
--SELECT Title FROM Books WHERE CopiesAvailable=(SELECT MAX(CopiesAvailable) FROM Books);
--SELECT Title FROM Books WHERE CopiesAvailable=(SELECT MIN(CopiesAvailable) FROM Books);
--SELECT AVG(PublishedYear) FROM Books;
--SELECT COUNT(BooksID)  FROM Books;
--TRUNCATE TABLE Books;
--DROP TABLE Authors;