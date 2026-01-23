CREATE DATABASE Empresa83;
USE Empresa83;


-- =========================
-- Tabla: Departamento
-- =========================
CREATE TABLE Departamento (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Presupuesto DECIMAL(12,2) NOT NULL,
    Gastos DECIMAL(12,2) NOT NULL
);
GO

-- =========================
-- Tabla: Empleado
-- =========================
CREATE TABLE Empleado (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    NIF VARCHAR(9) NOT NULL UNIQUE,
    Nombre VARCHAR(100) NOT NULL,
    Apellido1 VARCHAR(100) NOT NULL,
    Apellido2 VARCHAR(100) NULL,
    Id_Departamento INT NULL,
    CONSTRAINT FK_Empleado_Departamento
        FOREIGN KEY (Id_Departamento)
        REFERENCES Departamento(Id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);
GO

-- =========================
-- Datos: Departamento
-- =========================
SET IDENTITY_INSERT Departamento ON;

INSERT INTO Departamento (Id, Nombre, Presupuesto, Gastos) VALUES
(1, 'Desarrollo', 120000, 6000),
(2, 'Sistemas', 150000, 21000),
(3, 'Recursos Humanos', 280000, 25000),
(4, 'Contabilidad', 110000, 3000),
(5, 'I+D', 375000, 380000),
(6, 'Proyectos', 0, 0),
(7, 'Publicidad', 0, 1000);

SET IDENTITY_INSERT Departamento OFF;
GO
SET IDENTITY_INSERT Empleado ON;


-- =========================
-- Datos: Empleado
-- =========================
SET IDENTITY_INSERT Empleado ON;

INSERT INTO Empleado (Id, NIF, Nombre, Apellido1, Apellido2, Id_Departamento) VALUES
(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1),
(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2),
(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3),
(4, '77705545E', 'Adrián', 'Suárez', NULL, 4),
(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5),
(6, '38382980M', 'María', 'Santana', 'Moreno', 1),
(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2),
(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3),
(9, '56399183D', 'Juan', 'Gómez', 'López', 2),
(10, '46384486H', 'Diego', 'Flores', 'Salas', 5),
(11, '67389283A', 'Marta', 'Herrera', 'Gil', 1),
(12, '41234836R', 'Irene', 'Salas', 'Flores', NULL),
(13, '82635162B', 'Juan Antonio', 'Sáez', 'Guerrero', NULL);

SET IDENTITY_INSERT Empleado OFF;
GO

SELECT * FROM Empleado
SELECT * FROM Departamento


-- RICARDO BELTRAN CETINA --
SELECT Nombre, Presupuesto 
FROM Departamento 

-- RICARDO BELTRAN CETINA --
SELECT NIF, Nombre, Apellido1 
FROM Empleado 

-- RICARDO BELTRAN CETINA --
SELECT Nombre, Apellido1, Apellido2 
FROM Empleado WHERE Id_Departamento = 2

-- RICARDO BELTRAN CETINA --
SELECT TOP(3) * FROM Empleado
WHERE Nombre LIKE 'a%'

-- RICARDO BELTRAN CETINA --
SELECT Nombre, Gastos FROM Departamento 
ORDER BY Gastos DESC 

-- RICARDO BELTRAN CETINA --
SELECT CONCAT(Nombre, ' ', Apellido1, ' ', ISNULL(Apellido2, ''))
AS Nombre_Completo FROM Empleado 

SELECT CONCAT_WS(' ', Nombre, Apellido1, ISNULL(Apellido2, ''))
AS Nombre_Completo FROM Empleado

-- RICARDO BELTRAN CETINA --
SELECT * FROM Departamento 
WHERE Presupuesto >= 100000 

-- RICARDO BELTRAN CETINA --
SELECT COUNT(Id) AS Total_Empleado 
FROM Empleado

-- RICARDO BELTRAN CETINA --
SELECT d.Nombre, COUNT(e.id) AS Empleados 
FROM Empleado e
INNER JOIN Departamento d 
ON d.Id = e.Id_Departamento
GROUP BY d.Nombre

-- RICARDO BELTRAN CETINA --
DELETE FROM Empleado
WHERE Apellido2 IS NULL