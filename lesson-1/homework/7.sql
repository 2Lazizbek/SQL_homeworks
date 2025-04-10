CREATE TABLE invoice (
    invoice_id INT CONSTRAINT pk_invoice PRIMARY KEY IDENTITY(1,1),
    amount DECIMAL
);

INSERT INTO invoice (amount) VALUES (10.50);
INSERT INTO invoice (amount) VALUES (25.75);
INSERT INTO invoice (amount) VALUES (99.99);
INSERT INTO invoice (amount) VALUES (15.00);
INSERT INTO invoice (amount) VALUES (45.30);

SET IDENTITY_INSERT invoice ON;
INSERT INTO invoice (invoice_id, amount) VALUES (100, 75.25);
SET IDENTITY_INSERT invoice OFF;