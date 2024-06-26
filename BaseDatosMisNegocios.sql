CREATE DATABASE MisNegocios
GO
USE MisNegocios
GO
CREATE SCHEMA VENTA
go
CREATE SCHEMA COMPRA
go
CREATE SCHEMA RRHH
go
----------------------------------------------------
CREATE TABLE VENTA.PAISES
(
    IdPais INTEGER NOT NULL,
    NombrePais varchar(40) not null,
    primary key (IdPais)
)
----------------------------------------------------
CREATE TABLE COMPRA.CATEGORIAS
(
    IdCategoria Int NOT NULL,
    NombreCategoria VARCHAR(40) NOT NULL,
    Descripcion text null,
    PRIMARY KEY(IdCategoria)
);
-----------------------------------------------------
CREATE TABLE VENTA.CLIENTES
(
    IdCliente Int NOT NULL,
    NombreCliente VARCHAR(40) NOT NULL,
    DirCliente VARCHAR(80) NULL,
    IdPais Int NOT NULL,
    fonoCliente VARCHAR(15) NOT NULL,
    PRIMARY KEY(IdCliente)
)
-----------------------------------------------------
CREATE TABLE COMPRA.PROVEEDORES
(
    IdProveedor Int NOT NULL,
    NombreProveedor VARCHAR(40) NOT NULL,
    DirProveedor VARCHAR(80) NULL,
    nomContacto VARCHAR(80) NULL,
    cargoContacto VARCHAR(50) NULL,
    IdPais Int NOT NULL,
    fonoProveedor VARCHAR(15) NOT NULL,
    faxProveedor VARCHAR(15) NOT NULL,
    PRIMARY KEY(IdProveedor),
    FOREIGN KEY (IdPais) REFERENCES VENTA.PAISES(IdPais)
)
------------------------------------------------------
CREATE TABLE COMPRA.PRODUCTOS
(
    IdProducto Int NOT NULL,
    nomProducto VARCHAR(80) NOT NULL,
    idProveedor Int NOT NULL,
    idCategoria Int NOT NULL,
    cantxUnidad SMALLINT NOT NULL,
    precioUnidad DECIMAL(10, 2) NOT NULL,
    UniEnExistencia SMALLINT NOT NULL,
    UniEnPedido SMALLINT NOT NULL,
    PRIMARY KEY(IdProducto),
    FOREIGN KEY (idProveedor) REFERENCES COMPRA.PROVEEDORES(idProveedor)
)
-----------------------------------------------------------------------
CREATE TABLE RRHH.CARGOS
(
    IdCargo INTEGER NOT NULL,
    desCargo varchar(30) not null,
    primary key (IdCargo)
)
------------------------------------------
CREATE TABLE RRHH.DISTRITOS
(
    IdDistrito INTEGER NOT NULL,
    NombreDistrito varchar(50) not null,
    primary key (IdDistrito)
)
------------------------------------------
CREATE TABLE RRHH.EMPLEADOS
(
    IdEmpleado Int NOT NULL,
    Tratamiento varchar(20) NULL,
    NombreEmpleado VARCHAR(40) NOT NULL,
    apeEmpleado VARCHAR(40) NOT NULL,
    fecNac DATE NOT NULL,
    dirEmpleado VARCHAR(100) NOT NULL,
    IdDistrito Int NOT NULL,
    fonoEmpleado VARCHAR(15) NULL,
    idCargo Int NOT NULL,
    fecCantrata DATE NOT NULL,
    fotoEmpleado IMAGE NULL,
    PRIMARY KEY(IdEmpleado),
    FOREIGN KEY (IdDistrito) REFERENCES RRHH.DISTRITOS(IdDistrito),
    FOREIGN KEY (idCargo) REFERENCES RRHH.CARGOS (IdCargo),
)
----------------------------------------------------------------
CREATE TABLE VENTA.PEDIDOSCABE
(
    IdPedido Int NOT NULL,
    IdCliente Int NOT NULL,
    idEmpleado Int NOT NULL,
    fecPedido DATE NOT NULL,
    fecEntrega DATE NOT NULL,
    fecEnvio DATE NOT NULL,
    envioPedido VARCHAR(15) NOT NULL,
    destinatario VARCHAR(50) NOT NULL,
    dirdestinatario VARCHAR(100) NOT NULL,
    PRIMARY KEY(IdPedido),
    FOREIGN KEY (IdCliente) REFERENCES VENTA.CLIENTES(IdCliente),
    FOREIGN KEY (idEmpleado) REFERENCES RRHH.EMPLEADOS (IdEmpleado),
)
--------------------------------------------------------------------
CREATE TABLE COMPRA.PEDIDOSDETA
(
    IdPedido Int NOT NULL,
    IdProducto Int NOT NULL,
    precioUnidad DECIMAL(10, 2) NOT NULL,
    Cantidad SMALLINT NOT NULL,
    Descuento DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (IdPedido) REFERENCES VENTA.PEDIDOSCABE(IdPedido),
    FOREIGN KEY (IdProducto) REFERENCES COMPRA.PRODUCTOS (IdProducto),
)
-------------------------------------------------------------------
INSERT INTO VENTA.PAISES
    (IDpais, NOMBREpais)
