USE vk;

-- #1. Проанализировать какие запросы могут выполняться наиболее часто в процессе работы приложения и добавить необходимые индексы.

CREATE INDEX media_filename_idx ON media(filename);
CREATE INDEX comunities_name_idx ON communities(name);
CREATE INDEX profiles_hometown_idx ON profiles(hometown);
CREATE INDEX posts_header_idx ON posts(header);


-- #2. Задание на оконные функции
-- Построить запрос, который будет выводить следующие столбцы:
-- имя группы +
-- среднее количество пользователей в группах +
-- самый молодой пользователь в группе +
-- самый пожилой пользователь в группе +
-- общее количество пользователей в группе +
-- всего пользователей в системе
-- отношение в процентах (общее количество пользователей в группе / всего пользователей в системе) * 100

SELECT DISTINCT c.name,
	AVG(cu.user_id) OVER(PARTITION BY cu.community_id) AS average,
	MAX(p.birthday) OVER (PARTITION BY cu.community_id) AS youngerst_bday,
	MIN(p.birthday) OVER (PARTITION BY cu.community_id) AS oldest_bday,
	COUNT(cu.user_id) OVER(PARTITION BY cu.community_id) AS total_in_comm,
	COUNT( users.id) OVER () AS total,
	COUNT(cu.user_id) OVER(PARTITION BY cu.community_id) / COUNT(users.id) OVER () * 100 AS '%%'
    FROM communities_users cu
    	LEFT JOIN communities c
    		ON  cu.community_id = c.id
    	JOIN users 
    		ON users.id = cu.user_id
    	JOIN profiles p
    		ON p.user_id = users.id;
  		