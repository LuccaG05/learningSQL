


/* 
	LUCCA GONÇALVES RA: 1976213
	LUCAS SIMÕES DA COSTA RA: 1973724
    PLINIO TENORIO DANTAS RA: 1976507
*/

CREATE SCHEMA petshop;
USE petshop;

CREATE TABLE cliente(
    cpf VARCHAR(20) NOT NULL,
    nome VARCHAR (50) NOT NULL,
    PRIMARY KEY (cpf)
);

CREATE TABLE produto(
    codigo_barras VARCHAR(50) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(5,2),
    PRIMARY KEY (codigo_barras)
);

CREATE TABLE pet(
    cpf_cliente VARCHAR(20) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    especie VARCHAR(30) NOT NULL,
    PRIMARY KEY(cpf_cliente, nome),
    FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf),
    INDEX (nome)
);

CREATE TABLE veterinario(
    crmv VARCHAR(20) NOT NULL,
    PRIMARY KEY (crmv)
);

CREATE TABLE especialidades(
	crmv_vet VARCHAR(20),
    cirurgia VARCHAR(50),
    patologia VARCHAR(50),
    anestesista VARCHAR(50),
    oncologia VARCHAR(50),
    homeopatia VARCHAR(50),
    PRIMARY KEY(crmv_vet),
    FOREIGN KEY (crmv_vet) REFERENCES veterinario(crmv)
);

CREATE TABLE consulta(
    crmv_vet VARCHAR(20) NOT NULL,
    data_hora TIMESTAMP NOT NULL,
    descricao_anamnese VARCHAR(50),
    descricao_exame VARCHAR(50),
    descricao_prescricao VARCHAR(50),
    nome_pet VARCHAR(50) NOT NULL,
    PRIMARY KEY(crmv_vet, data_hora),
    FOREIGN KEY (crmv_vet) REFERENCES veterinario(crmv),
    FOREIGN KEY (nome_pet) REFERENCES pet(nome)
);

CREATE TABLE venda(
    cpf_cliente VARCHAR(50) NOT NULL,
    forma_pagto VARCHAR(50) NOT NULL,
    valor_total DECIMAL(5,2),
    data_venda DATE NOT NULL,
    PRIMARY KEY (cpf_cliente, data_venda),
    FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf),
    INDEX (data_venda)
);

CREATE TABLE venda_produto(
    cpf_cliente VARCHAR(50) NOT NULL,
    data_venda DATE NOT NULL,
    codigo_barras_produto VARCHAR (50) NOT NULL,
    quantidade_comprada INT NOT NULL,
    PRIMARY KEY (cpf_cliente, data_venda, codigo_barras_produto),
    FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf),
    FOREIGN KEY (data_venda) REFERENCES venda(data_venda),
    FOREIGN KEY (codigo_barras_produto) REFERENCES produto(codigo_barras)
);