CREATE TABLE books (
    book_id INT CONSTRAINT pk_books PRIMARY KEY IDENTITY(1,1),
    title VARCHAR(255) CONSTRAINT nn_title NOT NULL,
    price DECIMAL CONSTRAINT chk_price CHECK (price > 0),
    genre VARCHAR(255) DEFAULT 'Unknown'
);

INSERT INTO books (title, price, genre) VALUES ('The Great Gatsby', 12.99, 'Fiction');
INSERT INTO books (title, price, genre) VALUES ('Learn SQL', 29.99, 'Education');
INSERT INTO books (title, price) VALUES ('Python Basics', 19.50);

INSERT INTO books (title, price) VALUES ('', 15.00);
INSERT INTO books (price, genre) VALUES (25.75, 'Mystery');
INSERT INTO books (title, price, genre) VALUES ('Test Book', 0, 'Sci-Fi');
INSERT INTO books (title, price, genre) VALUES ('Null Test', -5.00, 'Fantasy');