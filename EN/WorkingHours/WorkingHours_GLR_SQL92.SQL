--
-- Project=WorkingHours.prj
-- Path=\\Mac\Home\Documents\CaseTalk\Models\EN\WorkingHours\
-- Description=A more realistic example where worksheets are verbalized and modeled. The model validation shows potential redundancy warnings.
-- 
-- Repository=\\Mac\Home\Documents\CaseTalk\Models\EN\WorkingHours\WorkingHours_GLR.igg
-- Author=BCP Software
--

CREATE SCHEMA "WORKINGHOURS_GLR_IGG";

CREATE DOMAIN "AMOUNT_OF_EUROS" AS NUMERIC(6,0);
CREATE DOMAIN "AMOUNT_OF_HOURS" AS INTEGER;
CREATE DOMAIN "CITY" AS CHAR(7);
CREATE DOMAIN "CUSTOMER_NAME" AS CHAR(20);
CREATE DOMAIN "CUSTOMERNUMBER" AS INTEGER;
CREATE DOMAIN "DESCRIPTION" AS CHAR(42);
CREATE DOMAIN "DIVISION_NAME" AS CHAR(13);
CREATE DOMAIN "DIVISION_NR" AS INTEGER;
CREATE DOMAIN "EMPLOYEE_NO" AS INTEGER;
CREATE DOMAIN "PERSON_NAME" AS CHAR(14);
CREATE DOMAIN "PROJECT_NO" AS CHAR(7);
-- 
-- Source
--   Created at : 3-10-2017 9:33:02
--   Modeler : marcow
--   Modified at : 22-10-2017 21:41:07
--
CREATE DOMAIN "TASK_NAME" AS CHAR(11);
-- 
-- Source
--   Created at : 8-1-2018 11:52:11
--   Modeler : BCP Software
--   Modified at : 8-1-2018 11:52:11
--
CREATE DOMAIN "TITLE_CODE" AS CHAR(3)
   CHECK (VALUE IN ('ing', 'ir', 'mr', 'mrs', 'ms'));
-- 
-- Source
--   Created at : 15-9-2017 12:54:57
--   Modeler : marcow
--   Modified at : 15-9-2017 12:54:57
--
CREATE DOMAIN "WBS_NUMBER" AS INTEGER;
CREATE DOMAIN "WEEK_NO" AS INTEGER;
CREATE DOMAIN "YEAR_NO" AS INTEGER;
--
-- Artificial key domain
--
CREATE DOMAIN "GENID" AS INTEGER;

-- Table "CUSTOMER"
-- what can this mean?
-- 
-- "Customer <customernumber> has name <Name of Customer>."
--
-- 
-- Data Warehouse
--   History : No history
--
-- Column "NAME_OF_CUSTOMER"
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
CREATE TABLE "CUSTOMER" (
   "CUSTOMERNUMBER" "CUSTOMERNUMBER" NOT NULL, -- customernumber
   "NAME_OF_CUSTOMER" "CUSTOMER_NAME" NOT NULL, -- Name of Customer

   PRIMARY KEY ("CUSTOMERNUMBER"),
   UNIQUE ("NAME_OF_CUSTOMER")
);
CREATE OR REPLACE VIEW e_"CUSTOMER" AS
  FOLDER = '/CaseTalk/WorkingHours_GLR.igg/Documentation'
SELECT "CUSTOMERNUMBER",
 'Customer ' || "CUSTOMERNUMBER" ||  ' has name ' || "NAME_OF_CUSTOMER" || '.' AS FactExpression
 FROM "CUSTOMER";


-- Table "CUSTOMER_LOCATION"
-- "Customer <Customer> is located in <City>."
--
CREATE TABLE "CUSTOMER_LOCATION" (
   "CUSTOMER" "CUSTOMERNUMBER" NOT NULL, -- Customer
   "CITY" "CITY" NOT NULL, -- City

   PRIMARY KEY ("CUSTOMER", "CITY")
);
CREATE OR REPLACE VIEW e_"CUSTOMER_LOCATION" AS
  FOLDER = '/CaseTalk/WorkingHours_GLR.igg/Documentation'
SELECT "CUSTOMER", "CITY",
 'Customer ' || "CUSTOMER" ||  ' is located in ' || "CITY" || '.' AS FactExpression
 FROM "CUSTOMER_LOCATION";


-- Table "DIVISION"
-- "Division <division nr> has name <Name of Division>."
--
CREATE TABLE "DIVISION" (
   "DIVISION_NR" "DIVISION_NR" NOT NULL, -- division nr
   "NAME_OF_DIVISION" "DIVISION_NAME" NOT NULL, -- Name of Division

   PRIMARY KEY ("DIVISION_NR"),
   UNIQUE ("NAME_OF_DIVISION")
);
CREATE OR REPLACE VIEW e_"DIVISION" AS
  FOLDER = '/CaseTalk/WorkingHours_GLR.igg/Documentation'
