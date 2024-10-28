CREATE TABLE authors (
    author_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    order_number INT
);
INSERT INTO authors (first_name, last_name, city, state, order_number)
VALUES 
('John', 'Doe', 'Menlo Park', 'CA', 1),
('Jane', 'Smith', 'San Francisco', 'CA', 2),
('Dean', 'Winters', 'Los Angeles', 'CA', 3);

CREATE TABLE publishers (
    publisher_id VARCHAR(10) PRIMARY KEY,
    publisher_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50)
);
INSERT INTO publishers (publisher_id, publisher_name, city, state, country)
VALUES 
('0736', 'Tech Books Publishing', 'New York', 'NY', 'USA'),
('0877', 'Business Publishers', 'Menlo Park', 'CA', 'USA');

CREATE TABLE book(
    book_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(255),
    publisher_id VARCHAR(10) FOREIGN KEY REFERENCES publishers(publisher_id),
    author_id INT FOREIGN KEY REFERENCES authors(author_id),
    publishing_date DATE,
    price DECIMAL(10, 2),
    sales INT,
    royalty DECIMAL(5, 2),
    type VARCHAR(50),
    publisher_location VARCHAR(50)
);
INSERT INTO book (book_id, title, publisher_id, author_id, publishing_date, price, sales, royalty, type, publisher_location)
VALUES 
('BU1111', 'Business Strategies', '0877', 1, '2020-05-01', 15.99, 10000, 15, 'business', 'USA'),
('MC2222', 'Mindset Psychology', '0736', 2, '2019-07-15', 20.00, 7000, 10, 'psychology', 'USA');

CREATE TABLE title_author (
    title_author_id INT PRIMARY KEY IDENTITY(1,1),
    book_id VARCHAR(10) FOREIGN KEY REFERENCES book(book_id),
    author_id INT FOREIGN KEY REFERENCES authors(author_id)
);
INSERT INTO title_author (book_id, author_id)
VALUES 
('BU1111', 1),  
('MC2222', 2),  
('BU1111', 2),  
('MC2222', 1);  

CREATE TABLE product (
    product_id INT PRIMARY KEY IDENTITY(1,1),
    title VARCHAR(255),
    price DECIMAL(10, 2),
    tax_rate DECIMAL(5, 2)
);
INSERT INTO product(title, price, tax_rate)
VALUES 
('Business Strategies', 15.99, 0.12),
('Mindset Psychology', 20.00, 0.12);