VALUES
    (1, 'Colombia')
INSERT INTO VENTA.PAISES
    (IDpais, NOMBREpais)
VALUES
    (2, 'Venezuela')
INSERT INTO VENTA.PAISES
    (IDpais, NOMBREpais)
VALUES
    (3, 'Ecuador')
INSERT INTO VENTA.PAISES
    (IDpais, NOMBREpais)
VALUES
    (4, 'Perú')
INSERT INTO VENTA.PAISES
    (IDpais, NOMBREpais)
VALUES
    (5, 'Chile')
INSERT INTO VENTA.PAISES
    (IDpais, NOMBREpais)
VALUES
    (6, 'Argentina')
INSERT INTO VENTA.PAISES
    (IDpais, NOMBREpais)
VALUES
    (7, 'Brasil')
INSERT INTO VENTA.PAISES
    (IDpais, NOMBREpais)
VALUES
    (8, 'Paraguay')
INSERT INTO VENTA.PAISES
    (IDpais, NOMBREpais)
VALUES
    (9, 'Uruguay')
INSERT INTO VENTA.PAISES
    (IDpais, NOMBREpais)
VALUES
    (10, 'Bolivia')
------------------------------------------------------------------------
INSERT INTO COMPRA.CATEGORIAS
    (IDCATEGORIA, NOMBRECATEGORIA, DESCRIPCION)
VALUES
    (1, 'Primera', 'Limpiadores hogar')
INSERT INTO COMPRA.CATEGORIAS
    (IDCATEGORIA, NOMBRECATEGORIA, DESCRIPCION)
VALUES
    (2, 'Segunda', 'Detergentes Líquidos')
INSERT INTO COMPRA.CATEGORIAS
    (IDCATEGORIA, NOMBRECATEGORIA, DESCRIPCION)
VALUES
    (3, 'Tercera', 'Detergentes en polvo')
INSERT INTO COMPRA.CATEGORIAS
    (IDCATEGORIA, NOMBRECATEGORIA, DESCRIPCION)
VALUES
    (4, 'Cuarta', 'Productos industriales')
INSERT INTO COMPRA.CATEGORIAS
    (IDCATEGORIA, NOMBRECATEGORIA, DESCRIPCION)
VALUES
    (5, 'Quinta', 'Uso exterior')
------------------------------------------------------------------------------------------------------------------------
INSERT INTO VENTA.CLIENTES
VALUES
    (
        1,
        'Limpiadores el baúl',
        'Calle 21 34-56 Guayaquil',
        '3',
        '3365658'
    );
INSERT INTO VENTA.CLIENTES
VALUES
    (
        2,
        'Olores y Olores',
        'Cra 3 21-35 Medellín',
        '1',
        '25874587'
    );