SELECT "DIVISION_NR",
 'Division ' || "DIVISION_NR" ||  ' has name ' || "NAME_OF_DIVISION" || '.' AS FactExpression
 FROM "DIVISION";


-- Table "EMPLOYEE"
-- "Employee <employee no> has name <Employee Name>."
-- "Employee <employee no> has title <Title>."
-- "Employee <employee no> is arranged to division <Division>."
--
CREATE TABLE "EMPLOYEE" (
   "EMPLOYEE_NO" "EMPLOYEE_NO" NOT NULL, -- employee no
   "EMPLOYEE_NAME" "PERSON_NAME" NOT NULL, -- Employee Name
   "TITLE" "TITLE_CODE", -- Employee Title/Title
   "DIVISION" "DIVISION_NR" NOT NULL, -- Division Employee/Division

   PRIMARY KEY ("EMPLOYEE_NO")
);
CREATE OR REPLACE VIEW e_"EMPLOYEE" AS
  FOLDER = '/CaseTalk/WorkingHours_GLR.igg/Documentation'
SELECT "EMPLOYEE_NO",
 'Employee ' || "EMPLOYEE_NO" ||  ' has name ' || "EMPLOYEE_NAME" || '.' AS FactExpression
 FROM "EMPLOYEE"
UNION
SELECT "EMPLOYEE_NO",
 'Employee ' || "EMPLOYEE_NO" ||  ' has title ' || "TITLE" || '.' AS FactExpression
 FROM "EMPLOYEE"
UNION
SELECT "EMPLOYEE_NO",
 'Employee ' || "EMPLOYEE_NO" ||  ' is arranged to division ' || "DIVISION" || '.' AS FactExpression
 FROM "EMPLOYEE";


-- Table "HOUR_RATE"
-- "From week <Year><week no> the hour rate for employee <Employee> working on project <Project> is EUR <Amount>."
--
CREATE TABLE "HOUR_RATE" (
   "YEAR" "YEAR_NO" NOT NULL, -- Week/Year
   "WEEK_NO" "WEEK_NO" NOT NULL, -- Week/week no
   "EMPLOYEE" "EMPLOYEE_NO" NOT NULL, -- Project Employee/Employee
   "PROJECT" "PROJECT_NO" NOT NULL, -- Project Employee/Project
   "AMOUNT" "AMOUNT_OF_EUROS" NOT NULL, -- Amount

   PRIMARY KEY ("YEAR", "WEEK_NO", "EMPLOYEE", "PROJECT")
);
CREATE OR REPLACE VIEW e_"HOUR_RATE" AS
  FOLDER = '/CaseTalk/WorkingHours_GLR.igg/Documentation'
SELECT "YEAR", "WEEK_NO", "EMPLOYEE", "PROJECT",
 'From week ' || "YEAR" || "WEEK_NO" ||  ' the hour rate for employee ' || "EMPLOYEE" ||  ' working on project ' || "PROJECT" ||  ' is EUR ' || "AMOUNT" || '.' AS FactExpression
 FROM "HOUR_RATE";


-- Table "PROJECT"
-- "Project <project no> is the responsibility of division <Division>."
-- "Project <project no> is managed by employee <Employee>."
-- "Project <project no> is carried out for customer <Customer>."
-- "Project <project no> has description <Project Description>."
--
-- Column "CUSTOMER"
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
-- Column "PROJECT_DESCRIPTION"
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
CREATE TABLE "PROJECT" (
   "PROJECT_NO" "PROJECT_NO" NOT NULL, -- project no
   "DIVISION" "DIVISION_NR" NOT NULL, -- Responsible Division/Division
   "EMPLOYEE" "EMPLOYEE_NO", -- Project Manager/Employee
   "CUSTOMER" "CUSTOMERNUMBER" NOT NULL, -- Customer Project/Customer
   "PROJECT_DESCRIPTION" "DESCRIPTION" NOT NULL, -- Project Description

   PRIMARY KEY ("PROJECT_NO")
);
CREATE OR REPLACE VIEW e_"PROJECT" AS
  FOLDER = '/CaseTalk/WorkingHours_GLR.igg/Documentation'
SELECT "PROJECT_NO",
 'Project ' || "PROJECT_NO" ||  ' is the responsibility of division ' || "DIVISION" || '.' AS FactExpression
 FROM "PROJECT"
