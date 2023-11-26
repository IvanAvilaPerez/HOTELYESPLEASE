-- Crear la base de datos
CREATE DATABASE HotelYesPlease;

-- Usar la base de datos
USE HotelYesPlease;

-- Crear la tabla Empleados
CREATE TABLE Empleados (
    IdEmpleado INT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(15) NOT NULL,
    ApellidoPaterno VARCHAR(15) NOT NULL,
    ApellidoMaterno VARCHAR(15) NOT NULL,
    CorreoElectronico VARCHAR(50) NOT NULL,
    Telefono VARCHAR(20) NOT NULL
);

-- Crear la tabla Clientes
CREATE TABLE Clientes (
    IdCliente VARCHAR(20) PRIMARY KEY NOT NULL,
    Nombre VARCHAR(15) NOT NULL,
    ApellidoPaterno VARCHAR(15) NOT NULL,
    ApellidoMaterno VARCHAR(15) NOT NULL,
	Nacionalidad VARCHAR(20) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    CorreoElectronico VARCHAR(50) NOT NULL,
    Telefono VARCHAR(20) NOT NULL
);

-- Crear la tabla Habitaciones
CREATE TABLE Habitaciones (
    IdHabitacion INT PRIMARY KEY NOT NULL,
    TipoHabitacion VARCHAR(50) NOT NULL,
    PrecioNoche DECIMAL(10, 2) NOT NULL,
    Capacidad INT NOT NULL,
	Estado VARCHAR(20) NOT NULL,
);

-- Crear la tabla Reservas
CREATE TABLE Reservas (
    IdReserva INT PRIMARY KEY NOT NULL,
    IdCliente VARCHAR(20) NOT NULL,
	IdEmpleado INT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL,
    IdHabitacion INT NOT NULL,
	PrecioTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente),
	FOREIGN KEY (IdEmpleado) REFERENCES Empleados(IdEmpleado),
    FOREIGN KEY (IdHabitacion) REFERENCES Habitaciones(IdHabitacion)
);

-- Crear la tabla CheckIns
CREATE TABLE CheckIns (
    IdCheckIn INT PRIMARY KEY NOT NULL,
    IdReserva INT NOT NULL,
    FechaCheckIn DATETIME NOT NULL,
	Estado VARCHAR(25) NOT NULL,
    FOREIGN KEY (IdReserva) REFERENCES Reservas(IdReserva)
);

-- Crear la tabla CheckOuts
CREATE TABLE CheckOuts (
    IdCheckOut INT PRIMARY KEY NOT NULL,
    IdReserva INT NOT NULL,
    FechaCheckOut DATETIME NOT NULL,
	Estado VARCHAR(25) NOT NULL,
    FOREIGN KEY (IdReserva) REFERENCES Reservas(IdReserva)
);

-- Insertar habitaci�n 1
INSERT INTO [dbo].[Habitaciones] ([IdHabitacion], [TipoHabitacion], [PrecioNoche], [Capacidad], [Estado])
VALUES (1, 'Suite Presidencial', 150.00, 2, 'Disponible');

-- Insertar habitaci�n 2
INSERT INTO [dbo].[Habitaciones] ([IdHabitacion], [TipoHabitacion], [PrecioNoche], [Capacidad], [Estado])
VALUES (2, 'Habitaci�n Doble', 75.00, 2, 'Disponible');

-- Insertar habitaci�n 3
INSERT INTO [dbo].[Habitaciones] ([IdHabitacion], [TipoHabitacion], [PrecioNoche], [Capacidad], [Estado])
VALUES (3, 'Habitaci�n Individual', 50.00, 1, 'Disponible');

-- Insertar habitaci�n 4
INSERT INTO [dbo].[Habitaciones] ([IdHabitacion], [TipoHabitacion], [PrecioNoche], [Capacidad], [Estado])
VALUES (4, 'Suite Junior', 100.00, 2, 'Disponible');

-- Insertar habitaci�n 5
INSERT INTO [dbo].[Habitaciones] ([IdHabitacion], [TipoHabitacion], [PrecioNoche], [Capacidad], [Estado])
VALUES (5, 'Habitaci�n Familiar', 90.00, 4, 'Disponible');

