-- =============================================
-- Author:	Iván Ávila
-- Create date: 26/11/2023
-- Description:	Procedimiento almacenado para CRUD en la tabla Empleados
-- =============================================
CREATE PROCEDURE [dbo].[MantenimientoEmpleados]
    @operacion char(1) = NULL,
    @idEmpleado int = NULL,
    @nombre varchar(15) = NULL,
    @apellidoPaterno varchar(15) = NULL,
    @apellidoMaterno varchar(15) = NULL,
    @correoElectronico varchar(50) = NULL,
    @telefono varchar(20) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Operacion S = Selecciona todos los empleados
    IF (@operacion = 'S')
    BEGIN
        SELECT [IdEmpleado],
               [Nombre],
               [ApellidoPaterno],
               [ApellidoMaterno],
               [CorreoElectronico],
               [Telefono]
        FROM [HotelYesPlease].[dbo].[Empleados]
    END

    -- Operacion A = Selecciona un solo empleado
    IF (@operacion = 'A')
    BEGIN
        SELECT [IdEmpleado],
               [Nombre],
               [ApellidoPaterno],
               [ApellidoMaterno],
               [CorreoElectronico],
               [Telefono]
        FROM [HotelYesPlease].[dbo].[Empleados]
        WHERE [IdEmpleado] = @idEmpleado
    END

    -- Operacion I = Inserta un nuevo empleado
    IF (@operacion = 'I')
    BEGIN
        INSERT INTO [dbo].[Empleados]
                    ([IdEmpleado],
                     [Nombre],
                     [ApellidoPaterno],
                     [ApellidoMaterno],
                     [CorreoElectronico],
                     [Telefono])
        VALUES      (@idEmpleado,
                     @nombre,
                     @apellidoPaterno,
                     @apellidoMaterno,
                     @correoElectronico,
                     @telefono)
    END

    -- Operacion D = Elimina un empleado
    IF (@operacion = 'D')
    BEGIN
        DELETE FROM [dbo].[Empleados]
        WHERE [IdEmpleado] = @idEmpleado
    END

    -- Operacion U = Actualiza un empleado
    IF (@operacion = 'U')
    BEGIN
        UPDATE [dbo].[Empleados]
        SET    [Nombre] = @nombre,
               [ApellidoPaterno] = @apellidoPaterno,
               [ApellidoMaterno] = @apellidoMaterno,
               [CorreoElectronico] = @correoElectronico,
               [Telefono] = @telefono
        WHERE  [IdEmpleado] = @idEmpleado
    END
END
GO
