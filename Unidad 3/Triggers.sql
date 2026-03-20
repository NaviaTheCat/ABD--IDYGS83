CREATE DATABASE Empresa83;
USE Empresa83;

CREATE TABLE Departamento (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Presupuesto DECIMAL(12,2) NOT NULL,
    Gastos DECIMAL(12,2) NOT NULL
);
GO

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
---INSERT de ejemplo---
INSERT INTO Empleado ( NIF, Nombre, Apellido1, Apellido2, Id_Departamento) VALUES
('Y5575632D', 'Adela', 'Salas', 'Díaz', 2);

---eliminar ejemplo---
DELETE FROM Empleado WHERE Id = 6

--Insertar--
go
CREATE TRIGGER tr_empleadoInsertado
ON Empleado FOR INSERT
AS 
SET NOCOUNT ON
DECLARE @NIF VARCHAR(9)
SELECT @NIF = NIF FROM inserted
INSERT INTO Historial VALUES(
GETDATE(), @NIF, 'Registro insertado', system_user
)
go

--Actualizar--
CREATE TRIGGER tr_empleadoActualizado
ON Empleado FOR UPDATE
AS 
SET NOCOUNT ON
DECLARE @NIF VARCHAR(9)
SELECT @NIF = NIF FROM inserted 
INSERT INTO Historial VALUES(GETDATE(), @NIF, 'Registro Actualizado', system_user)
go

--Eliminar--
CREATE TRIGGER tr_empleadoEliminado
ON Empleado FOR DELETE
AS 
SET NOCOUNT ON
DECLARE @NIF VARCHAR(9)
SELECT @NIF = NIF FROM deleted
INSERT INTO Historial VALUES(GETDATE(), @NIF, 'Registro Eliminado', system_user)
go
--------------------
SELECT * FROM Empleado
SELECT * FROM Historial