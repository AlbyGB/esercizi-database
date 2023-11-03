CREATE TABLE dipartimenti (
    id SERIAL PRIMARY KEY,
    location VARCHAR(50) NOT NULL ,
    provincia VARCHAR(50) NOT NULL
);

CREATE TABLE personale (
    matricola SERIAL PRIMARY KEY,
    id_dip SERIAL,
    nominativo VARCHAR(50) NOT NULL DEFAULT '',
    data_nascita DATE NOT NULL DEFAULT '2005/05/07',
    qualifca VARCHAR(100) NOT NULL DEFAULT 'ingegnere',
    stipendio VARCHAR(50) NOT NULL DEFAULT '100k',
    FOREIGN KEY (id_dip) REFERENCES dipartimenti(id)
);

CREATE TABLE prodotti (
    id_prodotto SERIAL PRIMARY KEY,
    id_dip SERIAL,
    nome_prodotto VARCHAR(50) NOT NULL DEFAULT 'vite',
    prezzo VARCHAR(50) NOT NULL DEFAULT '10',
    FOREIGN KEY (id_dip) REFERENCES dipartimenti(id)
);

CREATE TABLE composizione (
    id_prod SERIAL,
    id_comp SERIAL,
    FOREIGN KEY (id_prod) REFERENCES prodotti(id_prodotto),
    FOREIGN KEY (id_comp) REFERENCES componenti(id_comp),
    PRIMARY KEY (id_prod, id_comp)
);

CREATE TABLE componenti (
    id_comp SERIAL PRIMARY KEY,
    nome_comp VARCHAR(50) NOT NULL DEFAULT '',
    costo_unitario FLOAT,
    fornitore VARCHAR(50) NOT NULL DEFAULT ''
);

INSERT INTO dipartimenti (nome, location, provincia) VALUES
('Nome1', 'Location1', 'Provincia1'),
('Nome2', 'Location2', 'Provincia2'),
('Nome3', 'Location3', 'Provincia3'),
('Nome4', 'Location4', 'Provincia4'),
('Nome5', 'Location5', 'Provincia5'),
('Nome6', 'Location6', 'Provincia6'),
('Nome7', 'Location7', 'Provincia7'),
('Nome8', 'Location8', 'Provincia8'),
('Nome9', 'Location9', 'Provincia9'),
('Nome10', 'Location10', 'Provincia10'),
('Nome11', 'Location11', 'Provincia11'),
('Nome12', 'Location12', 'Provincia12'),
('Nome13', 'Location13', 'Provincia13'),
('Nome14', 'Location14', 'Provincia14'),
('Nome15', 'Location15', 'Provincia15'),
('Nome16', 'Location16', 'Provincia16'),
('Nome17', 'Location17', 'Provincia17'),
('Nome18', 'Location18', 'Provincia18'),
('Nome19', 'Location19', 'Provincia19'),
('Nome20', 'Location20', 'Provincia20');