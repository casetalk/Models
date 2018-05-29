--
-- Project=WorkingHours.prj
-- Path=\\Mac\Home\Documents\CaseTalk\Models\EN\WorkingHours\
-- Description=A more realistic example where worksheets are verbalized and modeled. The model validation shows potential redundancy warnings.
-- 
-- Repository=\\Mac\Home\Documents\CaseTalk\Models\EN\WorkingHours\WorkingHours_GLR.igg
-- Author=BCP Software
--

CREATE SCHEMA WorkingHours_GLR_igg;

CREATE DOMAIN amount_of_euros AS NUMERIC(6,0);
CREATE DOMAIN amount_of_hours AS INTEGER;
CREATE DOMAIN City AS CHAR(7);
CREATE DOMAIN customer_name AS CHAR(20);
CREATE DOMAIN customernumber AS INTEGER;
CREATE DOMAIN description AS CHAR(42);
CREATE DOMAIN division_name AS CHAR(13);
CREATE DOMAIN division_nr AS INTEGER;
CREATE DOMAIN employee_no AS INTEGER;
CREATE DOMAIN person_name AS CHAR(14);
CREATE DOMAIN project_no AS CHAR(7);
-- 
-- Source
--   Created at : 3-10-2017 9:33:02
--   Modeler : marcow
--   Modified at : 22-10-2017 21:41:07
--
CREATE DOMAIN task_name AS CHAR(11);
-- 
-- Source
--   Created at : 8-1-2018 11:52:11
--   Modeler : BCP Software
--   Modified at : 8-1-2018 11:52:11
--
CREATE DOMAIN title_code AS CHAR(3)
   CHECK (VALUE IN ('ing', 'ir', 'mr', 'mrs', 'ms'));
-- 
-- Source
--   Created at : 15-9-2017 12:54:57
--   Modeler : marcow
--   Modified at : 15-9-2017 12:54:57
--
CREATE DOMAIN wbs_number AS INTEGER;
CREATE DOMAIN week_no AS INTEGER;
CREATE DOMAIN year_no AS INTEGER;
--
-- Artificial key domain
--
CREATE DOMAIN GENID AS INTEGER;

-- Table Customer
-- what can this mean?
-- 
-- "Customer <customernumber> has name <Name of Customer>."
--
-- 
-- Data Warehouse
--   History : No history
--
-- Column Name_of_Customer
-- blablabla
--
-- 
-- Data Warehouse
--   History : No history
-- Source
--   Created at : 26-10-2017 17:00:10
--   Modeler : marcow
--   Modified at : 26-10-2017 17:00:10
--
CREATE TABLE Customer (
   customernumber customernumber NOT NULL, -- customernumber
   Name_of_Customer customer_name NOT NULL, -- Name of Customer

   PRIMARY KEY (customernumber),
   UNIQUE (Name_of_Customer)
);
CREATE VIEW Customer_Expression AS
SELECT customernumber,
 'Customer ' || customernumber ||  ' has name ' || Name_of_Customer || '.' AS FactExpression
 FROM Customer;


-- Table Customer_Location
-- "Customer <Customer> is located in <City>."
--
CREATE TABLE Customer_Location (
   Customer customernumber NOT NULL, -- Customer
   City City NOT NULL, -- City

   PRIMARY KEY (Customer, City)
);
CREATE VIEW Customer_Location_Expression AS
SELECT Customer, City,
 'Customer ' || Customer ||  ' is located in ' || City || '.' AS FactExpression
 FROM Customer_Location;


-- Table Division
-- "Division <division nr> has name <Name of Division>."
--
CREATE TABLE Division (
   division_nr division_nr NOT NULL, -- division nr
   Name_of_Division division_name NOT NULL, -- Name of Division

   PRIMARY KEY (division_nr),
   UNIQUE (Name_of_Division)
);
CREATE VIEW Division_Expression AS
SELECT division_nr,
 'Division ' || division_nr ||  ' has name ' || Name_of_Division || '.' AS FactExpression
 FROM Division;


-- Table Employee
-- "Employee <employee no> has name <Employee Name>."
-- "Employee <employee no> has title <Title>."
-- "Employee <employee no> is arranged to division <Division>."
--
CREATE TABLE Employee (
   employee_no employee_no NOT NULL, -- employee no
   Employee_Name person_name NOT NULL, -- Employee Name
   Title title_code, -- Employee Title/Title
   Division division_nr NOT NULL, -- Division Employee/Division

   PRIMARY KEY (employee_no)
);
CREATE VIEW Employee_Expression AS
SELECT employee_no,
 'Employee ' || employee_no ||  ' has name ' || Employee_Name || '.' AS FactExpression
 FROM Employee
