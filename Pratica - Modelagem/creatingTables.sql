CREATE TABLE "users" (
    "id" serial PRIMARY KEY,
    "name" varchar(255) NOT NULL,
    "email" varchar(255) NOT NULL,
    "password" varchar(255) NOT NULL
);

CREATE TABLE "products" (
    "id" serial PRIMARY KEY,
    "name" varchar(255) NOT NULL,
    "price" int(255) NOT NULL,
    "main_photo" TEXT NOT NULL,
    "category_id" int NOT NULL REFERENCES "categories"("id"),
    "size_id" int NOT NULL REFERENCES "sizes"("id")
);

CREATE TABLE "products_photos" (
    "id" serial PRIMARY KEY,
    "product_id" int NOT NULL REFERENCES "products"("id"),
    "photo" TEXT NOT NULL
);

CREATE TABLE "categories" (
    "id" serial PRIMARY KEY,
    "name" varchar(255) NOT NULL
);

CREATE TABLE "sizes" (
    "id" serial PRIMARY KEY,
    "name" varchar(255) NOT NULL
);

CREATE TYPE "status" AS ENUM('created', 'paid', 'canceled', 'delivered');

CREATE TABLE "buys" (
    "id" serial PRIMARY KEY,
    "user_id" int NOT NULL REFERENCES "users"("id"),
    "product_id" int NOT NULL REFERENCES "products"("id"),
    "quantity" int NOT NULL,
    "state" status NOT NULL DEFAULT 'created',
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "address_id" int NOT NULL REFERENCES "addresses"("id")
);

CREATE TABLE "addresses" (
    "id" serial PRIMARY KEY,
    "street" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "number" int NOT NULL,
    "complement" int
);