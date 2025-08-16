/* 
 * This script is part of a set to build a database or other artifact.
 * The X marks this script as part of the set:
 * [ ] generic   - Create and/or set database generators
 * [ ] create    - Create domains, tables, primary keys, unique constraints
 * [X] load      - Insert data
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

INSERT INTO Apprenticeship
  (apprenticeship_code, Apprenticeship_Duration, Apprenticeship_Category, Apprenticeship_Assigned_lastname, Apprenticeship_Assigned_firstname, Apprenticeship_City, Apprenticeship_Description, Apprenticeship_Assigned_ID)
  VALUES
  ('S101', 4, 'ICT', 'Johnson', 'Peter', 'New York', 'the development of a magazine infomration system', 1);
INSERT INTO Apprenticeship
  (apprenticeship_code, Apprenticeship_Duration, Apprenticeship_Category, Apprenticeship_Assigned_lastname, Apprenticeship_Assigned_firstname, Apprenticeship_City, Apprenticeship_Description, Apprenticeship_Assigned_ID)
  VALUES
  ('S209', null, null, 'Blight', 'Mary', null, null, 2);
INSERT INTO Apprenticeship_Preference
  (Apprenticeship, Student_lastname, Student_firstname, "number", Student_ID)
  VALUES
  ('S101', 'Johnson', 'Peter', 1, 1);
INSERT INTO Apprenticeship_Preference
  (Apprenticeship, Student_lastname, Student_firstname, "number", Student_ID)
  VALUES
  ('S101', 'Blight', 'Mary', 2, 2);
INSERT INTO Apprenticeship_Preference
  (Apprenticeship, Student_lastname, Student_firstname, "number", Student_ID)
  VALUES
  ('S105', 'Johnson', 'Peter', 2, 3);
INSERT INTO Apprenticeship_Preference
  (Apprenticeship, Student_lastname, Student_firstname, "number", Student_ID)
  VALUES
  ('S209', 'Johnson', 'Peter', 3, 4);
INSERT INTO Apprenticeship_Preference
  (Apprenticeship, Student_lastname, Student_firstname, "number", Student_ID)
  VALUES
  ('S112', 'Blight', 'Mary', 1, 5);
INSERT INTO City
  (city_name, City_Student_Count, Population)
  VALUES
  ('Amsterdam', null, 400000);
INSERT INTO City
  (city_name, City_Student_Count, Population)
  VALUES
  ('Utrecht', 12000, null);
INSERT INTO Graduate
  (Graduation_Student_lastname, Graduation_Student_firstname, Graduation_Date, Graduation_Student_ID)
  VALUES
  ('Blight', 'Mary', '2019-12-31', 1);
INSERT INTO Student
  (lastname, firstname, Student_Type, Exam_Score, Student_Buddy_lastname, Student_Buddy_firstname, City_Of_Residence, Student_ID, Student_Buddy_ID)
  VALUES
  ('Johnson', 'Peter', null, null, null, null, 'New York', 1, 1);
INSERT INTO Student
  (lastname, firstname, Student_Type, Exam_Score, Student_Buddy_lastname, Student_Buddy_firstname, City_Of_Residence, Student_ID, Student_Buddy_ID)
  VALUES
  ('Blight', 'Mary', 'Graduate', null, 'Wobben', 'Marco', 'Amsterdam', 2, 2);
INSERT INTO Student
  (lastname, firstname, Student_Type, Exam_Score, Student_Buddy_lastname, Student_Buddy_firstname, City_Of_Residence, Student_ID, Student_Buddy_ID)
  VALUES
  ('Wobben', 'Marco', null, null, null, null, 'Utrecht', 3, 3);
INSERT INTO Student
  (lastname, firstname, Student_Type, Exam_Score, Student_Buddy_lastname, Student_Buddy_firstname, City_Of_Residence, Student_ID, Student_Buddy_ID)
  VALUES
  ('Smith', 'Daniel', null, null, null, null, 'Enschede', 4, 4);
INSERT INTO Student
  (lastname, firstname, Student_Type, Exam_Score, Student_Buddy_lastname, Student_Buddy_firstname, City_Of_Residence, Student_ID, Student_Buddy_ID)
  VALUES
  ('Doe', 'Emily', null, null, null, null, 'Utrech', 5, 5);
INSERT INTO Student
  (lastname, firstname, Student_Type, Exam_Score, Student_Buddy_lastname, Student_Buddy_firstname, City_Of_Residence, Student_ID, Student_Buddy_ID)
  VALUES
  ('Bradley', 'John', null, null, null, null, 'Berlin', 6, 6);
INSERT INTO Student
  (lastname, firstname, Student_Type, Exam_Score, Student_Buddy_lastname, Student_Buddy_firstname, City_Of_Residence, Student_ID, Student_Buddy_ID)
  VALUES
  ('Fernandez', 'Paul', null, null, null, null, 'Madrid', 7, 7);
INSERT INTO Student
  (lastname, firstname, Student_Type, Exam_Score, Student_Buddy_lastname, Student_Buddy_firstname, City_Of_Residence, Student_ID, Student_Buddy_ID)
  VALUES
  ('Gomez', 'Jenna', null, null, null, null, 'Rome', 8, 8);
INSERT INTO Student
  (lastname, firstname, Student_Type, Exam_Score, Student_Buddy_lastname, Student_Buddy_firstname, City_Of_Residence, Student_ID, Student_Buddy_ID)
  VALUES
  ('Thompson', 'James', null, null, null, null, 'Athens', 9, 9);
INSERT INTO Student
  (lastname, firstname, Student_Type, Exam_Score, Student_Buddy_lastname, Student_Buddy_firstname, City_Of_Residence, Student_ID, Student_Buddy_ID)
  VALUES
  ('Kowalski', 'Anna', null, 9.8, null, null, 'Warsaw', 10, 10);
