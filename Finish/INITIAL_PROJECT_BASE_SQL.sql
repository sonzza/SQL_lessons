DROP DATABASE IF EXISTS project_base;
CREATE DATABASE project_base;
USE project_base;

DROP TABLE IF EXISTS projects;
CREATE TABLE projects(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	pressmark VARCHAR(30) UNIQUE NOT NULL,
	projects_type_id INT UNSIGNED,
	directions_id INT UNSIGNED,
	statuses_id INT UNSIGNED NOT NULL,
	start_day DATE NOT NULL,
	finish_day DATE NOT NULL,
	created_at DATETIME DEFAULT NOW(),
  	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
);


DROP TABLE IF EXISTS stages;
CREATE TABLE stages(
	id INT UNSIGNED AUTO_INCREMENT NOT NULL,
	projects_id INT UNSIGNED NOT NULL,
	name VARCHAR(255) NOT NULL,
	statuses_id INT UNSIGNED NOT NULL,
	start_day DATE NOT NULL,
	finish_day DATE NOT NULL,
	created_at DATETIME DEFAULT NOW(),
  	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
  	PRIMARY KEY (id, projects_id)
);

DROP TABLE IF EXISTS projects_types;
CREATE TABLE projects_types(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(150) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS directions;
CREATE TABLE directions(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(150) NOT NULL UNIQUE
);


DROP TABLE IF EXISTS statuses;
CREATE TABLE statuses(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(150) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS documents;
CREATE TABLE documents(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(150) NOT NULL UNIQUE,
	documents_type_id INT UNSIGNED NOT NULL,
	metadata LONGTEXT NOT NULL,
	projects_id INT UNSIGNED NOT NULL, 
	created_at DATETIME DEFAULT NOW(),
  	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
);

DROP TABLE IF EXISTS documents_types;
CREATE TABLE documents_types(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(150) NOT NULL 
);

DROP TABLE IF EXISTS project_menegments;
CREATE TABLE project_menegments(
	projects_id INT UNSIGNED PRIMARY KEY,
	PM_id INT UNSIGNED NOT NULL,
	PA_id INT UNSIGNED,
	PE_id INT UNSIGNED
);

DROP TABLE IF EXISTS managers;
CREATE TABLE managers(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	login VARCHAR(8) NOT NULL UNIQUE,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS budgets_plan;
CREATE TABLE budgets_plan(
	stages_id INT UNSIGNED PRIMARY KEY,
	material_sum FLOAT,
	semimanufactures_sum FLOAT,
	salary_sum FLOAT,
	total FLOAT AS (material_sum + semimanufactures_sum + salary_sum) STORED COMMENT 'Себестоимость'

);

DROP TABLE IF EXISTS budgets_actual_costs;
CREATE TABLE budgets_actual_costs(
	stages_id INT UNSIGNED PRIMARY KEY,
	material_sum FLOAT,
	semimanufactures_sum FLOAT,
	salary_sum FLOAT, 
	total FLOAT AS (material_sum + semimanufactures_sum + salary_sum) STORED COMMENT 'Фактически затрачено'
);