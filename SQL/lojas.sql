CREATE SCHEMA minifudi;
USE minifudi;

CREATE TABLE loja(
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(50),
    telefone VARCHAR(20),
    tipo VARCHAR(20),
    data_inicio DATE,
    avaliacao DECIMAL(3,1),
    latitude FLOAT,
    longitude FLOAT,
    PRIMARY KEY (id)
);

CREATE TABLE item (
	codigo INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255),
    total_pedidos INT,
    preco DECIMAL(5,2),
    id_loja INT,
    PRIMARY KEY(codigo),
    FOREIGN KEY (id_loja) REFERENCES loja (id)
	ON DELETE SET NULL
	ON UPDATE SET NULL
);

CREATE TABLE clientes(
	cpf VARCHAR(30) NOT NULL,
    nome VARCHAR(45) NOT NULL,
    endereco VARCHAR(100),
    email VARCHAR(60),
    celular VARCHAR(20),
    senha VARCHAR(32),
    PRIMARY KEY (cpf)
);



INSERT INTO loja (nome, tipo, data_inicio, avaliacao)
VALUES ('Iron Burguer', 'HAMBURGUERIA', '2022-11-12', 9.4);

INSERT INTO loja (nome, tipo, data_inicio, avaliacao)
VALUES ('Bondoce', 'DOCERIA', '2019-04-05', 8.4);

INSERT INTO loja (nome, tipo, data_inicio, avaliacao)
VALUES ('Água Limpa', 'RESTAURANTE', '2018-09-25', 9.9);

INSERT INTO loja (nome, tipo, data_inicio, avaliacao)
VALUES ('Toscana', 'PIZZARIA', '2015-08-04', 10.0);

INSERT INTO loja (nome, tipo, data_inicio, avaliacao)
VALUES ('Coquinho', 'BOTECO', '2002-01-15', 6.0);

UPDATE loja
SET tipo = 'BAR'
WHERE tipo = 'BOTECO';

SELECT * FROM loja;

/*RESTRICT só apaga o pai se nao houver filhos - CASCADE apaga mesmo tendo filho e apaga os filhos juntos - SET NULL apaga o pai e deixa os filhos*/
INSERT INTO item (nome, id_loja) 
VALUES ('Pizza Strogonoff', 4);

INSERT INTO item (nome, id_loja) 
VALUES ('Pizza Calabresa', 4);

INSERT INTO item (nome, id_loja)
VALUES ('Smash Bacon', 1);

INSERT INTO item (nome, id_loja)
VALUES ('Cone Ninho', 2);

INSERT INTO item (nome, id_loja)
VALUES ('Marmita P', 3);

INSERT INTO item (nome, id_loja)
VALUES ('Dose 51', 5);

SELECT * FROM item;

/*produto cartesiano das duas tabelas*/
SELECT * FROM loja, item;

/*	consulta com relacionamento usando INNER JOIN
	trazemos as lojas junto dos seus respectivos itens*/
SELECT * FROM loja INNER JOIN item ON item.id_loja = loja.id;

/*	Agora trazemos  todos os itens junto dos dados da sua respectiva loja*/
SELECT * FROM item INNER JOIN loja ON item.id_loja = loja.id;

DELETE FROM item WHERE codigo = 5;

INSERT INTO clientes
VALUES ('123.456.789-01', 'Lucca Goncalves', 'Av arapongas', 'lucca@gmail.com', '99123-4567', MD5('senha123'));

INSERT INTO clientes
VALUES ('589.456.789-01', 'Gorduro', 'Av 10', 'goradao@hotmail.com', '99123-8521', MD5('123654'));

INSERT INTO clientes
VALUES ('749.456.789-01', 'Tivo Vargas', 'Av 98', 'tivo@outlook.com', '98574-4567', MD5('1598753'));

INSERT INTO clientes
VALUES ('987.654.321-02', 'Plinio Neto', 'Rua 10', 'plinio@gmail.com', '99123-8947', MD5('456senha'));

INSERT INTO clientes
VALUES ('456.987.321-03', 'Lucas Costa', 'Av 22', 'lk@gmail.com', '99123-3698', MD5('lkthesenha'));

CREATE TABLE pedido(
cpf_cliente VARCHAR(30) NOT NULL,
data_hora TIMESTAMP NOT NULL,
forma_pagto VARCHAR(20),
pago BOOLEAN,
id_loja INT NOT NULL,
PRIMARY KEY (cpf_cliente, data_hora),
/*foreign key (nome_do_campo_chave_estrangeira) REFERENCES  nome_tabela_pai (campo_tabela_pai)*/
FOREIGN KEY (cpf_cliente) REFERENCES clientes (cpf),
FOREIGN KEY (id_loja) REFERENCES loja (id)
);


