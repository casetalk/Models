/* 
 * This script is part of a set to build a database or other artifact.
 * The X marks this script as part of the set:
 * [ ] generic   - Create and/or set database generators
 * [ ] create    - Create domains, tables, primary keys, unique constraints
 * [ ] load      - Insert data
 * [ ] protect   - Add check constraints, foreign key constraints (internal to module) and triggers
 * [ ] link      - Add foreign key constraints referencing other modules
 * [X] access    - Create indices, views and procedures
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


-- EXPRESSION VIEWS
--

CREATE VIEW Apprenticeship_Expression AS
SELECT apprenticeship_code,
 'apprenticeship ' || cast(apprenticeship_code as varchar) ||  ' concerns ' || cast(Apprenticeship_Description as varchar) || '.' AS FactExpression,
 'en-GB' AS FactLocale
 FROM Apprenticeship WHERE NOT FactExpression IS NULL
UNION
SELECT apprenticeship_code,
 'apprenticeship ' || cast(apprenticeship_code as varchar) ||  ' takes place in ' || cast(Apprenticeship_City as varchar) || '.' AS FactExpression,
 'en-GB' AS FactLocale
 FROM Apprenticeship WHERE NOT FactExpression IS NULL
UNION
SELECT apprenticeship_code,
 'apprenticeship ' || cast(apprenticeship_code as varchar) ||  ' is assigned to ' || cast(Apprenticeship_Assigned_firstname as varchar) ||  ' ' || cast(Apprenticeship_Assigned_lastname as varchar) AS FactExpression,
 'en-GB' AS FactLocale
 FROM Apprenticeship WHERE NOT FactExpression IS NULL
UNION
SELECT apprenticeship_code,
 'apprenticeship ' || cast(apprenticeship_code as varchar) ||  ' vindt plaats in ' || cast(Apprenticeship_City as varchar) || '.' AS FactExpression,
 'nl-NL' AS FactLocale
 FROM Apprenticeship WHERE NOT FactExpression IS NULL
UNION
SELECT apprenticeship_code,
 'apprenticeship ' || cast(apprenticeship_code as varchar) ||  ' betreft ' || cast(Apprenticeship_Description as varchar) || '.' AS FactExpression,
 'nl-NL' AS FactLocale
 FROM Apprenticeship WHERE NOT FactExpression IS NULL
UNION
SELECT apprenticeship_code,
 'apprenticeship ' || cast(apprenticeship_code as varchar) ||  ' will take ' || cast(Apprenticeship_Duration as varchar) || ' months' AS FactExpression,
 'en-GB' AS FactLocale
 FROM Apprenticeship WHERE NOT FactExpression IS NULL
UNION
SELECT apprenticeship_code,
 'apprenticeship ' || cast(apprenticeship_code as varchar) ||  ' falls in the category ' || cast(Apprenticeship_Category as varchar) AS FactExpression,
 'en-GB' AS FactLocale
 FROM Apprenticeship WHERE NOT FactExpression IS NULL
UNION
SELECT apprenticeship_code,
 'Where does apprenticeship ' || cast(apprenticeship_code as varchar) ||  ' take place? ' || cast(Apprenticeship_City as varchar) AS FactExpression,
 'en-GB' AS FactLocale
 FROM Apprenticeship WHERE NOT FactExpression IS NULL
UNION
SELECT apprenticeship_code,
 'Does apprenticeship ' || cast(apprenticeship_code as varchar) ||  ' take place in ' || cast(Apprenticeship_City as varchar) || '?' AS FactExpression,
 'en-GB' AS FactLocale
 FROM Apprenticeship WHERE NOT FactExpression IS NULL;

/*
CREATE VIEW Apprenticeship_Preference_Expression AS
SELECT <primarykey>,
cast(Student_firstname as varchar) ||  ' ' || cast(Student_lastname as varchar) ||  ' has as preference no. ' || cast("number" as varchar) ||  ' apprenticeship ' || cast(Apprenticeship as varchar) || '.' AS FactExpression,
 'en-GB' AS FactLocale
 FROM Apprenticeship_Preference WHERE NOT FactExpression IS NULL
UNION
SELECT <primarykey>,
cast(Student_firstname as varchar) ||  ' ' || cast(Student_lastname as varchar) ||  ' heeft als voorkeur ' || cast("number" as varchar) ||  ' de apprenticeship ' || cast(Apprenticeship as varchar) || '.' AS FactExpression,
 'nl-NL' AS FactLocale
 FROM Apprenticeship_Preference WHERE NOT FactExpression IS NULL;
*/

