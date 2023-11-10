/* CREATE */
CREATE TYPE LIVELLO AS ENUM ('base', 'senior');

CREATE TABLE velisti (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50),
    esperienza LIVELLO,
    data_nascita DATE
);

CREATE TABLE barche (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50),
    colore VARCHAR(100)
);

CREATE TABLE prenotazioni (
    id_barca SERIAL,
    id_velista SERIAL,
    data DATE,
    FOREIGN KEY (id_barca) REFERENCES barche(id),
    FOREIGN KEY (id_velista) REFERENCES velisti(id) ,
    PRIMARY KEY (id_barca, id_velista)
);

/* INSERT */
INSERT INTO velisti (nome, esperienza, data_nascita) VALUES
('Mario Rossi', 'senior', '1980-05-15'),
('Luca Bianchi', 'base', '2003-07-22'),
('Giulia Verdi', 'senior', '1992-11-30'),
('Sara Neri', 'base', '2008-01-10');

INSERT INTO barche (nome, colore) VALUES
('Vento Marino', 'rosso'),
('Onda Azzurra', 'blu'),
('Sole Giallo', 'giallo'),
('Prato Verde', 'verde');

INSERT INTO prenotazioni (id_barca, id_velista, data) VALUES
(1, 1, '2023-11-01'),
(2, 2, '2023-11-15'),
(3, 3, '2023-04-10'),
(4, 4, '2023-04-20'),
(4, 1, '2023-07-01'),
(1, 2, '2023-08-15');

/* SELECT */
SELECT DISTINCT
    velisti.nome
FROM
    velisti
JOIN
    prenotazioni ON velisti.id = prenotazioni.id_velista
JOIN
    barche ON prenotazioni.id_barca = barche.id
WHERE
    barche.colore IN ('rosso', 'verde');

SELECT DISTINCT
    barche.nome
FROM
    barche
JOIN
    prenotazioni ON barche.id = prenotazioni.id_barca
WHERE
    EXTRACT(MONTH FROM prenotazioni.data) = 11 AND EXTRACT(YEAR FROM prenotazioni.data) = 2023;

SELECT
    nome
FROM
    velisti
WHERE
    esperienza = 'base' AND data_nascita > '2005-11-10';

SELECT DISTINCT
    velisti.nome
FROM
    velisti
JOIN
    prenotazioni ON velisti.id = prenotazioni.id_velista
JOIN
    barche ON prenotazioni.id_barca = barche.id
WHERE
    barche.colore = 'giallo' AND EXTRACT(MONTH FROM prenotazioni.data) = 4 AND EXTRACT(YEAR FROM prenotazioni.data) = 2023;

SELECT
    barche.nome
FROM
    barche
JOIN
    prenotazioni ON prenotazioni.id_barca = barche.id
JOIN
    velisti ON velisti.id = prenotazioni.id_velista
WHERE
    velisti.esperienza = 'senior';

SELECT
    velisti.id
FROM
    velisti
JOIN
    prenotazioni ON velisti.id = prenotazioni.id_velista
JOIN
    barche ON prenotazioni.id_barca = barche.id
WHERE NOT
    barche.colore = 'rosso';