USE project_base;

ALTER TABLE stages
  ADD CONSTRAINT stages_projects_id_fk 
    FOREIGN KEY (projects_id) REFERENCES projects(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT stages_statuses_id_fk
    FOREIGN KEY (statuses_id) REFERENCES statuses(id);

   
ALTER TABLE projects
 ADD CONSTRAINT projects_projects_type_id_fk 
   FOREIGN KEY (projects_type_id) REFERENCES projects_types(id)
      ON DELETE SET NULL,
 ADD CONSTRAINT projects_direction_id_fk 
   FOREIGN KEY (directions_id) REFERENCES directions(id)
      ON DELETE SET NULL,
 ADD CONSTRAINT projects_statuses_id_fk
   FOREIGN KEY (statuses_id) REFERENCES statuses(id);


ALTER TABLE budgets_plan
  ADD CONSTRAINT budgets_plan_stages_id_fk
    FOREIGN KEY (stages_id) REFERENCES stages(id)
   	  ON DELETE CASCADE;

ALTER TABLE budgets_actual_costs
  ADD CONSTRAINT budgets_actual_costs_stages_id_fk
    FOREIGN KEY (stages_id) REFERENCES stages(id)
   	  ON DELETE CASCADE;
  	 
   
ALTER TABLE project_menegments
 ADD CONSTRAINT project_managments_projects_id_fk 
   FOREIGN KEY (projects_id) REFERENCES projects(id)
      ON DELETE CASCADE,
 ADD CONSTRAINT project_managments_PM_id_fk
   FOREIGN KEY (PM_id) REFERENCES managers(id),
 ADD CONSTRAINT project_managments_PA_id_fk
   FOREIGN KEY (PA_id) REFERENCES managers(id)
      ON DELETE SET NULL,
 ADD CONSTRAINT project_managments_PI_id_fk
   FOREIGN KEY (PE_id) REFERENCES managers(id)
      ON DELETE SET NULL;

     
ALTER TABLE documents
  ADD CONSTRAINT documents_documents_type_id_fk
    FOREIGN KEY (documents_type_id) REFERENCES documents_types(id),
  ADD CONSTRAINT documents_projects_id_fk 
    FOREIGN KEY (projects_id) REFERENCES projects(id)
      ON DELETE CASCADE;

     
CREATE INDEX managers_name_idx ON managers(login);
CREATE INDEX directions_name_idx ON directions(name);
CREATE INDEX projects_types_name_idx ON projects_types(name);
CREATE INDEX documents_name_idx ON documents(name);