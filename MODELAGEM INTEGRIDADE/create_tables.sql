CREATE TYPE "phoneTypes" AS ENUM (
  'landline',
  'mobile'
);

CREATE TYPE "transactionsType" AS ENUM (
  'deposit',
  'withdraw'
);

CREATE TABLE "customers" (
  "id" SERIAL PRIMARY KEY,
  "fullName" varchar[100],
  "cpf" varchar[11] UNIQUE,
  "email" varchar[100] UNIQUE,
  "password" text
);

CREATE TABLE "customerPhones" (
  "id" SERIAL PRIMARY KEY,
  "customerId" integer,
  "number" varchar[19],
  "type" phoneTypes
);

CREATE TABLE "customerAddresses" (
  "id" SERIAL PRIMARY KEY,
  "customerId" integer UNIQUE,
  "street" varchar[30],
  "number" varchar[10],
  "complement" varchar[100],
  "postalCode" varchar[10],
  "cityId" integer
);

CREATE TABLE "cities" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar[20],
  "stateId" integer
);

CREATE TABLE "states" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar[20] UNIQUE
);

CREATE TABLE "backAccount" (
  "id" SERIAL PRIMARY KEY,
  "customerId" integer,
  "accountNumber" varchar[10],
  "agency" varchar[10],
  "openDate" date,
  "closeDate" date
);

CREATE TABLE "transactions" (
  "id" SERIAL PRIMARY KEY,
  "bankAccountId" integer,
  "amount" integer,
  "type" transactionsType,
  "time" timestamptz,
  "description" varchar[30],
  "cancelled" boolean
);

CREATE TABLE "creditCards" (
  "id" SERIAL PRIMARY KEY,
  "bankAccountId" integer,
  "name" varchar[20],
  "number" text,
  "securityCode" text,
  "expirationMonth" integer,
  "expirationYear" integer,
  "password" text,
  "limit" integer
);

ALTER TABLE "customerPhones" ADD FOREIGN KEY ("customerId") REFERENCES "customers" ("id");

ALTER TABLE "customerAddresses" ADD FOREIGN KEY ("customerId") REFERENCES "customers" ("id");
ALTER TABLE "customerAddresses" ADD FOREIGN KEY ("cityId") REFERENCES "cities" ("id");

ALTER TABLE "cities" ADD FOREIGN KEY ("stateId") REFERENCES "states" ("id");

ALTER TABLE "backAccount" ADD FOREIGN KEY ("customerId") REFERENCES "customers" ("id");

ALTER TABLE "creditCards" ADD FOREIGN KEY ("bankAccountId") REFERENCES "backAccount" ("id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("bankAccountId") REFERENCES "backAccount" ("id");