INSERT INTO VENTA.CLIENTES
VALUES
    (
        3,
        'Limpieza Uno A',
        'Crc 5 23-45 Caracas',
        '2',
        '3659744'
    );
INSERT INTO VENTA.CLIENTES
VALUES
    (
        4,
        'Qúimicos R H',
        'Cra 45 23-56 Quito',
        '3',
        '8545787'
    );
INSERT INTO VENTA.CLIENTES
VALUES
    (
        5,
        'Limpiado extremo',
        'Calle 2 4-56 Itagui',
        '1',
        '3254512'
    );
--------------------------------------------------------------------------------------------------------------------
INSERT INTO COMPRA.PROVEEDORES
VALUES(
        1,
        'Líquidos Extremos',
        'Circ 4 78-98 Medellín',
        'Juan Carlos Valdez',
        'Asistente Comercial',
        1,
        '2545478',
        '2545478'
    )
INSERT INTO COMPRA.PROVEEDORES
VALUES(
        2,
        'Quìmicos lo mejor',
        'Calle 21 45-67 Bogotá',
        'Luis Fdo Sepúlveda',
        'Gerente General',
        2,
        '2457874',
        '2457874'
    )
INSERT INTO COMPRA.PROVEEDORES
VALUES(
        3,
        'Esencias extremas',
        'Cra 67 32-57 Itaguí',
        'Juan Guillermo Solórzano',
        'Asistente de ventas',
        3,
        '6478547',
        '6478547'
    )
INSERT INTO COMPRA.PROVEEDORES
VALUES(
        4,
        'Polvos mágicos',
        'Calle 21 34-32 Medellín',
        'Diego Hernán Cifuentes',
        'Gerente Comercial',
        4,
        '8545124',
        '8545124'
    )
INSERT INTO COMPRA.PROVEEDORES
VALUES(
        5,
        'Reactivos eficientes',
        'Diag 25 23-78 Medellín',
        'Ramón Elías Durán',
        'Servicio al cliente',
        5,
        '2451245',
        '2451245'
    )
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO COMPRA.PRODUCTOS
VALUES
    (
        1,
        'Jabón Espumoso',
        4,
        3,
        2700,
        2300,
        3800,
        5100
    )
INSERT INTO COMPRA.PRODUCTOS
VALUES
    (2, 'Suavemáx', 3, 4, 2500, 2300, 3800, 500)
INSERT INTO COMPRA.PRODUCTOS
VALUES
    (3, 'Jabón Supremo', 1, 2, 500, 2300, 3500, 700)
INSERT INTO COMPRA.PRODUCTOS
VALUES
    (
        4,
        'Limpiador Rindemáx',
        5,
        2,
        1200,
        2300,
        3800,
        200
    )
INSERT INTO COMPRA.PRODUCTOS
VALUES
    (5, 'Cera Limpiadora', 4, 2, 2500, 1400, 3600, 20)
-------------------------------------------------------------------------------------------
INSERT INTO RRHH.CARGOS
VALUES(1, 'Gerente Regional')
INSERT INTO RRHH.CARGOS
VALUES(2, 'Gerente Comercial')
INSERT INTO RRHH.CARGOS
VALUES(3, 'Asitente de ventas')
INSERT INTO RRHH.CARGOS
VALUES(4, 'Secretaria')
INSERT INTO RRHH.CARGOS
VALUES(5, 'Gerente General')
------------------------------------------------------------
INSERT INTO RRHH.DISTRITOS
VALUES(1, 'Bogotá')
INSERT INTO RRHH.DISTRITOS
VALUES(2, 'Valle')
INSERT INTO RRHH.DISTRITOS
VALUES(3, 'Antioquia')
INSERT INTO RRHH.DISTRITOS
VALUES(4, 'Caldas')
INSERT INTO RRHH.DISTRITOS
VALUES(5, 'Meta')
-----------------------------------------------------
INSERT INTO RRHH.EMPLEADOS
VALUES(
        1,
        'Sr',
        'Luis Guillermo',
        'Mendietta',
        '1968-02-05',
        'Cra 3 34-56 Medellín',
        2,
        '2545478',
        2,
        '1996-05-05 ',
        NULL
    )
