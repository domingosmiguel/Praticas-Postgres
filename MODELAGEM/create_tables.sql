CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
);

CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" money NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
);

CREATE TABLE "public.pictureAlbum" (
	"id" serial NOT NULL,
	"productId" int NOT NULL,
	"pictureId" int NOT NULL UNIQUE,
	CONSTRAINT "pictureAlbum_pk" PRIMARY KEY ("id")
);

CREATE TABLE "public.pictures" (
	"id" serial NOT NULL,
	"url" TEXT NOT NULL,
	"main" BOOLEAN DEFAULT 'FALSE',
	CONSTRAINT "pictures_pk" PRIMARY KEY ("id")
);

CREATE TABLE "public.clothesCategories" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "clothesCategories_pk" PRIMARY KEY ("id")
);

CREATE TABLE "public.clothesSizes" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "clothesSizes_pk" PRIMARY KEY ("id")
);

CREATE TABLE "public.clothes" (
	"id" serial NOT NULL,
	"productId" int NOT NULL,
	"categoryId" int NOT NULL,
	"sizeId" int NOT NULL,
	CONSTRAINT "clothes_pk" PRIMARY KEY ("id")
);

CREATE TABLE "public.shoppingCart" (
	"id" serial NOT NULL,
	"productId" int NOT NULL,
	"userId" int NOT NULL,
	"qty" int NOT NULL,
	"status" TEXT NOT NULL,
	"time" timestamp with time zone DEFAULT 'NOW()',
	"deliveryAdress" int NOT NULL,
	CONSTRAINT "shoppingCart_pk" PRIMARY KEY ("id")
);

CREATE TABLE "public.adresses" (
	"id" serial NOT NULL,
	"postalCode" TEXT NOT NULL,
	"number" int NOT NULL,
	"street" TEXT NOT NULL,
	"city" TEXT NOT NULL,
	"state" TEXT NOT NULL,
	"country" TEXT NOT NULL,
	"additionalInfo" int NOT NULL,
	"userId" int NOT NULL,
	CONSTRAINT "adresses_pk" PRIMARY KEY ("id")
);

ALTER TABLE "pictureAlbum" ADD CONSTRAINT "pictureAlbum_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "pictureAlbum" ADD CONSTRAINT "pictureAlbum_fk1" FOREIGN KEY ("pictureId") REFERENCES "pictures"("id");

ALTER TABLE "clothes" ADD CONSTRAINT "clothes_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "clothes" ADD CONSTRAINT "clothes_fk1" FOREIGN KEY ("categoryId") REFERENCES "clothesCategories"("id");
ALTER TABLE "clothes" ADD CONSTRAINT "clothes_fk2" FOREIGN KEY ("sizeId") REFERENCES "clothesSizes"("id");

ALTER TABLE "shoppingCart" ADD CONSTRAINT "shoppingCart_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "shoppingCart" ADD CONSTRAINT "shoppingCart_fk1" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "shoppingCart" ADD CONSTRAINT "shoppingCart_fk2" FOREIGN KEY ("deliveryAdress") REFERENCES "adresses"("id");

ALTER TABLE "adresses" ADD CONSTRAINT "adresses_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");










