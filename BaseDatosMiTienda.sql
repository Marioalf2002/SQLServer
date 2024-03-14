-- Base Datos MiTienda

create database MiTIenda

CREATE TABLE EMPLEADOS(
Id                    Int            PRIMARY KEY        NOT NULL,
Nombre                    varchar(50)                    NOT NULL,
Apellido                varchar(50)                    NOT NULL,
Direccion                varchar(150)                    NOT NULL,
Telefono                char(10)                    NOT NULL,
Fecha_Vinc                date                    NOT NULL,
)

CREATE TABLE PROVEEDORES(
Id                    int            PRIMARY KEY        NOT NULL,
Descripcion                varchar(150)                    NOT NULL,
Direccion                varchar(150)                    NOT NULL,
Telefono                char(10)                    NOT NULL,
Fecha_Vinc                date                   NOT NULL,
)

CREATE TABLE PRODUCTOS(
Id                    int            PRIMARY KEY        NOT NULL,
Descripcion                varchar(150)                    NOT NULL,
Cantidad                int                        NOT NULL,
Precio                    decimal(10, 2)                    NOT NULL,
ProveedorId                int                    NOT NULL,
Fecha_Vencimiento            date                        NOT NULL,
Prod_Code                int            UNIQUE            NOT NULL,
FOREIGN KEY (ProveedorId) REFERENCES PROVEEDORES(Id) on delete cascade on update cascade,
)

CREATE TABLE CLIENTES(
Id                    Int            PRIMARY KEY        NOT NULL,
Nombre                    varchar(50)                    NOT NULL,
Apellido                varchar(50)                    NOT NULL,
Direccion                varchar(150)                    NOT NULL,
Telefono                char(10)                    NOT NULL,
Fecha_Vinc                date                    NOT NULL,
)

CREATE TABLE FACTURAS(
Id                    Int            PRIMARY KEY        NOT NULL,
Cliente               int                                NOT NULL,
Descripcion                varchar(250)                    NOT NULL,
Cantidad                int                        NOT NULL,
precio                    decimal(10,2)                    NOT NULL,
Fecha                    datetime                    NOT NULL,
Fact_Code                int            UNIQUE            NOT NULL,
EmpleId                    int                                not null,
FOREIGN KEY (EmpleId) REFERENCES EMPLEADOS(Id) on delete cascade on update cascade,
FOREIGN KEY (Cliente) REFERENCES CLIENTES(Id) on delete cascade on update cascade,
FOREIGN KEY (Fact_Code) REFERENCES PRODUCTOS (Prod_Code) on delete cascade on update cascade,
)

INSERT INTO EMPLEADOS (Id, Nombre, Apellido, Direccion, Telefono, Fecha_Vinc)
VALUES
    (1, 'Juan', 'Pérez', 'Calle 123, Ciudad ABC', '1234567890', '2023-05-15'),
    (2, 'María', 'García', 'Avenida XYZ, Ciudad XYZ', '9876543210', '2022-10-20'),
    (3, 'Carlos', 'Rodríguez', 'Calle 456, Ciudad DEF', '5555555555', '2024-01-10'),
    (4, 'Ana', 'Martínez', 'Calle 789, Ciudad GHI', '7777777777', '2023-08-05'),
    (5, 'Pedro', 'López', 'Avenida ABC, Ciudad JKL', '9999999999', '2022-12-30'),
    (6, 'Laura', 'Sánchez', 'Calle Principal 456, Ciudad MNO', '1112223333', '2023-09-18'),
    (7, 'Alejandro', 'Díaz', 'Avenida Central 789, Ciudad PQR', '4445556666', '2022-07-25'),
    (8, 'Lucia', 'González', 'Calle Secundaria 321, Ciudad STU', '7778889999', '2024-02-05'),
    (9, 'Daniel', 'Ruiz', 'Avenida Norte 987, Ciudad VWX', '3334445555', '2023-04-30'),
    (10, 'Sofia', 'Hernández', 'Calle Sur 654, Ciudad YZA', '6667778888', '2022-11-12');
