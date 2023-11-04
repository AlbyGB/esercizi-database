/* Create */
CREATE TABLE riviste (
    codice_rivista SERIAL PRIMARY KEY ,
    nome_rivista VARCHAR(50),
    editore VARCHAR(100)
);

CREATE TABLE articoli (
    codice_articolo SERIAL PRIMARY KEY,
    titolo VARCHAR(100),
    argomento VARCHAR(100),
    codice_rivista SERIAL,
    FOREIGN KEY (codice_rivista) REFERENCES riviste(codice_rivista)
);

/* Insert */
INSERT INTO articoli (titolo, argomento, codice_rivista) VALUES
('Intelligenza Artificiale', 'Informatica', 1),
('Teorema di Pitagora', 'Matematica', 2),
('Particelle Subatomiche', 'Fisica', 3),
('Composti Organici', 'Chimica', 4),
('Vaccini e Immunizzazione', 'Medicina', 5),
('DNA e Genetica', 'Biologia', 6),
('Esplorazione Spaziale', 'Astronomia', 7),
('Teorie dello Apprendimento', 'Psicologia', 8),
('La Rivoluzione Francese', 'Storia', 9),
('Pensiero di Socrate', 'Filosofia', 10),
('Analisi del "Faust"', 'Letteratura', 11),
('Impressionismo', 'Arte', 12),
('Crisi del 2008', 'Economia', 13),
('Diritto Internazionale', 'Diritto', 14),
('Sostenibilità Urbana', 'Architettura', 15),
('Robotica', 'Ingegneria', 16),
('Cambiamenti Climatici', 'Geografia', 17),
('Scavi di Pompei', 'Archeologia', 18),
('Metodi Educativi', 'Pedagogia', 19),
('Strutturalismo', 'Sociologia', 20);

INSERT INTO riviste (nome_rivista, editore) VALUES
('Rivista di Informatica', 'Mondadori'),
('Giornale di Matematica', 'Feltrinelli'),
('Periodico di Fisica', 'Rizzoli'),
('Magazine di Chimica', 'Il Mulino'),
('Annali di Medicina', 'Springer Italia'),
('Quaderni di Biologia', 'Zanichelli'),
('Giornale di Astronomia', 'Bollati Boringhieri'),
('Rivista di Psicologia', 'Franco Angeli'),
('Bollettino di Storia', 'Laterza'),
('Annuario di Filosofia', 'Einaudi'),
('Rivista di Letteratura', 'Adelphi'),
('Periodico di Arte', 'Skira'),
('Magazine di Economia', 'Il Sole 24 Ore'),
('Annali di Diritto', 'Giuffrè Editore'),
('Quaderni di Architettura', 'Electa'),
('Giornale di Ingegneria', 'Hoepli'),
('Rivista di Geografia', 'Touring Club Italiano'),
('Bollatino di Archeologia', 'Edizioni Quasar'),
('Annuario di Pedagogia', 'Carocci'),
('Rivista di Sociologia', 'Cortina Raffaello');

/* Select */
SELECT
    riviste.codice_rivista, nome_rivista
FROM
    riviste
JOIN
    articoli ON riviste.codice_rivista = articoli.codice_rivista
WHERE
    articoli.argomento = 'Motociclismo';

/* SELECT con condizione di JOIN nel WHERE */
SELECT
    riviste.codice_rivista, riviste.nome_rivista
FROM
    riviste, articoli
WHERE
    articoli.argomento = 'Motociclismo' AND riviste.codice_rivista = articoli.codice_rivista;

SELECT
    articoli.codice_articolo, articoli.titolo
FROM
    articoli
JOIN
    riviste ON articoli.codice_rivista = riviste.codice_rivista
WHERE
    nome_rivista = 'Focus' AND articoli.argomento = 'Intelligenza Artificiale';

SELECT
    riviste.nome_rivista
FROM
    riviste
WHERE editore = 'Einaudi' AND SUBSTRING(riviste.nome_rivista FROM 1 FOR 1) = 'G';

SELECT
    riviste.editore
FROM
    riviste
JOIN
    articoli ON riviste.codice_rivista = articoli.codice_rivista AND articoli.argomento != 'Intelligenza Artificiale'
GROUP BY
    riviste.editore;

/* FINIRE */
SELECT
    riviste.nome_rivista
FROM
    riviste
JOIN
    (
        SELECT
            articoli.argomento, articoli.codice_rivista
        FROM
            articoli
        WHERE articoli.argomento = 'Motociclismo' OR articoli.argomento = 'Automobilismo'
    ) AS boh
ON boh.codice_rivista = riviste.codice_rivista;
