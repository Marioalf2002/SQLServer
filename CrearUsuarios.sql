-- Crear un perfil
CREATE PROFILE NAME_PROFILE
LIMIT
    FAILED_LOGIN_ATTEMPTS = 3
    PASSWORD_LIFE_TIME = 90
    PASSWORD_LOCK_TIME = 1
    PASSWORD_GRACE_TIME = 3
    PASSWORD_REUSE_TIME = 365
    PASSWORD_REUSE_MAX = 10
    PASSWORD_VERIFY_FUNCTION = NULL;
GO

-- Crear un rol
CREATE ROLE NAME_ROLE;
GO

-- Crear un usuario
CREATE USER NAME_USER
IDENTIFIED BY PASSWORD
    DEFAULT TABLESPACE NAME_TABLESPACE
    TEMPORARY TABLESPACE NAME_TABLESPACE
    PROFILE NAME_PROFILE
    ACCOUNT UNLOCK;
GO

-- Asignar un rol a un usuario
GRANT NAME_ROLE TO NAME_USER;
GO

-- Crear login
CREATE LOGIN NAME_USUARIO
    WITH PASSWORD = 'PASSWORD',
    DEFAULT_DATABASE = MisNegocios;
GO

-- Asignar un rol a un login
GRANT NAME_ROLE TO NAME_LOGIN;
GO

-- Usar la base de datos MisNegocios
USE MisNegocios;
GO

-- Crear usuario asociado al login
CREATE USER NAME_USUARIO
    FOR LOGIN NAME_USUARIO;
GO

-- Asignar roles al usuario
ALTER ROLE db_datareader ADD MEMBER NAME_USUARIO;
-- Permite leer datos
ALTER ROLE db_datawriter ADD MEMBER NAME_USUARIO;
-- Permite escribir datos
ALTER ROLE db_ddladmin ADD MEMBER NAME_USUARIO; -- Permite realizar operaciones DDL
GO

-- Dar permisos al usuario
GRANT CREATE PROCEDURE TO NAME_USUARIO;
-- Puede crear procedimientos
GRANT CREATE FUNCTION TO NAME_USUARIO;
-- Puede crear funciones
GRANT CREATE TABLE TO NAME_USUARIO;
-- Puede crear tablas
GRANT CREATE VIEW TO NAME_USUARIO;
-- Puede crear vistas
GRANT CREATE TRIGGER TO NAME_USUARIO;
-- Puede crear triggers
GRANT CREATE INDEX TO NAME_USUARIO;
-- Puede crear índices
GRANT CREATE ASSEMBLY TO NAME_USUARIO;
-- Puede crear ensamblados
GRANT CREATE ROLE TO NAME_USUARIO;
-- Puede crear roles
GRANT CREATE USER TO NAME_USUARIO;
-- Puede crear usuarios
GRANT CREATE TYPE TO NAME_USUARIO;
-- Puede crear tipos
GRANT CREATE SCHEMA TO NAME_USUARIO;
-- Puede crear esquemas
GRANT CREATE SYNONYM TO NAME_USUARIO;
-- Puede crear sinónimos
GRANT CREATE AGGREGATE TO NAME_USUARIO;
-- Puede crear agregados
GRANT CREATE DEFAULT TO NAME_USUARIO;
-- Puede crear valores predeterminados
GRANT CREATE RULE TO NAME_USUARIO;
-- Puede crear reglas
GRANT CREATE XML SCHEMA COLLECTION TO NAME_USUARIO;
-- Puede crear colecciones de esquemas XML
GRANT CREATE MESSAGE TYPE TO NAME_USUARIO;
-- Puede crear tipos de mensaje
GRANT CREATE CONTRACT TO NAME_USUARIO;
-- Puede crear contratos
GRANT CREATE SERVICE TO NAME_USUARIO;
-- Puede crear servicios
GRANT CREATE QUEUE TO NAME_USUARIO;
-- Puede crear colas
GRANT CREATE REMOTE SERVICE BINDING TO NAME_USUARIO;
-- Puede crear enlaces de servicio remoto
GRANT CREATE ROUTE TO NAME_USUARIO;
-- Puede crear rutas
GRANT CREATE SYMMETRIC KEY TO NAME_USUARIO;
-- Puede crear claves simétricas
GRANT CREATE CERTIFICATE TO NAME_USUARIO;
-- Puede crear certificados
GRANT CREATE DATABASE DDL EVENT NOTIFICATION TO NAME_USUARIO; -- Puede crear notificaciones de eventos DDL de base de datos
GO

-- Copia de seguridad completa
USE MisNegocios;
GO
BACKUP DATABASE MisNegocios
    TO DISK = 'C:\Users\Luisana\Documents'
    WITH FORMAT;
GO

-- Copia de seguridad diferencial
USE MisNegocios;
GO
BACKUP DATABASE MisNegocios
    TO DISK = 'D:\bakup'
    WITH DIFFERENTIAL;
GO

-- Restaurar base de datos
USE master;
GO
RESTORE DATABASE MisNegocios
    FROM DISK = 'C:\Users\Luisana\Documents\backup.bak'
    WITH REPLACE;
GO
