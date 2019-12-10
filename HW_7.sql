USE shop;

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_of_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Заказы';

INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('1', 1, '2012-09-04 04:52:27', '2010-02-03 03:22:02');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('2', 4, '1972-05-22 13:07:53', '2001-08-31 23:11:09');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('3', 3, '2012-03-02 09:07:15', '1992-06-13 20:04:33');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('4', 3, '2005-10-15 03:36:07', '2017-05-10 08:41:35');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('5', 6, '1980-06-10 10:52:56', '2005-09-29 00:37:56');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('6', 2, '2000-10-25 01:58:35', '1986-04-03 17:01:18');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('7', 5, '2006-06-25 04:58:03', '2012-12-22 14:51:20');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('8', 1, '1990-01-28 12:59:28', '2007-02-27 06:58:20');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('9', 4, '1977-11-09 04:25:46', '1992-08-22 17:36:33');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('10', 6, '2010-04-11 23:42:50', '2000-08-04 22:51:13');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('11', 1, '1981-12-17 19:12:55', '1996-10-25 19:23:59');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('12', 4, '1974-03-06 15:36:57', '1970-05-05 12:03:34');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('13', 3, '1997-06-06 02:14:41', '1992-12-03 05:02:22');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('14', 4, '2012-04-10 07:02:27', '2019-07-06 01:24:41');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('15', 4, '1994-06-24 00:44:22', '2012-09-01 16:59:06');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('16', 1, '1985-12-26 05:07:02', '1976-06-09 18:24:06');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('17', 6, '1999-06-29 05:21:42', '1999-11-25 17:25:11');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('18', 2, '2000-11-22 17:27:36', '2004-04-20 10:40:05');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('19', 3, '1976-12-15 19:20:18', '2012-09-19 10:44:48');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('20', 2, '1982-09-19 15:03:58', '1977-03-12 01:42:26');


DROP TABLE IF EXISTS `orders_products`;

CREATE TABLE `orders_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `total` int(10) unsigned DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Состав заказа';

INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('1', 1, 3, 7, '2000-01-27 17:15:20', '2010-04-29 13:44:31');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('2', 2, 5, 3, '1986-08-18 02:15:53', '1991-11-25 03:06:14');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('3', 3, 1, 3, '1977-09-12 03:21:16', '2013-03-24 17:36:31');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('4', 4, 4, 4, '1976-03-10 02:47:23', '2014-06-12 19:26:13');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('5', 5, 4, 4, '1998-12-17 06:07:22', '1995-10-17 22:22:38');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('6', 6, 1, 0, '1995-08-13 23:42:26', '2018-11-18 19:18:21');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('7', 7, 5, 8, '1980-03-25 20:29:04', '1999-09-22 15:16:04');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('8', 8, 2, 2, '2000-12-17 03:38:13', '1993-11-18 22:58:55');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('9', 9, 4, 3, '1970-01-29 23:40:29', '1994-03-24 01:27:11');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('10', 10, 3, 6, '2011-12-28 16:12:31', '2010-11-06 07:48:25');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('11', 11, 2, 3, '1975-05-19 21:23:28', '2007-08-25 14:30:54');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('12', 12, 3, 9, '2012-10-13 15:21:42', '1976-01-22 04:36:15');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('13', 13, 5, 0, '2015-05-06 07:05:40', '1982-05-01 04:25:07');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('14', 14, 5, 0, '1976-04-28 13:45:54', '2012-01-27 11:15:20');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('15', 15, 2, 7, '1979-01-29 02:11:54', '1998-03-19 02:34:00');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('16', 16, 5, 8, '1990-11-22 06:46:08', '1985-06-29 07:02:30');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('17', 17, 4, 4, '2008-04-06 01:28:27', '1972-06-08 09:08:45');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('18', 18, 7, 5, '1985-11-09 23:42:50', '1972-01-17 15:42:06');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('19', 19, 3, 3, '1990-09-13 10:13:22', '1988-05-14 19:00:56');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('20', 20, 4, 9, '1982-02-27 11:07:57', '2013-02-03 14:19:19');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('21', 1, 5, 6, '2004-01-16 20:22:15', '1979-01-27 04:53:56');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('22', 2, 3, 0, '1991-06-09 21:25:50', '1986-02-04 17:50:13');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('23', 3, 6, 7, '1985-07-05 20:34:48', '1971-03-31 06:06:12');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('24', 4, 6, 3, '1984-03-29 12:49:54', '2019-08-03 03:39:18');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('25', 5, 1, 5, '1974-06-16 17:27:38', '1987-09-27 01:16:23');

-- #1 Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
SELECT * FROM orders;
DELETE FROM orders WHERE user_id = 4;
SELECT id, name FROM users u WHERE id IN(SELECT user_id FROM orders);

-- доработанное до JOIN;
SELECT DISTINCT u.id, u.name FROM users u JOIN orders o WHERE u.id  = o.user_id;

-- #2 Выведите список товаров products и разделов catalogs, который соответствует товару.
SELECT p.name, c.*
	FROM products p LEFT JOIN catalogs c
		ON c.id = p.catalog_id;
	
-- #3 (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.
DROP TABLE IF EXISTS flights;
CREATE TABLE flights(
id SERIAL PRIMARY KEY,
`from` VARCHAR(30) DEFAULT NULL,
`to` VARCHAR(30) DEFAULT NULL);

INSERT INTO flights (`from`, `to`) VALUES ('moscow', 'omsk'), ('novgorod', 'kazan'), ('irkutsk', 'moscow'), ('omsk', 'irkutsk'), ('moscow', 'kazan');
SELECT * FROM flights;
DROP TABLE IF EXISTS cities;
CREATE TABLE cities(
id SERIAL PRIMARY KEY,
`label` VARCHAR(30) DEFAULT NULL,
`name` VARCHAR(30) DEFAULT NULL);

INSERT INTO cities (`label`, `name`) VALUES ('moscow', 'Москва'), ('novgorod', 'Новгород'), ('irkutsk', 'Иркутск'), ('omsk', 'Омск'), ('kazan', 'Казань');


SELECT c.name AS `откуда`, ci.name AS `куда` 
	FROM cities c JOIN cities ci JOIN flights f 
		ON c.label = f.`from` AND ci.label = f.`to` 
			ORDER BY FIELD (f.`id`, 1, 2, 3, 4, 5);


