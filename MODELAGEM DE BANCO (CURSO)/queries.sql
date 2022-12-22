CREATE TYPE "scores" AS ENUM (
  'Abaixo das Expectativas',
  'Dentro das Expectativas',
  'Acima das Expectativas'
);

CREATE TABLE "students" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(100) NOT NULL,
  "cpf" varchar(11) NOT NULL,
  "email" varchar(100) NOT NULL
);

CREATE TABLE "classes" (
  "id" SERIAL PRIMARY KEY,
  "code" varchar(10) NOT NULL
);

CREATE TABLE "studentClass" (
  "id" SERIAL PRIMARY KEY,
  "classId" integer NOT NULL,
  "studentId" integer NOT NULL,
  "start" date NOT NULL,
  "end" date
);

CREATE TABLE "modules" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(100) NOT NULL
);

CREATE TABLE "projects" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(100) NOT NULL,
  "moduleId" integer NOT NULL
);

CREATE TABLE "studentProject" (
  "id" SERIAL PRIMARY KEY,
  "deliveryDate" date NOT NULL,
  "score" scores NOT NULL,
  "studentId" integer NOT NULL,
  "projectId" integer NOT NULL
);

ALTER TABLE "studentClass" ADD FOREIGN KEY ("classId") REFERENCES "classes" ("id");

ALTER TABLE "studentClass" ADD FOREIGN KEY ("studentId") REFERENCES "students" ("id");

ALTER TABLE "projects" ADD FOREIGN KEY ("moduleId") REFERENCES "modules" ("id");

ALTER TABLE "studentProject" ADD FOREIGN KEY ("studentId") REFERENCES "students" ("id");

ALTER TABLE "studentProject" ADD FOREIGN KEY ("projectId") REFERENCES "projects" ("id");
