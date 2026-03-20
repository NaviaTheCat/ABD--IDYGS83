CREATE DATABASE Usuarios 
USE Usuarios

CREATE TABLE Usuarios(
PkUsuario INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(50),
Apellido VARCHAR(50),
Correo VARCHAR(50),
Edad INT
)

CREATE LOGIN Navia WITH PASSWORD = 'Universal.25';
CREATE LOGIN Administrador WITH PASSWORD = '46ApplePizzaOrangeBike#';

CREATE USER UNavia FOR LOGIN Navia;
CREATE USER UAdministrador FOR LOGIN Administrador;

GRANT SELECT, INSERT
ON Usuarios TO
UNavia;

GRANT SELECT, INSERT, UPDATE, DELETE
ON Usuarios TO UAdministrador

EXECUTE AS USER = 'UNavia';
UPDATE Usuarios SET Nombre = 'Ric'
REVERT

EXECUTE AS USER = 'UAdministrador';
UPDATE Usuarios SET Nombre = 'Ric'
WHERE PkUsuario = 1

SELECT IS_SRVROLEMEMBER('sysadmin') AS EsSysadmin;

SELECT * FROM Usuarios