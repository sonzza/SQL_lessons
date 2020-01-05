-- №1 Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs 
-- помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.
USE shop;
DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
    id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    table_name varchar(30) NOT NULL,
   	id_from_table INT UNSIGNED NOT NULL,
    name_from_table varchar(255)
) ENGINE = Archive;

SHOW TABLES;
SHOW TRIGGERS;
DROP TRIGGER users_inserts;
DROP TRIGGER catalogs_inserts;
DROP TRIGGER products_inserts;

SELECT * FROM logs l;

DELIMITER //

CREATE TRIGGER users_inserts AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO logs VALUES (NULL, DEFAULT, "users", NEW.id, NEW.name);
END //

DELIMITER //

CREATE TRIGGER catalogs_inserts AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
    INSERT INTO logs VALUES (NULL, DEFAULT, "catalogs", NEW.id, NEW.name);
END //

DELIMITER //

CREATE TRIGGER products_inserts AFTER INSERT ON products
FOR EACH ROW
BEGIN
    INSERT INTO logs VALUES (NULL, DEFAULT, "products", NEW.id, NEW.name);
END //

INSERT INTO products(name, description) VALUES('Core I9', 'новый серверный');

USE vk;
SELECT first_name, email FROM users LIMIT 10;


USE shop;
SELECT * FROM products LIMIT 3;



-- 
    
db.products.insert({name: 'Intel Core i3-8100', cat: 'процессоры',
    description: 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.',
    price: 7890.00}) 
db.products.insert({name: 'Intel Core i5-7400', cat: 'процессоры', 
	description: 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 
	price: 12700.00})
db.products.insert({name: 'ASUS ROG MAXIMUS X HERO', cat: 'материнские платы',
    description: 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX',
    price: 19310.00})
