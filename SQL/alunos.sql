CREATE TABLE alunos(
	ra INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    nascimento DATE,
    media_geral DECIMAL (5,2),
    PRIMARY KEY (ra)
);

INSERT INTO alunos (nome, nascimento, media_geral)
VALUES ('Lucca', '2002-07-05', 9.5);

INSERT INTO alunos (nome, nascimento, media_geral)
VALUES ('Lucas Costa', '2000-09-30', 4.5);

INSERT INTO alunos (nome, nascimento, media_geral)
VALUES ('Plinio', '2000-12-29', 4.5);

SELECT * FROM alunos WHERE ra = 1;

SELECT * FROM alunos;

SELECT * FROM alunos WHERE media_geral > 9;

SELECT nome, nascimento FROM alunos WHERE media_geral > 9;

SELECT * FROM alunos WHERE nascimento >= '2002-07-05';

ALTER TABLE alunos ADD curso CHAR(3); 

UPDATE alunos
SET media_geral = 8.0
WHERE ra = 2;

DELETE FROM alunos
WHERE ra = 5;

INSERT INTO alunos
VALUES (NULL, 'Jeff', '2004-09-22', 7);

UPDATE alunos
SET curso = 'CDC'
WHERE ra = 1 OR ra = 2;

UPDATE alunos SET curso = 'ADS' WHERE ra = 3;
UPDATE alunos SET curso = 'MED' WHERE ra = 4;

INSERT INTO alunos (nome, nascimento, media_geral, curso)
VALUES ('Gordao', '2000-07-06', 8, 'DIR');

INSERT INTO alunos (nome, nascimento, media_geral, curso)
VALUES ('Kaua', '2004-10-22', 10, 'ADS');

INSERT INTO alunos (nome, nascimento, media_geral, curso)
VALUES ('Leonardo', '2003-12-01', 10, 'CDC');

SELECT * FROM alunos ORDER BY nome DESC;

SELECT * FROM alunos ORDER BY curso, nome;

SELECT * FROM alunos ORDER BY curso, media_geral DESC;

SELECT * FROM alunos WHERE nome LIKE '%ff%';

SELECT AVG(media_geral) FROM alunos WHERE curso = 'CDC';

SELECT MIN(media_geral) FROM alunos WHERE curso = 'CDC';

SELECT curso, AVG(media_geral) FROM alunos GROUP BY curso;


