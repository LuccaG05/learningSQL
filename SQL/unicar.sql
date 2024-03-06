CREATE TABLE usuarios(
	ra INT NOT NULL,
	nome VARCHAR(50) NOT NULL,
    nascimento DATE, 
    email VARCHAR (50),
    tipo CHAR(15) NOT NULL,
    genero CHAR(5),
    cnh VARCHAR(15),
    curso VARCHAR(30),
    PRIMARY KEY (ra)

);

INSERT INTO usuarios
VALUES (1919191, 'Lucas', '2000-09-30', 'lk@gmail.com', 'ADMINISTRADOR', 'M', '12345678910', 'ADS');

INSERT INTO usuarios
VALUES (1818181, 'Lucca', '2002-07-05', 'dog@gmail.com','ADMINISTRADOR', 'M', '01987654321', 'ADS');


SELECT * FROM usuarios;

CREATE TABLE veiculos(
	placa VARCHAR(10) NOT NULL,
    tipo VARCHAR(10) NOT NULL,
    modelo VARCHAR(20),
    cor CHAR(12),
    capacidade INT NOT NULL,
    ra INT NOT NULL,
    motorista VARCHAR(50) NOT NULL,
    PRIMARY KEY (placa)
);

INSERT INTO veiculos
VALUES ('BRA2E19', 'CARRO', 'BMW', 'Preto', '5', 1919191, 'LK');

SELECT * FROM veiculos;

CREATE TABLE recuperar_senha(
	email VARCHAR(50) NOT NULL,
    ra INT NOT NULL,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE perfil(
	ra INT NOT NULL,
	nome VARCHAR(50) NOT NULL,
    email VARCHAR (50),
    descricao VARCHAR(50),
    editar_perfil VARCHAR(50),
    nascimento DATE,
    PRIMARY KEY (ra)
);

CREATE TABLE avaliacao(
	usuario VARCHAR (50),
    num DECIMAL (2,1),
    descricao VARCHAR(50)
);

