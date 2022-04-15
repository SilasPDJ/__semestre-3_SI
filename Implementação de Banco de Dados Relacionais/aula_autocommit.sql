SET autocommit = OFF;

CREATE TABLE professor1 (
    CODIGO    INTEGER    NOT NULL AUTO_INCREMENT,
    NOME        VARCHAR(50)    NOT NULL,
    CPF        CHAR(11)    NULL,
    EMAIL        VARCHAR(40),
    PRIMARY KEY (CODIGO)
);
 
INSERT INTO professor1 (NOME, CPF, EMAIL) VALUES ('Juca', '00024457741', 'juca@hotmail.com');
INSERT INTO professor1 (NOME, CPF, EMAIL) VALUES ('Jalen', '00024457741', 'jalen@hotmail.com');
INSERT INTO professor1 (NOME, CPF, EMAIL) VALUES ('Fábio', '00024457741', 'fabio@hotmail.com');
INSERT INTO professor1 (NOME, CPF, EMAIL) VALUES ('Jaci', '00024457741', 'jaci@hotmail.com');
INSERT INTO professor1 (NOME, CPF, EMAIL) VALUES ('Mara', '00024457741', 'mara@hotmail.com');
INSERT INTO professor1 (NOME, CPF, EMAIL) VALUES ('Christiane', '00024457741', 'chris@hotmail.com');
 

SELECT * FROM professor1;
 
START TRANSACTION;
 
DELETE FROM professor1 WHERE CODIGO=2;
 

ROLLBACK;
 
COMMIT;
 

# Tem que fazer: START, INSERT, COMMIT, SELECT, DELETE e ROLLBACK
 
 
# SET autommit = 0;
 
# SET autocommit = OFF;