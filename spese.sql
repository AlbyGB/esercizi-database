/* CREATE */
CREATE TABLE categorie (
    nome VARCHAR(50) PRIMARY KEY
);

CREATE TABLE spese (
    id SERIAL PRIMARY KEY,
    descrizione VARCHAR(255) DEFAULT '',
    data DATE DEFAULT CURRENT_DATE,
    importo FLOAT DEFAULT 0,
    nome_categoria VARCHAR(100),
    FOREIGN KEY (nome_categoria) REFERENCES categorie(nome)
);

CREATE TABLE tags (
    nome VARCHAR(50) PRIMARY KEY
);

CREATE TABLE spese_tags (
    id_spesa SERIAL,
    nome_tag VARCHAR(50),
    FOREIGN KEY (id_spesa) REFERENCES spese(id),
    FOREIGN KEY (nome_tag) REFERENCES tags(nome),
    PRIMARY KEY (id_spesa, nome_tag)
);

/* INSERT */
INSERT INTO categorie (nome) VALUES ('Alimentari');
INSERT INTO categorie (nome) VALUES ('Intrattenimento');
INSERT INTO categorie (nome) VALUES ('Vacanze');
INSERT INTO categorie (nome) VALUES ('Abbigliamento');
INSERT INTO categorie (nome) VALUES ('Bollette');
INSERT INTO categorie (nome) VALUES ('Altro');
INSERT INTO tags (nome) VALUES ('Viaggio');
INSERT INTO tags (nome) VALUES ('Cena');
INSERT INTO tags (nome) VALUES ('Cinema');
INSERT INTO tags (nome) VALUES ('Caffè');
INSERT INTO tags (nome) VALUES ('Auto');
INSERT INTO tags (nome) VALUES ('Benzina');
INSERT INTO tags (nome) VALUES ('Treno');
INSERT INTO tags (nome) VALUES ('Aereo');
INSERT INTO tags (nome) VALUES ('Hotel');
INSERT INTO tags (nome) VALUES ('Noleggio');
INSERT INTO tags (nome) VALUES ('Elettronica');
INSERT INTO tags (nome) VALUES ('Libri');
INSERT INTO tags (nome) VALUES ('Musica');
INSERT INTO tags (nome) VALUES ('Giochi');
INSERT INTO tags (nome) VALUES ('Sport');
INSERT INTO tags (nome) VALUES ('Palestra');
INSERT INTO tags (nome) VALUES ('Luce');
INSERT INTO tags (nome) VALUES ('Gas');
INSERT INTO spese (descrizione, data, importo, nome_categoria) VALUES ('ciao', '2023/08/16', 300, 'Vacanze');
INSERT INTO spese (descrizione, data, importo, nome_categoria) VALUES ('ciao', '2023/08/16', 300, 'Vacanze');
INSERT INTO spese (descrizione, data, importo, nome_categoria) VALUES ('ciao', '2023/08/16', 300, 'Vacanze');
INSERT INTO spese (descrizione, data, importo, nome_categoria) VALUES ('ciao', '2023/08/16', 300, 'Vacanze');
INSERT INTO spese (descrizione, data, importo, nome_categoria) VALUES ('ciao', '2023/08/16', 300, 'Vacanze');