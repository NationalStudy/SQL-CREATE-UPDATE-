\c Depot;

create table payments
(
	"CodeOfPayment" id,
	"Date" date_type,
	"PaymentSum" int
);

alter table products add column "CodeOfPayment" id;

alter table payments add constraint "PK_Payments" primary key ("CodeOfPayment");

alter table payments add constraint "FK_CodeOfSale" foreign key ("CodeOfPayment") references sale ("CodeOfSale");
