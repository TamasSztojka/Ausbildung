CREATE DATABASE transaktionen;
USE transaktionen;

CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    account_holder VARCHAR(100),
    balance DECIMAL(10, 2)
);

CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    transaction_type ENUM('DEPOSIT', 'WITHDRAWAL') NOT NULL,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
INSERT INTO accounts (account_holder, balance) 
VALUES ('John Doe', 1000.00),
       ('Jane Doe', 500.00);

DELIMITER //

CREATE PROCEDURE transfer(
    IN sender_id INT,
    IN receiver_id INT,
    IN amount DECIMAL(10,2)
)
BEGIN
    DECLARE rollback_message VARCHAR(255) DEFAULT 'Transaction rolled back: Insufficient funds';
    DECLARE commit_message VARCHAR(255) DEFAULT 'Transaction committed successfully';

    START TRANSACTION;
    
    UPDATE accounts SET balance = balance - amount WHERE account_id = sender_id;

    UPDATE accounts SET balance = balance + amount WHERE account_id = receiver_id;

    IF (SELECT balance FROM accounts WHERE account_id = sender_id) < 0 THEN
     
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = rollback_message;
    ELSE
        INSERT INTO transactions (account_id, amount, transaction_type) VALUES (sender_id, -amount, 'WITHDRAWAL');
        INSERT INTO transactions (account_id, amount, transaction_type) VALUES (receiver_id, amount, 'DEPOSIT');
        
        COMMIT;
        SELECT commit_message AS 'Result';
    END IF;
END //

DELIMITER ;

SELECT * FROM accounts;

CALL transfer(1,2,100);
CALL transfer(2,1,700);
CALL transfer(2,1,700);
