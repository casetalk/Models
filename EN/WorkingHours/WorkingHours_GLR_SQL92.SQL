--
-- Project=WorkingHours.prj
-- Path=\\Mac\Home\Documents\CaseTalk\Modellen\WorkingHours\
-- Description=
-- Repository=\\Mac\Home\Documents\CaseTalk\Modellen\WorkingHours\WorkingHours_GLR.igg
-- Author=BCP Software
--

CREATE SCHEMA "WORKINGHOURS_GLR";

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
CREATE DOMAIN "TITLE_CODE" AS CHAR(3);
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
-- [Description]
-- Artificial key domain
--
CREATE DOMAIN "GENID" AS INTEGER;

-- Table "CUSTOMER_LOCATION"
-- [Description]
-- 
-- "Customer <Customer> is located in <City>."
--
CREATE TABLE "CUSTOMER_LOCATION" (
   "CUSTOMER" "CUSTOMERNUMBER" NOT NULL, -- Customer
   "CITY" "CITY" NOT NULL, -- City

   PRIMARY KEY ("CUSTOMER", "CITY")
);

-- Table "EMPLOYEE"
-- [Description]
-- 
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

-- Table "HOUR_RATE"
-- [Description]
-- 
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

-- Table "NAME_OF_CUSTOMER"
-- [Description]
-- blablabla
-- 
-- "Customer <Customer> has name <customer name>."
--
-- 
-- Data Warehouse
--   History : No history
-- Source
--   Created at : 26-10-2017 17:00:10
--   Modeler : marcow
--   Modified at : 26-10-2017 17:00:10
--
CREATE TABLE "NAME_OF_CUSTOMER" (
   "CUSTOMER" "CUSTOMERNUMBER" NOT NULL, -- Customer
   "CUSTOMER_NAME" "CUSTOMER_NAME" NOT NULL, -- customer name

   UNIQUE ("CUSTOMER_NAME"),
   PRIMARY KEY ("CUSTOMER")
);

-- Table "NAME_OF_DIVISION"
-- [Description]
-- 
-- "Division <Division> has name <division name>."
--
CREATE TABLE "NAME_OF_DIVISION" (
   "DIVISION" "DIVISION_NR" NOT NULL, -- Division
   "DIVISION_NAME" "DIVISION_NAME" NOT NULL, -- division name

   UNIQUE ("DIVISION_NAME"),
   PRIMARY KEY ("DIVISION")
);

-- Table "PROJECT"
-- [Description]
-- 
-- "Project <project no> is the responsibility of division <Division>."
-- "Project <project no> is carried out for customer <Customer>."
-- "Project <project no> has description <Project Description>."
--
-- Column "CUSTOMER"
-- [Description]
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
-- [Description]
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
   "CUSTOMER" "CUSTOMERNUMBER" NOT NULL, -- Customer Project/Customer
   "PROJECT_DESCRIPTION" "DESCRIPTION" NOT NULL, -- Project Description

   PRIMARY KEY ("PROJECT_NO")
);

-- Table "PROJECT_MANAGER"
-- [Description]
-- 
-- "Project <Project> is managed by employee <Employee>."
--
CREATE TABLE "PROJECT_MANAGER" (
   "PROJECT" "PROJECT_NO" NOT NULL, -- Project
   "EMPLOYEE" "EMPLOYEE_NO" NOT NULL, -- Employee

   PRIMARY KEY ("PROJECT", "EMPLOYEE")
);

-- Table "WORK_TASK_NAME"
-- [Description]
-- 
-- "Work task <Work Task> has name <task name>."
--
CREATE TABLE "WORK_TASK_NAME" (
   "WORK_TASK" "WBS_NUMBER" NOT NULL, -- Work Task
   "TASK_NAME" "TASK_NAME" NOT NULL, -- task name

   UNIQUE ("TASK_NAME"),
   PRIMARY KEY ("WORK_TASK")
);

