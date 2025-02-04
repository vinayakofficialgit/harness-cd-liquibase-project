--liquibase formatted sql

--changeset your.linuxuser:11        
CREATE TABLE IF NOT EXISTS person (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    address1 VARCHAR(50),
    address2 VARCHAR(50),
    city VARCHAR(30)
);
--rollback DROP TABLE person;

--changeset your.vinayaks:12 labels:example-label context:example-context
--comment: example comment
CREATE TABLE IF NOT EXISTS company (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    address1 VARCHAR(50),
    address2 VARCHAR(50),
    city VARCHAR(30)
);
--rollback DROP TABLE company;

--changeset other.DevOps:13 labels:example-label context:example-context
--comment: example comment
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM information_schema.columns WHERE table_name='person' AND column_name='country';
ALTER TABLE person ADD COLUMN country VARCHAR(2);
--rollback ALTER TABLE person DROP COLUMN country;
