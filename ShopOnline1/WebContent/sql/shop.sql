create table Prodotto (
id_prodotto integer primary key,
nome varchar2(20),
categoria varchar2(20) check (categoria in ('SCARPE', 'PANTALONI', 'MAGLIERIA', 'ACCESSORI')),
marca varchar2(20),
prezzo number(6,2),
offerta integer check(offerta in(0,1)),
sconto integer,
quantita_disponibile integer,
immagine varchar2(50)
);

create sequence prodotto_seq start with 1 increment by 1;

create table Utente(
id_utente integer primary key,
nome varchar2(20),
cognome varchar2(20),
username varchar2(20) unique,
password varchar2(20),
indirizzo varchar2(20)
);

create sequence utente_seq start with 1 increment by 1;

create table Acquisto (
id_acquisto integer primary key,
tipo_spedizione varchar2(20) check (tipo_spedizione in('PREMIUM', 'ORDINARIA', 'LUNGO_TERMINE')),
data_inizio date,
data_fine date,
prezzo_di_spedizione number(5,2),
quantita_acquistata integer,
id_utente integer,
foreign key (id_utente) references Utente(id_utente),
id_prodotto integer,
foreign key (id_utente) references Prodotto(id_prodotto)
);

create sequence acquisto_seq start with 1 increment by 1;

insert into Prodotto values (prodotto_seq.nextval, 'Old Shool Vans', 'SCARPE', 'Vans', 69.90, 1, 0, 23, 'img/vans.jpg');
insert into Prodotto values (prodotto_seq.nextval, 'Stivaletti stringati', 'SCARPE', 'Timberland', 250.00, 0, 20, 14, 'img/timberland.jpg');
insert into Prodotto values (prodotto_seq.nextval, 'Workout plus', 'SCARPE', 'Reebok', 83.90, 1, 0, 26, 'img/reebok.jpg');
insert into Prodotto values (prodotto_seq.nextval, 'Air Max', 'SCARPE', 'Nike', 129.90, 1, 0, 33, 'img/nike.jpg');
insert into Prodotto values (prodotto_seq.nextval, 'Skinny Carrot fit', 'PANTALONI', 'G-Star', 130.00, 0, 20, 111, 'img/gstar.jpg');
insert into Prodotto values (prodotto_seq.nextval, 'Skinny fit', 'PANTALONI', 'Nuvolari', 99.90, 1, 0, 125, 'img/nuvolari.jpg');
insert into Prodotto values (prodotto_seq.nextval, 'Regoular fit', 'PANTALONI', 'Diesel', 84.90, 0, 30, 343, 'img/diesel.jpg');
insert into Prodotto values (prodotto_seq.nextval, '70s Old Fit', 'PANTALONI', 'Diesel', 115.00, 0, 30, 33, 'img/diesel2.jpg');
insert into Prodotto values (prodotto_seq.nextval, 'Polo', 'MAGLIERIA', 'Ralph Lauren', 79.90, 0, 10, 74, 'img/ralphlauren.jpg');
insert into Prodotto values (prodotto_seq.nextval, 'Polo', 'MAGLIERIA', 'Fred Perry', 74.90, 1, 0, 44, 'img/fredperry.jpg');
insert into Prodotto values (prodotto_seq.nextval, 'T-Shirt', 'MAGLIERIA', 'Adidas', 25.00, 1, 0, 64, 'img/adidas.jpg');
insert into Prodotto values (prodotto_seq.nextval, 'Tuta', 'MAGLIERIA', 'Nike', 25.00, 1, 0, 9, 'img/nike2.jpg');
insert into Prodotto values (prodotto_seq.nextval, 'Cappello', 'ACCESSORI', 'New Era', 30.00, 0, 15, 42, 'img/newera.jpg');
insert into Prodotto values (prodotto_seq.nextval, 'Calzini', 'ACCESSORI', 'G-Star', 9.90, 1, 0, 54, 'img/gstar2.jpg');
insert into Prodotto values (prodotto_seq.nextval, 'Calzini', 'ACCESSORI', 'Leviss', 12.90, 1, 0, 66, 'img/leviss.jpg');
insert into Prodotto values (prodotto_seq.nextval, 'Sciarpa', 'ACCESSORI', 'Nuvolari', 38.90, 1, 0, 21, 'img/nuvolari2.jpg');

commit;

