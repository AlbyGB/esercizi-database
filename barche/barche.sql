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