INSERT INTO RRHH.EMPLEADOS
VALUES(
        2,
        'Dr',
        'Juan Camilo',
        'Tabares',
        '1976-10-15',
        'Calle 5 56-78 Medellín',
        2,
        '3252547',
        1,
        '2004-12-05 ',
        NULL
    )
INSERT INTO RRHH.EMPLEADOS
VALUES(
        3,
        'Lic',
        'Rafael',
        'Cristancho',
        '2000-11-05',
        'Cra 5 54-56 Medellín',
        2,
        '6254578',
        3,
        '2000-11-22 ',
        NULL
    )
INSERT INTO RRHH.EMPLEADOS
VALUES(
        4,
        'Dn',
        'Juan Gonzalo',
        'Arbeláez',
        '1999-06-05',
        'Calle 13 24-65 Medellín',
        2,
        '2147474',
        5,
        '2001-12-15 ',
        NULL
    )
INSERT INTO RRHH.EMPLEADOS
VALUES(
        5,
        'Sr',
        'Ricardo de Jesús',
        'Salamanca',
        '1998-12-05',
        'Cra 19 38-62 Medellín',
        2,
        '2145478',
        4,
        '1996-06-22 ',
        NULL
    )
----------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO VENTA.PEDIDOSCABE
VALUES(
        1,
        1,
        2,
        '2014-02-06',
        '2014-02-22',
        '2014-02-15',
        'Emviado',
        'Limpieza profunda',
        'Calle 35 56-67'
    )
INSERT INTO VENTA.PEDIDOSCABE
VALUES(
        2,
        1,
        2,
        '2014-02-08',
        '2014-02-25',
        '2014-02-17',
        'Emviado',
        'Limpieza profunda',
        'Calle 35 56-67'
    )
INSERT INTO VENTA.PEDIDOSCABE
VALUES(
        3,
        4,
        2,
        '2014-02-06',
        '2014-02-22',
        '2014-02-15',
        'Emviado',
        'Aseos extremos',
        'Car 46 15-35 Medellín'
    )
INSERT INTO VENTA.PEDIDOSCABE
VALUES(
        4,
        1,
        2,
        '2014-02-07',
        '2014-02-22',
        '2014-02-15',
        'Emviado',
        'Suavemax',
        'Calle 5 23-45'
    )
INSERT INTO VENTA.PEDIDOSCABE
VALUES(
        5,
        1,
        2,
        '2014-02-06',
        '2014-02-22',
        '2014-02-15',
        'Emviado',
        'Limpieza profunda',
        'Calle 35 56-67'
    )
-----------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO COMPRA.PEDIDOSDETA
VALUES(1, 1, 800, 60, 500)
INSERT INTO COMPRA.PEDIDOSDETA
VALUES(2, 3, 500, 20, 600)
INSERT INTO COMPRA.PEDIDOSDETA
VALUES(3, 1, 300, 60, 500)
INSERT INTO COMPRA.PEDIDOSDETA
VALUES(4, 4, 400, 30, 200)
INSERT INTO COMPRA.PEDIDOSDETA
VALUES(5, 1, 1000, 800, 6500)
-----------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @cant int
SELECT @cant = COUNT(*)
from COMPRA.PRODUCTOS
where idCategoria = 2
IF @cant <= 2 PRINT 'No hay mas de dos productos en la categoria 2'
    ELSE PRINT 'Hay mas de dos productos en la categoria 2'
PRINT 'Hay ' + STR(@cant) + ' productos en la categoria 2'
GO
-- Insertar un nuevo empleado que pertenezca al distrito 3 (Antioquia). 
-- Deberá preguntar primero si el distrito existe, porque si no, no lo inserta, cualquier dato del empleado.
DECLARE @distrito int
SELECT @distrito = COUNT(*)
from RRHH.DISTRITOS
where IdDistrito = 3
IF @distrito = 0 PRINT 'No existe el distrito 3'
    ELSE PRINT 'Existe el distrito 3'
