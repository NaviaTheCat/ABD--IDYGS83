--USE ventas;
--------------------
--DECLARE 
--@FechaInicio DATE = '2019-01-01',
--@FechaFin DATE = '2019-12-31',
--@NombreCliente VARCHAR(20)

--BEGIN
--SELECT 
--    T2.nombre,
--    T2.apellido1,
--    T1.total,
--    T1.fecha,
--    T3.nombre as NombreVendedor
--    FROM pedido AS T1
--    LEFT JOIN cliente AS T2 ON T1.id_cliente = T2.id
--    LEFT JOIN comercial AS T3 ON T1.id_comercial = T3.id
--    WHERE T1.fecha BETWEEN @FechaInicio AND @FechaFin
--            OR T2.nombre = @NombreCliente
--END

CREATE PROCEDURE spObtenerVentas
--Delclaracion de variables o parametros
@FechaInicio DATE,
@FechaFin DATE,
@NombreCliente VARCHAR(20) = NULL


AS
BEGIN
SELECT 
    T2.nombre,
    T2.apellido1,
    T1.total,
    T1.fecha,
    T3.nombre as NombreVendedor
    FROM pedido AS T1
    LEFT JOIN cliente AS T2 ON T1.id_cliente = T2.id
    LEFT JOIN comercial AS T3 ON T1.id_comercial = T3.id
    WHERE T1.fecha BETWEEN @FechaInicio AND @FechaFin
            OR T2.nombre = @NombreCliente
--funcionalidad
END


--EXEC spObtenerVentas 
--@FechaInicio = '2019-01-01',
--@FechaFin = '2019-12-31',
--@NombreCliente = 'María'
SELECT * FROM cliente
EXEC spObtenerVentas '2019-01-01', '2019-12-31','María'

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


EXEC spAgregarCliente 'Arturo', 'Diaz', 'Valdez','Culiacan', 100
EXEC spActualizarCliente @idcliente = 13, @NombreCliente = Adia
EXEC spEliminarCliente @idcliente = 13