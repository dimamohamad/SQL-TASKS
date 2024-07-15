USE Library;

SELECT * FROM Books;
SELECT * FROM Authors;
SELECT Title FROM Books WHERE CopiesAvailable=(SELECT MAX(CopiesAvailable) FROM Books);
SELECT Title FROM Books WHERE CopiesAvailable=(SELECT MIN(CopiesAvailable) FROM Books);
SELECT AVG(PublishedYear) FROM Books;
SELECT COUNT(BooksID)  FROM Books;