BEGIN
    INSERT INTO RRHH.EMPLEADOS
    VALUES(
            6,
            'Sr',
            'Luis Guillermo',
            'Mendietta',
            '1968-02-05',
            'Cra 3 34-56 Medellín',
            3,
            '2545478',
            2,
            '1996-05-05 ',
            NULL
    )
    PRINT 'Empleado insertado'
END
GO
SELECT *
from RRHH.EMPLEADOS
GO
DECLARE @m int,
    @mes VARCHAR(20)
SET @m = 4
SET @mes = (
        CASE
            @m
            WHEN 1 THEN 'Enero'
            WHEN 2 THEN 'Febrero'
            WHEN 3 THEN 'Marzo'
            WHEN 4 THEN 'Abril'
            WHEN 5 THEN 'Mayo'
            WHEN 6 THEN 'Junio'
            WHEN 7 THEN 'Julio'
            WHEN 8 THEN 'Agosto'
            WHEN 9 THEN 'Septiembre'
            WHEN 10 THEN 'Octubre'
            WHEN 11 THEN 'Noviembre'
            WHEN 12 THEN 'Diciembre'
            ELSE 'Mes no válido'
        END
    )
PRINT @mes
GO
-- Elaborar una consulta que permita saber en qué mes NO se realizó ninguna contratación de empleados, 
-- haga uso del anterior programa (estructura case) e imprima el resultado como una tabla.

WITH
    Meses
    AS
    (
                                                                                                    SELECT 1 AS Mes
        UNION ALL
            SELECT 2
        UNION ALL
            SELECT 3
        UNION ALL
            SELECT 4
        UNION ALL
            SELECT 5
        UNION ALL
            SELECT 6
        UNION ALL
            SELECT 7
        UNION ALL
            SELECT 8
        UNION ALL
            SELECT 9
        UNION ALL
            SELECT 10
        UNION ALL
            SELECT 11
        UNION ALL
            SELECT 12
    ),
    ContratacionesPorMes
    AS
    (
        SELECT MONTH(fecCantrata) AS Mes,
            COUNT(*) AS Contrataciones
        FROM RRHH.EMPLEADOS
        GROUP BY MONTH(fecCantrata)
    )
SELECT (
        CASE
            m.Mes
            WHEN 1 THEN 'Enero'
            WHEN 2 THEN 'Febrero'
            WHEN 3 THEN 'Marzo'
            WHEN 4 THEN 'Abril'
            WHEN 5 THEN 'Mayo'
            WHEN 6 THEN 'Junio'
            WHEN 7 THEN 'Julio'
            WHEN 8 THEN 'Agosto'
            WHEN 9 THEN 'Septiembre'
            WHEN 10 THEN 'Octubre'
            WHEN 11 THEN 'Noviembre'
            WHEN 12 THEN 'Diciembre'
            ELSE 'Mes no válido'
        END
    ) AS Mes,
    ISNULL(c.Contrataciones, 0) AS Contrataciones
FROM Meses m
    LEFT JOIN ContratacionesPorMes c ON m.Mes = c.Mes
WHERE ISNULL(c.Contrataciones, 0) = 0
ORDER BY m.Mes
GO

-- Elabore una consulta que reciba el código de un empleado y regrese sus datos completos.

DECLARE @idEmpleado int
SET @idEmpleado = 1
SELECT *
from RRHH.EMPLEADOS
where IdEmpleado = @idEmpleado
GO

--  Elabore una consulta que reciba la fecha actual y retorne el nombre de todos los empleados que cumplen años en el mes.

DECLARE @fechaActual DATE
SET @fechaActual = GETDATE()
SELECT *
from RRHH.EMPLEADOS
where MONTH(fecNac) = MONTH(@fechaActual)
GO

-- Triggers

CREATE TRIGGER TX_Productos
ON COMPRA.PRODUCTOS
FOR INSERT, UPDATE, DELETE
AS
PRINT 'Actualizacion de los registros de productos'
GO

