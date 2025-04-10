CREATE TABLE Book (
    book_id INT CONSTRAINT pk_book PRIMARY KEY IDENTITY(1,1),
    title VARCHAR(255),
    author VARCHAR(255),
    published_year INT
);

CREATE TABLE Member (
    member_id INT CONSTRAINT pk_member PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(255)
);

CREATE TABLE Loan (
    loan_id INT CONSTRAINT pk_loan PRIMARY KEY IDENTITY(1,1),
    book_id INT CONSTRAINT fk_book_loan FOREIGN KEY REFERENCES Book(book_id),
    member_id INT CONSTRAINT fk_member_loan FOREIGN KEY REFERENCES Member(member_id),
    loan_date DATE,
    return_date DATE
);

INSERT INTO Book (title, author, published_year) VALUES ('To Kill a Mockingbird', 'Harper Lee', 1960);
INSERT INTO Book (title, author, published_year) VALUES ('1984', 'George Orwell', 1949);
INSERT INTO Book (title, author, published_year) VALUES ('Pride and Prejudice', 'Jane Austen', 1813);

INSERT INTO Member (name, email, phone_number) VALUES ('John Doe', 'john.doe@email.com', '555-1234');
INSERT INTO Member (name, email, phone_number) VALUES ('Jane Smith', 'jane.smith@email.com', '555-5678');
INSERT INTO Member (name, email, phone_number) VALUES ('Bob Johnson', 'bob.j@email.com', '555-9012');

INSERT INTO Loan (book_id, member_id, loan_date, return_date) VALUES (1, 1, '2025-03-01', '2025-03-15');
INSERT INTO Loan (book_id, member_id, loan_date, return_date) VALUES (2, 2, '2025-04-01', NULL);
INSERT INTO Loan (book_id, member_id, loan_date, return_date) VALUES (3, 3, '2025-04-05', '2025-04-09');