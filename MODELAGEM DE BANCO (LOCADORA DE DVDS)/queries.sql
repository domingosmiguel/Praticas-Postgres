CREATE DATABASE "locadora"

CREATE TABLE "discs" (
  "id" SERIAL PRIMARY KEY,
  "number" integer NOT NULL,
  "serialNumber" varchar(100) NOT NULL,
  "movieId" integer NOT NULL
);

CREATE TABLE "movies" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar(100) NOT NULL,
  "categoryId" integer NOT NULL
);

CREATE TABLE "categories" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(100) NOT NULL
);

CREATE TABLE "actors" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(100) NOT NULL,
  "CO" varchar(100) NOT NULL,
  "birth" date NOT NULL
);

CREATE TABLE "movieActor" (
  "id" SERIAL PRIMARY KEY,
  "movieId" integer NOT NULL,
  "actorId" integer NOT NULL
);

CREATE TABLE "clients" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(100) NOT NULL,
  "cpf" varchar(11) NOT NULL
);

CREATE TABLE "phoneNumbers" (
  "id" SERIAL PRIMARY KEY,
  "number" varchar(14) NOT NULL
);

CREATE TABLE "adresses" (
  "id" SERIAL PRIMARY KEY,
  "street" varchar(100) NOT NULL,
  "number" varchar(20) NOT NULL,
  "complement" varchar(100) DEFAULT 'no complement',
  "district" varchar(100) NOT NULL,
  "postalCode" varchar(10) NOT NULL,
  "cityId" integer NOT NULL
);

CREATE TABLE "cities" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(100) NOT NULL,
  "stateId" integer NOT NULL
);

CREATE TABLE "states" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(100) UNIQUE NOT NULL,
  "countryId" integer NOT NULL
);

CREATE TABLE "countries" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(100) UNIQUE NOT NULL
);

CREATE TABLE "clientAdress" (
  "id" SERIAL PRIMARY KEY,
  "clientId" integer NOT NULL,
  "adressId" integer NOT NULL
);

CREATE TABLE "clientPhoneNumber" (
  "id" SERIAL PRIMARY KEY,
  "clientId" integer NOT NULL,
  "phoneNumberId" integer NOT NULL
);

CREATE TABLE "leases" (
  "id" SERIAL PRIMARY KEY,
  "clientId" integer NOT NULL,
  "leaseStart" date NOT NULL,
  "leaseEnd" date,
  "serviceSatisfaction" integer
);

CREATE TABLE "leaseMovie" (
  "id" SERIAL PRIMARY KEY,
  "leaseId" integer NOT NULL,
  "movieId" integer NOT NULL,
  "movieSatisfaction" integer
);

ALTER TABLE "discs" ADD FOREIGN KEY ("movieId") REFERENCES "movies" ("id");

ALTER TABLE "movies" ADD FOREIGN KEY ("categoryId") REFERENCES "categories" ("id");

ALTER TABLE "movieActor" ADD FOREIGN KEY ("movieId") REFERENCES "movies" ("id");

ALTER TABLE "movieActor" ADD FOREIGN KEY ("actorId") REFERENCES "actors" ("id");

ALTER TABLE "adresses" ADD FOREIGN KEY ("cityId") REFERENCES "cities" ("id");

ALTER TABLE "cities" ADD FOREIGN KEY ("stateId") REFERENCES "states" ("id");

ALTER TABLE "states" ADD FOREIGN KEY ("countryId") REFERENCES "countries" ("id");

ALTER TABLE "clientAdress" ADD FOREIGN KEY ("clientId") REFERENCES "clients" ("id");

ALTER TABLE "clientAdress" ADD FOREIGN KEY ("adressId") REFERENCES "adresses" ("id");

ALTER TABLE "clientPhoneNumber" ADD FOREIGN KEY ("clientId") REFERENCES "clients" ("id");

ALTER TABLE "clientPhoneNumber" ADD FOREIGN KEY ("phoneNumberId") REFERENCES "phoneNumbers" ("id");

ALTER TABLE "leases" ADD FOREIGN KEY ("clientId") REFERENCES "clients" ("id");

ALTER TABLE "leaseMovie" ADD FOREIGN KEY ("leaseId") REFERENCES "leases" ("id");

ALTER TABLE "leaseMovie" ADD FOREIGN KEY ("movieId") REFERENCES "movies" ("id");
