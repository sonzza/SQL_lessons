-- #1 В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

START TRANSACTION;
INSERT INTO example.users (name) SELECT name FROM shop.users WHERE id = 1;
COMMIT;

SELECT * FROM example.users u;
SELECT * FROM shop.users u;

-- #2 Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.
USE shop;
CREATE OR REPLACE VIEW prod_by_part AS SELECT p.name AS product, c.name AS part FROM products p JOIN catalogs c ON c.id = p.catalog_id;
SELECT * FROM prod_by_part;

SELECT * FROM catalogs;
SELECT * FROM products;

-- #3 Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
DELIMITER //
 
DROP FUNCTION IF EXISTS hello //
CREATE FUNCTION hello()	
RETURNS VARCHAR(255) NO SQL
	BEGIN
			IF DATE_FORMAT(NOW(), '%H:%i:%s') BETWEEN '06:00:01' AND '12:00:00' THEN
				RETURN 'Good morinig!';
			ELSEIF DATE_FORMAT(NOW(), '%H:%i:%s') BETWEEN '12:00:01' AND '18:00:00' THEN
				RETURN 'Good day!';
			ELSEIF DATE_FORMAT(NOW(), '%H:%i:%s') BETWEEN '18:00:01' AND '23:59:59' THEN
				RETURN 'Good evening!';
			ELSEIF DATE_FORMAT(NOW(), '%H:%i:%s') BETWEEN '00:00:00' AND '06:00:00' THEN 
				RETURN 'Good night!';
		END IF;
	END //

SELECT hello();


-- #4 В таблице products есть два текстовых поля: name с названием товара и description с его описанием. Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.


INSERT INTO products(name, description) VALUES ('NULL', NULL);
SELECT * FROM products p;

DROP TRIGGER check_catalog_name_description_insert_2;

SHOW TRIGGERS;

DELIMITER //

CREATE TRIGGER check_catalog_name_description_insert_2 BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF NEW.name IS NULL AND NEW.description IS NULL THEN
  		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Имя и описание не могут быть одновременно пусты';
	ELSE 
		BEGIN
			DECLARE prod_name VARCHAR(50) DEFAULT 'замените на нормальное наименование';
			DECLARE prod_description VARCHAR(50) DEFAULT 'замените описание на нормальное наименование';
			SET NEW.name = COALESCE(NEW.name, prod_name);
			SET NEW.description = COALESCE(NEW.description, prod_description);
		END;
	END IF;
END //

DELIMITER //

CREATE TRIGGER check_catalog_name_description_insert_2 BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
	IF NEW.name IS NULL AND NEW.description IS NULL THEN
  		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Имя и описание не могут быть одновременно пусты';
	ELSE 
		BEGIN
			DECLARE prod_name VARCHAR(50) DEFAULT 'замените на нормальное наименование';
			DECLARE prod_description VARCHAR(50) DEFAULT 'замените описание на нормальное наименование';
			SET NEW.name = COALESCE(NEW.name, OLD.name, prod_name);
			SET NEW.description = COALESCE(NEW.description, OLD.description, prod_description);
		END;
	END IF;
END //

