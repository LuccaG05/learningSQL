CREATE SCHEMA congresso;
USE congresso;

CREATE TABLE participante(
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    graduacao VARCHAR(50) NOT NULL,
    instituicao VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE trabalho(
	codigo INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(50) NOT NULL,
    data_apresentacao TIMESTAMP NOT NULL,
    nota_final DECIMAL(3,1) NOT NULL,
    autor_principal INT NOT NULL,
    orientador INT,
    PRIMARY KEY (codigo),
    FOREIGN KEY (autor_principal) REFERENCES participante (id),
    FOREIGN KEY (orientador) REFERENCES participante (id)
);

INSERT INTO participante
VALUES (NULL, 'Lucas Costa', 'ADS', 'UNIMAR');

INSERT INTO participante
VALUES (NULL, 'Lucca Goncalves', 'ADS', 'UNIMAR');

INSERT INTO participante
VALUES (NULL, 'Eduarda Lopone', 'Arquitetura', 'UNIMAR');

INSERT INTO participante
VALUES (NULL, 'Celso Goncalves', 'Chaveiro', 'VIDA');

INSERT INTO participante
VALUES (NULL, 'Guilherme', 'Biomedicina', 'UNIMAR');

INSERT INTO trabalho
VALUES (NULL, 'IA', NOW(), 10.0, 1, 2);

INSERT INTO trabalho
VALUES (NULL, 'Backend', '2023-11-13', 9.0, 2, 1);

INSERT INTO trabalho
VALUES (NULL, 'UNICAR', NOW(), 8.5, 5, NULL);

INSERT INTO trabalho
VALUES (NULL, 'SQL', NOW(), 10.0, 1, NULL);


SELECT * FROM participante;
SELECT p.nome FROM participante p;

SELECT * FROM participante INNER JOIN trabalho ON autor_principal = id;

SELECT * FROM trabalho;
/*3 & 4*/

SELECT * FROM trabalho INNER JOIN participante ON orientador = id;

SELECT * FROM trabalho RIGHT JOIN participante ON orientador = id;

SELECT * FROM trabalho LEFT JOIN participante ON orientador = id;

UPDATE trabalho 
SET orientador = 3
WHERE codigo = 4;

DELETE FROM participante 
WHERE codigo





