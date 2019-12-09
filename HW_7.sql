DESC messages;
DESC friendship;
DESC profiles;
DESC likes;
DESC media;
DESC users;
SELECT * FROM friendship;
SELECT * FROM friendship_statuses;


-- #2 Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

SELECT COUNT(*), from_user_id AS `user`
FROM messages m
	WHERE to_user_id = 5 AND  from_user_id IN
		(SELECT friend_id FROM friendship 
			WHERE user_id = m.to_user_id AND status_id IN 
		(SELECT id FROM friendship_statuses 
		WHERE name <> 'blocked'))
	GROUP BY `user`;


-- #3 Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

DROP TABLE IF EXISTS young_users;
CREATE TEMPORARY TABLE young_users
	(id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id INT UNSIGNED NOT NULL,
	birthday DATETIME DEFAULT CURRENT_TIMESTAMP);

INSERT INTO young_users(user_id, birthday)
	SELECT user_id, birthday FROM profiles ORDER BY birthday DESC LIMIT 10;
SELECT * FROM young_users;

SELECT COUNT(*) AS total_likes 
	FROM likes 
		WHERE user_id IN
			(SELECT user_id FROM young_users);

-- #4 Определить кто больше поставил лайков (всего) - мужчины или женщины?
	
SELECT 
	(SELECT COUNT(*) AS likes
		FROM likes 
			WHERE user_id IN
				(SELECT user_id FROM profiles WHERE sex = 'f')) AS female, 
	(SELECT COUNT(*) AS likes
		FROM likes 
			WHERE user_id IN
				(SELECT user_id FROM profiles WHERE sex = 'm')) AS male
	FROM profiles LIMIT 1;
		

-- №5 Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
DROP TABLE IF EXISTS total_stuff;
CREATE TEMPORARY TABLE total_stuff
	(id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id INT UNSIGNED NOT NULL,
	total INT UNSIGNED DEFAULT NULL
);

INSERT INTO total_stuff(user_id, total) 
	SELECT from_user_id, COUNT(*) FROM messages GROUP by from_user_id;
INSERT INTO total_stuff(user_id, total) 	
	SELECT user_id, COUNT(*) FROM posts GROUP by user_id;
INSERT INTO total_stuff(user_id, total)	
	SELECT user_id, COUNT(*) FROM likes GROUP by user_id;
INSERT INTO total_stuff(user_id, total)	
	SELECT user_id, COUNT(*) FROM media GROUP by user_id;

SELECT * FROM total_stuff;

SELECT user_id, SUM(total) AS total FROM total_stuff GROUP BY user_id ORDER BY total LIMIT 10;
