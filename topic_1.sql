DROP TABLE IF EXISTS users;
CREATE TABLE users(
id SERIAL PRIMARY KEY,
name VARCHAR(255) COMMENT 'имя пользователя')
UNIQUE uniq_name(name(10);

INSERT INTO users VALUES
(DEFAULT, 'sonzza'),
(DEFAULT, 'KPjkee'),
(DEFAULT, 'bluebyte');

SELECT * FROM users;