CREATE DATABASE tienda 
USE tienda;

CREATE TABLE fabricante (
pkFabricante INT IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
)

CREATE TABLE Producto(
id INT IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR(100),
precio DECIMAL,
fk_fabricante INT, FOREIGN KEY(fk_fabricante) REFERENCES fabricante(pkFabricante)
)

INSERT INTO fabricante VALUES('Asus')
INSERT INTO Producto VALUES('ASUS TUF A16', 20000, 1)

INSERT INTO fabricante VALUES('Asus');
INSERT INTO fabricante VALUES('Lenovo');
INSERT INTO fabricante VALUES('Hewlett-Packard');
INSERT INTO fabricante VALUES('Samsung');
INSERT INTO fabricante VALUES('Seagate');
INSERT INTO fabricante VALUES('Crucial');
INSERT INTO fabricante VALUES('Gigabyte');
INSERT INTO fabricante VALUES('Huawei');
INSERT INTO fabricante VALUES('Xiaomi');

INSERT INTO producto VALUES('Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES('Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES('Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES('GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES('GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES('Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES('Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES('Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES('Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES('Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES('Impresora HP Laserjet Pro M26nw', 180, 3);

--1.	Lista el nombre de todos los productos que hay en la tabla producto.

SELECT nombre FROM Producto

--2.	Lista los nombres y los precios de todos los productos de la tabla producto.

SELECT nombre, precio 
FROM Producto 

--3.	Lista todas las columnas de la tabla producto.

SELECT * FROM Producto

--4.	Lista el nombre de los productos, el precio en MXN y el precio en dólares estadounidenses (USD).

SELECT Nombre,precio 
AS Precio_USD, precio * 17.45 
AS Precio_MX FROM Producto

--5.	Lista el nombre de los productos, el precio en MXN y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, mxn, dólares.

SELECT Nombre 
AS Nombre_Producto, precio
AS dolares, precio * 17.45
AS mxm FROM Producto

--6.	Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.

SELECT UPPER(nombre) 
AS Nombre_Mayuscula, 
precio FROM Producto

--7.	Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.

SELECT LOWER(nombre) 
AS Nombre_Minusculas, 
precio FROM Producto

--8.	Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.

SELECT nombre, 
UPPER(SUBSTRING(nombre, 1, 2)) 
AS Dos_Caracteres 
FROM Fabricante

--9.	Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.

SELECT nombre, ROUND(precio, 2) AS Redondeo_Valor FROM Producto

--10.	Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante ASC
--11.	Lista los nombres de los fabricantes ordenados de forma descendente.

--12.	Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.

--13.	Devuelve una lista con las 5 primeras filas de la tabla fabricante.

--14.	Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
--15.	Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
--16.	Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.
--17.	Lista el nombre de los productos que tienen un precio menor o igual a 120.
--18.	Lista el nombre de los productos que tienen un precio mayor o igual a 400.
--19.	Lista el nombre de los productos que no tienen un precio mayor o igual a 400.
--20.	Lista todos los productos que tengan un precio entre 80 y 300. Sin utilizar el operador BETWEEN.
--21.	Lista todos los productos que tengan un precio entre 60 y 200. Utilizando el operador BETWEEN.
--22.	Lista todos los productos que tengan un precio mayor que 200 y que el identificador de fabricante sea igual a 6.
--23.	Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
--24.	Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
--25.	Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
--26.	Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
--27.	Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
--28.	Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
--29.	Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
--30.	Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
--31.	Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215.
--32.	Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).