INSERT INTO Proveedores (Id, Descripcion, Direccion, Telefono, Fecha_Vinc) 
VALUES 
(001, 'Coca-Cola', 'Calle 123', '12345678', '2024-02-10'),
(002, 'Postobon', 'Avenida XYZ', '09876543', '2024-02-09'),
(003, 'Alpina', 'Carrera 456', '11223344', '2024-02-08'),
(004, 'Bucanero', 'Calle 789', '99887766', '2024-02-07'),
(005, 'Colombina', 'Avenida MNO', '55443322', '2024-02-06'),
(006, 'Familia', 'Calle 321', '77889900', '2024-02-05'),
(007, 'Purina', 'Avenida VWX', '33221144', '2024-02-04'),
(008, 'gsk', 'Carrera 654', '88997766', '2024-02-03'),
(009, 'El Rey', 'Calle 987', '66554432', '2024-02-02'),
(0010, 'P&G', 'Avenida HIJ', '44332211', '2024-02-01')

insert into PRODUCTOS(id,Descripcion,Cantidad,Precio,ProveedorId,Fecha_Vencimiento,Prod_Code)
values (01,'mantequilla 500 gr',10,5500,04,'2024-02-12',100);

insert into PRODUCTOS(id,Descripcion,Cantidad,Precio,ProveedorId,Fecha_Vencimiento,Prod_Code)
values (02,'leche bolsa entera',20,4500,04,'2024-02-14',101);

insert into PRODUCTOS(id,Descripcion,Cantidad,Precio,ProveedorId,Fecha_Vencimiento,Prod_Code)
values (03,'arepa blanca x 5',5,2000,04,'2024-02-15',102);

insert into PRODUCTOS(id,Descripcion,Cantidad,Precio,ProveedorId,Fecha_Vencimiento,Prod_Code)
values (04,'cocacola 1 litro',15,6500,02,'2026-02-12',103);

insert into PRODUCTOS(id,Descripcion,Cantidad,Precio,ProveedorId,Fecha_Vencimiento,Prod_Code)
values (05,'pepsi x 3 litros',15,6200,03,'2025-11-21',104);

insert into PRODUCTOS(id,Descripcion,Cantidad,Precio,ProveedorId,Fecha_Vencimiento,Prod_Code)
values (06,'pan tajado bimbo',10,6000,05,'2024-03-12',105);

insert into PRODUCTOS(id,Descripcion,Cantidad,Precio,ProveedorId,Fecha_Vencimiento,Prod_Code)
values (07,'manzana verde x unidad',30,2000,04,'2024-04-12',106);

insert into PRODUCTOS(id,Descripcion,Cantidad,Precio,ProveedorId,Fecha_Vencimiento,Prod_Code)
values (08,'mango tomy x unidad',10,1000,04,'2024-04-12',107);

insert into PRODUCTOS(id,Descripcion,Cantidad,Precio,ProveedorId,Fecha_Vencimiento,Prod_Code)
values (09,'papas de limon margarita x 500 gr',18,7000,05,'2024-05-10',108);

insert into PRODUCTOS(id,Descripcion,Cantidad,Precio,ProveedorId,Fecha_Vencimiento,Prod_Code)
values (10,'huevo blanco #2 x canasta',10,13000,05,'2024-03-12',109);


INSERT INTO CLIENTES (Id, Nombre, Apellido, Direccion, Telefono, Fecha_Vinc)
VALUES (1, 'Juan', 'Gomez', 'Av. Principal 123', '555-1234', '2023-01-15');

INSERT INTO CLIENTES (Id, Nombre, Apellido, Direccion, Telefono, Fecha_Vinc)
VALUES (2, 'Maria', 'Rodriguez', 'Calle Robles 456', '555-5678', '2023-02-20');

INSERT INTO CLIENTES (Id, Nombre, Apellido, Direccion, Telefono, Fecha_Vinc)
VALUES (3, 'Carlos', 'Lopez', 'Barrio Flores 789', '555-9012', '2023-03-25');

INSERT INTO CLIENTES (Id, Nombre, Apellido, Direccion, Telefono, Fecha_Vinc)
VALUES (4, 'Ana', 'Martinez', 'Esquina Palmas 101', '555-3456', '2023-04-10');

