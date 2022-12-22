CREATE TABLE "airlineCompanies" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(100) NOT NULL,
  "acronym" varchar(15) NOT NULL
);

CREATE TABLE "airports" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(100) NOT NULL,
  "acronym" varchar(15) NOT NULL
);

CREATE TABLE "flights" (
  "id" SERIAL PRIMARY KEY,
  "acronym" varchar(15) NOT NULL,
  "airlineCompanyId" integer NOT NULL,
  "departureAirportId" integer NOT NULL,
  "departureTime" timestamptz NOT NULL,
  "arrivalAirportId" integer NOT NULL,
  "arrivalTime" timestamptz NOT NULL
);

ALTER TABLE "flights" ADD FOREIGN KEY ("airlineCompanyId") REFERENCES "airlineCompanies" ("id");

ALTER TABLE "flights" ADD FOREIGN KEY ("departureAirportId") REFERENCES "airports" ("id");

ALTER TABLE "flights" ADD FOREIGN KEY ("arrivalAirportId") REFERENCES "airports" ("id");
