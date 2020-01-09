SHOW TRIGGERS;
DROP TRIGGER IF EXISTS check_start_data_for_projects_update;
DROP TRIGGER IF EXISTS check_start_data_for_projects_insert;
DROP TRIGGER IF EXISTS check_finish_data_for_projects_insert;
DROP TRIGGER IF EXISTS check_finish_data_for_projects_update;

DELIMITER //
CREATE TRIGGER check_start_data_for_projects_update AFTER UPDATE ON stages
FOR EACH ROW
	BEGIN
		UPDATE projects SET start_day = (SELECT MIN(start_day) FROM stages s WHERE projects.id = projects_id);
	END //
	

DELIMITER //
CREATE TRIGGER check_start_data_for_projects_insert AFTER INSERT ON stages
FOR EACH ROW
	BEGIN
		UPDATE projects SET start_day = (SELECT MIN(start_day) FROM stages s WHERE projects.id = projects_id);
	END //

DELIMITER //
CREATE TRIGGER check_finish_data_for_projects_update AFTER UPDATE ON stages
FOR EACH ROW
	BEGIN
		UPDATE projects SET finish_day = (SELECT MAX(finish_day) FROM stages s WHERE projects.id = projects_id);
	END //
	

DELIMITER //
CREATE TRIGGER check_finish_data_for_projects_insert AFTER INSERT ON stages 
FOR EACH ROW
	BEGIN
		UPDATE projects SET finish_day = (SELECT MAX(finish_day) FROM stages s WHERE projects.id = projects_id);
	END //	
	


SELECT * FROM stages s WHERE projects_id = 1;
SELECT pressmark, start_day, finish_day FROM projects p WHERE id = 1;

UPDATE `stages` SET start_day ='1986-06-29' WHERE projects_id = 1;

UPDATE `stages` SET finish_day ='1999-06-29' WHERE projects_id = 1;

INSERT INTO `stages` (`id`, `projects_id`, `name`, `statuses_id`, `start_day`, `finish_day`, `created_at`, `updated_at`) VALUES (61, 1, 'gooogo', 1, '1980-06-29', '2002-07-06', '1992-01-21 02:20:56', '2001-01-07 19:32:29');