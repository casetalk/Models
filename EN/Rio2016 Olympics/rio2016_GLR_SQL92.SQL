--
-- Project=rio2016.prj
-- Path=Z:\Documents\CaseTalk\Models\EN\Rio2016 Olympics\
-- Description=
-- Repository=Z:\Documents\CaseTalk\Models\EN\Rio2016 Olympics\rio2016_GLR.igg
-- Author=marcow
--

CREATE SCHEMA "RIO2016_GLR";

-- 
-- Data Warehouse
--   History : None
-- Dossier
--   Root : false
-- Owner
--   Date : 24-8-2016 16:56:15
--
CREATE DOMAIN "X_KGS" AS INTEGER;
-- 
-- Data Warehouse
--   History : None
-- Dossier
--   Root : false
-- Owner
--   Date : 24-8-2016 16:56:33
--
CREATE DOMAIN "X_METERS" AS CHAR(4);
-- 
-- Data Warehouse
--   History : None
-- Dossier
--   Root : false
-- Owner
--   Date : 24-8-2016 16:56:39
--
CREATE DOMAIN "X_POINTS" AS INTEGER;
-- 
-- Data Warehouse
--   History : None
-- Dossier
--   Root : false
-- Owner
--   Date : 24-8-2016 16:56:46
--
CREATE DOMAIN "X_YEARS" AS INTEGER;
CREATE DOMAIN "CATEGORY" AS CHAR(11);
CREATE DOMAIN "CITY" AS CHAR(15);
CREATE DOMAIN "COUNTRYCODE" AS CHAR(3);
CREATE DOMAIN "COUNTRY_NAME" AS CHAR(11);
CREATE DOMAIN "DAY" AS DATE;
CREATE DOMAIN "FIRST_NAME" AS CHAR(10);
CREATE DOMAIN "FUNCTION" AS CHAR(7);
-- 
-- Data Warehouse
--   History : None
-- Dossier
--   Root : false
-- Owner
--   Date : 18-8-2016 19:07:29
--
CREATE DOMAIN "HOW" AS CHAR(11)
   CHECK (VALUE IN ('final score', 'judge', 'referee'));
-- 
-- Data Warehouse
--   History : None
-- Dossier
--   Root : false
-- Owner
--   Date : 18-8-2016 19:04:49
--
CREATE DOMAIN "M_F" AS CHAR(6)
   CHECK (VALUE IN ('female', 'male'));
CREATE DOMAIN "MEDAL" AS CHAR(6);
CREATE DOMAIN "NICKNAME" AS CHAR(6);
CREATE DOMAIN "NUMBER" AS CHAR(5);
CREATE DOMAIN "OLYMPICS" AS CHAR(10);
CREATE DOMAIN "PARTICIPANT_ID" AS INTEGER;
CREATE DOMAIN "PHASE" AS CHAR(11);
CREATE DOMAIN "SPORTNAME" AS CHAR(9);
CREATE DOMAIN "STREETNAME" AS CHAR(29);
CREATE DOMAIN "SUR_NAME" AS CHAR(6);
CREATE DOMAIN "TIME" AS TIME;
CREATE DOMAIN "TIMEZONE" AS CHAR(3);
-- 
-- Data Warehouse
--   History : None
-- Dossier
--   Root : false
-- Owner
--   Date : 24-8-2016 12:36:26
--
CREATE DOMAIN "TYPE" AS CHAR(7)
   CHECK (VALUE IN ('athlete', 'team'));
CREATE DOMAIN "VENUENAME" AS CHAR(15);
-- 
-- Data Warehouse
--   History : None
-- Dossier
--   Root : false
-- Owner
--   Date : 18-8-2016 19:06:56
--
CREATE DOMAIN "WINLOOSETIE" AS CHAR(4)
   CHECK (VALUE IN ('lost', 'tied', 'won'));
--
-- [Description]
-- Artificial key domain
--
CREATE DOMAIN "GENID" AS INTEGER;