-- Table "WORKING_HOURS"
-- [Description]
-- 
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

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE "PROJECT_MANAGER"
   ADD FOREIGN KEY ("PROJECT")
   REFERENCES "PROJECT" ("PROJECT_NO");

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE "PROJECT_MANAGER"
   ADD FOREIGN KEY ("EMPLOYEE")
   REFERENCES "EMPLOYEE" ("EMPLOYEE_NO");

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- While reducing "Customer"
--
ALTER TABLE "PROJECT"
   ADD FOREIGN KEY ("CUSTOMER")
   REFERENCES "NAME_OF_CUSTOMER" ("CUSTOMER");

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- While reducing "Customer"
--
ALTER TABLE "CUSTOMER_LOCATION"
   ADD FOREIGN KEY ("CUSTOMER")
   REFERENCES "NAME_OF_CUSTOMER" ("CUSTOMER");

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- While reducing "Division"
--
ALTER TABLE "PROJECT"
   ADD FOREIGN KEY ("DIVISION")
   REFERENCES "NAME_OF_DIVISION" ("DIVISION");

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- While reducing "Division"
--
ALTER TABLE "EMPLOYEE"
   ADD FOREIGN KEY ("DIVISION")
   REFERENCES "NAME_OF_DIVISION" ("DIVISION");

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- While reducing "Project Employee"
--
ALTER TABLE "WORKING_HOURS"
   ADD FOREIGN KEY ("EMPLOYEE")
   REFERENCES "EMPLOYEE" ("EMPLOYEE_NO");

-- SUBSET 
-- [Description]
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
-- [Description]
-- During lexicalizing generated SC
-- While reducing "Project Employee"
--
ALTER TABLE "WORKING_HOURS"
   ADD FOREIGN KEY ("PROJECT")
   REFERENCES "PROJECT" ("PROJECT_NO");

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- While reducing "Project Employee"
--
ALTER TABLE "HOUR_RATE"
   ADD FOREIGN KEY ("EMPLOYEE")
   REFERENCES "EMPLOYEE" ("EMPLOYEE_NO");

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- While reducing "Project Employee"
--
ALTER TABLE "HOUR_RATE"
   ADD FOREIGN KEY ("PROJECT")
   REFERENCES "PROJECT" ("PROJECT_NO");

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- While reducing "Work Task"
--
ALTER TABLE "WORKING_HOURS"
   ADD FOREIGN KEY ("WORK_TASK")
   REFERENCES "WORK_TASK_NAME" ("WORK_TASK");

INSERT INTO "CUSTOMER_LOCATION"
  ("CUSTOMER", "CITY")
  VALUES
  (4081, 'Utrecht');
INSERT INTO "EMPLOYEE"
  ("EMPLOYEE_NO", "EMPLOYEE_NAME", "TITLE", "DIVISION")
  VALUES
  (618, 'Boven W.J. van', 'ing', 6);
INSERT INTO "EMPLOYEE"
  ("EMPLOYEE_NO", "EMPLOYEE_NAME", "TITLE", "DIVISION")
  VALUES
  (232, 'Bakker R.P.', null, null);
INSERT INTO "EMPLOYEE"
  ("EMPLOYEE_NO", "EMPLOYEE_NAME", "TITLE", "DIVISION")
  VALUES
  (312, null, 'ir', 6);
INSERT INTO "HOUR_RATE"
  ("YEAR", "WEEK_NO", "EMPLOYEE", "PROJECT", "AMOUNT")
  VALUES
  (2001, 09, 618, '6323.16', 213,83);
INSERT INTO "HOUR_RATE"
  ("YEAR", "WEEK_NO", "EMPLOYEE", "PROJECT", "AMOUNT")
  VALUES
  (2001, 38, 312, '7004.07', 164,00);
INSERT INTO "NAME_OF_CUSTOMER"
  ("CUSTOMER", "CUSTOMER_NAME")
  VALUES
  (4081, 'District Limburg S.E');
INSERT INTO "NAME_OF_DIVISION"
  ("DIVISION", "DIVISION_NAME")
  VALUES
  (6, 'Soil Research');
INSERT INTO "PROJECT"
  ("PROJECT_NO", "DIVISION", "CUSTOMER", "PROJECT_DESCRIPTION")
  VALUES
  ('6323.16', 6, 4081, 'Investigation of ...dumping site in Ulbach');
INSERT INTO "PROJECT_MANAGER"
  ("PROJECT", "EMPLOYEE")
  VALUES
  ('6323.16', 283);
INSERT INTO "PROJECT_MANAGER"
  ("PROJECT", "EMPLOYEE")
  VALUES
  ('7004.07', 618);
INSERT INTO "WORK_TASK_NAME"
  ("WORK_TASK", "TASK_NAME")
  VALUES
  (1, 'preparation');
INSERT INTO "WORK_TASK_NAME"
  ("WORK_TASK", "TASK_NAME")
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

