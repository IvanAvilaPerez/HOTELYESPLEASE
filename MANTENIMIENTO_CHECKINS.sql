-- =============================================
-- Author:	Iván Ávila Pérez
-- Create date: 26/11/2023
-- Description:	Procedimiento almacenado para CRUD en la tabla CheckIns
-- =============================================
CREATE PROCEDURE [dbo].[MantenimientoCheckIns]
    @operacion char(1) = NULL,
    @idCheckIn int = NULL,
    @idReserva int = NULL,
    @fechaCheckIn datetime = NULL,
    @estado varchar(25) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Operacion S = Selecciona todos los CheckIns
    IF (@operacion = 'S')
    BEGIN
        SELECT [IdCheckIn],
               [IdReserva],
               [FechaCheckIn],
               [Estado]
        FROM [HotelYesPlease].[dbo].[CheckIns]
    END

    -- Operacion A = Selecciona un solo CheckIn
    IF (@operacion = 'A')
    BEGIN
        SELECT [IdCheckIn],
               [IdReserva],
               [FechaCheckIn],
               [Estado]
        FROM [HotelYesPlease].[dbo].[CheckIns]
        WHERE [IdCheckIn] = @idCheckIn
    END

    -- Operacion I = Inserta un nuevo CheckIn
    IF (@operacion = 'I')
    BEGIN
        INSERT INTO [dbo].[CheckIns]
                    ([IdCheckIn],
                     [IdReserva],
                     [FechaCheckIn],
                     [Estado])
        VALUES      (@idCheckIn,
                     @idReserva,
                     @fechaCheckIn,
                     @estado)
    END

    -- Operacion D = Elimina un CheckIn
    IF (@operacion = 'D')
    BEGIN
        DELETE FROM [dbo].[CheckIns]
        WHERE [IdCheckIn] = @idCheckIn
    END

    -- Operacion U = Actualiza un CheckIn
    IF (@operacion = 'U')
    BEGIN
        UPDATE [dbo].[CheckIns]
        SET    [IdReserva] = @idReserva,
               [FechaCheckIn] = @fechaCheckIn,
               [Estado] = @estado
        WHERE  [IdCheckIn] = @idCheckIn
    END
END
GO