INSERT INTO CLIENTES (Id, Nombre, Apellido, Direccion, Telefono, Fecha_Vinc)
VALUES (5, 'Pedro', 'Santos', 'Colonia Pinos 202', '555-7890', '2023-05-15');

INSERT INTO CLIENTES (Id, Nombre, Apellido, Direccion, Telefono, Fecha_Vinc)
VALUES (6, 'Laura', 'Fernandez', 'Residencial Alamos 303', '555-1234', '2023-06-20');

INSERT INTO CLIENTES (Id, Nombre, Apellido, Direccion, Telefono, Fecha_Vinc)
VALUES (7, 'Fernando', 'Gonzalez', 'Condominio Cedros 404', '555-5678', '2023-07-25');

INSERT INTO CLIENTES (Id, Nombre, Apellido, Direccion, Telefono, Fecha_Vinc)
VALUES (8, 'Marta', 'Hernandez', 'Urbanizacion Nogales 505', '555-9012', '2023-08-30');

INSERT INTO CLIENTES (Id, Nombre, Apellido, Direccion, Telefono, Fecha_Vinc)
VALUES (9, 'Ricardo', 'Diaz', 'Callejón Laurel 606', '555-3456', '2023-09-05');

INSERT INTO CLIENTES (Id, Nombre, Apellido, Direccion, Telefono, Fecha_Vinc)
VALUES (10, 'Elena', 'Perez', 'Avenida Pino Real 707', '555-7890', '2023-10-10');
INSERT INTO FACTURAS (Id, Cliente, Descripcion, Cantidad, Precio, Fecha, Fact_Code, EmpleId)
VALUES
    (1, 1, ' mantequilla', 2, 11000, '20240213 08:30:00 AM', 100, 1),
    (2, 2, 'leche', 3, 13500, '20240213 09:45:00 AM', 101, 2),
    (3, 3, 'de arepas', 1, 2000, '20240213 10:15:00 AM', 102, 3),
    (4, 4, 'Coca-Cola', 5, 32500, '20240213 11:00:00 AM', 103, 4),
    (5, 5, 'Pepsi', 4, 24800, '20240213 12:30:00 PM', 104, 5),
    (6, 6, 'pan tajado', 2, 12000, '20240213 01:15:00 PM', 105, 6),
    (7, 7, ' manzanas', 1, 2000, '20240213 02:00:00 PM', 106, 7),
    (8, 8, 'mango', 3, 3000, '20240213 03:30:00 PM', 107, 8),
    (9, 9, ' papas de limón', 2, 14000, '20240213 04:45:00 PM', 108, 9),
    (10, 10, 'huevos', 1, 13000, '20240213 05:20:00 PM', 109, 10);

-- Vistas
create view EMPLEADOS_Vista as	-- Creamos la vista con el nombre 'EMPLEADOS_Vista' donde contiene el nombre y apellido de empleados
select Nombre, Apellido from empleado

select * from EMPLEADOS_Vista  -- Se Usa para ejecturas la vista creada

create view PRODUCTOS_Vista as
select Descripcion, Precio from productos
where precio = (select max(precio) from productos)

select * from PRODUCTOS_Vista

create view Promedio_Productos as
select * from productos
where precio < (select avg(precio) from productos)

select * from Promedio_Productos

select * from EMPLEADOS_Vista
where Apellido like '%z'

create view ApellidosNombres as
select * from EMPLEADOS_Vista
where Apellido like '%z' and Nombre like'A%'

select * from ApellidosNombres

select P.*, pr.* from productos as P
Join proveedores as pr on p.id = pr.id
where pr.id = 6

/**
 * Ejemplo de funciones en SQL Server
    * Crear una funcion que retorne un valor decimal
    * Crear una funcion que retorne el promedio de los precios de los productos
 */

-- Crear una funcion que retorne un valor decimal
create function promedio() returns decimal(10, 2)
as 
BEGIN
DECLARE @var decimal(10, 2)
set @var = 256.3
RETURN @var
END
go

-- imprimir el valor de la funcion
print 'El valor es: ' + cast(dbo.promedio() as VARCHAR(150))
GO