INSERT INTO COMPRA.PRODUCTOS
VALUES
    (6, 'Jabón de manos', 1, 2, 500, 2300, 3500, 700)
GO

UPDATE COMPRA.PRODUCTOS
SET precioUnidad = precioUnidad * 1.15
WHERE IdProducto = 2
GO

DELETE FROM COMPRA.PRODUCTOS
WHERE IdProducto = 6
GO

ALTER TRIGGER TX_Productos
ON COMPRA.PRODUCTOS
FOR INSERT, UPDATE, DELETE
AS
PRINT UPPER('Actualizacion de los registros de productos')
GO

DROP TRIGGER TX_Productos
GO

CREATE TRIGGER TX_Productos_Inserta
ON COMPRA.PRODUCTOS
FOR INSERT
AS
IF (SELECT COUNT(*)
FROM inserted, COMPRA.PRODUCTOS
WHERE inserted.nomProducto = COMPRA.PRODUCTOS.nomProducto) > 1
    BEGIN
    PRINT 'No se puede insertar el producto, ya existe'
    ROLLBACK TRANSACTION
END
ELSE
    PRINT 'Producto insertado'
GO

SELECT *
FROM COMPRA.PRODUCTOS
GO

INSERT INTO COMPRA.PRODUCTOS
    (IdProducto, nomProducto, idProveedor, idCategoria, cantxUnidad, precioUnidad, UniEnExistencia, UniEnPedido)
VALUES
    (8, 'Jabón de manos', 1, 2, 500, 2300, 3500, 700)
GO

CREATE TRIGGER TX_ELIMINA
ON VENDOR
FOR DELETE
AS
IF EXISTS ( SELECT *
FROM PRODUCT
WHERE V_CODE =( SELECT V_CODE
FROM DELETED ) )
    BEGIN
    PRINT 'No se puede eliminar el proveedor, tiene productos asociados'
    ROLLBACK TRANSACTION
END
ELSE
    PRINT 'Proveedor eliminado'
GO

CREATE TRIGGER TX_Productos_Actualiza
ON PRODUCT
FOR UPDATE
AS
IF (SELECT P_PRICE
    FROM INSERTED) <= 0 OR (SELECT P_PRICE
    FROM INSERTED) <= 0
    BEGIN
    PRINT 'El precio del producto no puede ser menor o igual a 0 o mayor a 1000'
    ROLLBACK TRANSACTION
END
ELSE
    PRINT 'Producto actualizado'
GO

-- 1. Cree un mensaje de error con código 50005, nivel de severidad 14 y el mensaje: 'Usted no está autorizado para realizar modificaciones en esta tabla'.

EXEC sp_addmessage 50005, 14, 'Usted no está autorizado para realizar modificaciones en esta tabla'
GO

--  2. Cree un trigger  instead of en la tabla COMPRA.PRODUCTOS que busque realizar un UPDATE  en cualquier registro. El trigger deberá alzar el error anteriormente creado.

DROP TRIGGER IF EXISTS TX_Productos_Actualiza
GO

CREATE TRIGGER TX_Productos_Actualiza
ON COMPRA.PRODUCTOS
INSTEAD OF UPDATE
AS
RAISERROR(50005, 14, 1)
GO

--  3. Elabore un procedimiento almacenado que reciba el código de un producto e intente realizar un UPDATE  en la tabla utilizada en el punto 2. Se deberá disparar este trigger evitando la actualización de la tabla. 

DROP PROCEDURE IF EXISTS ActualizaProducto
GO

CREATE PROCEDURE ActualizaProducto
    @IdProducto INT
AS
UPDATE COMPRA.PRODUCTOS
SET precioUnidad = precioUnidad * 1.15
WHERE IdProducto = @IdProducto
GO

-- 4. Organize los tres puntos anteriores en una sola sentencia que pueda ser corrido como una sola consulta. Este será el único punto que se revisará. 

EXEC ActualizaProducto 2;
GO
