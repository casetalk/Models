--
-- Project=CarFuel.prj
-- Path=Z:\Documents\CaseTalk\Models\EN\CarFuel\
-- Description=
-- Repository=Z:\Documents\CaseTalk\Models\EN\CarFuel\CarFuel_GLR.igg
-- Author=Site License
--

CREATE SCHEMA "CARFUEL_GLR";

CREATE DOMAIN "X_KG" AS INTEGER;
CREATE DOMAIN "X_KM" AS datetime;
CREATE DOMAIN "FUEL_NAME" AS CHAR(7);
CREATE DOMAIN "LICENSE_NUMBER" AS CHAR(8);
--
-- [Description]
-- Artificial key domain
--
CREATE DOMAIN "GENID" AS INTEGER;

-- Table "CAR"
-- [Description]
-- 
-- "The car with license number <License number> drives <Gasoline Consumption_Distance>km per litre."
-- "The car with license number <License number> weighs <Car Weight>KG."
-- "The car with license number <License number> runs on <Car Fuel> fuel."
--
CREATE TABLE "CAR" (
   "LICENSE_NUMBER" "LICENSE_NUMBER" NOT NULL, -- License number
   "GASOLINE_CONSUMPTION_DISTANCE" "X_KM", -- Gasoline Consumption/Distance
   "CAR_WEIGHT" "X_KG" NOT NULL, -- Car Weight/Weight
   "CAR_FUEL" "FUEL_NAME" NOT NULL, -- Car Fuel/Fuel

   PRIMARY KEY ("LICENSE_NUMBER")
);

INSERT INTO "CAR"
  ("LICENSE_NUMBER", "GASOLINE_CONSUMPTION_DISTANCE", "CAR_WEIGHT", "CAR_FUEL")
  VALUES
  ('34-KK-NN', '12.0', 1420, 'regular');

