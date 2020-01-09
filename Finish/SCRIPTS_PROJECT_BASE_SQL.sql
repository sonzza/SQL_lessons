SELECT * FROM projects p;
SELECT * FROM stages s;
SELECT * FROM budgets_plan bp;
SELECT * FROM budgets_actual_costs bac;
SELECT * FROM documents_types;


-- Поправляем сгенерированные данные
UPDATE stages SET finish_day = ADDDATE(start_day, INTERVAL RAND()*(3-1)+1 YEAR);
UPDATE stages SET created_at = start_day WHERE created_at > start_day;
UPDATE projects SET start_day = (SELECT MIN(start_day) FROM stages s WHERE projects.id = projects_id);
UPDATE projects SET finish_day = (SELECT MAX(finish_day) FROM stages s WHERE projects.id = projects_id);
UPDATE projects SET created_at = start_day WHERE created_at > start_day;


-- К какому проекту какие этапы относятся
SELECT p.id, p.pressmark, s.id, s.name FROM projects p
	LEFT JOIN stages s
		ON p.id = s.projects_id;

-- Суммарные предполагаемые затраты по этапам
SELECT s.name, salary_sum + semimanufactures_sum + material_sum AS total FROM projects p 
	 JOIN stages s
	 	ON p.id = s.projects_id
	 LEFT JOIN budgets_plan bp
	 	ON bp.stages_id = s.id;

-- Суммарные предполагаемые затраты по проектам	
SELECT pressmark, SUM(bp.total) AS total_plan FROM projects p 
	 JOIN stages s
	 	ON p.id = s.projects_id
	 JOIN budgets_plan bp
	 	ON bp.stages_id = s.id
	 GROUP BY pressmark;

-- Суммарные фактические затраты по проектам  
SELECT pressmark, SUM(bac.total) AS total_actual FROM projects p 
	 JOIN stages s
	 	ON p.id = s.projects_id
	 JOIN budgets_actual_costs bac
	 	ON bac.stages_id = s.id
	 GROUP BY pressmark;		
	
-- Сравнение затрат по проектам
SELECT p.pressmark, SUM(bp.total), SUM(bac.total), SUM(bp.total) - SUM(bac.total) AS difference FROM projects p 
	 JOIN stages s
	 	ON p.id = s.projects_id
	 JOIN budgets_plan bp
	 	ON bp.stages_id = s.id
	 JOIN budgets_actual_costs bac
	 	ON bac.stages_id = s.id
	 GROUP BY p.pressmark;	

-- Проекты по отраслям/направлениям
SELECT d.name, COUNT(p.name) FROM directions d
	JOIN projects p
		ON p.directions_id = d.id
	GROUP BY d.name;
		
-- Проекты по типам
SELECT pt.name, COUNT(p.name) FROM projects_types pt
	JOIN projects p
		ON p.projects_type_id = pt.id
	GROUP BY pt.name;

-- Количество проектов по сотрудникам
SELECT CONCAT(m.first_name, ' ', m.last_name) AS manager, COUNT(p.id) AS total_projects FROM projects p
	JOIN project_menegments pm
		ON pm.projects_id = p.id
	JOIN managers m
		ON m.id = pm.PM_id
	GROUP BY manager;

