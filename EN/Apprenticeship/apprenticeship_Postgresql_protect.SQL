/* 
 * This script is part of a set to build a database or other artifact.
 * The X marks this script as part of the set:
 * [ ] generic   - Create and/or set database generators
 * [ ] create    - Create domains, tables, primary keys, unique constraints
 * [ ] load      - Insert data
 * [X] protect   - Add check constraints, foreign key constraints (internal to module) and triggers
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


ALTER TABLE Alumni
   ADD FOREIGN KEY (Student_ID)
   REFERENCES Student (Student_ID);

ALTER TABLE Apprenticeship
   ADD FOREIGN KEY (Apprenticeship_City)
   REFERENCES City (city_name);

ALTER TABLE Apprenticeship
   ADD FOREIGN KEY (Apprenticeship_Assigned_ID)
   REFERENCES Student (Student_ID);

ALTER TABLE Apprenticeship_Preference
   ADD FOREIGN KEY (Student_ID)
   REFERENCES Student (Student_ID);

ALTER TABLE Apprenticeship_Preference
   ADD FOREIGN KEY (Apprenticeship)
   REFERENCES Apprenticeship (apprenticeship_code);

ALTER TABLE Graduate
   ADD FOREIGN KEY (Graduation_Student_ID)
   REFERENCES Student (Student_ID);

ALTER TABLE Student
   ADD FOREIGN KEY (City_Of_Residence)
   REFERENCES City (city_name);

ALTER TABLE Student
   ADD FOREIGN KEY (Student_Buddy_ID)
   REFERENCES Student (Student_ID);