-- Crear una funcion que retorne el promedio de los precios de los productos
create function promedioPrecioProductos() returns decimal(10, 2)
as 
BEGIN
DECLARE @var decimal(10, 2)
set @var = (Select avg (precio) from PRODUCTOS)
RETURN @var
END
go

-- imprimir el valor de la funcion
PRINT 'El promedio de los precios de los productos es: ' + cast(dbo.promedioPrecioProductos() as VARCHAR(150))
GO
drop function promedio -- Eliminar la funcion promedio
GO
-- Crear una funcion que diga cual es la descripcion del producto con mayor precio 
create function productoConMayorPrecio() returns varchar(150)
as
BEGIN
DECLARE @var varchar(150)
set @var = (Select descripcion from PRODUCTOS where precio = (Select max(precio) from PRODUCTOS))
RETURN @var
END
GO
PRINT 'El producto con mayor precio es: ' + dbo.productoConMayorPrecio()
go
-- elaborar una funcion que muestre la descripcion del articulo que se encuentra en la primera fila de la tabla productos
create function primerProducto() returns varchar(150)
as
BEGIN
DECLARE @var varchar(150)
set @var = (Select TOP(1) descripcion from PRODUCTOS)
RETURN @var
END
GO

PRINT 'El primer producto es: ' + dbo.primerProducto()
GO
-- elaborar una funcion que retorne el nombre y apellido del empleado con id entrado como argumento
create function nombreEmpleado(@id int) returns varchar(150)
as
BEGIN
DECLARE @nombre VARCHAR(150)
set @nombre = (Select nombre + ' ' + apellido from EMPLEADOS where id = @id)
RETURN @nombre
END
go

PRINT 'El nombre del empleado es: ' + dbo.nombreEmpleado(9)
go

-- llamado recursivo de una funcion
-- elaborar una funcion que retorne el mayor precio de la tabla productos haciendo uso de esta funcion, elaborar otra
-- que la llame y retorne la descripcion del articulo con el mayor precio.
create function mayorPrecio() returns decimal(10, 2)
as
BEGIN
DECLARE @var decimal(10, 2)
set @var = (Select max(precio) from PRODUCTOS)
RETURN @var
END
go

create function descripcionProductoMayorPrecio() returns varchar(150)
as
BEGIN
DECLARE @var varchar(150)
set @var = (Select descripcion from PRODUCTOS where precio = dbo.mayorPrecio())
RETURN @var
END
go

PRINT 'El producto con mayor precio es: ' + dbo.descripcionProductoMayorPrecio()
GO

-- Elaborar una función que retorne la raíz cuadrada de un número entrado como argumento.
create function raizCuadrada(@numero int) returns decimal(10, 2)
as
BEGIN
DECLARE @var decimal(10, 2)
set @var = (Select sqrt(@numero))
RETURN @var
END
go

PRINT 'La raiz cuadrada de 25 es: ' + cast(dbo.raizCuadrada(25) as varchar(150))
GO

-- Elaborar una función que retorne el resultado de una base elevada a un exponente.
create function potencia(@base int, @exponente int) returns decimal(10, 2)
as
BEGIN
DECLARE @var decimal(10, 2)
set @var = (Select power(@base, @exponente))
RETURN @var
END
go

PRINT 'El resultado de 2 elevado a la 3 es: ' + cast(dbo.potencia(2, 3) as varchar(150))
go 

-- Elaborar una función que retorne el seno de un número entrado en grados.
create function seno(@grados int) returns decimal(10, 2)
as
BEGIN
DECLARE @var decimal(10, 2)
set @var = (Select sin(radians(@grados)))
RETURN @var
END
go

PRINT 'El seno de 90 grados es: ' + cast(dbo.seno(90) as varchar(150))
go


CREATE TABLE EMPLEADOS(
Id                    Int            PRIMARY KEY        NOT NULL,
Nombre                    varchar(50)                    NOT NULL,
Apellido                varchar(50)                    NOT NULL,
Direccion                varchar(150)                    NOT NULL,
Telefono                char(10)                    NOT NULL,
Fecha_Vinc                date                    NOT NULL,
)

