CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"userName" varchar(16) NOT NULL UNIQUE,
	"name" varchar(80) NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	"addresId" integer NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"price" integer NOT NULL,
	"mainImageId" integer NOT NULL UNIQUE,
	"onStock" BOOLEAN NOT NULL DEFAULT 'false',
	"stockQuantity" integer NOT NULL DEFAULT 'false',
	"categoryId" integer NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" serial NOT NULL UNIQUE,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.images" (
	"id" serial NOT NULL,
	"imageUrl" TEXT NOT NULL UNIQUE,
	"productId" TEXT NOT NULL UNIQUE,
	CONSTRAINT "images_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cart" (
	"id" serial NOT NULL,
	"userId" integer NOT NULL,
	"date" DATE NOT NULL UNIQUE,
	"status" TEXT NOT NULL,
	"adderessId" integer NOT NULL UNIQUE,
	CONSTRAINT "cart_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cartsProducts" (
	"id" serial NOT NULL,
	"cartId" integer NOT NULL,
	"productId" integer NOT NULL,
	"quantity" integer NOT NULL,
	"currentPrice" integer NOT NULL,
	CONSTRAINT "cartsProducts_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.address" (
	"id" serial NOT NULL,
	"neighborhood" TEXT NOT NULL,
	"number" integer NOT NULL,
	"completment" TEXT,
	"postalCode" TEXT,
	"street" TEXT NOT NULL,
	"cityId" integer NOT NULL,
	CONSTRAINT "address_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cities" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"stateId" integer NOT NULL UNIQUE,
	CONSTRAINT "cities_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.states" (
	"id" serial NOT NULL,
	"name" integer NOT NULL UNIQUE,
	CONSTRAINT "states_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "users" ADD CONSTRAINT "users_fk0" FOREIGN KEY ("addresId") REFERENCES "address"("id");

ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("mainImageId") REFERENCES "images"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");


ALTER TABLE "images" ADD CONSTRAINT "images_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "cart" ADD CONSTRAINT "cart_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "cart" ADD CONSTRAINT "cart_fk1" FOREIGN KEY ("adderessId") REFERENCES "address"("id");

ALTER TABLE "cartsProducts" ADD CONSTRAINT "cartsProducts_fk0" FOREIGN KEY ("cartId") REFERENCES "cart"("id");
ALTER TABLE "cartsProducts" ADD CONSTRAINT "cartsProducts_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "address" ADD CONSTRAINT "address_fk0" FOREIGN KEY ("cityId") REFERENCES "cities"("id");

ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "states"("id");











