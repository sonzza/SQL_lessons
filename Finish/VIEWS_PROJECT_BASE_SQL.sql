-- Проекты по направлениям и типам
CREATE OR REPLACE VIEW directions_types_view AS 
	SELECT d.name AS direction, pt.name AS `type`, p.name AS `name`
		FROM directions d, projects_types AS pt, projects AS p
			WHERE d.id = p.directions_id AND pt.id = p.projects_type_id

			
SELECT * FROM directions_types_view;


-- Проекты по руководителям
CREATE OR REPLACE VIEW managers_view AS 
	SELECT m.login login, pt.name `type`, p.name `name`
		FROM managers m, projects_types pt, projects p, project_menegments pm 
			WHERE m.id = pm.PM_id AND pt.id = p.projects_type_id AND pm.projects_id = p.id;
		
SELECT * FROM managers_view;

-- Проекты по ведущим инженерам
CREATE OR REPLACE VIEW engineers_view AS 
	SELECT m.login login, pt.name `type`, p.name `name`
		FROM managers m, projects_types pt, projects p, project_menegments pm 
			WHERE m.id = pm.PE_id AND pt.id = p.projects_type_id AND pm.projects_id = p.id;
		
SELECT * FROM engineers_view;

-- Проекты по администраторам
CREATE OR REPLACE VIEW administrators_view AS 
	SELECT m.login login, pt.name `type`, p.name `name`
		FROM managers m, projects_types pt, projects p, project_menegments pm 
			WHERE m.id = pm.PA_id AND pt.id = p.projects_type_id AND pm.projects_id = p.id;
		
SELECT * FROM administrators_view;

-- Полная административная информация по проектам (наименование, шифр, направление, тип,  РП, АП, ИП)
CREATE OR REPLACE VIEW main_view AS 
	SELECT DISTINCT p.id, p.name AS `project name`, p.pressmark, pt.name AS `type`,  d.name AS direction,  
		(SELECT CONCAT(m.first_name, ' ', m.last_name) FROM managers m WHERE m.id = pm1.PM_id) AS  PM,
		(SELECT CONCAT(m.first_name, ' ', m.last_name) FROM managers m WHERE m.id = pm1.PA_id) AS  PA,
		(SELECT CONCAT(m.first_name, ' ', m.last_name) FROM managers m WHERE m.id = pm1.PE_id) AS  PE FROM projects p 
		JOIN project_menegments pm1 
			ON pm1.projects_id = p.id
		JOIN projects_types pt
			ON p.projects_type_id = pt.id
		JOIN directions d
			ON p.directions_id = d.id;
			
SELECT * FROM main_view;


SELECT p.id, name, pressmark FROM projects p;

	