-- Table "ATHLETE"
-- [Description]
-- 
-- "Athlete participant <Participant> weighs <weight>kg."
-- "Athlete participant <Participant> is <height>m in height."
-- "Athlete participant <Participant> is <age> years old."
-- "Athlete participant <Participant> is <gender>."
-- "Athlete participant <Participant> has first name <first name>."
-- "Athlete participant <Participant> has surname <surname>."
--
-- 
-- Data Warehouse
--   History : None
-- Dossier
--   Root : false
-- Owner
--   Date : 24-8-2016 13:30:20
--
CREATE TABLE "ATHLETE" (
   "PARTICIPANT" "PARTICIPANT_ID" NOT NULL, -- Participant
   "WEIGHT" "X_KGS" NOT NULL, -- weight
   "HEIGHT" "X_METERS" NOT NULL, -- height
   "AGE" "X_YEARS" NOT NULL, -- age
   "GENDER" "M_F" NOT NULL, -- gender
   "FIRST_NAME" "FIRST_NAME" NOT NULL, -- first name
   "SURNAME" "SUR_NAME" NOT NULL, -- surname

   PRIMARY KEY ("PARTICIPANT")
);

-- Table "COMPETITION"
-- [Description]
-- 
-- "<Sport Category_Olympics> shows <Sport Category_Sport> <Sport Category> where <Phase> takes place on <Competition Moment_Day> at <Competition Moment_Time> <Competition Moment_Timezone>."
-- "<Sport Category_Olympics> shows <Sport Category_Sport> <Sport Category> where <Phase> takes place at venue <Competition Venue>."
--
CREATE TABLE "COMPETITION" (
   "SPORT_CATEGORY_OLYMPICS" "OLYMPICS" NOT NULL, -- Sport Category/Olympic Sport/Olympics
   "SPORT_CATEGORY_SPORT" "SPORTNAME" NOT NULL, -- Sport Category/Olympic Sport/Sport
   "SPORT_CATEGORY" "CATEGORY" NOT NULL, -- Sport Category/Category
   "PHASE" "PHASE" NOT NULL, -- Phase
   "COMPETITION_MOMENT_DAY" "DAY", -- Competition Moment/DateTime/Day
   "COMPETITION_MOMENT_TIME" "TIME", -- Competition Moment/DateTime/Time
   "COMPETITION_MOMENT_TIMEZONE" "TIMEZONE", -- Competition Moment/DateTime/Timezone
   "COMPETITION_VENUE" "VENUENAME" NOT NULL, -- Competition Venue/Venue

   PRIMARY KEY ("SPORT_CATEGORY_OLYMPICS", "SPORT_CATEGORY_SPORT", "SPORT_CATEGORY", "PHASE")
);

-- Table "COMPETITION_OFFICIAL"
-- [Description]
-- 
-- "<Competition_Olympics>, <Competition_Sport> <Competition_Category> in <Competition_Phase> has <Official_Function> <Official_Sur_name> <Official_First_name>."
--
CREATE TABLE "COMPETITION_OFFICIAL" (
   "COMPETITION_OLYMPICS" "OLYMPICS" NOT NULL, -- Competition/Sport Category/Olympic Sport/Olympics
   "COMPETITION_SPORT" "SPORTNAME" NOT NULL, -- Competition/Sport Category/Olympic Sport/Sport
   "COMPETITION_CATEGORY" "CATEGORY" NOT NULL, -- Competition/Sport Category/Category
   "COMPETITION_PHASE" "PHASE" NOT NULL, -- Competition/Phase
   "OFFICIAL_FUNCTION" "FUNCTION" NOT NULL, -- Official/Function
   "OFFICIAL_SUR_NAME" "SUR_NAME" NOT NULL, -- Official/Name/Sur_name
   "OFFICIAL_FIRST_NAME" "FIRST_NAME" NOT NULL, -- Official/Name/First_name

   PRIMARY KEY ("COMPETITION_OLYMPICS", "COMPETITION_SPORT", "COMPETITION_CATEGORY", "COMPETITION_PHASE", "OFFICIAL_FUNCTION", "OFFICIAL_SUR_NAME", "OFFICIAL_FIRST_NAME")
);

