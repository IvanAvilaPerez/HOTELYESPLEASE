-- =============================================
-- Author:	Iván Ávila Pérez
-- Create date: 26/11/2023
-- Description:	Procedimiento almacenado para CRUD en la tabla Reservas
-- =============================================
CREATE PROCEDURE [dbo].[MantenimientoReservas]
    @operacion char(1) = NULL,
    @idReserva int = NULL,
    @idCliente varchar(20) = NULL,
    @idEmpleado int = NULL,
    @fechaInicio date = NULL,
    @fechaFin date = NULL,
    @idHabitacion int = NULL,
    @precioTotal decimal(10, 2) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Operacion S = Selecciona todas las reservas
    IF (@operacion = 'S')
    BEGIN
        SELECT [IdReserva],
               [IdCliente],
               [IdEmpleado],
               [FechaInicio],
               [FechaFin],
               [IdHabitacion],
               [PrecioTotal]
        FROM [HotelYesPlease].[dbo].[Reservas]
    END

    -- Operacion A = Selecciona una sola reserva
    IF (@operacion = 'A')
    BEGIN
        SELECT [IdReserva],
               [IdCliente],
               [IdEmpleado],
               [FechaInicio],
               [FechaFin],
               [IdHabitacion],
               [PrecioTotal]
        FROM [HotelYesPlease].[dbo].[Reservas]
        WHERE [IdReserva] = @idReserva
    END

    -- Operacion I = Inserta una nueva reserva
    IF (@operacion = 'I')
    BEGIN
        INSERT INTO [dbo].[Reservas]
                    ([IdReserva],
                     [IdCliente],
                     [IdEmpleado],
                     [FechaInicio],
                     [FechaFin],
                     [IdHabitacion],
                     [PrecioTotal])
        VALUES      (@idReserva,
                     @idCliente,
                     @idEmpleado,
                     @fechaInicio,
                     @fechaFin,
                     @idHabitacion,
                     @precioTotal)
    END

    -- Operacion D = Elimina una reserva
    IF (@operacion = 'D')
    BEGIN
        DELETE FROM [dbo].[Reservas]
        WHERE [IdReserva] = @idReserva
    END

    -- Operacion U = Actualiza una reserva
    IF (@operacion = 'U')
    BEGIN
        UPDATE [dbo].[Reservas]
        SET    [IdCliente] = @idCliente,
               [IdEmpleado] = @idEmpleado,
               [FechaInicio] = @fechaInicio,
               [FechaFin] = @fechaFin,
               [IdHabitacion] = @idHabitacion,
               [PrecioTotal] = @precioTotal
        WHERE  [IdReserva] = @idReserva
    END
END
GO
