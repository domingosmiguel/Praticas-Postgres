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
  "fullName" varchar[100] NOT NULL,
  "cpf" varchar[11] NOT NULL UNIQUE,
  "email" varchar[100] NOT NULL UNIQUE,
  "password" text NOT NULL
);

CREATE TABLE "customerPhones" (
  "id" SERIAL PRIMARY KEY,
  "customerId" integer NOT NULL,
  "number" varchar[19] NOT NULL,
  "type" phoneTypes NOT NULL
);

CREATE TABLE "customerAddresses" (
  "id" SERIAL PRIMARY KEY,
  "customerId" integer NOT NULL UNIQUE,
  "street" varchar[30] NOT NULL,
  "number" varchar[10] NOT NULL,
  "complement" varchar[100] NOT NULL,
  "postalCode" varchar[10] NOT NULL,
  "cityId" integer NOT NULL
);

CREATE TABLE "cities" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar[20] NOT NULL,
  "stateId" integer NOT NULL
);

CREATE TABLE "states" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar[20] NOT NULL UNIQUE
);

CREATE TABLE "backAccount" (
  "id" SERIAL PRIMARY KEY,
  "customerId" integer NOT NULL,
  "accountNumber" varchar[10] NOT NULL,
  "agency" varchar[10] NOT NULL,
  "openDate" date NOT NULL,
  "closeDate" date NOT NULL
);

CREATE TABLE "transactions" (
  "id" SERIAL PRIMARY KEY,
  "bankAccountId" integer NOT NULL,
  "amount" integer NOT NULL,
  "type" transactionsType NOT NULL,
  "time" timestamptz NOT NULL,
  "description" varchar[30] NOT NULL,
  "cancelled" boolean NOT NULL
);

CREATE TABLE "creditCards" (
  "id" SERIAL PRIMARY KEY,
  "bankAccountId" integer NOT NULL,
  "name" varchar[20] NOT NULL,
  "number" text NOT NULL,
  "securityCode" text NOT NULL,
  "expirationMonth" integer NOT NULL,
  "expirationYear" integer NOT NULL,
  "password" text NOT NULL,
  "limit" integer NOT NULL
);

ALTER TABLE "customerPhones" ADD FOREIGN KEY ("customerId") REFERENCES "customers" ("id");

ALTER TABLE "customerAddresses" ADD FOREIGN KEY ("customerId") REFERENCES "customers" ("id");
ALTER TABLE "customerAddresses" ADD FOREIGN KEY ("cityId") REFERENCES "cities" ("id");

ALTER TABLE "cities" ADD FOREIGN KEY ("stateId") REFERENCES "states" ("id");

ALTER TABLE "backAccount" ADD FOREIGN KEY ("customerId") REFERENCES "customers" ("id");

ALTER TABLE "creditCards" ADD FOREIGN KEY ("bankAccountId") REFERENCES "backAccount" ("id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("bankAccountId") REFERENCES "backAccount" ("id");
