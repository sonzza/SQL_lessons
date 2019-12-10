CREATE DATABASE IF NOT EXISTS example;
USE example;
DROP TABLE IF EXISTS users;
CREATE TABLE users(
id SERIAL PRIMARY KEY,
name VARCHAR(255) NOT NULL COMMENT 'имя пользователя')
UNIQUE uniq_name(name(10);

INSERT INTO users VALUES
(DEFAULT, 'sonzza'),
(DEFAULT, 'KPjkee'),
(DEFAULT, 'bluebyte');