CREATE TABLE PROVEEDORES(
Id                    int            PRIMARY KEY        NOT NULL,
Descripcion                varchar(150)                    NOT NULL,
Direccion                varchar(150)                    NOT NULL,
Telefono                char(10)                    NOT NULL,
Fecha_Vinc                date                   NOT NULL,
)

CREATE TABLE PRODUCTOS(
Id                    int            PRIMARY KEY        NOT NULL,
Descripcion                varchar(150)                    NOT NULL,
Cantidad                int                        NOT NULL,
Precio                    decimal(10, 2)                    NOT NULL,
ProveedorId                int                    NOT NULL,
Fecha_Vencimiento            date                        NOT NULL,
Prod_Code                int            UNIQUE            NOT NULL,
FOREIGN KEY (ProveedorId) REFERENCES PROVEEDORES(Id) on delete cascade on update cascade,
)

CREATE TABLE CLIENTES(
Id                    Int            PRIMARY KEY        NOT NULL,
Nombre                    varchar(50)                    NOT NULL,
Apellido                varchar(50)                    NOT NULL,
Direccion                varchar(150)                    NOT NULL,
Telefono                char(10)                    NOT NULL,
Fecha_Vinc                date                    NOT NULL,
)

CREATE TABLE FACTURAS(
Id                    Int            PRIMARY KEY        NOT NULL,
Cliente               int                                NOT NULL,
Descripcion                varchar(250)                    NOT NULL,
Cantidad                int                        NOT NULL,
precio                    decimal(10,2)                    NOT NULL,
Fecha                    datetime                    NOT NULL,
Fact_Code                int            UNIQUE            NOT NULL,
EmpleId                    int                                not null,
FOREIGN KEY (EmpleId) REFERENCES EMPLEADOS(Id) on delete cascade on update cascade,
FOREIGN KEY (Cliente) REFERENCES CLIENTES(Id) on delete cascade on update cascade,
FOREIGN KEY (Fact_Code) REFERENCES PRODUCTOS (Prod_Code) on delete cascade on update cascade,
)

-- Elaborar una función que retorne la información de un cliente entrando su apellido como argumento.
drop FUNCTION if exists informacion
GO

CREATE FUNCTION informacion(@apellido VARCHAR(50))
RETURNS @EMPLEADOS TABLE(
    Id int,
    Nombre Varchar(150),
    Apellido varchar(150),
    Direccion varchar(150),
    Telefono varchar(150),
    Fecha_Vinc date
)
AS
BEGIN
    INSERT INTO @EMPLEADOS (Id,Nombre,Apellido,Direccion,Telefono,Fecha_Vinc)
    SELECT * FROM EMPLEADOS WHERE Apellido = @apellido
    RETURN
END
GO

select * from dbo.informacion('Hernández')
GO

-- Elaborar una función que permita llamar otra función de tal modo que la primer me indique 
-- el id del proveedor del artículo de mayor precio, y con la segunda mostrar la información del proveedor con ese Id.

drop FUNCTION if exists idProveedor
GO

CREATE FUNCTION idProveedor()
RETURNS int
AS
BEGIN
    DECLARE @id int
    SELECT @id = ProveedorId FROM PRODUCTOS WHERE Precio = (SELECT MAX(Precio) FROM PRODUCTOS)
    RETURN @id
END
GO

select dbo.idProveedor()
GO

drop FUNCTION if exists informacionProveedor
GO

CREATE FUNCTION informacionProveedor()
RETURNS @PROVEEDORES TABLE(
    Id int,
    Descripcion Varchar(150),
    Direccion varchar(150),
    Telefono varchar(150),
    Fecha_Vinc date
)
AS
BEGIN
    DECLARE @id int
    SELECT @id = dbo.idProveedor()
    INSERT INTO @PROVEEDORES (Id,Descripcion,Direccion,Telefono,Fecha_Vinc)
    SELECT * FROM PROVEEDORES WHERE Id = @id
    RETURN
END
GO

-- Elaborar una funcion que retorne la informacion de los clientes que poseen el record de la compra mas alto en un factura
-- donde calcules la factura del cliente tomando en cuenta la cantidad y el precio del producto, donde calcules el precio total

