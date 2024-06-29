CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE service (
    "createdAt"     TIMESTAMP NOT NULL DEFAULT now(),
    "updatedAt"     TIMESTAMP NOT NULL DEFAULT now(),
    "deletedAt"     TIMESTAMP,
    "uid"           uuid NOT NULL DEFAULT uuid_generate_v4(),
    "name"          character varying(255)
);

CREATE TABLE message (
    "createdAt"     TIMESTAMP NOT NULL DEFAULT now(),
    "updatedAt"     TIMESTAMP NOT NULL DEFAULT now(),
    "deletedAt"     TIMESTAMP,
    "uid"           uuid      NOT NULL DEFAULT uuid_generate_v4(),
    "user"          uuid      NOT NULL,
    "text"          character varying(255)
);

CREATE TABLE users (
    "createdAt"     TIMESTAMP NOT NULL DEFAULT now(),
    "updatedAt"     TIMESTAMP NOT NULL DEFAULT now(),
    "deletedAt"     TIMESTAMP,
    "uid"           uuid      NOT NULL DEFAULT uuid_generate_v4(),
    "name"          character varying(255),
    "info"          character varying(255)
);

INSERT INTO "service" (name) 
VALUES 
    ('dataBase'), 
    ('front-and'), 
    ('back-and');

INSERT INTO "users" ("name", "info") 
VALUES 
    ('Nik', NULL), 
    ('Eva', NULL), 
    ('Vlad', NULL);

insert into message ("user", "text") 
VALUES 
    ((select uid from users u where name = 'Nik'), 'HI'),
    ((select uid from users u where name = 'Eva'), 'HI'),
    ((select uid from users u where name = 'Vlad'), 'Не понял');