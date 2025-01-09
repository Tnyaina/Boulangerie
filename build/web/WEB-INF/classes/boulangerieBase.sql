CREATE TABLE unite (
idUnite varchar(50) primary key not null,
nom varchar(50)
);

insert into unite (idUnite, nom) VALUES ('u1', 'kg');
insert into unite (idUnite, nom) VALUES ('u2', 'l');
insert into unite (idUnite, nom) VALUES ('u3', 'piece') returning idUnite;

-- -------------------------------------------------------------------------------
create sequence prod_seq increment by 1 start with 1;
-- ingredients 
CREATE TABLE produit (
idProduit varchar(100) primary key not null,
nomProduit varchar(100),
idUnite varchar(100),
foreign key (idUnite) references unite(idUnite)
);

insert into produit VALUES ('p0', 'farine', 'u1');

create sequence emp_seq increment by 1 start with 1;
CREATE TABLE employe (
idEmploye varchar(100) primary key not null,
nomEmploye varchar(100),
dtn date
);

-- patisserie ex : pain
-- Création de la séquence pour la table patisserie
CREATE SEQUENCE pat_seq INCREMENT BY 1 START WITH 1;

-- Table patisserie
CREATE TABLE patisserie (
    idPatisserie VARCHAR(100) PRIMARY KEY NOT NULL,
    nomPatisserie VARCHAR(100),
    prixUnite NUMERIC -- PostgreSQL utilise NUMERIC pour les nombres décimaux
);

CREATE SEQUENCE cat_seq INCREMENT BY 1 START WITH 1;
CREATE TABLE category(
    idCategory VARCHAR(100) PRIMARY KEY NOT NULL,
    nomCategory VARCHAR(100)
);

INSERT INTO category (nomCategory) VALUES ('Pains');
INSERT INTO category (nomCategory) VALUES ('Viennoiseries');
INSERT INTO category (nomCategory) VALUES ('Pâtisseries');

CREATE SEQUENCE pat_cat_seq INCREMENT BY 1 START WITH 1;
CREATE TABLE patisserie_category(
    idPat_Cat VARCHAR(100) PRIMARY KEY NOT NULL,
    idPatisserie VARCHAR(100),
    idCategory VARCHAR(100),
    CONSTRAINT fk_patisserie FOREIGN KEY (idPatisserie) REFERENCES patisserie(idPatisserie),
    CONSTRAINT fk_category FOREIGN KEY (idCategory) REFERENCES category(idCategory)
);

-- Création de la séquence pour la table ingredient
CREATE SEQUENCE ingr_seq INCREMENT BY 1 START WITH 1;

-- Table ingredient
CREATE TABLE ingredient (
    idIngredient VARCHAR(100) PRIMARY KEY NOT NULL,
    idPatisserie VARCHAR(100), -- Référence à patisserie
    idProduit VARCHAR(100),    -- Référence à produit
    CONSTRAINT fk_patisserie FOREIGN KEY (idPatisserie) REFERENCES patisserie(idPatisserie),
    CONSTRAINT fk_produit FOREIGN KEY (idProduit) REFERENCES produit(idProduit)
);


CREATE SEQUENCE vente_seq INCREMENT BY 1 START WITH 1;
CREATE TABLE vente (
    idVente VARCHAR(100) PRIMARY KEY NOT NULL,
    NomClient VARCHAR(100),
    idPatisserie VARCHAR(100),
    CONSTRAINT fk_patisserie FOREIGN KEY (idPatisserie) REFERENCES patisserie(idPatisserie)
);

CREATE SEQUENCE parf_seq INCREMENT BY 1 START WITH 1;
CREATE TABLE parfum (
    idParfum VARCHAR(100) PRIMARY KEY NOT NULL,
    Nom VARCHAR(100)
);

CREATE SEQUENCE pat_parf_seq INCREMENT BY 1 START WITH 1;
CREATE TABLE pat_parfum (
    idPat_parfum VARCHAR(100) PRIMARY KEY NOT NULL,
    idPatisserie VARCHAR(100),
    idParfum VARCHAR(100),
    CONSTRAINT fk_patisserie FOREIGN KEY (idPatisserie) REFERENCES patisserie(idPatisserie),
    CONSTRAINT fk_parfum FOREIGN KEY (idParfum) REFERENCES parfum(idParfum)
);
