-- Delete old tables if they exist
DROP TABLE IF EXISTS Members;
DROP TABLE IF EXISTS Books;

-- Q1: Create Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    price DECIMAL(8,2),
    published_date DATE,
    in_stock INT DEFAULT 1
);

-- Q2: Insert 5 records
INSERT INTO Books (title, isbn, price, published_date, in_stock)
VALUES
('Database Systems', 'ISBN1001', 450.00, '2021-05-10', 5),
('History of India', 'ISBN1002', 350.00, '2018-08-15', 2),
('Python Programming', 'ISBN1003', 600.00, '2023-02-20', 10),
('Ancient History', 'ISBN1004', 400.00, '2019-11-01', 0);

INSERT INTO Books (title, isbn, price, published_date)
VALUES
('Computer Networks', 'ISBN1005', 550.00, '2022-06-18');

-- Show records
SELECT * FROM Books;

-- Q3: Rename column
ALTER TABLE Books
RENAME COLUMN title TO book_title;

-- Q4: Change data type
ALTER TABLE Books
MODIFY COLUMN price FLOAT;

-- Q5: Add author_name column
ALTER TABLE Books
ADD COLUMN author_name VARCHAR(50) NOT NULL DEFAULT 'Unknown';

-- Q6: Update prices
SET SQL_SAFE_UPDATES = 0;

UPDATE Books
SET price = price * 0.9
WHERE published_date < '2020-01-01';

SET SQL_SAFE_UPDATES = 0;

-- Show updated records
SELECT * FROM Books;

-- Q7: Delete books with in_stock = 0
DELETE FROM Books
WHERE in_stock = 0;


-- Show records
SELECT * FROM Books;

-- Q8: Reset AUTO_INCREMENT
ALTER TABLE Books
AUTO_INCREMENT = 101;

-- Q9: Display History books
SELECT book_title, price, published_date
FROM Books
WHERE book_title LIKE '%History%'
AND price > 300
ORDER BY price DESC;

-- Q10: Create Members table
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    member_name VARCHAR(100) NOT NULL,
    join_date DATE NOT NULL DEFAULT (CURRENT_DATE)
);

-- Display members joined in 2024
SELECT *
FROM Members
WHERE YEAR(join_date) = 2024
ORDER BY member_name ASC;