-- Table "COMPETITOR"
-- [Description]
-- 
-- "At <Competition_Olympics>, <Competition_Sport> <Competition_Category> in <Competition_Phase> participant <Participant> scored <Competitor Score> points."
-- "<Competition_Olympics>, <Competition_Sport> <Competition_Category> in <Competition_Phase> participant <Participant> <Competition Result_WinLooseTie> by <Competition Result_How>."
--
CREATE TABLE "COMPETITOR" (
   "COMPETITION_OLYMPICS" "OLYMPICS" NOT NULL, -- Competition/Sport Category/Olympic Sport/Olympics
   "COMPETITION_SPORT" "SPORTNAME" NOT NULL, -- Competition/Sport Category/Olympic Sport/Sport
   "COMPETITION_CATEGORY" "CATEGORY" NOT NULL, -- Competition/Sport Category/Category
   "COMPETITION_PHASE" "PHASE" NOT NULL, -- Competition/Phase
   "PARTICIPANT" "PARTICIPANT_ID" NOT NULL, -- Participant
   "COMPETITOR_SCORE" "X_POINTS" NOT NULL, -- Competitor Score
   "COMPETITION_RESULT_WINLOOSETIE" "WINLOOSETIE" NOT NULL, -- Competition Result/Result/WinLooseTie
   "COMPETITION_RESULT_HOW" "HOW" NOT NULL, -- Competition Result/Result/How

   PRIMARY KEY ("COMPETITION_OLYMPICS", "COMPETITION_SPORT", "COMPETITION_CATEGORY", "COMPETITION_PHASE", "PARTICIPANT")
);

-- Table "COUNTRY_NAME"
-- [Description]
-- 
-- "Country code <Country> stands for <Country_Name>."
--
CREATE TABLE "COUNTRY_NAME" (
   "COUNTRY" "COUNTRYCODE" NOT NULL, -- Country
   "COUNTRY_NAME" "COUNTRY_NAME" NOT NULL, -- Country_Name

   UNIQUE ("COUNTRY_NAME"),
   PRIMARY KEY ("COUNTRY")
);

-- Table "MEDAL_WINNER"
-- [Description]
-- 
-- "At <Sport Category_Olympics>, <Sport Category_Sport> <Sport Category> participant <Participant> won the <athlete medal> medal."
--
CREATE TABLE "MEDAL_WINNER" (
   "SPORT_CATEGORY_OLYMPICS" "OLYMPICS" NOT NULL, -- Sport Category/Olympic Sport/Olympics
   "SPORT_CATEGORY_SPORT" "SPORTNAME" NOT NULL, -- Sport Category/Olympic Sport/Sport
   "SPORT_CATEGORY" "CATEGORY" NOT NULL, -- Sport Category/Category
   "PARTICIPANT" "PARTICIPANT_ID" NOT NULL, -- Participant
   "ATHLETE_MEDAL" "MEDAL" NOT NULL, -- athlete medal

   PRIMARY KEY ("SPORT_CATEGORY_OLYMPICS", "SPORT_CATEGORY_SPORT", "SPORT_CATEGORY", "PARTICIPANT")
);

-- Table "OLYMPIC_SPORT"
-- [Description]
-- 
-- "<Olympics> shows <Sport>."
--
CREATE TABLE "OLYMPIC_SPORT" (
   "OLYMPICS" "OLYMPICS" NOT NULL, -- Olympics
   "SPORT" "SPORTNAME" NOT NULL, -- Sport

   PRIMARY KEY ("OLYMPICS", "SPORT")
);

-- Table "PARTICIPANT"
-- [Description]
-- 
-- "Participant <Participant_ID> plays for <Country Participant_Country>."
-- "Participant <Participant_ID> plays <Participant Sport>."
-- "Participant <Participant_ID> is a(n) <Participant Type>."
--
CREATE TABLE "PARTICIPANT" (
   "PARTICIPANT_ID" "PARTICIPANT_ID" NOT NULL, -- Participant_ID
   "COUNTRY_PARTICIPANT_COUNTRY" "COUNTRYCODE" NOT NULL, -- Country Participant/Country
   "PARTICIPANT_SPORT" "SPORTNAME", -- Participant Sport/Sport
   "PARTICIPANT_TYPE" "TYPE" NOT NULL, -- Participant Type

   PRIMARY KEY ("PARTICIPANT_ID")
);

