/* 
 * This script is part of a set to build a database or other artifact.
 * The X marks this script as part of the set:
 * [ ] generic   - Create and/or set database generators
 * [X] create    - Create domains, tables, primary keys, unique constraints
 * [ ] load      - Insert data
 * [ ] protect   - Add check constraints, foreign key constraints (internal to module) and triggers
 * [ ] link      - Add foreign key constraints referencing other modules
 * [ ] access    - Create indices, views and procedures
 * [ ] grant     - Template grant statements
 * 
 * The inverse set is:
 * 
 * [ ] revoke    - Template revoke statements
 * [ ] noaccess  - Drop indices, views and procedures
 * [ ] unlink    - Drop foreign key constraints referencing other modules
 * [ ] unprotect - Drop check constrints, foreign key constraints (internal to module) and triggers
 * [ ] unload    - Delete data
 * [ ] drop      - Drop tables and domains
 * 
 * [ ] catalog   - Catalog insert statements describing the script objects
 */

 -- Temporal support does not come native and packages need to be installed
 -- please visit: https://wiki.postgresql.org/wiki/Temporal_Extensions
CREATE DOMAIN X_citizens AS integer(6,0);
--
-- 123ABC
--
CREATE DOMAIN apprenticeship_code AS char(4);
CREATE DOMAIN category_title AS char(3);
CREATE DOMAIN city_name AS name;
CREATE DOMAIN datum AS char(10);
CREATE DOMAIN description AS char(52);
CREATE DOMAIN firstname AS char(6);
CREATE DOMAIN grade AS float8(2);
CREATE DOMAIN lastname AS char(9);
CREATE DOMAIN month_amount AS integer(1,0);
--
-- Choices to be made
--
CREATE DOMAIN "number" AS integer(1,0)
   CHECK (VALUE IN (1, 2, 3));
CREATE DOMAIN student_count AS integer(5,0);
CREATE DOMAIN type AS char(10)
   CHECK (VALUE IN ('Declined', 'DropOut', 'Graduate', 'Registered', 'Student'));
--
-- Artificial Key ID
--
CREATE DOMAIN Artificial_Key_ID AS autoinc(0,0);
--
-- Artificial Key Value
--
CREATE DOMAIN Artificial_Key_Value AS integer(0,0);

-- Table Alumni
-- [Rules]
-- "<Alumni> is identified by <Student_firstname> and <Student_lastname>."
-- "<Alumni> is a subset of <firstname>, <lastname> in <Student>."
--
CREATE TABLE Alumni (
   Student_lastname lastname NOT NULL, -- Student/lastname
   Student_firstname firstname NOT NULL, -- Student/firstname
   Student_ID Artificial_Key_Value NOT NULL, -- Student//ID

   UNIQUE (Student_ID) -- Primary Key
);

-- Table Apprenticeship
-- [Comment]
-- a position as an apprentice : an arrangement in which someone learns an art, trade, or job under another.
-- [Expressions]
-- "Apprenticeship <apprenticeship_code> concerns <Apprenticeship Description>."
-- "Apprenticeship <apprenticeship_code> takes place in <Apprenticeship City>."
-- "Apprenticeship <apprenticeship_code> is assigned to <Apprenticeship Assigned_firstname> <Apprenticeship Assigned_lastname>."
-- "Apprenticeship <apprenticeship_code> vindt plaats in <Apprenticeship City>."
-- "Apprenticeship <apprenticeship_code> betreft <Apprenticeship Description>."
-- "Apprenticeship <apprenticeship_code> will take <Apprenticeship Duration> months."
-- "Apprenticeship <apprenticeship_code> falls in the category <Apprenticeship Category>."
-- "Where does apprenticeship <apprenticeship_code> take place? <Apprenticeship City>."
-- "Does apprenticeship <apprenticeship_code> take place in <Apprenticeship City>?"
-- [Rules]
-- "Is concept type Thing"
-- "<Apprenticeship> is identified by <apprenticeship_code>."
-- "<Apprenticeship City> in <Apprenticeship> is a subset of <city_name> in <City>."
-- "<Apprenticeship Assigned_firstname>, <Apprenticeship Assigned_lastname> in <Apprenticeship> is a subset of <firstname>, <lastname> in <Student>."
--
CREATE TABLE Apprenticeship (
   apprenticeship_code apprenticeship_code NOT NULL, -- apprenticeship_code
   Apprenticeship_Duration month_amount, -- Apprenticeship Duration/month_amount
   Apprenticeship_Category category_title, -- Apprenticeship Category/Describing/category_title
   Apprenticeship_Assigned_lastname lastname, -- Apprenticeship Assigned/Student/lastname
   Apprenticeship_Assigned_firstname firstname, -- Apprenticeship Assigned/Student/firstname
   Apprenticeship_City city_name NOT NULL, -- Apprenticeship City/City/city_name
   Apprenticeship_Description description, -- Apprenticeship Description/Describing/description
   Apprenticeship_Assigned_ID Artificial_Key_Value, -- Apprenticeship Assigned//ID

   PRIMARY KEY (apprenticeship_code) -- Primary Key
);

