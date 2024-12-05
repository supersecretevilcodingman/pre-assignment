DROP DATABASE IF EXISTS library;
CREATE DATABASE library;
USE library;

CREATE TABLE authors (
author_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
full_name VARCHAR(40)
);
CREATE TABLE books (
book_id int  PRIMARY KEY NOT NULL AUTO_INCREMENT,
title VARCHAR(100),
author_id int,
FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

INSERT INTO library.authors (full_name) VALUES ('Phil');
INSERT INTO library.authors (full_name) VALUES ('William Shakespeare');
INSERT INTO library.authors (full_name) VALUES ('Jane Austen');
INSERT INTO library.authors (full_name) VALUES ('Charlees Dickeens');