-- Table "SPORT_CATEGORY"
-- [Description]
-- 
-- "<Olympic Sport_Olympics> shows <Olympic Sport> with category <Category>."
--
CREATE TABLE "SPORT_CATEGORY" (
   "OLYMPIC_SPORT_OLYMPICS" "OLYMPICS" NOT NULL, -- Olympic Sport/Olympics
   "OLYMPIC_SPORT" "SPORTNAME" NOT NULL, -- Olympic Sport/Sport
   "CATEGORY" "CATEGORY" NOT NULL, -- Category

   PRIMARY KEY ("OLYMPIC_SPORT_OLYMPICS", "OLYMPIC_SPORT", "CATEGORY")
);

-- 
-- Data Warehouse
--   History : None
-- Dossier
--   Root : false
-- Owner
--   Date : 7-9-2016 9:27:32
--
CREATE TABLE "STREET" (
   "STREETNAME" "STREETNAME" NOT NULL, -- Streetname
   "NUMBER" "NUMBER" NOT NULL, -- Number

   PRIMARY KEY ("STREETNAME", "NUMBER")
);

-- 
-- Data Warehouse
--   History : None
-- Dossier
--   Root : false
-- Owner
--   Date : 24-8-2016 12:31:41
--
CREATE TABLE "TEAM" (
   "PARTICIPANT" "PARTICIPANT_ID" NOT NULL, -- Participant

   PRIMARY KEY ("PARTICIPANT")
);

-- Table "TEAM_MEMBER"
-- [Description]
-- 
-- "Athlete participant <Athlete_Participant> plays for team participant <Team_Participant>."
--
CREATE TABLE "TEAM_MEMBER" (
   "ATHLETE_PARTICIPANT" "PARTICIPANT_ID" NOT NULL, -- Athlete/Participant
   "TEAM_PARTICIPANT" "PARTICIPANT_ID" NOT NULL, -- Team/Participant

   PRIMARY KEY ("ATHLETE_PARTICIPANT", "TEAM_PARTICIPANT")
);

-- Table "TEAM_NICKNAME"
-- [Description]
-- 
-- "Team participant <Team_Participant> has nickname <Nickname>."
--
CREATE TABLE "TEAM_NICKNAME" (
   "TEAM_PARTICIPANT" "PARTICIPANT_ID" NOT NULL, -- Team/Participant
   "NICKNAME" "NICKNAME" NOT NULL, -- Nickname

   UNIQUE ("NICKNAME"),
   PRIMARY KEY ("TEAM_PARTICIPANT")
);

