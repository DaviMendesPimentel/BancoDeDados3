USE MASTER
GO

DROP DATABASE empresa_db
GO

CREATE DATABASE empresa_db
GO

USE empresa_db
GO

CREATE TABLE tb_clientes(
id_cliente int PRIMARY KEY IDENTITY(1,1),
nome VARCHAR(60) NOT NULL,
endereco VARCHAR(255) NOT NULL,
idade INT NOT NULL,
sexo CHAR(1) NOT NULL,
fone VARCHAR(15),
email VARCHAR(70)
)
GO

CREATE TABLE tb_vendas(
id_venda INT PRIMARY KEY IDENTITY(1,1),
id_cliente INT NOT NULL FOREIGN KEY REFERENCES tb_clientes(id_cliente),
data date NOT NULL,
desconto DECIMAL(2,2),
)
GO

 

CREATE TABLE tb_produtos(
id_produto INT PRIMARY KEY IDENTITY(1,1),
nome VARCHAR(30) NOT NULL,
detalhes VARCHAR(255) NOT NULL,
data date NOT NULL,
desconto DECIMAL(2,2)
)
GO

CREATE TABLE tb_itens_vendidos(
id_item_vendido INT PRIMARY KEY IDENTITY(1,1),
id_venda INT NOT NULL FOREIGN KEY REFERENCES tb_vendas(id_venda),
id_produto INT NOT NULL FOREIGN KEY REFERENCES tb_produtos(id_produto),
)
GO

CREATE TABLE tb_vendas_canceladas(
id_vendas_canceladas INT PRIMARY KEY IDENTITY(1,1),
id_item_vendido INT NOT NULL FOREIGN KEY REFERENCES tb_itens_vendidos(id_item_vendido)
)
GO



-----------------------------------------------------------------------------------------------------------------------------
------------------------------- INSERÇÃO DE VALORES -------------------------------------------------------------------------
/*USE empresa_db
GO

TRUNCATE TABLE tb_vendas_canceladas
GO

TRUNCATE TABLE tb_itens_vendidos
GO

TRUNCATE TABLE tb_produtos
GO

TRUNCATE TABLE tb_vendas
GO

TRUNCATE TABLE tb_clientes
GO*/


INSERT INTO tb_clientes(nome, endereco, idade, sexo) VALUES ('Jailson', 'Tv Vitória Silva Santos', 44, 'M')
GO

INSERT INTO tb_vendas(id_cliente, data) VALUES(1, '2019-09-12')
GO

INSERT INTO tb_produtos(nome, detalhes, data) VALUES('JAV', 'Distintas utilizacoes robotica/motora', '2019-08-14')
GO

INSERT INTO tb_itens_vendidos(id_venda, id_produto) VALUES(1, 1)
GO

INSERT INTO tb_vendas_canceladas(id_item_vendido) VALUES(1)
GO

INSERT INTO tb_clientes(nome, endereco, idade, sexo) VALUES ('Davi', 'Tv Vitória Silva Santos', 18, 'M')
GO

INSERT INTO tb_vendas(id_cliente, data) VALUES(2, '2019-09-12')
GO

INSERT INTO tb_produtos(nome, detalhes, data) VALUES('Processador GeinuineIntel', 'processador Intel última G', '2019-08-14')
GO

INSERT INTO tb_itens_vendidos(id_venda, id_produto) VALUES(2, 2)
GO

INSERT INTO tb_vendas_canceladas(id_item_vendido) VALUES(2)
GO

INSERT INTO tb_clientes(nome, endereco, idade, sexo) VALUES ('José', 'Tv Vitória Silva Santos', 56, 'M')
GO

INSERT INTO tb_produtos(nome, detalhes, data) VALUES('Matrix 32x32', 'matriz utilizada em arduino', '2019-08-14')
GO

-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM tb_clientes as tb_c
LEFT JOIN tb_vendas ON tb_c.id_cliente = tb_vendas.id_cliente WHERE tb_vendas.id_cliente IS NOT NULL
GO

SELECT *
FROM tb_clientes as tb_c
LEFT JOIN tb_vendas ON tb_c.id_cliente = tb_vendas.id_cliente WHERE tb_vendas.id_cliente IS NULL
GO

SELECT *
FROM tb_produtos as tb_p
LEFT JOIN tb_itens_vendidos ON tb_p.id_produto = tb_itens_vendidos.id_produto WHERE tb_itens_vendidos.id_produto IS NULL
GO

CREATE TRIGGER trigger_uc_client
ON tb_clientes
FOR INSERT, UPDATE
AS
BEGIN
	SELECT * FROM tb_clientes
END

UPDATE tb_clientes SET email = NULL WHERE id_cliente <> 0
GO

