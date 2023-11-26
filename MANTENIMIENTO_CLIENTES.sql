-- =============================================
-- Author:	Iván Ávila Pérez
-- Create date: 26/11/2023
-- Description:	Procedimiento almacenado para CRUD en la tabla Clientes
-- =============================================
CREATE PROCEDURE [dbo].[MantenimientoClientes]
    @operacion char(1) = NULL,
    @idCliente varchar(20) = NULL,
    @nombre varchar(15) = NULL,
    @apellidoPaterno varchar(15) = NULL,
    @apellidoMaterno varchar(15) = NULL,
    @nacionalidad varchar(20) = NULL,
    @fechaNacimiento DATE = NULL,
    @correoElectronico varchar(50) = NULL,
    @telefono varchar(20) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Operacion S = Selecciona todos los clientes
    IF (@operacion = 'S')
    BEGIN
        SELECT [IdCliente],
               [Nombre],
               [ApellidoPaterno],
               [ApellidoMaterno],
               [Nacionalidad],
               [FechaNacimiento],
               [CorreoElectronico],
               [Telefono]
        FROM [HotelYesPlease].[dbo].[Clientes]
    END

    -- Operacion A = Selecciona un solo cliente
    IF (@operacion = 'A')
    BEGIN
        SELECT [IdCliente],
               [Nombre],
               [ApellidoPaterno],
               [ApellidoMaterno],
               [Nacionalidad],
               [FechaNacimiento],
               [CorreoElectronico],
               [Telefono]
        FROM [HotelYesPlease].[dbo].[Clientes]
        WHERE [IdCliente] = @idCliente
    END

    -- Operacion I = Inserta un nuevo cliente
    IF (@operacion = 'I')
    BEGIN
        INSERT INTO [dbo].[Clientes]
                    ([IdCliente],
                     [Nombre],
                     [ApellidoPaterno],
                     [ApellidoMaterno],
                     [Nacionalidad],
                     [FechaNacimiento],
                     [CorreoElectronico],
                     [Telefono])
        VALUES      (@idCliente,
                     @nombre,
                     @apellidoPaterno,
                     @apellidoMaterno,
                     @nacionalidad,
                     @fechaNacimiento,
                     @correoElectronico,
                     @telefono)
    END

    -- Operacion D = Elimina un cliente
    IF (@operacion = 'D')
    BEGIN
        DELETE FROM [dbo].[Clientes]
        WHERE [IdCliente] = @idCliente
    END

    -- Operacion U = Actualiza un cliente
    IF (@operacion = 'U')
    BEGIN
        UPDATE [dbo].[Clientes]
        SET    [Nombre] = @nombre,
               [ApellidoPaterno] = @apellidoPaterno,
               [ApellidoMaterno] = @apellidoMaterno,
               [Nacionalidad] = @nacionalidad,
               [FechaNacimiento] = @fechaNacimiento,
               [CorreoElectronico] = @correoElectronico,
               [Telefono] = @telefono
        WHERE  [IdCliente] = @idCliente
    END
END
GO
