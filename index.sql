CREATE DATABASE AULA0611;
USE AULA0611;
CREATE TABLE PEDIDOS(
VENDA_ID INT PRIMARY KEY,
PRODUTO VARCHAR(30),
QUANTIDADE INT,
PRECO_UNIT DECIMAL(10,2));

INSERT INTO PEDIDOS (VENDA_ID,PRODUTO,QUANTIDADE,PRECO_UNIT) VALUES 
(1, "PRODUTO A",5,10),
(2, "PRODUTO B",3,20),
(3, "PRODUTO A",2,10),
(4, "PRODUTO C",7,15),
(5, "PRODUTO B",4,20),
(6, "PRODUTO A",3,10);

-- 1: Calcule o valor total de vendas considerando a quantidade vendida e o preço unitário de cada produto.
SELECT SUM(QUANTIDADE*PRECO_UNIT) AS VENDA_TOTAL FROM PEDIDOS;

-- 2: Determine a média dos preços unitários de todos os produtos.
SELECT ROUND(AVG(PRECO_UNIT),2) AS MEDIA_DE_PRECOS FROM PEDIDOS;

-- 3: Liste o nome de cada produto e o valor total obtido com suas vendas, considerando a quantidade e o preço unitário.
SELECT PRODUTO,SUM(QUANTIDADE*PRECO_UNIT) AS VALOR_TOTAL FROM PEDIDOS
GROUP BY PRODUTO;

--  4: Encontre o nome do produto que foi mais vendido, ou seja, tem a maior quantidade total vendida.
SELECT PRODUTO FROM PEDIDOS
GROUP BY PRODUTO
HAVING MAX(QUANTIDADE)
LIMIT 1;
-- LIMIT: Limita a quantidade de resultados.

-- OUTRA FORMA DE CONSULTA:
SELECT PRODUTO
FROM PEDIDOS
GROUP BY PRODUTO
ORDER BY SUM(QUANTIDADE) DESC
LIMIT 1;

-- 5: Calcule o valor médio das vendas para cada produto.
SELECT PRODUTO, ROUND(AVG(QUANTIDADE*PRECO_UNIT),2) AS VALOR_MEDIO 
FROM PEDIDOS
GROUP BY PRODUTO;

-- 6: Conte quantos produtos diferentes foram vendidos.
SELECT COUNT(DISTINCT PRODUTO) AS QTD_PRODUTOS FROM PEDIDOS;
-- DISTINCT: Elimina dados duplicados da consulta

-- 7: Encontre o nome do produto que possui o preço unitário mais alto.
SELECT PRODUTO FROM PEDIDOS
ORDER BY PRECO_UNIT DESC LIMIT 1;

-- 8: Liste o nome de cada produto e o valor total obtido com suas vendas, 
-- considerando a quantidade e o preço unitário, mas apenas para produtos vendidos 
-- em quantidades maiores ou iguais a 4.
SELECT PRODUTO,SUM(QUANTIDADE*PRECO_UNIT) AS VALOR_TOTAL FROM PEDIDOS
WHERE QUANTIDADE >= 4
GROUP BY PRODUTO;


-- 9: Calcule a média dos preços unitários dos produtos para cada produto.
SELECT PRODUTO,ROUND(AVG(PRECO_UNIT),2) AS MEDIA_PRECO FROM PEDIDOS
GROUP BY PRODUTO;


-- 10: Liste o nome de cada produto e o valor total obtido com suas vendas, 
-- considerando a quantidade e o preço unitário, mas apenas para produtos com 
-- preço unitário médio acima de 12.00.

SELECT PRODUTO, SUM(QUANTIDADE*PRECO_UNIT) AS VALOR_TOTAL
FROM PEDIDOS
GROUP BY PRODUTO
HAVING AVG(PRECO_UNIT) > 12.00;

