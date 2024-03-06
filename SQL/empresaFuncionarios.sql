CREATE TABLE funcionarios(
	numero INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cidade VARCHAR(50),
    genero CHAR(1),
    nascimento DATE,
    setor CHAR(15) NOT NULL,
    salario DECIMAL(7,2) NOT NULL, 
    PRIMARY KEY (numero)
    );
    
    INSERT INTO funcionarios
    VALUES (NULL, 'Luiz Souza', 'Marília', 'M', '1950-02-10', 'DIRETORIA', 6750.30);
    
    INSERT INTO funcionarios
    VALUES (NULL, 'Maria Silva', 'Garça', 'F', '2000-05-23', 'RECEPÇÃO', 1560.00);
    
	INSERT INTO funcionarios
    VALUES (NULL, 'Roberto Carlos', 'Pompéia', 'M', '1995-08-07', 'PRODUÇÃO', 2345.00);
    
    INSERT INTO funcionarios
    VALUES (NULL, 'Ana Alves', 'Vera Cruz', NULL, NULL, 'DIRETORIA', 8900.20);
    
	INSERT INTO funcionarios
    VALUES (NULL, 'Maria Ribeiro', 'Marília', 'F', '1952-10-14', 'PRODUÇÃO', 1890.10);
    
	INSERT INTO funcionarios
    VALUES (NULL, 'João Andrade', NULL, 'M', NULL, 'RECEPÇÃO', 1780.00);
    
	INSERT INTO funcionarios
    VALUES (NULL, 'Silvio Oliveira', 'Vera Cruz', NULL, '1965-04-12', 'VENDAS', 3460.00);
    
	INSERT INTO funcionarios
    VALUES (NULL, 'Alberto Silva', 'Pompeia', 'M', NULL, 'VEDAS', 3800.00);
    
	INSERT INTO funcionarios
    VALUES (NULL, 'Gabriela Marques', NULL, 'F', '1980-03-30', 'DIRETORIA', 5650.35);
    
	INSERT INTO funcionarios
    VALUES (NULL, 'Ivo Oliveira', 'Marília', 'M', '2003-08-09', 'ESTOQUE', 1980.20);
    
    UPDATE funcionarios
    SET setor = 'VENDAS'
    WHERE numero = 8;
    
    SELECT * FROM funcionarios;
    
    SELECT nome, salario FROM funcionarios;
    
    SELECT nome, cidade, nascimento FROM funcionarios WHERE setor = 'VENDAS';
    
    SELECT * FROM funcionarios WHERE salario < 2000.00;
    
    SELECT numero, nome FROM funcionarios WHERE setor = 'RECEPÇÃO' or setor = 'DIRETORIA';
    
    SELECT * FROM funcionarios WHERE salario > 1500 and salario < 5000;
    
    SELECT AVG(salario) FROM funcionarios;
    
    SELECT setor, AVG(salario) FROM funcionarios GROUP BY setor;
    
    SELECT SUM(salario) FROM funcionarios;
    
    SELECT SUM(salario) FROM funcionarios WHERE setor = 'PRODUÇÃO' or setor = 'ESTOQUE';
    
    SELECT setor, MAX(salario) FROM funcionarios GROUP BY setor;
    
    SELECT * FROM funcionarios WHERE nome LIKE 'a%';
    
    SELECT * FROM funcionarios ORDER BY nome;
    
    SELECT nome, cidade, salario FROM funcionarios ORDER BY salario DESC;
    
    SELECT * FROM funcionarios ORDER BY setor, nome;
    
    SELECT setor, COUNT(nome) FROM funcionarios GROUP BY setor;
    
    UPDATE funcionarios
    SET salario = salario + salario * 0.08;
    
    SELECT nome, setor FROM funcionarios WHERE nome LIKE 'Maria%';
	
    SELECT * FROM funcionarios WHERE nome LIKE '%Silva';
    
    UPDATE funcionarios
    SET setor = 'ALMOXARIFADO'
    WHERE setor = 'ESTOQUE';
    
    UPDATE funcionarios
    SET cidade = 'Gália'
    WHERE nome = 'João Andrade';
    
    DELETE FROM funcionarios
    WHERE DATEDIFF(CURDATE(), nascimento) > 70 * 365;
     
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    