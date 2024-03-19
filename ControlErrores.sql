BEGIN TRY
DECLARE @DIVISOR INT, @DIVIDENDO INT, @RESULTADO DECIMAL (10,2)
SET @DIVIDENDO = 100
SET @DIVISOR = 10
SET @RESULTADO = @DIVIDENDO/@DIVISOR
PRINT 'NO HAY ERROR'
END TRY
BEGIN CATCH
PRINT 'SE HA PRODUCIDO UN ERROR'
END CATCH;
GO

DECLARE @divisor   int , 
 	 @dividendo int , 
   	 @resultado int

SET @dividendo = 100
SET @divisor = 0
-- Esta linea provoca un error de division por 0
SET @resultado = @dividendo/@divisor
PRINT 'Controlando el error ...'
-- Esta linea establece @@ERROR a cero
IF @@ERROR = 0 
     BEGIN
    -- Se ejecuta esta parte!
    PRINT 'No hay error'
END
 ELSE
     BEGIN
    PRINT 'Hay error'
END
GO

SELECT m.message_id, m.severity, m.is_event_logged, m.[text]
FROM sys.messages m
    INNER JOIN sys.syslanguages l ON m.language_id = l.msglangid
WHERE l.alias = 'Spanish'
ORDER BY m.severity DESC, m.[text]
GO


-- primero se debe crear el mensaje en ingles antes que español
EXEC sp_addmessage 
50003,
14,
N'No tiene permisos en la tabla actual %1! contacte al administrador de base de datos.', 'Spanish'
GO

SET LANGUAGE us_english;
RAISERROR (50003, 14, 1, N'dbo.DEMO_ROLES')

-- Español
SET LANGUAGE Español;
RAISERROR (50003, 14, 1, N'dbo.DEMO_ROLES')

-- Elabore una consulta que arroje un error definido por el usuario al intentar crear una tabla en una base de datos siendo que ésta ya existe.  No se deben desplegar errores del sistema

BEGIN TRY
CREATE TABLE Person.Person
(
    BusinessEntityID INT PRIMARY KEY,
    PersonType NVARCHAR(2)
)
END TRY
BEGIN CATCH
    PRINT 'Error: La tabla ya existe'
END CATCH
GO

-- Crea dos ejemplos de mensajes de error
-- 1. Un mensaje de error que indique que el usuario no tiene permisos para ejecutar una consulta
-- 2. Un mensaje de error que indique que el usuario no tiene permisos para crear una tabla

EXEC sp_addmessage
    @msgnum = 50004,
    @severity = 14,
    @msgtext = N'You do not have permission to execute the query', 
    @lang = 'us_english'
GO

EXEC sp_addmessage
    @msgnum = 50004,
    @severity = 14,
    @msgtext = N'No tiene permisos para ejecutar la consulta', 
    @lang = 'Spanish'
GO

EXEC sp_addmessage
    @msgnum = 50005,
    @severity = 14,
    @msgtext = N'You do not have permission to create the table', 
    @lang = 'us_english'
GO

EXEC sp_addmessage
    @msgnum = 50005,
    @severity = 14,
    @msgtext = N'No tiene permisos para crear la tabla', 
    @lang = 'Spanish'
GO

-- Elabore un ejemplo de uso de la función ERROR_MESSAGE() para desplegar el mensaje de error que se generó en el ejemplo anterior

BEGIN TRY
    CREATE TABLE Person.Person
(
    BusinessEntityID INT PRIMARY KEY,
    PersonType NVARCHAR(2)
)
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
GO

-- Elabore un ejemplo de uso de la función ERROR_NUMBER() para desplegar el número de error que se generó en el ejemplo anterior

BEGIN TRY
    CREATE TABLE Person.Person
(
    BusinessEntityID INT PRIMARY
        KEY,
    PersonType NVARCHAR(2)
)
END TRY
BEGIN CATCH
    PRINT ERROR_NUMBER()
END CATCH
GO

-- Elabore un ejemplo de uso de la función ERROR_SEVERITY() para desplegar el nivel de severidad del error que se generó en el ejemplo anterior

BEGIN TRY
    CREATE TABLE Person.Person
(
    BusinessEntityID INT PRIMARY
        KEY,
    PersonType NVARCHAR(2)
)
END TRY
BEGIN CATCH
    PRINT ERROR_SEVERITY()
END CATCH
GO

-- Elabore un ejemplo de uso de la función ERROR_STATE() para desplegar el estado del error que se generó en el ejemplo anterior

BEGIN TRY
    CREATE TABLE Person.Person
(
    BusinessEntityID INT PRIMARY
        KEY,
    PersonType NVARCHAR(2)
)
END TRY
BEGIN CATCH
    PRINT ERROR_STATE()
END CATCH
GO

-- elabore de control de errores usando try catch crea una condiciones sobre edades

BEGIN TRY
    DECLARE @edad INT
    SET @edad = 15
    IF @edad < 18
        RAISERROR('No se permite el acceso a menores de edad', 16, 1)
    ELSE
        PRINT 'Bienvenido'
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
GO

-- Contro de errores usando try catch crea una condicion sobre la division de dos numeros y imrpime resultado

BEGIN TRY
    DECLARE @dividendo INT, @divisor INT, @resultado DECIMAL(10,2)
    SET @dividendo = 100
    SET @divisor = 2
    SET @resultado = @dividendo/@divisor
    PRINT 'El resultado es: ' + CAST(@resultado AS NVARCHAR)
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
GO

-- control de errores usando try catch crea una condicion sobre si el numero es impar o par y muestra el resultado

BEGIN TRY
    DECLARE @numero INT
    SET @numero = 5
    IF @numero % 2 = 0
        PRINT 'El número es par'
    ELSE
        RAISERROR('El número es impar', 16, 1)
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
GO

-- Control de errores sobre diferencia en tipo de datos en una consulta

BEGIN TRY
    SELECT 'Hola' + 5
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
GO

-- inventa dos tipos de control de errores con condiciones que tu quieras que no hayamos creado antes

-- 1. Control de errores para verificar si una tabla existe
DECLARE @divisor INT = 0
BEGIN TRY
    IF @divisor = 0
        THROW 50000, 'Error: División por cero no está permitida.', 1
    PRINT 10 / @divisor
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH

-- 2. Control de errores para verificar si un valor es nulo
DECLARE @valor INT = NULL
BEGIN TRY
    IF @valor IS NULL
        THROW 50000, 'Error: El valor es nulo y no puede ser utilizado en esta operación.', 1
    PRINT @valor + 1
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH