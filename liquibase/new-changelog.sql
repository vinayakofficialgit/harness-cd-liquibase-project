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

