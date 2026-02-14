CREATE DATABASE Examen_U1_RICARDO_BELTRAN
USE Examen_U1_RICARDO_BELTRAN

CREATE TABLE ciudad(
PkEstado INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(50)
)

CREATE TABLE Hoteles(
PkHotel INT IDENTITY(1,1) PRIMARY KEY,
NombreHotel VARCHAR(50),
Estrellas INT,
Precio DECIMAL(12,3),
TodoIncluido INT,
FK_Estado INT FOREIGN KEY (FK_Estado) REFERENCES Ciudad(PkEstado)
)

INSERT INTO Ciudad VALUES
('Los cabos'),
('Cancun')

INSERT INTO Hoteles VALUES
('Gran Velas', 5, 2.500, 1, 1),
('Westing Regina', 4, 2.600,0,1),
('Hotel One', 5, 5.650, 1,1),
('Marriot', 3, 10.900,0,2),
('Haciendas del mar', 2, 4.500, 1, 1),
('Moon Palace', 1, 3.800,1,2),
('Royal Solaris', 3, 2.500,1,2);

SELECT * FROM Hoteles
SELECT * FROM Ciudad

--Maxmimo y minimo
SELECT MAX(Precio) AS Max_Precio, 
MIN(Precio) AS Min_Precio FROM Hoteles

--Hoteles de los cabos y que tenga todo incluido
SELECT * FROM Hoteles 
WHERE FK_Estado = 1
AND TodoIncluido = 1

--Hoteles de cancun
SELECT COUNT(*) AS HotelesCancun
FROM Hoteles
WHERE FK_Estado = 2

-- Hoteles en nombre ascendente
SELECT * FROM Hoteles
ORDER BY NombreHotel ASC

-- hoteles de 5 estrellas
SELECT * FROM Hoteles
WHERE Estrellas = 5