UNION
SELECT employee_no,
 'Employee ' || employee_no ||  ' has title ' || Title || '.' AS FactExpression
 FROM Employee
UNION
SELECT employee_no,
 'Employee ' || employee_no ||  ' is arranged to division ' || Division || '.' AS FactExpression
 FROM Employee;


-- Table Hour_Rate
-- "From week <Year><week no> the hour rate for employee <Employee> working on project <Project> is EUR <Amount>."
--
CREATE TABLE Hour_Rate (
   Year year_no NOT NULL, -- Week/Year
   week_no week_no NOT NULL, -- Week/week no
   Employee employee_no NOT NULL, -- Project Employee/Employee
   Project project_no NOT NULL, -- Project Employee/Project
   Amount amount_of_euros NOT NULL, -- Amount

   PRIMARY KEY (Year, week_no, Employee, Project)
);
CREATE VIEW Hour_Rate_Expression AS
SELECT Year, week_no, Employee, Project,
 'From week ' || Year || week_no ||  ' the hour rate for employee ' || Employee ||  ' working on project ' || Project ||  ' is EUR ' || Amount || '.' AS FactExpression
 FROM Hour_Rate;


-- Table Project
-- "Project <project no> is the responsibility of division <Division>."
-- "Project <project no> is managed by employee <Employee>."
-- "Project <project no> is carried out for customer <Customer>."
-- "Project <project no> has description <Project Description>."
--
-- Column Customer
-- pipo
--
-- 
-- Data Warehouse
--   History : No history
-- Source
--   Created at : 26-10-2017 17:00:25
--   Modeler : marcow
--   Modified at : 14-11-2017 13:35:47
--
-- Column Project_Description
-- de clown
--
-- 
-- Data Warehouse
--   History : No history
-- Source
--   Created at : 26-10-2017 17:00:32
--   Modeler : marcow
--   Modified at : 14-11-2017 13:35:54
--
CREATE TABLE Project (
   project_no project_no NOT NULL, -- project no
   Division division_nr NOT NULL, -- Responsible Division/Division
   Employee employee_no, -- Project Manager/Employee
   Customer customernumber NOT NULL, -- Customer Project/Customer
   Project_Description description NOT NULL, -- Project Description

   PRIMARY KEY (project_no)
);
CREATE VIEW Project_Expression AS
SELECT project_no,
 'Project ' || project_no ||  ' is the responsibility of division ' || Division || '.' AS FactExpression
 FROM Project
UNION
SELECT project_no,
 'Project ' || project_no ||  ' is managed by employee ' || Employee || '.' AS FactExpression
 FROM Project
UNION
SELECT project_no,
 'Project ' || project_no ||  ' is carried out for customer ' || Customer || '.' AS FactExpression
 FROM Project
UNION
SELECT project_no,
 'Project ' || project_no ||  ' has description ' || Project_Description || '.' AS FactExpression
 FROM Project;


-- Table Work_Task
-- "There is a Work Task with wbs code <wbs number>."
-- "Work task <wbs number> has name <Work Task Name>."
--
CREATE TABLE Work_Task (
   wbs_number wbs_number NOT NULL, -- wbs number
   Work_Task_Name task_name NOT NULL, -- Work Task Name

   PRIMARY KEY (wbs_number),
   UNIQUE (Work_Task_Name)
);
CREATE VIEW Work_Task_Expression AS
SELECT wbs_number,
 'There is a Work Task with wbs code ' || wbs_number || '.' AS FactExpression
 FROM Work_Task
UNION
SELECT wbs_number,
 'Work task ' || wbs_number ||  ' has name ' || Work_Task_Name || '.' AS FactExpression
 FROM Work_Task;


-- Table Working_Hours
-- "In week <Year><week no> employee <Employee> working on project <Project> <amount of hours> hours at work task <Work Task> ."
--
CREATE TABLE Working_Hours (
   Year year_no NOT NULL, -- Week/Year
   week_no week_no NOT NULL, -- Week/week no
   Employee employee_no NOT NULL, -- Project Employee/Employee
   Project project_no NOT NULL, -- Project Employee/Project
   Work_Task wbs_number NOT NULL, -- Work Task
   amount_of_hours amount_of_hours NOT NULL, -- amount of hours

   UNIQUE (Year, week_no, Employee, Project, amount_of_hours),
   PRIMARY KEY (Year, week_no, Employee, Project, Work_Task)
);
CREATE VIEW Working_Hours_Expression AS
SELECT Year, week_no, Employee, Project, Work_Task,
 'In week ' || Year || week_no ||  ' employee ' || Employee ||  ' working on project ' || Project ||  ' ' || amount_of_hours ||  ' hours at work task ' || Work_Task || ' .' AS FactExpression
 FROM Working_Hours;