-- Table "VENUE_LOCATION"
-- [Description]
-- 
-- "Venue <Venue> is located at <Location_Streetname>, <Location_Number> - <Location_City>."
--
CREATE TABLE "VENUE_LOCATION" (
   "VENUE" "VENUENAME" NOT NULL, -- Venue
   "LOCATION_STREETNAME" "STREETNAME" NOT NULL, -- Location/Street/Streetname
   "LOCATION_NUMBER" "NUMBER" NOT NULL, -- Location/Street/Number
   "LOCATION_CITY" "CITY" NOT NULL, -- Location/City

   PRIMARY KEY ("VENUE"),
   UNIQUE ("LOCATION_STREETNAME", "LOCATION_NUMBER", "LOCATION_CITY")
);

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE "SPORT_CATEGORY"
   ADD FOREIGN KEY ("OLYMPIC_SPORT_OLYMPICS", "OLYMPIC_SPORT")
   REFERENCES "OLYMPIC_SPORT" ("OLYMPICS", "SPORT");

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE "COMPETITION"
   ADD FOREIGN KEY ("SPORT_CATEGORY_OLYMPICS", "SPORT_CATEGORY_SPORT", "SPORT_CATEGORY")
   REFERENCES "SPORT_CATEGORY" ("OLYMPIC_SPORT_OLYMPICS", "OLYMPIC_SPORT", "CATEGORY");

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE "COMPETITOR"
   ADD FOREIGN KEY ("COMPETITION_OLYMPICS", "COMPETITION_SPORT", "COMPETITION_CATEGORY", "COMPETITION_PHASE")
   REFERENCES "COMPETITION" ("SPORT_CATEGORY_OLYMPICS", "SPORT_CATEGORY_SPORT", "SPORT_CATEGORY", "PHASE");

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE "COMPETITOR"
   ADD FOREIGN KEY ("PARTICIPANT")
   REFERENCES "PARTICIPANT" ("PARTICIPANT_ID");

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE "COMPETITION_OFFICIAL"
   ADD FOREIGN KEY ("COMPETITION_OLYMPICS", "COMPETITION_SPORT", "COMPETITION_CATEGORY", "COMPETITION_PHASE")
   REFERENCES "COMPETITION" ("SPORT_CATEGORY_OLYMPICS", "SPORT_CATEGORY_SPORT", "SPORT_CATEGORY", "PHASE");

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE "MEDAL_WINNER"
   ADD FOREIGN KEY ("SPORT_CATEGORY_OLYMPICS", "SPORT_CATEGORY_SPORT", "SPORT_CATEGORY")
   REFERENCES "SPORT_CATEGORY" ("OLYMPIC_SPORT_OLYMPICS", "OLYMPIC_SPORT", "CATEGORY");

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE "MEDAL_WINNER"
   ADD FOREIGN KEY ("PARTICIPANT")
   REFERENCES "PARTICIPANT" ("PARTICIPANT_ID");

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- Due to role substitution
-- (Athlete is subtype of "Participant")
--
ALTER TABLE "ATHLETE"
   ADD FOREIGN KEY ("PARTICIPANT")
   REFERENCES "PARTICIPANT" ("PARTICIPANT_ID");

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE "TEAM_MEMBER"
   ADD FOREIGN KEY ("ATHLETE_PARTICIPANT")
   REFERENCES "ATHLETE" ("PARTICIPANT");

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- Due to role substitution
-- (Team is subtype of "Participant")
--
ALTER TABLE "TEAM"
   ADD FOREIGN KEY ("PARTICIPANT")
   REFERENCES "PARTICIPANT" ("PARTICIPANT_ID");

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated EC
--
ALTER TABLE "TEAM_MEMBER"
   ADD FOREIGN KEY ("TEAM_PARTICIPANT")
   REFERENCES "TEAM" ("PARTICIPANT");

-- SUBSET 
-- [Description]
-- During lexicalizing generated EC
-- (Former TC on role 62)
--
ALTER TABLE "TEAM"
   ADD CHECK ("PARTICIPANT" 
      IN (SELECT "TEAM_PARTICIPANT" FROM "TEAM_MEMBER"));

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- Due to role substitution
--
ALTER TABLE "TEAM_NICKNAME"
   ADD FOREIGN KEY ("TEAM_PARTICIPANT")
   REFERENCES "TEAM" ("PARTICIPANT");

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- While reducing "Country"
--
ALTER TABLE "PARTICIPANT"
   ADD FOREIGN KEY ("COUNTRY_PARTICIPANT_COUNTRY")
   REFERENCES "COUNTRY_NAME" ("COUNTRY");

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- While reducing "Location"
--
ALTER TABLE "VENUE_LOCATION"
   ADD FOREIGN KEY ("LOCATION_STREETNAME", "LOCATION_NUMBER")
   REFERENCES "STREET" ("STREETNAME", "NUMBER");

-- SUBSET 
-- [Description]
-- During lexicalizing generated SC
-- While reducing "Sport"
--
ALTER TABLE "PARTICIPANT"
   ADD CHECK ("PARTICIPANT_SPORT" 
      IN (SELECT "SPORT" FROM "OLYMPIC_SPORT"));

