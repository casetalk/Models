/* 
 * This script is part of a set to build a database or other artifact.
 * The X marks this script as part of the set:
 * [X] generic   - Create and/or set database generators
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
 * [ ] drop      - Drop tables and domains
 * 
 * [ ] catalog   - Catalog insert statements describing the script objects
 */

--
-- Project=apprenticeship.prj
-- Path=\\Mac\Home\Documents\CaseTalk\GitHub\Models\EN\Apprenticeship\
-- Description=[Description]
-- This is an example project to illustrate FCO-IM and CaseTalk features.
-- [Default]
-- 
-- Repository=\\Mac\Home\Documents\CaseTalk\GitHub\Models\EN\Apprenticeship\apprenticeship.ig
-- Author=Marco Wobben
--

CREATE SCHEMA X33756;

 -- Temporal support does not come native and packages need to be installed
 -- please visit: https://wiki.postgresql.org/wiki/Temporal_Extensions
