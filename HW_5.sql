-- #1.1 Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
SELECT * FROM users;
UPDATE users SET created_at = NOW(), updated_at = NOW();

-- #1.2 Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
ALTER TABLE users CHANGE created_at created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
DESCRIBE users;
ALTER TABLE users CHANGE updated_at updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- #1.3 В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.
SELECT  * FROM storehouses;
INSERT INTO storehouses(name) VALUES ('склад 1'), ('склад 2'), ('склад 3');
INSERT INTO storehouses_products
  (storehouse_id, product_id, `value`)
VALUES
  (FLOOR(RAND()*(3-1)+1), 1, FLOOR(RAND()*(10-0)+0)),
  (FLOOR(RAND()*(3-1)+1), 2, FLOOR(RAND()*(10-0)+0)),
  (FLOOR(RAND()*(3-1)+1), 3, FLOOR(RAND()*(10-0)+0)),
  (FLOOR(RAND()*(3-1)+1), 4, FLOOR(RAND()*(10-0)+0)),
  (FLOOR(RAND()*(3-1)+1), 5, FLOOR(RAND()*(10-0)+0)),
  (FLOOR(RAND()*(3-1)+1), 6, FLOOR(RAND()*(10-0)+0)),
  (FLOOR(RAND()*(3-1)+1), 7, FLOOR(RAND()*(10-0)+0));
SELECT * FROM products;
DESCRIBE storehouses_products;
SELECT * FROM storehouses_products;
SELECT storehouse_id, product_id, `value` FROM storehouses_products ORDER BY `value` = 0, `value`;

-- #1.4 (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий ('may', 'august')
SELECT * FROM users;
CREATE TEMPORARY TABLE months(
id SERIAL PRIMARY KEY,
name VARCHAR(25));
INSERT INTO months(name) VALUES
('январь'),('февраль'),('март'),
('апрель'),('май'),('июнь'),('июль'),
('август'),('сентябрь'),('октябрь'),
('ноябрь'),('декабрь');
SELECT users.name, months.name AS `month` FROM users JOIN months ON MONTH(birthday_at) = months.id 
WHERE MONTH(birthday_at) = 5 OR MONTH(birthday_at) = 8;

-- №1.5 (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.
SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY id = 5 DESC, id;

-- #2.1 Подсчитайте средний возраст пользователей в таблице users
SELECT name, TIMESTAMPDIFF(YEAR, birthday_at, NOW()) AS Age FROM users;
SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS `avg` FROM users;

-- #2.2 Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.
SELECT ADDDATE(birthday_at, INTERVAL (TIMESTAMPDIFF(YEAR, birthday_at, NOW())) YEAR) FROM users;
SELECT DAYNAME(ADDDATE(birthday_at, INTERVAL (TIMESTAMPDIFF(YEAR, birthday_at, NOW())) YEAR)) AS `weekday`, COUNT(*) FROM users GROUP BY DAYNAME(ADDDATE(birthday_at, INTERVAL (TIMESTAMPDIFF(YEAR, birthday_at, NOW())) YEAR));

-- #2.3 (по желанию) Подсчитайте произведение чисел в столбце таблицы
SELECT ROUND(EXP(SUM(LN(id))), 2) FROM users;