UNION
SELECT "PROJECT_NO",
 'Project ' || "PROJECT_NO" ||  ' is managed by employee ' || "EMPLOYEE" || '.' AS FactExpression
 FROM "PROJECT"
UNION
SELECT "PROJECT_NO",
 'Project ' || "PROJECT_NO" ||  ' is carried out for customer ' || "CUSTOMER" || '.' AS FactExpression
 FROM "PROJECT"
UNION
SELECT "PROJECT_NO",
 'Project ' || "PROJECT_NO" ||  ' has description ' || "PROJECT_DESCRIPTION" || '.' AS FactExpression
 FROM "PROJECT";


-- Table "WORK_TASK"
-- "There is a Work Task with wbs code <wbs number>."
-- "Work task <wbs number> has name <Work Task Name>."
--
CREATE TABLE "WORK_TASK" (
   "WBS_NUMBER" "WBS_NUMBER" NOT NULL, -- wbs number
   "WORK_TASK_NAME" "TASK_NAME" NOT NULL, -- Work Task Name

   PRIMARY KEY ("WBS_NUMBER"),
   UNIQUE ("WORK_TASK_NAME")
);
CREATE OR REPLACE VIEW e_"WORK_TASK" AS
  FOLDER = '/CaseTalk/WorkingHours_GLR.igg/Documentation'
SELECT "WBS_NUMBER",
 'There is a Work Task with wbs code ' || "WBS_NUMBER" || '.' AS FactExpression
 FROM "WORK_TASK"
UNION
SELECT "WBS_NUMBER",
 'Work task ' || "WBS_NUMBER" ||  ' has name ' || "WORK_TASK_NAME" || '.' AS FactExpression
 FROM "WORK_TASK";


-- Table "WORKING_HOURS"
-- "In week <Year><week no> employee <Employee> working on project <Project> <amount of hours> hours at work task <Work Task> ."
--
CREATE TABLE "WORKING_HOURS" (
   "YEAR" "YEAR_NO" NOT NULL, -- Week/Year
   "WEEK_NO" "WEEK_NO" NOT NULL, -- Week/week no
   "EMPLOYEE" "EMPLOYEE_NO" NOT NULL, -- Project Employee/Employee
   "PROJECT" "PROJECT_NO" NOT NULL, -- Project Employee/Project
   "WORK_TASK" "WBS_NUMBER" NOT NULL, -- Work Task
   "AMOUNT_OF_HOURS" "AMOUNT_OF_HOURS" NOT NULL, -- amount of hours

   UNIQUE ("YEAR", "WEEK_NO", "EMPLOYEE", "PROJECT", "AMOUNT_OF_HOURS"),
   PRIMARY KEY ("YEAR", "WEEK_NO", "EMPLOYEE", "PROJECT", "WORK_TASK")
);
CREATE OR REPLACE VIEW e_"WORKING_HOURS" AS
  FOLDER = '/CaseTalk/WorkingHours_GLR.igg/Documentation'
SELECT "YEAR", "WEEK_NO", "EMPLOYEE", "PROJECT", "WORK_TASK",
 'In week ' || "YEAR" || "WEEK_NO" ||  ' employee ' || "EMPLOYEE" ||  ' working on project ' || "PROJECT" ||  ' ' || "AMOUNT_OF_HOURS" ||  ' hours at work task ' || "WORK_TASK" || ' .' AS FactExpression
 FROM "WORKING_HOURS";


-- FOREIGN KEY 
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE "WORKING_HOURS"
   ADD FOREIGN KEY ("WORK_TASK")
   REFERENCES "WORK_TASK" ("WBS_NUMBER");

-- FOREIGN KEY 
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE "PROJECT"
   ADD FOREIGN KEY ("DIVISION")
   REFERENCES "DIVISION" ("DIVISION_NR");

-- FOREIGN KEY 
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE "PROJECT"
   ADD FOREIGN KEY ("EMPLOYEE")
   REFERENCES "EMPLOYEE" ("EMPLOYEE_NO");

-- FOREIGN KEY 
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE "PROJECT"
   ADD FOREIGN KEY ("CUSTOMER")
   REFERENCES "CUSTOMER" ("CUSTOMERNUMBER");

-- FOREIGN KEY 
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE "EMPLOYEE"
   ADD FOREIGN KEY ("DIVISION")
   REFERENCES "DIVISION" ("DIVISION_NR");

-- FOREIGN KEY 
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE "CUSTOMER_LOCATION"
   ADD FOREIGN KEY ("CUSTOMER")
   REFERENCES "CUSTOMER" ("CUSTOMERNUMBER");