-- FOREIGN KEY 
-- [Description]
-- During lexicalizing generated SC
-- While reducing "Venue"
--
ALTER TABLE "COMPETITION"
   ADD FOREIGN KEY ("COMPETITION_VENUE")
   REFERENCES "VENUE_LOCATION" ("VENUE");

INSERT INTO "ATHLETE"
  ("PARTICIPANT", "WEIGHT", "HEIGHT", "AGE", "GENDER", "FIRST_NAME", "SURNAME")
  VALUES
  (113, 48, '1.61', 34, 'female', 'Andrea', 'Kilday');
INSERT INTO "COMPETITION"
  ("SPORT_CATEGORY_OLYMPICS", "SPORT_CATEGORY_SPORT", "SPORT_CATEGORY", "PHASE", "COMPETITION_MOMENT_DAY", "COMPETITION_MOMENT_TIME", "COMPETITION_MOMENT_TIMEZONE", "COMPETITION_VENUE")
  VALUES
  ('Rio2016', 'Taekwondo', 'Woman -49kg', 'round of 16', '17 Aug', '14:00', 'BRT', 'Carioca Arena 3');
INSERT INTO "COMPETITION_OFFICIAL"
  ("COMPETITION_OLYMPICS", "COMPETITION_SPORT", "COMPETITION_CATEGORY", "COMPETITION_PHASE", "OFFICIAL_FUNCTION", "OFFICIAL_SUR_NAME", "OFFICIAL_FIRST_NAME")
  VALUES
  ('At Rio2016', 'Taekwondo', 'Woman -49kg', 'round of 16', 'referee', 'DIB', 'Julie');
INSERT INTO "COMPETITION_OFFICIAL"
  ("COMPETITION_OLYMPICS", "COMPETITION_SPORT", "COMPETITION_CATEGORY", "COMPETITION_PHASE", "OFFICIAL_FUNCTION", "OFFICIAL_SUR_NAME", "OFFICIAL_FIRST_NAME")
  VALUES
  ('At Rio2016', 'Taekwondo', 'Woman -49kg', 'round of 16', 'judge', 'Chbibi', 'Abdelhak');
INSERT INTO "COMPETITION_OFFICIAL"
  ("COMPETITION_OLYMPICS", "COMPETITION_SPORT", "COMPETITION_CATEGORY", "COMPETITION_PHASE", "OFFICIAL_FUNCTION", "OFFICIAL_SUR_NAME", "OFFICIAL_FIRST_NAME")
  VALUES
  ('At Rio2016', 'Taekwondo', 'Woman -49kg', 'round of 16', 'judge', 'Molapo', 'Moshoeshoe');
INSERT INTO "COMPETITOR"
  ("COMPETITION_OLYMPICS", "COMPETITION_SPORT", "COMPETITION_CATEGORY", "COMPETITION_PHASE", "PARTICIPANT", "COMPETITOR_SCORE", "COMPETITION_RESULT_WINLOOSETIE", "COMPETITION_RESULT_HOW")
  VALUES
  ('Rio2016', 'Taekwondo', 'Woman -49kg', 'round of 16', 113, 5, null, null);
INSERT INTO "COMPETITOR"
  ("COMPETITION_OLYMPICS", "COMPETITION_SPORT", "COMPETITION_CATEGORY", "COMPETITION_PHASE", "PARTICIPANT", "COMPETITOR_SCORE", "COMPETITION_RESULT_WINLOOSETIE", "COMPETITION_RESULT_HOW")
  VALUES
  ('Rio2016', 'Taekwondo', 'Woman -49kg', 'round of 16', 104, 7, null, null);
INSERT INTO "COMPETITOR"
  ("COMPETITION_OLYMPICS", "COMPETITION_SPORT", "COMPETITION_CATEGORY", "COMPETITION_PHASE", "PARTICIPANT", "COMPETITOR_SCORE", "COMPETITION_RESULT_WINLOOSETIE", "COMPETITION_RESULT_HOW")
  VALUES
  ('At Rio2016', 'Taekwondo', 'Woman -49kg', 'round of 16', 104, null, 'won', 'final score');
