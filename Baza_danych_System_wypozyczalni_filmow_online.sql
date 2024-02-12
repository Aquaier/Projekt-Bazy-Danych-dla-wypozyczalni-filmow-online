CREATE TABLE klienci (
id_klienta INTEGER NOT NULL,
imie_klienta VARCHAR2(45),
nazwisko_klienta VARCHAR2(45),
login VARCHAR2(20) NOT NULL,
haslo VARCHAR2(20) NOT NULL,
CONSTRAINT klienci_pk PRIMARY KEY (id_klienta),
CONSTRAINT haslo CHECK (LENGTH(haslo) >= 10),
CONSTRAINT imie_klienta CHECK (LENGTH(imie_klienta) > 2),
CONSTRAINT nazwisko_klienta CHECK (LENGTH(nazwisko_klienta) > 2)
);
COMMIT

CREATE TABLE aktorzy (
id_aktora INTEGER NOT NULL,
imie_aktora VARCHAR2(45),
nazwisko_aktora VARCHAR2(45),
CONSTRAINT aktorzy_pk PRIMARY KEY (id_aktora)
);
COMMIT

CREATE TABLE rezyserzy (
id_rezysera INTEGER NOT NULL,
imie_rezysera VARCHAR2(20),
nazwisko_rezysera VARCHAR2(30),
CONSTRAINT rezyserzy_pk PRIMARY KEY (id_rezysera)
);
COMMIT

CREATE TABLE filmy (
id_filmu INTEGER NOT NULL,
tytul VARCHAR2(50),
cena FLOAT(5),
dlugosc FLOAT(5),
rok_produkcji DATE,
id_dystrybutora INTEGER NOT NULL,
id_rezysera INTEGER NOT NULL,
CONSTRAINT filmy_pk PRIMARY KEY (id_filmu),
CONSTRAINT filmy_dystrybutorzy_fk FOREIGN KEY (id_dystrybutora)
REFERENCES dystrybutorzy (id_dystrybutora),
CONSTRAINT filmy_rezyserzy_fk FOREIGN KEY (id_rezysera)
REFERENCES rezyserzy (id_rezysera)
);
COMMIT

CREATE TABLE film_aktor (
id_aktora INTEGER NOT NULL,
id_filmu INTEGER NOT NULL,
CONSTRAINT relation_22_pk PRIMARY KEY (id_aktora, id_filmu),
CONSTRAINT relation_22_aktorzy_fk FOREIGN KEY (id_aktora)
REFERENCES aktorzy (id_aktora),
CONSTRAINT relation_22_filmy_fk FOREIGN KEY (id_filmu)
REFERENCES filmy (id_filmu)
);
COMMIT

CREATE TABLE gatunek (
id_gatunku INTEGER NOT NULL,
nazwa_gatunku VARCHAR2(45),
CONSTRAINT gatunek_pk PRIMARY KEY (id_gatunku)
);
COMMIT

CREATE TABLE wypozyczenia (
id_wypozyczenia INTEGER NOT NULL,
data_wypozyczenia DATE,
data_zwrotu DATE,
id_filmu INTEGER NOT NULL,
id_klienta INTEGER NOT NULL,
CONSTRAINT wypozyczenia_pk PRIMARY KEY (id_wypozyczenia),
CONSTRAINT wypozyczenia_filmy_fk FOREIGN KEY (id_filmu)
REFERENCES filmy (id_filmu),
CONSTRAINT wypozyczenia_klienci_fk FOREIGN KEY (id_klienta)
REFERENCES klienci (id_klienta)
);
COMMIT

CREATE TABLE dystrybutorzy (
id_dystrybutora INTEGER NOT NULL,
nazwa_dystrybutora VARCHAR2(50),
CONSTRAINT dystrybutorzy_pk PRIMARY KEY (id_dystrybutora)
);
COMMIT

CREATE TABLE film_gatunek (
id_gatunku INTEGER NOT NULL,
id_filmu INTEGER NOT NULL,
CONSTRAINT relation_23_pk PRIMARY KEY (id_gatunku,id_filmu),
CONSTRAINT relation_23_filmy_fk FOREIGN KEY (id_filmu)
REFERENCES filmy (id_filmu),
CONSTRAINT relation_23_gatunek_fk FOREIGN KEY (id_gatunku)
REFERENCES gatunek (id_gatunku)
);
COMMIT

CREATE TABLE recenzenci (
id_recenzenta INTEGER NOT NULL,
imie_recenzenta VARCHAR2(45),
nazwisko_recenzenta VARCHAR2(45),
CONSTRAINT recenzenci_pk PRIMARY KEY (id_recenzenta)
);
COMMIT

CREATE TABLE recenzje (
id_recenzji INTEGER NOT NULL,
ocena INTEGER,
tresc_recenzji VARCHAR2(100),
id_filmu INTEGER NOT NULL,
id_recenzenta INTEGER NOT NULL,
CONSTRAINT recenzje_pk PRIMARY KEY (id_recenzji),
CONSTRAINT recenzje_filmy_fk FOREIGN KEY (id_filmu)
REFERENCES filmy (id_filmu),
CONSTRAINT recenzje_recenzenci_fk FOREIGN KEY (id_recenzenta)
REFERENCES recenzenci (id_recenzenta)
);
COMMIT