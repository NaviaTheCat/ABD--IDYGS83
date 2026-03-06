--USE ventas

--Argregar clientes
CREATE PROCEDURE spAgregarCliente
@NombreCliente VARCHAR(20),
@Apellido1 VARCHAR(20),
@Apellido2 VARCHAR(20),
@Ciudad VARCHAR(20),
@Categoria INT
AS
BEGIN
	INSERT INTO cliente (nombre, apellido1, apellido2, ciudad, categoria) 
	VALUES (@NombreCliente, @Apellido1, @Apellido2, @Ciudad, @Categoria)
END;

--Actualizar cliente
GO
CREATE PROCEDURE spActualizarCliente
@idcliente INT,
@NombreCliente VARCHAR(20) = NULL ,
@Apellido1 VARCHAR(20) = NULL,
@Apellido2 VARCHAR(20) = NULL,
@Ciudad VARCHAR(20) = NULL,
@Categoria INT = NULL
AS
BEGIN
	UPDATE cliente SET 
	nombre = COALESCE(@NombreCliente, nombre),
	apellido1 = COALESCE(@Apellido1, apellido1), 
	apellido2 = COALESCE(@Apellido2, apellido2),
	ciudad = COALESCE(@Ciudad, ciudad), 
	categoria = COALESCE(@Categoria, categoria)
	WHERE id = @idcliente
END;

--Eliminar cliente
GO
CREATE PROCEDURE spEliminarCliente
@idcliente INT
AS 
BEGIN
	DELETE cliente WHERE id = @idcliente
END


--Ejecutar
EXEC spAgregarCliente 'Arturo', 'Diaz', 'Valdez','Culiacan', 100
EXEC spActualizarCliente @idcliente = 14, @NombreCliente = Adrian
EXEC spEliminarCliente @idcliente = 14