INSERT INTO "COUNTRY_NAME"
  ("COUNTRY", "COUNTRY_NAME")
  VALUES
  ('NZL', 'New Zealand');
INSERT INTO "COUNTRY_NAME"
  ("COUNTRY", "COUNTRY_NAME")
  VALUES
  ('BRA', 'Brazil');
INSERT INTO "MEDAL_WINNER"
  ("SPORT_CATEGORY_OLYMPICS", "SPORT_CATEGORY_SPORT", "SPORT_CATEGORY", "PARTICIPANT", "ATHLETE_MEDAL")
  VALUES
  ('Rio2016', 'Taekwondo', 'Woman -49kg', 104, 'Silver');
INSERT INTO "MEDAL_WINNER"
  ("SPORT_CATEGORY_OLYMPICS", "SPORT_CATEGORY_SPORT", "SPORT_CATEGORY", "PARTICIPANT", "ATHLETE_MEDAL")
  VALUES
  ('Rio2016', 'Taekwondo', 'Woman -49kg', 149, 'Bronze');
INSERT INTO "MEDAL_WINNER"
  ("SPORT_CATEGORY_OLYMPICS", "SPORT_CATEGORY_SPORT", "SPORT_CATEGORY", "PARTICIPANT", "ATHLETE_MEDAL")
  VALUES
  ('Rio2016', 'Taekwondo', 'Woman -49kg', 36, 'Bronze');
INSERT INTO "OLYMPIC_SPORT"
  ("OLYMPICS", "SPORT")
  VALUES
  ('Rio2016', 'Taekwondo');
INSERT INTO "OLYMPIC_SPORT"
  ("OLYMPICS", "SPORT")
  VALUES
  ('At Rio2016', 'Taekwondo');
INSERT INTO "PARTICIPANT"
  ("PARTICIPANT_ID", "COUNTRY_PARTICIPANT_COUNTRY", "PARTICIPANT_SPORT", "PARTICIPANT_TYPE")
  VALUES
  (113, 'NZL', 'Taekwondo', 'athlete');
INSERT INTO "PARTICIPANT"
  ("PARTICIPANT_ID", "COUNTRY_PARTICIPANT_COUNTRY", "PARTICIPANT_SPORT", "PARTICIPANT_TYPE")
  VALUES
  (104, null, null, 'athlete');
INSERT INTO "PARTICIPANT"
  ("PARTICIPANT_ID", "COUNTRY_PARTICIPANT_COUNTRY", "PARTICIPANT_SPORT", "PARTICIPANT_TYPE")
  VALUES
  (999, null, null, 'athlete');
INSERT INTO "PARTICIPANT"
  ("PARTICIPANT_ID", "COUNTRY_PARTICIPANT_COUNTRY", "PARTICIPANT_SPORT", "PARTICIPANT_TYPE")
  VALUES
  (1088, null, null, 'team');
INSERT INTO "SPORT_CATEGORY"
  ("OLYMPIC_SPORT_OLYMPICS", "OLYMPIC_SPORT", "CATEGORY")
  VALUES
  ('Rio2016', 'Taekwondo', 'Woman -49kg');
INSERT INTO "SPORT_CATEGORY"
  ("OLYMPIC_SPORT_OLYMPICS", "OLYMPIC_SPORT", "CATEGORY")
  VALUES
  ('At Rio2016', 'Taekwondo', 'Woman -49kg');
INSERT INTO "TEAM_MEMBER"
  ("ATHLETE_PARTICIPANT", "TEAM_PARTICIPANT")
  VALUES
  (999, 1088);
INSERT INTO "TEAM_NICKNAME"
  ("TEAM_PARTICIPANT", "NICKNAME")
  VALUES
  (1088, 'TeamNL');
INSERT INTO "VENUE_LOCATION"
  ("VENUE", "LOCATION_STREETNAME", "LOCATION_NUMBER", "LOCATION_CITY")
  VALUES
  ('Carioca Arena 3', 'AV. EMBAIXADOR ABELARDO BUENO', '3.401', 'BARRA DA TIJUCA');