drop FUNCTION if exists recordCompra
GO

CREATE FUNCTION recordCompra()
RETURNS @CLIENTES TABLE(
    Id int,
    Nombre Varchar(150),
    Apellido varchar(150),
    Direccion varchar(150),
    Telefono varchar(150),
    Fecha_Vinc date,
    Total decimal(10,2)
)
AS
BEGIN
    INSERT INTO @CLIENTES (Id,Nombre,Apellido,Direccion,Telefono,Fecha_Vinc,Total)
    SELECT CLIENTES.Id, CLIENTES.Nombre, CLIENTES.Apellido, CLIENTES.Direccion, CLIENTES.Telefono, CLIENTES.Fecha_Vinc, FACTURAS.precio*FACTURAS.cantidad AS Total
    FROM CLIENTES
    INNER JOIN FACTURAS ON CLIENTES.Id = FACTURAS.Cliente
    WHERE FACTURAS.precio*FACTURAS.cantidad = (SELECT MAX(FACTURAS.precio*FACTURAS.cantidad) FROM FACTURAS)
    RETURN
END
GO

select * from dbo.recordCompra()
GO

drop FUNCTION if exists Reporte
GO

CREATE FUNCTION Reporte()
RETURNS TABLE
AS
RETURN(select * from EMPLEADOS)
GO

select * from dbo.Reporte()
GO

SELECT Nombre, Apellido from Reporte() WHERE Apellido like 'L%'
GO

DROP FUNCTION if EXISTS Reporte2
GO

CREATE FUNCTION Reporte2(@valor decimal(10,2))
returns TABLE
AS
RETURN (select Descripcion, Precio, Nombre, Apellido, Fecha_Vinc from PRODUCTOS P, CLIENTES C
where P.Precio >= @valor and MONTH(C.Fecha_Vinc)>5)
GO

SELECT * FROM Reporte2(6000)
GO

-- Elaborar una funcion que retorne el nombre y apellido del (los) clientes que también sean empleados.

DROP FUNCTION if EXISTS Reporte3
GO

CREATE FUNCTION Reporte3()
returns TABLE
AS
RETURN (select E.Nombre, E.Apellido from EMPLEADOS E, CLIENTES C
where E.Nombre = C.Nombre and E.Apellido = C.Apellido)
GO

SELECT * FROM Reporte3()
GO

-- Elaborar una funcion que retorne un enlace entre las cinco tablas.

DROP FUNCTION if EXISTS infotablas
GO

CREATE FUNCTION infotablas()
RETURNS TABLE
AS
RETURN (
    SELECT E.Id AS EmpleadoId, E.Nombre AS EmpleadoNombre, E.Apellido AS EmpleadoApellido, E.Direccion AS EmpleadoDireccion, E.Telefono AS EmpleadoTelefono, E.Fecha_Vinc AS EmpleadoFechaVinc,
           P.Descripcion AS ProductoDescripcion, P.Precio AS ProductoPrecio,
           C.Id AS ClienteId, C.Nombre AS ClienteNombre, C.Apellido AS ClienteApellido, C.Direccion AS ClienteDireccion, C.Telefono AS ClienteTelefono, C.Fecha_Vinc AS ClienteFechaVinc,
           PR.Id AS ProveedorId, PR.Descripcion AS ProveedorDescripcion, PR.Direccion AS ProveedorDireccion, PR.Telefono AS ProveedorTelefono, PR.Fecha_Vinc AS ProveedorFechaVinc,
           F.Fact_Code, F.Cantidad
    FROM EMPLEADOS E, PRODUCTOS P, CLIENTES C, PROVEEDORES PR, FACTURAS F
    WHERE E.Id = F.EmpleId AND P.ProveedorId = PR.Id AND F.Cliente = C.Id AND F.Fact_Code = P.Prod_Code
)
GO

SELECT * FROM infotablas()
GO

-- Sotred Procedures

CREATE PROCEDURE MostrarEmpleados
AS
SELECT * from EMPLEADOS
GO

MostrarEmpleados
GO

