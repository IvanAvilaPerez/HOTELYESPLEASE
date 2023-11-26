-- =============================================
-- Author:	Iván Ávila Pérez
-- Create date: 26/11/2023
-- Description:	Procedimiento almacenado para CRUD en la tabla Habitaciones
-- =============================================
CREATE PROCEDURE [dbo].[MantenimientoHabitaciones]
    @operacion char(1) = NULL,
    @idHabitacion int = NULL,
    @tipoHabitacion varchar(50) = NULL,
    @precioNoche decimal(10, 2) = NULL,
    @capacidad int = NULL,
    @estado varchar(20) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Operacion S = Selecciona todas las habitaciones
    IF (@operacion = 'S')
    BEGIN
        SELECT [IdHabitacion],
               [TipoHabitacion],
               [PrecioNoche],
               [Capacidad],
               [Estado]
        FROM [HotelYesPlease].[dbo].[Habitaciones]
    END

    -- Operacion A = Selecciona una sola habitación
    IF (@operacion = 'A')
    BEGIN
        SELECT [IdHabitacion],
               [TipoHabitacion],
               [PrecioNoche],
               [Capacidad],
               [Estado]
        FROM [HotelYesPlease].[dbo].[Habitaciones]
        WHERE [IdHabitacion] = @idHabitacion
    END

    -- Operacion I = Inserta una nueva habitación
    IF (@operacion = 'I')
    BEGIN
        INSERT INTO [dbo].[Habitaciones]
                    ([IdHabitacion],
                     [TipoHabitacion],
                     [PrecioNoche],
                     [Capacidad],
                     [Estado])
        VALUES      (@idHabitacion,
                     @tipoHabitacion,
                     @precioNoche,
                     @capacidad,
                     @estado)
    END

    -- Operacion D = Elimina una habitación
    IF (@operacion = 'D')
    BEGIN
        DELETE FROM [dbo].[Habitaciones]
        WHERE [IdHabitacion] = @idHabitacion
    END

    -- Operacion U = Actualiza una habitación
    IF (@operacion = 'U')
    BEGIN
        UPDATE [dbo].[Habitaciones]
        SET    [TipoHabitacion] = @tipoHabitacion,
               [PrecioNoche] = @precioNoche,
               [Capacidad] = @capacidad,
               [Estado] = @estado
        WHERE  [IdHabitacion] = @idHabitacion
    END
END
GO