-- Insertar habitaci�n 6
INSERT INTO [dbo].[Habitaciones] ([IdHabitacion], [TipoHabitacion], [PrecioNoche], [Capacidad], [Estado])
VALUES (6, 'Suite Ejecutiva', 125.00, 2, 'Disponible');

-- Insertar habitaci�n 7
INSERT INTO [dbo].[Habitaciones] ([IdHabitacion], [TipoHabitacion], [PrecioNoche], [Capacidad], [Estado])
VALUES (7, 'Habitaci�n Triple', 85.00, 3, 'Disponible');

-- Insertar habitaci�n 8
INSERT INTO [dbo].[Habitaciones] ([IdHabitacion], [TipoHabitacion], [PrecioNoche], [Capacidad], [Estado])
VALUES (8, 'Suite Familiar', 140.00, 4, 'Disponible');

-- Insertar habitaci�n 9
INSERT INTO [dbo].[Habitaciones] ([IdHabitacion], [TipoHabitacion], [PrecioNoche], [Capacidad], [Estado])
VALUES (9, 'Habitaci�n Econ�mica', 60.00, 1, 'Disponible');

-- Insertar habitaci�n 10
INSERT INTO [dbo].[Habitaciones] ([IdHabitacion], [TipoHabitacion], [PrecioNoche], [Capacidad], [Estado])
VALUES (10, 'Suite Nupcial', 150.00, 2, 'Disponible');

-- Insertar empleado 1
INSERT INTO [dbo].[Empleados] ([IdEmpleado], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [CorreoElectronico], [Telefono])
VALUES (1, 'Juan', 'P�rez', 'G�mez', 'juan.perez@gmail.com', '555-1234');

-- Insertar empleado 2
INSERT INTO [dbo].[Empleados] ([IdEmpleado], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [CorreoElectronico], [Telefono])
VALUES (2, 'Mar�a', 'L�pez', 'Garc�a', 'maria.lopez@gmail.com', '555-5678');

-- Insertar empleado 3
INSERT INTO [dbo].[Empleados] ([IdEmpleado], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [CorreoElectronico], [Telefono])
VALUES (3, 'Carlos', 'Mart�nez', 'Hern�ndez', 'carlos.martinez@gmail.com', '555-8765');

-- Insertar empleado 4
INSERT INTO [dbo].[Empleados] ([IdEmpleado], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [CorreoElectronico], [Telefono])
VALUES (4, 'Laura', 'G�mez', 'Fern�ndez', 'laura.gomez@gmail.com', '555-2345');

-- Insertar empleado 5
INSERT INTO [dbo].[Empleados] ([IdEmpleado], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [CorreoElectronico], [Telefono])
VALUES (5, 'Alejandro', 'Rodr�guez', 'P�rez', 'alejandro.rodriguez@gmail.com', '555-6789');

-- Insertar empleado 6
INSERT INTO [dbo].[Empleados] ([IdEmpleado], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [CorreoElectronico], [Telefono])
VALUES (6, 'Ana', 'S�nchez', 'Ram�rez', 'ana.sanchez@gmail.com', '555-7890');

-- Insertar empleado 7
INSERT INTO [dbo].[Empleados] ([IdEmpleado], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [CorreoElectronico], [Telefono])
VALUES (7, 'Javier', 'D�az', 'Vargas', 'javier.diaz@gmail.com', '555-4321');

-- Insertar empleado 8
INSERT INTO [dbo].[Empleados] ([IdEmpleado], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [CorreoElectronico], [Telefono])
VALUES (8, 'Sof�a', 'Torres', 'L�pez', 'sofia.torres@gmail.com', '555-0987');

-- Insertar empleado 9
INSERT INTO [dbo].[Empleados] ([IdEmpleado], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [CorreoElectronico], [Telefono])
VALUES (9, 'Miguel', 'Guti�rrez', 'Castillo', 'miguel.gutierrez@gmail.com', '555-8765');

-- Insertar empleado 10
INSERT INTO [dbo].[Empleados] ([IdEmpleado], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [CorreoElectronico], [Telefono])
VALUES (10, 'Isabel', 'Fern�ndez', 'Jim�nez', 'isabel.fernandez@gmail.com', '555-5678');