CREATE PROCEDURE InsertarProveedor
@pid int, @pdesc varchar(150), @pdirc VARCHAR(150), @ptel char(10), @pfecha date
AS
BEGIN
    INSERT INTO PROVEEDORES 
    VALUES (@pid, @pdesc, @pdirc, @ptel, @pfecha)
END
GO

InsertarProveedor 11, 'Lacteos la mejor', 'Cra 5 67-98', '3152648758', '2021-05-13'
GO

DROP PROCEDURE if exists MuestraCliente
GO

CREATE PROCEDURE MuestraCliente @cod INT
as
select * from CLIENTES where id = @cod
GO

MuestraCliente 5

-- crear un procedimiento almacenado que permita eliminar el ultimo registro de la tabla proveedores.
DROP PROCEDURE if exists EliminarUltimoProveedor
GO

CREATE PROCEDURE EliminarUltimoProveedor
AS
BEGIN
    DELETE FROM PROVEEDORES WHERE Id = (SELECT MAX(Id) FROM PROVEEDORES)
END
GO

EliminarUltimoProveedor
GO

-- crear un stored procedure que permita aumentar en un diex por ciento el precio de todos los articulos cuyo precio esta por debajo del precio promedio

DROP PROCEDURE if exists AumentarPrecio
GO

CREATE PROCEDURE AumentarPrecio
AS
BEGIN
    DECLARE @promedio decimal(10,2)
    SELECT @promedio = AVG(Precio) FROM PRODUCTOS
    UPDATE PRODUCTOS SET Precio = Precio + (Precio * 1.1) WHERE Precio < @promedio
END
GO

AumentarPrecio
GO

-- crea un procedimiento que permita llamar una funcion que retorna la descripcion de un articulo de la tabla productos con id entrado como argumento. 
-- El procedimiento imprimira el precio de tal articulo

DROP PROCEDURE if exists PrecioArticulo
GO

CREATE PROCEDURE PrecioArticulo @id INT
AS
BEGIN
    DECLARE @descripcion varchar(150)
    DECLARE @precio varchar(150)
    SET @descripcion = (SELECT descripcion FROM PRODUCTOS WHERE Id = @id)
    SET @precio = (SELECT CAST(Precio AS VARCHAR(150)) FROM PRODUCTOS WHERE Id = @id)
    PRINT 'El precio del articulo ' + @descripcion + ' es: ' + @precio
END
GO

PrecioArticulo 5
GO

-- Crear una vista con los datos de los clientes que tienen compras por encima del promedio.

DROP VIEW if exists ComprasPorEncimaDelPromedio
GO

CREATE VIEW ComprasPorEncimaDelPromedio AS
SELECT C.Id, C.Nombre, C.Apellido, C.Direccion, C.Telefono, C.Fecha_Vinc, F.Descripcion, F.Cantidad, F.precio, F.Fecha
FROM CLIENTES C, FACTURAS F
WHERE C.Id = F.Cliente AND F.precio*F.Cantidad > (SELECT AVG(precio*Cantidad) FROM FACTURAS)
GO

select * from ComprasPorEncimaDelPromedio

SELECT AVG(precio*cantidad) from FACTURAS

-- Elabore una función que lea la vista anterior y envíe un mensaje de felicitación al mejor cliente indicando su nombre y promedio de compras.

DROP FUNCTION if exists Felicitacion
GO

CREATE FUNCTION Felicitacion()
RETURNS varchar(150)
AS
BEGIN
    DECLARE @nombre varchar(150)
    DECLARE @promedio varchar(150)
    SELECT @nombre = 'Felicitaciones ' + C.Nombre + ' ' + C.Apellido
    FROM CLIENTES C, FACTURAS F
    WHERE C.Id = F.Cliente AND F.precio*F.Cantidad = (SELECT MAX(precio*Cantidad) FROM FACTURAS)
    SELECT @promedio = 'has sido el cliente mas destacado, gracias por tus compras y confianza en nosotros.'
    RETURN @nombre + ' ' + @promedio
END
GO

PRINT dbo.Felicitacion()

-- Elaborar un procedimiento que permita ingresar un nuevo registro en la tabla facturas. donde el usuario puedan ingresar los datos agregar y crea un nuevo producto


DROP PROCEDURE if exists AgregarProducto
GO