-- FOREIGN KEY 
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE Working_Hours
   ADD FOREIGN KEY (Work_Task)
   REFERENCES Work_Task (wbs_number);

-- FOREIGN KEY 
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE Project
   ADD FOREIGN KEY (Division)
   REFERENCES Division (division_nr);

-- FOREIGN KEY 
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE Project
   ADD FOREIGN KEY (Employee)
   REFERENCES Employee (employee_no);

-- FOREIGN KEY 
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE Project
   ADD FOREIGN KEY (Customer)
   REFERENCES Customer (customernumber);

-- FOREIGN KEY 
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE Employee
   ADD FOREIGN KEY (Division)
   REFERENCES Division (division_nr);

-- FOREIGN KEY 
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE Customer_Location
   ADD FOREIGN KEY (Customer)
   REFERENCES Customer (customernumber);

-- FOREIGN KEY 
-- During lexicalizing generated SC
-- While reducing "Project Employee"
--
ALTER TABLE Working_Hours
   ADD FOREIGN KEY (Employee)
   REFERENCES Employee (employee_no);

-- SUBSET 
-- During lexicalizing generated SC
-- While reducing "Project Employee"
--

ALTER TABLE Working_Hours
   ADD CHECK (EXISTS
       (SELECT *
        FROM   Hour_Rate
        WHERE  Employee = Working_Hours.Employee
        AND    Project = Working_Hours.Project));

-- FOREIGN KEY 
-- During lexicalizing generated SC
-- While reducing "Project Employee"
--
ALTER TABLE Working_Hours
   ADD FOREIGN KEY (Project)
   REFERENCES Project (project_no);

-- FOREIGN KEY 
-- During lexicalizing generated SC
-- While reducing "Project Employee"
--
ALTER TABLE Hour_Rate
   ADD FOREIGN KEY (Employee)
   REFERENCES Employee (employee_no);

-- FOREIGN KEY 
-- During lexicalizing generated SC
-- While reducing "Project Employee"
--
ALTER TABLE Hour_Rate
   ADD FOREIGN KEY (Project)
   REFERENCES Project (project_no);

-- DATABASE VIEWS
--

CREATE VIEW Project_Employee AS
  SELECT 
    Employee,  -- Project Employee/Employee
    Project -- Project Employee/Project
  FROM Hour_Rate
  UNION
  SELECT 
    Employee,  -- Project Employee/Employee
    Project -- Project Employee/Project
  FROM Working_Hours;

CREATE VIEW Week AS
  SELECT 
    Year,  -- Week/Year
    week_no -- Week/week no
  FROM Hour_Rate
  UNION
  SELECT 
    Year,  -- Week/Year
    week_no -- Week/week no
  FROM Working_Hours;

--

-- POPULATION
--

INSERT INTO Customer
  (customernumber, Name_of_Customer)
  VALUES
  (4081, 'District Limburg S.E');
INSERT INTO Customer_Location
  (Customer, City)
  VALUES
  (4081, 'Utrecht');
INSERT INTO Division
  (division_nr, Name_of_Division)
  VALUES
  (6, 'Soil Research');
INSERT INTO Employee
  (employee_no, Employee_Name, Title, Division)
  VALUES
  (618, 'Boven W.J. van', 'ing', 6);
INSERT INTO Hour_Rate
  (Year, week_no, Employee, Project, Amount)
  VALUES
  (2001, 09, 618, '6323.16', 213.83);
INSERT INTO Hour_Rate
  (Year, week_no, Employee, Project, Amount)
  VALUES
  (2001, 38, 312, '7004.07', 164);
INSERT INTO Project
  (project_no, Division, Employee, Customer, Project_Description)
  VALUES
  ('6323.16', 6, 283, 4081, 'Investigation of ...dumping site in Ulbach');
INSERT INTO Work_Task
  (wbs_number, Work_Task_Name)
  VALUES
  (1, 'preparation');
INSERT INTO Work_Task
  (wbs_number, Work_Task_Name)
  VALUES
  (14, 'drawing');
INSERT INTO Working_Hours
  (Year, week_no, Employee, Project, Work_Task, amount_of_hours)
  VALUES
  (2001, 38, 618, '7004.07', 1, 2);
INSERT INTO Working_Hours
  (Year, week_no, Employee, Project, Work_Task, amount_of_hours)
  VALUES
  (2001, 38, 232, '6323.16', 14, 4);

