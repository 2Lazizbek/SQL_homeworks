CREATE TABLE account (
    account_id INT CONSTRAINT pk_account PRIMARY KEY,
    balance DECIMAL(10,2) CONSTRAINT chk_balance_account CHECK (balance >= 0),
    account_type VARCHAR(50) CONSTRAINT chk_accounttype_account CHECK (account_type IN ('Saving', 'Checking'))
);

ALTER TABLE account
DROP CONSTRAINT chk_balance_account;

ALTER TABLE account
DROP CONSTRAINT chk_accounttype_account;

ALTER TABLE account
ADD CONSTRAINT chk_balance_account CHECK (balance >= 0);

ALTER TABLE account
ADD CONSTRAINT chk_accounttype_account CHECK (account_type IN ('Saving', 'Checking'));