-- FOREIGN KEY 
-- During lexicalizing generated SC
-- While reducing "Project Employee"
--
ALTER TABLE "WORKING_HOURS"
   ADD FOREIGN KEY ("EMPLOYEE")
   REFERENCES "EMPLOYEE" ("EMPLOYEE_NO");

-- SUBSET 
-- During lexicalizing generated SC
-- While reducing "Project Employee"
--

ALTER TABLE "WORKING_HOURS"
   ADD CHECK (EXISTS
       (SELECT *
        FROM   "HOUR_RATE"
        WHERE  "EMPLOYEE" = "WORKING_HOURS"."EMPLOYEE"
        AND    "PROJECT" = "WORKING_HOURS"."PROJECT"));

-- FOREIGN KEY 
-- During lexicalizing generated SC
-- While reducing "Project Employee"
--
ALTER TABLE "WORKING_HOURS"
   ADD FOREIGN KEY ("PROJECT")
   REFERENCES "PROJECT" ("PROJECT_NO");

-- FOREIGN KEY 
-- During lexicalizing generated SC
-- While reducing "Project Employee"
--
ALTER TABLE "HOUR_RATE"
   ADD FOREIGN KEY ("EMPLOYEE")
   REFERENCES "EMPLOYEE" ("EMPLOYEE_NO");

-- FOREIGN KEY 
-- During lexicalizing generated SC
-- While reducing "Project Employee"
--
ALTER TABLE "HOUR_RATE"
   ADD FOREIGN KEY ("PROJECT")
   REFERENCES "PROJECT" ("PROJECT_NO");

-- DATABASE VIEWS
--

CREATE VIEW "PROJECT_EMPLOYEE" AS
  SELECT 
    "EMPLOYEE",  -- Project Employee/Employee
    "PROJECT" -- Project Employee/Project
  FROM "HOUR_RATE"
  UNION
  SELECT 
    "EMPLOYEE",  -- Project Employee/Employee
    "PROJECT" -- Project Employee/Project
  FROM "WORKING_HOURS";

CREATE VIEW "WEEK" AS
  SELECT 
    "YEAR",  -- Week/Year
    "WEEK_NO" -- Week/week no
  FROM "HOUR_RATE"
  UNION
  SELECT 
    "YEAR",  -- Week/Year
    "WEEK_NO" -- Week/week no
  FROM "WORKING_HOURS";

--

-- POPULATION
--

INSERT INTO "CUSTOMER"
  ("CUSTOMERNUMBER", "NAME_OF_CUSTOMER")
  VALUES
  (4081, 'District Limburg S.E');
INSERT INTO "CUSTOMER_LOCATION"
  ("CUSTOMER", "CITY")
  VALUES
  (4081, 'Utrecht');
INSERT INTO "DIVISION"
  ("DIVISION_NR", "NAME_OF_DIVISION")
  VALUES
  (6, 'Soil Research');
INSERT INTO "EMPLOYEE"
  ("EMPLOYEE_NO", "EMPLOYEE_NAME", "TITLE", "DIVISION")
  VALUES
  (618, 'Boven W.J. van', 'ing', 6);
INSERT INTO "HOUR_RATE"
  ("YEAR", "WEEK_NO", "EMPLOYEE", "PROJECT", "AMOUNT")
  VALUES
  (2001, 09, 618, '6323.16', 213.83);
INSERT INTO "HOUR_RATE"
  ("YEAR", "WEEK_NO", "EMPLOYEE", "PROJECT", "AMOUNT")
  VALUES
  (2001, 38, 312, '7004.07', 164);
INSERT INTO "PROJECT"
  ("PROJECT_NO", "DIVISION", "EMPLOYEE", "CUSTOMER", "PROJECT_DESCRIPTION")
  VALUES
  ('6323.16', 6, 283, 4081, 'Investigation of ...dumping site in Ulbach');
INSERT INTO "WORK_TASK"
  ("WBS_NUMBER", "WORK_TASK_NAME")
  VALUES
  (1, 'preparation');
INSERT INTO "WORK_TASK"
  ("WBS_NUMBER", "WORK_TASK_NAME")
  VALUES
  (14, 'drawing');
INSERT INTO "WORKING_HOURS"
  ("YEAR", "WEEK_NO", "EMPLOYEE", "PROJECT", "WORK_TASK", "AMOUNT_OF_HOURS")
  VALUES
  (2001, 38, 618, '7004.07', 1, 2);
INSERT INTO "WORKING_HOURS"
  ("YEAR", "WEEK_NO", "EMPLOYEE", "PROJECT", "WORK_TASK", "AMOUNT_OF_HOURS")
  VALUES
  (2001, 38, 232, '6323.16', 14, 4);