-- Table Apprenticeship_Preference
-- [Comment]
-- one that is preferred
-- [Definition]
-- -- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column
-- [Reference Data]
-- -- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column
-- [Expressions]
-- "<Student_firstname> <Student_lastname> has as preference no. <number> apprenticeship <Apprenticeship>."
-- "<Student_firstname> <Student_lastname> heeft als voorkeur <number> de apprenticeship <Apprenticeship>."
-- [Rules]
-- "<Apprenticeship Preference> is identified by <Student_firstname> and <Student_lastname> and <number>."
-- "<Apprenticeship Preference> is identified by <Student_firstname> and <Student_lastname> and <Apprenticeship>."
-- "<Student_firstname>, <Student_lastname> in <Apprenticeship Preference> is a subset of <firstname>, <lastname> in <Student>."
-- "<Apprenticeship> in <Apprenticeship Preference> is a subset of <apprenticeship_code> in <Apprenticeship>."
--
CREATE TABLE Apprenticeship_Preference (
   Apprenticeship apprenticeship_code NOT NULL, -- Apprenticeship/apprenticeship_code
   Student_lastname lastname NOT NULL, -- Student/lastname
   Student_firstname firstname NOT NULL, -- Student/firstname
   "number" "number" NOT NULL, -- number
   Student_ID Artificial_Key_Value NOT NULL, -- Student//ID

   UNIQUE ("number", Student_ID), -- Primary Key
   UNIQUE (Apprenticeship, Student_ID) -- UC43
);

-- Table City
-- [Expressions]
-- "<city_name> has <Population> citizens."
-- "<city_name> heeft <Population> inwoners."
-- * "<city_name> houses <City Student Count> students."
-- [Rules]
-- "Is concept type Location"
-- "<City> is identified by <city_name>."
-- "<city_name>, <city_name> in <City> must occur in <City Of Residence> in <Student> and/or <Apprenticeship City> in <Apprenticeship>."
--
CREATE TABLE City (
   city_name city_name NOT NULL, -- city_name
   City_Student_Count student_count, -- City Student Count/student_count
   Population X_citizens, -- Population/#citizens

   PRIMARY KEY (city_name) -- Primary Key
);

-- Table Graduate
-- [Reference Data]
-- -- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column
-- [Expressions]
-- "Graduate <Graduation,Student,firstname> <Graduation,Student,lastname> graduated on <Graduation Date>."
-- "Afgestudeerde <Graduation,Student,firstname> <Graduation,Student,lastname> studeerde af op <Graduation Date>."
-- [Rules]
-- "Is concept type Person"
-- "<Graduate> is identified by <Graduation,Student,firstname> and <Graduation,Student,lastname>."
-- "<Graduation,Student,firstname>, <Graduation,Student,lastname> in <Graduate> is a subset of <firstname>, <lastname> in <Student>."
--
CREATE TABLE Graduate (
   Graduation_Student_lastname lastname NOT NULL, -- Graduation/Student/lastname
   Graduation_Student_firstname firstname NOT NULL, -- Graduation/Student/firstname
   Graduation_Date datum, -- Graduation Date/Graduation/datum
   Graduation_Student_ID Artificial_Key_Value NOT NULL, -- Graduation,Student,/ID

   UNIQUE (Graduation_Student_ID) -- Primary Key
);

-- Table Student
-- [Comment]
-- Students are the lifeblood of any educational institution.
-- [Definition]
-- A person who is enrolled in an educational institution.
-- [Methods]
-- Register()
-- Unregister()
-- Email()
-- Update()
-- [Reference Data]
-- -- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column
-- [Expressions]
-- "<firstname> <lastname> is a student."
-- "<firstname> <lastname> lives in <City Of Residence>."
-- "<firstname> <lastname> woont in <City Of Residence>."
-- "<firstname> <lastname> is een scholier."
-- "<Student Buddy_firstname> <Student Buddy_lastname> is a buddy for <firstname> <lastname>."
-- "<firstname> <lastname> is a <Student Type>."
-- * "<firstname> <lastname> scores a <Exam Score> on the exam."
-- [Rules]
-- "Is concept type Person"
-- "Population supports Valid & Transaction Time"
-- "<Student> is identified by <firstname> and <lastname>."
-- "<firstname>, <firstname>, <lastname>, <lastname> in <Student> must occur in either <Graduation,Student,firstname>, <Graduation,Student,lastname> in <Graduate> and/or <Alumni>."
-- "<City Of Residence> in <Student> is a subset of <city_name> in <City>."
-- "<Student Buddy_firstname>, <Student Buddy_lastname> in <Student> is a subset of <firstname>, <lastname> in <Student>."
--
CREATE TABLE Student (
   lastname lastname NOT NULL, -- lastname
   firstname firstname NOT NULL, -- firstname
   Student_Type type, -- Student Type/Type
   Exam_Score grade, -- Exam Score/Grade
   Student_Buddy_lastname lastname, -- Student Buddy/Buddy/Student/lastname
   Student_Buddy_firstname firstname, -- Student Buddy/Buddy/Student/firstname
   City_Of_Residence city_name, -- City Of Residence/City/city_name
   Student_ID Artificial_Key_ID NOT NULL, -- Student ID
   Student_Buddy_ID Artificial_Key_Value, -- Student Buddy//ID

   -- Valid Time
   Student_Start DATE,
   Student_End DATE,
   PERIOD FOR Student_Period (Student_Start, Student_End),

   -- Transaction Time
   Student_SysStart TIMESTAMP(12) GENERATED ALWAYS AS ROW START,
   Student_SysEnd TIMESTAMP(12) GENERATED ALWAYS AS ROW END,
   PERIOD FOR SYSTEM_TIME (Student_SysStart, Student_SysEnd),

   UNIQUE (firstname, lastname, Student_Period WITHOUT OVERLAPS), -- Primary Key
   PRIMARY KEY (Student_ID, Student_Period WITHOUT OVERLAPS) -- Primary Key
) WITH SYSTEM VERSIONING;
