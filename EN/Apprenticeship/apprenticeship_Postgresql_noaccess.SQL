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
 * [X] noaccess  - Drop indices, views and procedures
 * [ ] unlink    - Drop foreign key constraints referencing other modules
 * [ ] unprotect - Drop check constrints, foreign key constraints (internal to module) and triggers
 * [ ] unload    - Delete data
 * [ ] drop      - Drop tables and domains
 * 
 * [ ] catalog   - Catalog insert statements describing the script objects
 */

DROP VIEW Apprenticeship_Expression;
/*
DROP VIEW Apprenticeship_Preference_Expression;
*/
DROP VIEW City_Expression;
/*
DROP VIEW Graduate_Expression;
*/
DROP VIEW Student_Expression;
DROP VIEW Describing;
