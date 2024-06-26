USE [MiTiendaTaller]
GO
/****** Object:  Table [dbo].[ACCT_TRANSACTION]    Script Date: 18/03/2024 06:19:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCT_TRANSACTION]
(
	[ACCT_TRANS_NUM] [int] NULL,
	[ACCT_TRANS_DATE] [datetime] NULL,
	[CUST_NUMBER] [int] NULL,
	[ACCT_TRANS_TYPE] [nvarchar](8) NULL,
	[ACCT_TRANS_AMOUNT] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 18/03/2024 06:19:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER]
(
	[CUST_NUMBER] [int] NULL,
	[CUST_LNAME] [nvarchar](15) NULL,
	[CUST_FNAME] [nvarchar](15) NULL,
	[CUST_INITIAL] [nvarchar](1) NULL,
	[CUST_AREACODE] [nvarchar](3) NULL,
	[CUST_PHONE] [nvarchar](8) NULL,
	[CUST_BALANCE] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INVOICE]    Script Date: 18/03/2024 06:19:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INVOICE]
(
	[INV_NUMBER] [int] NULL,
	[CUST_NUMBER] [int] NULL,
	[INV_DATE] [datetime] NULL,
	[INV_SUBTOTAL] [real] NULL,
	[INV_TAX] [real] NULL,
	[INV_TOTAL] [real] NULL,
	[INV_PAY_TYPE] [nvarchar](5) NULL,
	[INV_PAY_AMOUNT] [real] NULL,
	[INV_BALANCE] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LINE]    Script Date: 18/03/2024 06:19:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LINE]
(
	[INV_NUMBER] [int] NULL,
	[LINE_NUMBER] [smallint] NULL,
	[PROD_CODE] [nvarchar](10) NULL,
	[LINE_UNITS] [real] NULL,
	[LINE_PRICE] [real] NULL,
	[LINE_AMOUNT] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 18/03/2024 06:19:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT]
(
	[PROD_CODE] [nvarchar](10) NULL,
	[PROD_DESCRIPT] [nvarchar](35) NULL,
	[PROD_INDATE] [datetime] NULL,
	[PROD_QOH] [smallint] NULL,
	[PROD_MIN] [smallint] NULL,
	[PROD_PRICE] [real] NULL,
	[PROD_DISCOUNT] [float] NULL,
	[VEND_NUMBER] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qryCustomer-Balance-for-Customer-10016]    Script Date: 18/03/2024 06:19:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qryCustomer-Balance-for-Customer-10016]
(
	[CUST_NUMBER] [int] NULL,
	[CUST_LNAME] [nvarchar](15) NULL,
	[CUST_FNAME] [nvarchar](15) NULL,
	[CUST_BALANCE] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qryCustomer-Invoice-Transactions-Grouped-by-Customer]    Script Date: 18/03/2024 06:19:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qryCustomer-Invoice-Transactions-Grouped-by-Customer]
(
	[CUST_NUMBER] [int] NULL,
	[CUST_LNAME] [nvarchar](15) NULL,
	[INV_NUMBER] [int] NULL,
	[INV_DATE] [datetime] NULL,
	[INV_TOTAL] [real] NULL,
	[INV_PAY_AMOUNT] [real] NULL,
	[INV_PAY_TYPE] [nvarchar](5) NULL,
	[INV_BALANCE] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qryCustomer-Transactions-by-Customer]    Script Date: 18/03/2024 06:19:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qryCustomer-Transactions-by-Customer]
(
	[CUST_NUMBER] [int] NULL,
	[CUST_LNAME] [nvarchar](15) NULL,
	[ACCT_TRANS_NUM] [int] NULL,
	[ACCT_TRANS_DATE] [datetime] NULL,
	[ACCT_TRANS_TYPE] [nvarchar](8) NULL,
	[ACCT_TRANS_AMOUNT] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qryList-all-Purchases-and-Group-by-Customer]    Script Date: 18/03/2024 06:19:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qryList-all-Purchases-and-Group-by-Customer]
(
	[CUST_NUMBER] [int] NULL,
	[CUST_LNAME] [nvarchar](15) NULL,
	[INV_NUMBER] [int] NULL,
	[LINE_NUMBER] [smallint] NULL,
	[PROD_CODE] [nvarchar](10) NULL,
	[LINE_UNITS] [real] NULL,
	[PROD_DESCRIPT] [nvarchar](35) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qryList-All-Purchases-by-Customer-10018]    Script Date: 18/03/2024 06:19:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qryList-All-Purchases-by-Customer-10018]
(
	[CUST_NUMBER] [int] NULL,
	[CUST_LNAME] [nvarchar](15) NULL,
	[INV_NUMBER] [int] NULL,
	[LINE_NUMBER] [smallint] NULL,
	[PROD_CODE] [nvarchar](10) NULL,
	[LINE_UNITS] [real] NULL,
	[PROD_DESCRIPT] [nvarchar](35) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qrySelected_PRODUCT-Table-Fields-for-PROD_CODE-89-WRE-Q]    Script Date: 18/03/2024 06:19:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qrySelected_PRODUCT-Table-Fields-for-PROD_CODE-89-WRE-Q]
(
	[PROD_CODE] [nvarchar](10) NULL,
	[PROD_DESCRIPT] [nvarchar](35) NULL,
	[PROD_INDATE] [datetime] NULL,
	[PROD_QOH] [smallint] NULL,
	[PROD_PRICE] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qrySelected-PRODUCT-Table-Fields-for-PROD_CODE-PVC23DRT]    Script Date: 18/03/2024 06:19:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qrySelected-PRODUCT-Table-Fields-for-PROD_CODE-PVC23DRT]
(
	[PROD_CODE] [nvarchar](10) NULL,
	[PROD_DESCRIPT] [nvarchar](35) NULL,
	[PROD_INDATE] [datetime] NULL,
	[PROD_QOH] [smallint] NULL,
	[PROD_PRICE] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qrySumLINE_AMOUNT-for-each-INV_NUMBER]    Script Date: 18/03/2024 06:19:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qrySumLINE_AMOUNT-for-each-INV_NUMBER]
(
	[INV_NUMBER] [int] NULL,
	[SumOfLINE_AMOUNT] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qryThe-ACCT-TRANSACTION-Table-Record-after-the-Purchase]    Script Date: 18/03/2024 06:19:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qryThe-ACCT-TRANSACTION-Table-Record-after-the-Purchase]
(
	[ACCT_TRANS_NUM] [int] NULL,
	[ACCT_TRANS_DATE] [datetime] NULL,
	[CUST_NUMBER] [int] NULL,
	[ACCT_TRANS_TYPE] [nvarchar](8) NULL,
	[ACCT_TRANS_AMOUNT] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qryThe-CUSTOMER-Table-Record-after-the-Purchase]    Script Date: 18/03/2024 06:19:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qryThe-CUSTOMER-Table-Record-after-the-Purchase]
(
	[CUST_NUMBER] [int] NULL,
	[CUST_LNAME] [nvarchar](15) NULL,
	[CUST_FNAME] [nvarchar](15) NULL,
	[CUST_BALANCE] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qryThe-PRODUCT-Table-Record-after-the-Purchase]    Script Date: 18/03/2024 06:19:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qryThe-PRODUCT-Table-Record-after-the-Purchase]
(
	[PROD_CODE] [nvarchar](10) NULL,
	[PROD_DESCRIPT] [nvarchar](35) NULL,
	[PROD_INDATE] [datetime] NULL,
	[PROD_QOH] [smallint] NULL,
	[PROD_MIN] [smallint] NULL,
	[PROD_PRICE] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENDOR]    Script Date: 18/03/2024 06:19:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENDOR]
(
	[VEND_NUMBER] [int] NULL,
	[VEND_NAME] [nvarchar](15) NULL,
	[VEND_CONTACT] [nvarchar](50) NULL,
	[VEND_AREACODE] [nvarchar](3) NULL,
	[VEND_PHONE] [nvarchar](8) NULL,
	[VEND_STATE] [nvarchar](2) NULL,
	[VEND_ORDER] [nvarchar](1) NULL
) ON [PRIMARY]
GO

-- Programar una estructura de control para determinar cuáles pedidos han sido enviados.


SELECT VEND_NUMBER, VEND_NAME, VEND_CONTACT, VEND_AREACODE, VEND_PHONE, VEND_STATE, VEND_ORDER
FROM VENDOR
WHERE VEND_ORDER = 'Y';

-- Programar una consulta para determinar los detalles de las facturas (INVOICE) expedidas en las últimas 24 horas.

SELECT *
FROM INVOICE
WHERE DATEDIFF(HOUR, INV_DATE, GETDATE()) <= 24;


-- Siendo que la tabla PRODUCT posee los códigos de vendedores que realizaron la venta, y la tabla VENDOR posee los códigos de todos los vendedores, realice una consulta que muestre aquellos vendedores que no han realizado ninguna venta. Envíeles una nota de amonestación.

SELECT CONCAT('El empleado con codigo ', VENDOR.VEND_NUMBER, ' debe generar ingresos.') AS NotaAmonestacion
FROM VENDOR
	LEFT JOIN PRODUCT ON VENDOR.VEND_NUMBER = PRODUCT.VEND_NUMBER
WHERE PRODUCT.VEND_NUMBER IS NULL;

-- Revisando la tabla de PRODUCT calcula al vendedor que posea el primero lugar en mayor PROD_PRICE imprime un mensaje de felicitaciones; al que tenga el menor record de ventas un mensaje de amonestación y a los demás envíeles una nota de ánimo.

WITH
	RankedVendors
	AS
	(
		SELECT VENDOR.VEND_NUMBER, SUM(LINE.LINE_AMOUNT) AS TotalVentas,
			ROW_NUMBER() OVER (ORDER BY SUM(LINE.LINE_AMOUNT) DESC) as SalesRank
		FROM VENDOR
			LEFT JOIN PRODUCT ON VENDOR.VEND_NUMBER = PRODUCT.VEND_NUMBER
			LEFT JOIN LINE ON PRODUCT.PROD_CODE = LINE.PROD_CODE
		GROUP BY VENDOR.VEND_NUMBER
	)
SELECT VEND_NUMBER, TotalVentas,
	CASE 
	WHEN TotalVentas IS NULL THEN '¡Amonestación! Este vendedor no ha realizado ninguna venta.'
	WHEN SalesRank = 1 THEN '¡Felicidades por ser el vendedor con el mayor precio de ventas!'
	WHEN SalesRank = (SELECT MAX(SalesRank)
	FROM RankedVendors) THEN ''
	ELSE '¡Sigue adelante y no te rindas! Siempre hay oportunidades para mejorar y crecer. ¡Tú puedes lograrlo!'
END as Mensaje
FROM RankedVendors
ORDER BY TotalVentas DESC;
GO

CREATE TRIGGER TX_ELIMINA
ON VENDOR
FOR DELETE
AS
IF EXISTS ( SELECT *
FROM PRODUCT
WHERE VEND_NUMBER =( SELECT VEND_NUMBER
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
IF (SELECT PROD_PRICE
	FROM INSERTED) <= 0 OR (SELECT PROD_PRICE
	FROM INSERTED) <= 0
    BEGIN
	PRINT 'El precio del producto no puede ser menor o igual a 0 o mayor a 1000'
	ROLLBACK TRANSACTION
END
ELSE
    PRINT 'Producto actualizado'
GO

-- Ejercicio. Elabore un trigger de actualización que arroje el mensaje indicado cuando la actualización de fecha sea actulice

DROP TRIGGER IF EXISTS TX_Actualizacion_Fecha;
GO

CREATE TRIGGER TX_Actualizacion_Fecha
ON dbo.PRODUCT
FOR UPDATE
AS
BEGIN
	IF EXISTS (SELECT *
	FROM inserted
	WHERE PROD_INDATE < '2010-01-01')
	BEGIN
		PRINT 'La fecha de actualización no puede ser menor a 2010.'
		ROLLBACK TRANSACTION
	END
END
GO

INSERT INTO PRODUCT
	(PROD_CODE, PROD_DESCRIPT, PROD_INDATE, PROD_QOH, PROD_MIN, PROD_PRICE, PROD_DISCOUNT, VEND_NUMBER)
VALUES
	('P12312', 'Producto obsoleto', '2000-01-01', 100, 10, 100.00, 0.00, 1);
GO

SELECT *
FROM PRODUCT;
-- Ejercicio. Elaborar un trigger que determine cuándo un Id a insertar pertenece a un producto obsoleto.

CREATE TABLE [dbo].[PRODUCT_OBSOLETE]
(
	[PROD_CODE] [nvarchar](10) NULL,
	[PROD_DESCRIPT] [nvarchar](35) NULL,
	[PROD_INDATE] [datetime] NULL,
	[PROD_QOH] [smallint] NULL,
	[PROD_MIN] [smallint] NULL,
	[PROD_PRICE] [real] NULL
) ON [PRIMARY]
GO

DROP TRIGGER IF EXISTS TX_Producto_Obsoleto;
GO

CREATE TRIGGER TX_Producto_Obsoleto
ON dbo.PRODUCT
FOR INSERT
AS
BEGIN
	IF EXISTS (SELECT *
	FROM inserted
	WHERE PROD_CODE IN (SELECT PROD_CODE
	FROM PRODUCT_OBSOLETE))
	BEGIN
		PRINT 'El producto insertado es obsoleto.'
	END
END
GO

INSERT INTO PRODUCT
	(PROD_CODE, PROD_DESCRIPT, PROD_INDATE, PROD_QOH, PROD_MIN, PROD_PRICE, PROD_DISCOUNT, VEND_NUMBER)
VALUES
	('P123', 'Producto obsoleto', '2020-01-01', 100, 10, 100.00, 0.00, 1);
GO

-- Ejercicio. Suponga que tiene una tabla con detalles de un pedido y una vista que agrega cantidades a los detalles del pedido por pedido. Corra el siguiente código para crear y llenar la tabla OrderDetails así como la vista OrderTotals la cual calcula la suma de la cantidad de pedidos por orden.

CREATE TABLE OrderDetails
(
	OrderID INT,
	ProductID INT,
	Quantity INT
);
GO

INSERT INTO OrderDetails
	(OrderID, ProductID, Quantity)
VALUES
	(1, 1, 10),
	(1, 2, 5),
	(2, 1, 8),
	(2, 3, 3),
	(3, 2, 12),
	(3, 3, 7);
GO

CREATE VIEW OrderTotals
AS
	SELECT OrderID, SUM(Quantity) AS TotalQuantity
	FROM OrderDetails
	GROUP BY OrderID;
GO

UPDATE OrderDetails
SET Quantity = Quantity * 2;