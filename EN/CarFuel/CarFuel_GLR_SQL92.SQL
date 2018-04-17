--
-- Project=CarFuel.prj
-- Path=\\Mac\Home\Documents\CaseTalk\Models\EN\CarFuel\
-- Description=A simple example to illustrate the table as designed in any relational casetool lacks semantics. The columns require meaning.
-- 
-- Repository=\\Mac\Home\Documents\CaseTalk\Models\EN\CarFuel\CarFuel_GLR.igg
-- Author=Site License
--

CREATE SCHEMA "CARFUEL_GLR";

CREATE DOMAIN "X_KG" AS INTEGER;
CREATE DOMAIN "X_KM" AS datetime;
CREATE DOMAIN "FUEL_NAME" AS CHAR(7);
CREATE DOMAIN "LICENSE_NUMBER" AS CHAR(8);
--
-- Artificial key domain
--
CREATE DOMAIN "GENID" AS INTEGER;

-- Table "CAR"
-- "The car with license number <License number> drives <Distance>km per litre."
-- "The car with license number <License number> weighs <Weight>KG."
-- "The car with license number <License number> runs on <Fuel> fuel."
--
-- 
-- Data Warehouse
--   History : No history
-- Task
--   Color : $004080FF
--   Status : finished
--
CREATE TABLE "CAR" (
   "LICENSE_NUMBER" "LICENSE_NUMBER" NOT NULL, -- License number
   "DISTANCE" "X_KM", -- Gasoline Consumption/Distance
   "WEIGHT" "X_KG" NOT NULL, -- Car Weight/Weight
   "FUEL" "FUEL_NAME" NOT NULL, -- Car Fuel/Fuel

   PRIMARY KEY ("LICENSE_NUMBER")
);

-- POPULATION
--

INSERT INTO "CAR"
  ("LICENSE_NUMBER", "DISTANCE", "WEIGHT", "FUEL")
  VALUES
  ('34-KK-NN', '12.0', 1420, 'regular');

