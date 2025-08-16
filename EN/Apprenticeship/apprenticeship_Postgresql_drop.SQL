/* 
 * This script is part of a set to build a database or other artifact.
 * The X marks this script as part of the set:
 * [ ] generic   - Create and/or set database generators
 * [ ] create    - Create domains, tables, primary keys, unique constraints
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
 * [X] drop      - Drop tables and domains
 * 
 * [ ] catalog   - Catalog insert statements describing the script objects
 */

DROP DOMAIN X_citizens;
DROP DOMAIN apprenticeship_code;
DROP DOMAIN category_title;
DROP DOMAIN city_name;
DROP DOMAIN datum;
DROP DOMAIN description;
DROP DOMAIN firstname;
DROP DOMAIN grade;
DROP DOMAIN lastname;
DROP DOMAIN month_amount;
DROP DOMAIN "number";
DROP DOMAIN student_count;
DROP DOMAIN type;
DROP DOMAIN Artificial_Key_ID;
DROP DOMAIN Artificial_Key_Value;
DROP TABLE Alumni;
DROP TABLE Apprenticeship;
DROP TABLE Apprenticeship_Preference;
DROP TABLE City;
DROP TABLE Graduate;
DROP TABLE Student;
