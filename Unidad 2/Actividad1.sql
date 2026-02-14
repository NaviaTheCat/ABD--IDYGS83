-- Crear base de datos
CREATE DATABASE ventas;
GO

USE ventas;
GO

-- =========================
-- TABLA CLIENTE
-- =========================
CREATE TABLE cliente (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido1 VARCHAR(100) NOT NULL,
    apellido2 VARCHAR(100) NULL,
    ciudad VARCHAR(100) NULL,
    categoria INT NULL
);
GO

-- =========================
-- TABLA COMERCIAL
-- =========================
CREATE TABLE comercial (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido1 VARCHAR(100) NOT NULL,
    apellido2 VARCHAR(100) NULL,
    comision FLOAT
);
GO

-- =========================
-- TABLA PEDIDO
-- =========================
CREATE TABLE pedido (
    id INT IDENTITY(1,1) PRIMARY KEY,
    total DECIMAL(10,2) NOT NULL,
    fecha DATE NULL,
    id_cliente INT NOT NULL,
    id_comercial INT NOT NULL,
    CONSTRAINT FK_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    CONSTRAINT FK_pedido_comercial FOREIGN KEY (id_comercial) REFERENCES comercial(id)
);
GO


-- =========================
-- INSERT CLIENTE
-- =========================
SET IDENTITY_INSERT cliente ON;

INSERT INTO cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES
(1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100),
(2, 'Adela', 'Salas', 'Díaz', 'Granada', 200),
(3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL),
(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300),
(5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200),
(6, 'María', 'Santana', 'Moreno', 'Cádiz', 100),
(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300),
(8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200),
(9, 'Guillermo', 'López', 'Gómez', 'Granada', 225),
(10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);

SET IDENTITY_INSERT cliente OFF;
GO

-- =========================
-- INSERT COMERCIAL
-- =========================
SET IDENTITY_INSERT comercial ON;

INSERT INTO comercial (id, nombre, apellido1, apellido2, comision) VALUES
(1, 'Daniel', 'Sáez', 'Vega', 0.15),
(2, 'Juan', 'Gómez', 'López', 0.13),
(3, 'Diego','Flores', 'Salas', 0.11),
(4, 'Marta','Herrera', 'Gil', 0.14),
(5, 'Antonio','Carretero', 'Ortega', 0.12),
(6, 'Manuel','Domínguez', 'Hernández', 0.13),
(7, 'Antonio','Vega', 'Hernández', 0.11),
(8, 'Alfredo','Ruiz', 'Flores', 0.05);

SET IDENTITY_INSERT comercial OFF;
GO

-- =========================
-- INSERT PEDIDO
-- =========================
SET IDENTITY_INSERT pedido ON;

INSERT INTO pedido (id, total, fecha, id_cliente, id_comercial) VALUES
(1, 150.50, '2017-10-05', 5, 2),
(2, 270.65, '2016-09-10', 1, 5),
(3, 65.26, '2017-10-05', 2, 1),
(4, 110.50, '2016-08-17', 8, 3),
(5, 948.50, '2017-09-10', 5, 2),
(6, 2400.60, '2016-07-27', 7, 1),
(7, 5760.00, '2015-09-10', 2, 1),
(8, 1983.43, '2017-10-10', 4, 6),
(9, 2480.40, '2016-10-10', 8, 3),
(10, 250.45, '2015-06-27', 8, 2),
(11, 75.29, '2016-08-17', 3, 7),
(12, 3045.60, '2017-04-25', 2, 1),
(13, 545.75, '2019-01-25', 6, 1),
(14, 145.82, '2017-02-02', 6, 1),
(15, 370.85, '2019-03-11', 1, 5),
(16, 2389.23, '2019-03-11', 1, 5);

SET IDENTITY_INSERT pedido OFF;
GO

SELECT * FROM pedido
SELECT * FROM cliente
SELECT * FROM comercial

SELECT * FROM pedido AS T1
INNER JOIN cliente AS T2 ON 
T1.id_cliente = T2.id
LEFT JOIN comercial AS T3 ON 
T1.id_comercial = T3.id

SELECT T1.fecha, T1.total, 
T2.nombre AS Cliente,
T3.nombre AS Vendedor 
FROM pedido AS T1
INNER JOIN cliente AS T2 ON 
T1.id_cliente = T2.id
LEFT JOIN comercial AS T3 ON 
T1.id_comercial = T3.id
WHERE T1.fecha BETWEEN '2019-01-01' AND '2019-12-31' 



SELECT SUM(T1.Total) AS Ventas2019
FROM pedido AS T1
INNER JOIN cliente AS T2 ON 
T1.id_cliente = T2.id
LEFT JOIN comercial AS T3 ON 
T1.id_comercial = T3.id
WHERE T1.fecha BETWEEN '2019-01-01' AND '2019-12-31' 



--1. Devuelve un listado con el identificador, nombre, los apellidos y la categoría 
--correspondiente de todos los clientes que han realizado algún pedido. El listado debe estar 
--ordenado alfabéticamente y se deben eliminar los elementos repetidos. 

SELECT DISTINCT T1.id, T1.nombre, T1.apellido1, T1.apellido2, T1.categoria
FROM cliente AS T1
INNER JOIN pedido AS T2 ON
T1.id = T2.id_cliente
ORDER BY T1.nombre, T1.apellido1, T1.apellido2 ASC 

--2. Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. 
--El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado 
--debe mostrar los datos de los comerciales ordenados alfabéticamente. 

SELECT T1.nombre, T1.apellido1, T1.apellido2, T2.total, T2.fecha FROM comercial AS T1
INNER JOIN pedido AS T2 
ON T1.id = T2.id_comercial
ORDER BY T1.nombre, T1.apellido1, T1.apellido2 ASC


--3. Devuelve el nombre de todos los clientes que han realizado algún pedido con el 
--comercial Daniel Sáez Vega. 

SELECT CONCAT(T1.nombre, ' ' ,T1.apellido1, ' ' ,T1.apellido2) AS Cliente, T2.total, T2.fecha,
CONCAT(T3.nombre, ' ' ,T3.apellido1, ' ' ,T3.apellido2) AS Comercial
FROM cliente AS T1
INNER JOIN pedido AS T2 
ON T1.id = T2.id_cliente
LEFT JOIN comercial AS T3
ON T3.id = T2.id_comercial
WHERE T3.id = 1

--4. Devuelve un listado que solamente muestre los clientes que no han realizado ningún 
--pedido. 

SELECT T1.nombre, T1.apellido1, T1.apellido2
FROM cliente AS T1
LEFT JOIN pedido AS T2 
ON T1.id = T2.id_cliente
WHERE T2.id_cliente IS NULL

--5. Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido. 

SELECT SUM(total) AS TotalPedido 
FROM pedido

--6. Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido. 

SELECT AVG(total) AS MediaPedido
FROM pedido

--7. Calcula el número total de comerciales distintos que aparecen en la tabla pedido.

SELECT COUNT(DISTINCT id_comercial) 
AS TotalComerciales FROM pedido

--8. Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin 
--utilizar INNER JOIN). 

SELECT * FROM pedido
WHERE id_cliente = 2
--9. Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. 
--(Sin utilizar INNER JOIN) 

SELECT COUNT(*) AS PedidosTotales 
FROM pedido WHERE id_comercial = 1

--10. Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin 
--utilizar INNER JOIN) 

SELECT * FROM cliente
WHERE id = (
    SELECT TOP 1 id_cliente
    FROM pedido
    WHERE fecha BETWEEN '2019-01-01' AND '2019-12-31'
    ORDER BY total DESC
);
