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
create table company (
    id int primary key auto_increment not null,
    name varchar(50) not null,
    address1 varchar(50),
    address2 varchar(50),
    city varchar(30)
);
--rollback DROP TABLE company;

--changeset other.DevOps:13 labels:example-label context:example-context
--comment: example comment
alter table person add column country varchar(2);
--rollback ALTER TABLE person DROP COLUMN country;