INSERT INTO pedido
VALUES ('123.456.789-01', '2023-10-31 20:18:12', 'CARTAO', false, 1);

INSERT INTO pedido
VALUES ('456.987.321-03', '2023-10-31 20:18:12', 'PIX', true, 2);

INSERT INTO pedido
VALUES ('987.654.321-02', '2023-10-04 20:18:12', 'PIX', true, 3);

INSERT INTO pedido
VALUES ('987.654.321-02', NOW(), 'PIX', true, 4);

INSERT INTO pedido
VALUES ('123.456.789-01', NOW(), 'CARTAO', true, 5);

INSERT INTO pedido
VALUES ('456.987.321-03', NOW(), 'DINHEIRO', false, 5);


SELECT * FROM pedido INNER JOIN clientes ON pedido.cpf_cliente = clientes.cpf;
SELECT * FROM pedido INNER JOIN loja ON pedido.id_loja = loja.id;
SELECT pedido.cpf_cliente, pedido.data_hora, pedido.forma_pagto, loja.nome FROM pedido INNER JOIN loja ON pedido.id_loja = loja.id;

SELECT * FROM pedido;
SELECT * FROM pedido INNER JOIN clientes ON pedido.cpf_cliente = clientes.cpf WHERE clientes.cpf = '123.456.789-01';

/*ex 4*/
SELECT * FROM pedido WHERE cpf_cliente = '123.456.789-01';

/*ex 5*/
SELECT * FROM pedido WHERE pago = false;

/*ex 6*/
SELECT * FROM clientes WHERE email LIKE '%@gmail%';

/*ex 7*/
SELECT * FROM clientes WHERE senha = MD5('senha123');

/*ex 8*/
SELECT * FROM item INNER JOIN loja ON item.id_loja = loja.id; 
SELECT item.nome, loja.nome FROM item INNER JOIN loja ON item.id_loja = loja.id; 

/*ex 9*/
SELECT * FROM pedido INNER JOIN loja ON pedido.id_loja = loja.id;
SELECT p.cpf_cliente, p.forma_pagto, l.nome FROM pedido p INNER JOIN loja l ON p.id_loja = l.id;

/*ex 10*/
SELECT * FROM clientes c INNER JOIN pedido p ON c.cpf = p.cpf_cliente;

SELECT c.cpf, c.nome AS cliente, p.data_hora, p.forma_pagto, l.nome AS loja FROM clientes c
INNER JOIN pedido p ON p.cpf_cliente = c.cpf
INNER JOIN loja l ON p.id_loja = l.id;

/*ex 11*/
SELECT p.data_hora, p.forma_pagto, p.pago, c.nome, c.email FROM pedido p INNER JOIN clientes c ON c.cpf = p.cpf_cliente;

/*ex 12*/
SELECT p.*, l.nome, l.avaliacao FROM pedido p INNER JOIN loja l ON l.id = p.id_loja WHERE nome = 'Coquinho' ORDER BY p.data_hora;

/*ex 13*/
SELECT p.* FROM pedido p WHERE p.data_hora < "2023-11-01 21:00";

/*ex 14*/
SELECT forma_pagto, COUNT(*) FROM pedido GROUP BY forma_pagto;
SELECT cpf_cliente, COUNT(*) FROM pedido GROUP BY cpf_cliente;
SELECT pago, COUNT(*) FROM pedido GROUP BY pago;
SELECT cpf_cliente, COUNT(*) FROM pedido GROUP BY cpf_cliente HAVING COUNT(*) >= 2;

/*ex 15*/
UPDATE clientes
SET endereco = "Rua Brasil"
WHERE nome = "Gorduro";

/*RELACIONAMeNTO N:N (entre pedido e item)*/ 
CREATE TABLE pedido_item(
	cpf_pedido VARCHAR(15) NOT NULL,
    data_hora_pedido TIMESTAMP NOT NULL,
    codigo_item INT NOT NULL,
    quantidade INT,
    preco_unitario DECIMAL(5,2),
    PRIMARY KEY (cpf_pedido, data_hora_pedido, codigo_item),
    FOREIGN KEY (cpf_pedido, data_hora_pedido) REFERENCES pedido (cpf_cliente, data_hora),
    FOREIGN KEY (codigo_item) REFERENCES item (codigo)
);

SELECT * FROM pedido_item;

INSERT INTO pedido_item VALUES ('123.456.789-01', "2023-10-31 20:18:12", 1, 2, 18.90)
















