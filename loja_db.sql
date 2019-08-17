CREATE TABLE tb_clientes(
id_cliente int PRIMARY KEY IDENTITY(1,1),
nome VARCHAR(60) NOT NULL,
endereco VARCHAR(120) NOT NULL,
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
detalhes VARCHAR(30) NOT NULL,
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