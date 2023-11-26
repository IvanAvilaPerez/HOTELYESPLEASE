-- =============================================
-- Author:	Iván Ávila Pérez
-- Create date: 26/11/2023
-- Description:	Procedimiento almacenado para CRUD en la tabla CheckOuts
-- =============================================
CREATE PROCEDURE [dbo].[MantenimientoCheckOuts]
    @operacion char(1) = NULL,
    @idCheckOut int = NULL,
    @idReserva int = NULL,
    @fechaCheckOut datetime = NULL,
    @estado varchar(25) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Operacion S = Selecciona todos los CheckOuts
    IF (@operacion = 'S')
    BEGIN
        SELECT [IdCheckOut],
               [IdReserva],
               [FechaCheckOut],
               [Estado]
        FROM [HotelYesPlease].[dbo].[CheckOuts]
    END

    -- Operacion A = Selecciona un solo CheckOut
    IF (@operacion = 'A')
    BEGIN
        SELECT [IdCheckOut],
               [IdReserva],
               [FechaCheckOut],
               [Estado]
        FROM [HotelYesPlease].[dbo].[CheckOuts]
        WHERE [IdCheckOut] = @idCheckOut
    END

    -- Operacion I = Inserta un nuevo CheckOut
    IF (@operacion = 'I')
    BEGIN
        INSERT INTO [dbo].[CheckOuts]
                    ([IdCheckOut],
                     [IdReserva],
                     [FechaCheckOut],
                     [Estado])
        VALUES      (@idCheckOut,
                     @idReserva,
                     @fechaCheckOut,
                     @estado)
    END

    -- Operacion D = Elimina un CheckOut
    IF (@operacion = 'D')
    BEGIN
        DELETE FROM [dbo].[CheckOuts]
        WHERE [IdCheckOut] = @idCheckOut
    END

    -- Operacion U = Actualiza un CheckOut
    IF (@operacion = 'U')
    BEGIN
        UPDATE [dbo].[CheckOuts]
        SET    [IdReserva] = @idReserva,
               [FechaCheckOut] = @fechaCheckOut,
               [Estado] = @estado
        WHERE  [IdCheckOut] = @idCheckOut
    END
END
GO
