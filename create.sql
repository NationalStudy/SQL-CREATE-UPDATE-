CREATE DATABASE "Depot";
\c Depot;

create domain id AS integer NOT NULL;
create domain phone_number AS character varying(15) NOT NULL;
create domain address AS character varying(50) NOT NULL;
create domain string AS text NOT NULL;
create domain int AS integer NOT NULL;
create domain money_type AS money NOT NULL;
create domain date_type AS date NOT NULL;
create domain email AS character varying(50);

create table customers
(
  "CodeOfCustomers" id,
  "FullName" string,
  "Address" address,
  "PhoneNumber" phone_number,
  "email" email
);

create table products
(
  "CodeOfProduct" id,
  "Name" string,
  "Price" money_type,
  "CodeOfSale" id
);

create table sale
(
  "CodeOfSale" id,
  "CodeOfProduct" id,
  "CodeOfCustomers" id,
  "DataOfSale" date_type,
  "DateOfDelewery" date_type
);

alter table customers add constraint "PK_customers" primary key ("CodeOfCustomers");

alter table products add constraint "PK_products" primary key ("CodeOfProduct");

alter table sale add constraint "PK_sale" primary key ("CodeOfSale");

alter table sale add constraint "FK_CodeOfProduct" foreign key ("CodeOfProduct") references products("CodeOfProduct");

alter table products add constraint "FK_CodeOfSale" foreign key ("CodeOfSale") references sale ("CodeOfSale");
