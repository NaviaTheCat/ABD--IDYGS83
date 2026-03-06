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

EXEC spAgregarCliente 'Arturo', 'Diaz', 'Valdez','Culiacan', 100
EXEC spActualizarCliente @idcliente = 13, @NombreCliente = Adia
EXEC spEliminarCliente @idcliente = 13