CREATE VIEW City_Expression AS
SELECT city_name,
cast(city_name as varchar) ||  ' has ' || cast(Population as varchar) || ' citizens' AS FactExpression,
 'en-GB' AS FactLocale
 FROM City WHERE NOT FactExpression IS NULL
UNION
SELECT city_name,
cast(city_name as varchar) ||  ' heeft ' || cast(Population as varchar) || ' inwoners' AS FactExpression,
 'nl-NL' AS FactLocale
 FROM City WHERE NOT FactExpression IS NULL
UNION
SELECT city_name,
cast(city_name as varchar) ||  ' houses ' || cast(City_Student_Count as varchar) || ' students' AS FactExpression,
 'en-GB' AS FactLocale
 FROM City WHERE NOT FactExpression IS NULL;

/*
CREATE VIEW Graduate_Expression AS
SELECT <primarykey>,
 'graduate ' || cast(Graduation_Student_firstname as varchar) ||  ' ' || cast(Graduation_Student_lastname as varchar) ||  ' graduated on ' || cast(Graduation_Date as varchar) || '.' AS FactExpression,
 'en-GB' AS FactLocale
 FROM Graduate WHERE NOT FactExpression IS NULL
UNION
SELECT <primarykey>,
 'afgestudeerde ' || cast(Graduation_Student_firstname as varchar) ||  ' ' || cast(Graduation_Student_lastname as varchar) ||  ' studeerde af op ' || cast(Graduation_Date as varchar) || '.' AS FactExpression,
 'nl-NL' AS FactLocale
 FROM Graduate WHERE NOT FactExpression IS NULL;
*/

CREATE VIEW Student_Expression AS
SELECT Student_ID,
cast(firstname as varchar) ||  ' ' || cast(lastname as varchar) || ' is a student.' AS FactExpression,
 'en-GB' AS FactLocale
 FROM Student WHERE NOT FactExpression IS NULL
UNION
SELECT Student_ID,
cast(firstname as varchar) ||  ' ' || cast(lastname as varchar) ||  ' lives in ' || cast(City_Of_Residence as varchar) || '.' AS FactExpression,
 'en-GB' AS FactLocale
 FROM Student WHERE NOT FactExpression IS NULL
UNION
SELECT Student_ID,
cast(firstname as varchar) ||  ' ' || cast(lastname as varchar) ||  ' woont in ' || cast(City_Of_Residence as varchar) || '.' AS FactExpression,
 'nl-NL' AS FactLocale
 FROM Student WHERE NOT FactExpression IS NULL
UNION
SELECT Student_ID,
cast(firstname as varchar) ||  ' ' || cast(lastname as varchar) || ' is een scholier.' AS FactExpression,
 'nl-NL' AS FactLocale
 FROM Student WHERE NOT FactExpression IS NULL
UNION
SELECT Student_ID,
cast(Student_Buddy_firstname as varchar) ||  ' ' || cast(Student_Buddy_lastname as varchar) ||  ' is a buddy for ' || cast(firstname as varchar) ||  ' ' || cast(lastname as varchar) AS FactExpression,
 'en-GB' AS FactLocale
 FROM Student WHERE NOT FactExpression IS NULL
UNION
SELECT Student_ID,
cast(firstname as varchar) ||  ' ' || cast(lastname as varchar) ||  ' is a ' || cast(Student_Type as varchar) AS FactExpression,
 'en-GB' AS FactLocale
 FROM Student WHERE NOT FactExpression IS NULL
UNION
SELECT Student_ID,
cast(firstname as varchar) ||  ' ' || cast(lastname as varchar) ||  ' scores a ' || cast(Exam_Score as varchar) || ' on the exam' AS FactExpression,
 'en-GB' AS FactLocale
 FROM Student WHERE NOT FactExpression IS NULL;


-- DATABASE VIEWS
--

CREATE VIEW Describing AS
  SELECT 
    Apprenticeship_Category AS Apprenticeship_Category_Describing_category_title -- Apprenticeship Category/Describing/category_title
  FROM Apprenticeship
  WHERE (NOT Apprenticeship.Apprenticeship_Category IS NULL)
  UNION
  SELECT 
    Apprenticeship_Description AS Apprenticeship_Category_Describing_category_title -- Apprenticeship Description/Describing/description
  FROM Apprenticeship
  WHERE (NOT Apprenticeship.Apprenticeship_Description IS NULL);
