USE IDYGS83

CREATE TABLE ALUMNOS(
PkAlumno INT identity(1,1) PRIMARY KEY,
Nombre VARCHAR(25),
Apellido VARCHAR(50),
Edad INT,
Matricula VARCHAR(20),
Estatus BIT,
Ciudad VARCHAR(20),
Genero VARCHAR(1),
Telefono VARCHAR(10),
FechaNacimiento DATE
)

SELECT * FROM ALUMNOS
--SELECT QUE COLUMNAS QUIERES MOSTRAR
--FROM QUE TABLA MOSTRARAS
-- QUE CONDICION PARA FILMAR

SELECT Nombre, Apellido, Genero, Edad, Ciudad
FROM ALUMNOS 
WHERE Genero = 'M' AND Edad >= 21

SELECT Nombre, Apellido, Genero, Edad, Ciudad
FROM ALUMNOS 
WHERE Ciudad = 'Cancun' or Ciudad = 'Cancún'

SELECT Nombre + ''+ Apellido + '@gmail.com' as Correo, Edad
FROM ALUMNOS

SELECT Matricula + '@utcancun.edu.mx' as Correo, Edad
FROM ALUMNOS

SELECT DISTINCT Ciudad FROM ALUMNOS 

SELECT * FROM ALUMNOS ORDER BY Apellido ASC -- ASC Acendente y DESC Decendente

SELECT Nombre, Matricula FROM ALUMNOS

SELECT * FROM ALUMNOS 
WHERE Ciudad = 'Cancun' AND Edad = 21

SELECT * FROM ALUMNOS 
WHERE NOT Ciudad = 'Cancun'

UPDATE ALUMNOS SET Estatus = NULL
WHERE PkAlumno = 1

SELECT * FROM ALUMNOS
WHERE Estatus IS NOT NULL

DELETE FROM ALUMNOS
WHERE PkAlumno = 28

SELECT TOP(5) * FROM ALUMNOS

SELECT MAX(Edad) As Maximo FROM ALUMNOS
SELECT Min(Edad) As Minimo FROM ALUMNOS

SELECT COUNT(*) AS Total FROM ALUMNOS
WHERE Genero = 'M'

SELECT SUM(Edad) FROM ALUMNOS 
WHERE PkAlumno = 1

SELECT * FROM ALUMNOS 
WHERE Nombre LIKE 'D%A' -- %m empieza y m% Termina, D%A Ambas letras

-- -- -- -- -- -- -- -- -- -- 

SELECT Nombre, Apellido FROM ALUMNOS 
WHERE Edad = 20;

SELECT Nombre, Apellido,
CONCAT(Matricula, '@utcancun.edu.mx') 
AS Correo FROM ALUMNOS 

UPDATE ALUMNOS SET Estatus = 0 
WHERE Genero = 'F'