CREATE PROCEDURE AgregarProducto
@id int, @desc varchar(150), @cant int, @precio decimal(10,2), @proveedorid int, @fecha date, @prodcode int
AS
BEGIN
    INSERT INTO PRODUCTOS VALUES (@id, @desc, @cant, @precio, @proveedorid, @fecha, @prodcode)
END
GO

AgregarProducto 12, 'Galletas*3', 10, 10000, 1, '2021-05-13', 111
GO

DROP PROCEDURE if exists AgregarFactura
GO

CREATE PROCEDURE AgregarFactura
@id INT, @cliente INT, @descripcion VARCHAR(250), @cantidad INT, @precio DECIMAL(10,2), @fecha DATETIME, @fact_code INT, @empleId INT
AS
BEGIN
    INSERT INTO FACTURAS (Id, Cliente, Descripcion, Cantidad, precio, Fecha, Fact_Code, EmpleId)
    VALUES (@id, @cliente, @descripcion, @cantidad, @precio, @fecha, @fact_code, @empleId)
END
GO

AgregarFactura 12, 5, 'Galletas', 3, 18600, '2024-02-13 06:30:00 PM', 111, 6
GO

-- Elabore un procedimiento que permita eliminar de la base de datos al empleado que no aparezca en la tabla facturas (si es el caso).

DROP PROCEDURE if exists EliminarEmpleado
GO

CREATE PROCEDURE EliminarEmpleado
AS
BEGIN
    DELETE FROM EMPLEADOS WHERE Id NOT IN (SELECT EmpleId FROM FACTURAS)
END
GO

EliminarEmpleado

-- Elabore una consulta para crear una función que retorne los cinco ultimos registros de la tabla Productos ordenados de forma ascendente por Id.

DROP FUNCTION if exists UltimosProductos
GO

CREATE FUNCTION UltimosProductos()
RETURNS @PRODUCTOS TABLE(
    Id int,
    Descripcion varchar(150),
    Cantidad int,
    Precio decimal(10,2),
    ProveedorId int,
    Fecha_Vencimiento date,
    Prod_Code int
)
AS
BEGIN
    INSERT INTO @PRODUCTOS (Id, Descripcion, Cantidad, Precio, ProveedorId, Fecha_Vencimiento, Prod_Code)
    SELECT TOP(5) * FROM PRODUCTOS
    ORDER BY Id DESC
    RETURN
END
GO

SELECT * FROM dbo.UltimosProductos()
GO

-- Elabore una consulta que retorne la descripción del producto de menor precio de la tabla retornada en el anterior punto. Imprima tal descripción.

DROP FUNCTION if exists MenorPrecio
GO

CREATE FUNCTION MenorPrecio()
RETURNS varchar(150)
AS
BEGIN
    DECLARE @descripcion varchar(150)
    SELECT @descripcion = Descripcion FROM dbo.UltimosProductos() WHERE Precio = (SELECT MIN(Precio) FROM dbo.UltimosProductos())
    RETURN @descripcion
END
GO

PRINT dbo.MenorPrecio()
GO

-- Elabore una consulta que cree una vista con los datos de la tabla clientes enlazada con la tabla facturas. Toda la información.

DROP VIEW if exists ClientesFacturas
GO

CREATE VIEW ClientesFacturas AS
SELECT C.Id AS IdCliente, C.Nombre, C.Apellido, C.Direccion, C.Telefono, C.Fecha_Vinc, F.Id AS IdFacturas, F.Descripcion, F.Cantidad, F.precio, F.Fecha, F.Fact_Code, EmpleId
FROM CLIENTES C, FACTURAS F
WHERE C.Id = F.Cliente
GO

SELECT * FROM ClientesFacturas
GO

-- Elabore un procedimiento almacenado que lea los datos de la vista del anterior punto y muestre la información del cliente asociado a un código de factura ingresado como consulta.

DROP PROCEDURE if exists MostrarClienteFactura
GO

CREATE PROCEDURE MostrarClienteFactura @cod INT
AS
BEGIN
    SELECT * FROM ClientesFacturas WHERE IdFacturas = @cod
END
GO

MostrarClienteFactura 4
GO