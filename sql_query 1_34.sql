ALTER TABLE product ADD tax_rates DECIMAL(5, 2);
UPDATE product SET tax_rate = 12.00;

SELECT title FROM product WHERE title LIKE '%s' OR title LIKE '%t';

SELECT * FROM books WHERE TYPE IN ('business', 'psychology', 'undecided');

SELECT title FROM book WHERE sales > 5000 AND royalty < 20;

SELECT title FROM book WHERE publisher_id = '0736' ORDER BY sales ASC;

SELECT MAX(royalty) - MIN(royalty) AS royalty_difference FROM book WHERE publisher_id = '0877';

SELECT author_id, COUNT(*) AS book_count FROM book GROUP BY author_id;

SELECT title, COUNT(author_id) AS author_count FROM title_author GROUP BY title;

SELECT AVG(royalty) AS average_royalty FROM authors WHERE order_number = 1;

SELECT title FROM book WHERE sales BETWEEN 10000 AND 20000 ORDER BY price;

SELECT COUNT(*) FROM authors WHERE city = 'Menlo Park';

SELECT state, COUNT(*) AS author_count FROM authors GROUP BY state ORDER BY state;

SELECT state FROM authors WHERE first_name LIKE 'S%' GROUP BY state HAVING COUNT(*) > 2;

SELECT REPLACE(REPLACE(title, ' ', '.'), '-', '*') AS modified_title FROM book;

SELECT REPLACE(title, ' ', '') AS title_no_spaces FROM book;

SELECT SUBSTRING_INDEX(title, ' ', 1) AS first_word FROM book;

SELECT MONTH(publishing_date) AS month, COUNT(*) AS book_count FROM book GROUP BY MONTH(publishing_date);

SELECT title, publisher_name FROM book WHERE publisher_location = 'USA';

SELECT publisher_name, AVG(price) AS average_price FROM book GROUP BY publisher_name;

SELECT a.city, COUNT(b.title) AS book_count 
FROM authors a 
JOIN book b ON a.author_id = b.author_id 
GROUP BY a.city;

SELECT a.name AS author_name, b.title 
FROM authors a 
LEFT JOIN book b ON a.author_id = b.author_id;

SELECT b.title, p.publisher_name, a.name AS author_name 
FROM book b 
JOIN publishers p ON b.publisher_id = p.publisher_id 
JOIN authors a ON b.primary_author_id = a.author_id;

SELECT p.city, MAX(b.price) AS max_price 
FROM publishers p 
JOIN book b ON p.publisher_id = b.publisher_id 
GROUP BY p.city;

SELECT DISTINCT b.title 
FROM book b 
JOIN authors a ON b.author_id = a.author_id 
WHERE a.city = 'Menlo Park';

SELECT title FROM book WHERE publisher_location != 'USA';

CREATE VIEW books_summary AS 
SELECT title, publisher_id, YEAR(publishing_date) AS publishing_year, 
       COALESCE(price, 0) AS price, COALESCE(type, 'Unknown') AS type 
FROM book;


SELECT DISTINCT p.publisher_name 
FROM publishers p 
JOIN book b ON p.publisher_id = b.publisher_id 
JOIN (SELECT author_id FROM book GROUP BY author_id HAVING COUNT(*) > 2) AS a ON b.author_id = a.author_id;

DELETE FROM title_author 
WHERE author_id IN (SELECT author_id FROM authors WHERE first_name = 'Dean');

UPDATE book
SET price = (SELECT price FROM books WHERE book_id = 'MC2222') 
WHERE book_id = 'BU1111';

SELECT title FROM book WHERE publishing_date >= DATE_SUB(CURDATE(), INTERVAL 25 YEAR);

SELECT DISTINCT b.title 
FROM book b 
WHERE b.publisher_id IN (SELECT publisher_id FROM books WHERE YEAR(publishing_date) = 2021);

CREATE VIEW publisher_summary AS 
SELECT p.publisher_name, p.city, COUNT(b.title) AS book_count 
FROM publishers p 
JOIN book b ON p.publisher_id = b.publisher_id 
GROUP BY p.publisher_name, p.city;




















