using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace ProyectoHotel.Models
{
    public partial class HotelYesPleaseContext : DbContext
    {
        public HotelYesPleaseContext()
        {
        }

        public HotelYesPleaseContext(DbContextOptions<HotelYesPleaseContext> options)
            : base(options)
        {
        }

        public virtual DbSet<CheckIn> CheckIns { get; set; } = null!;
        public virtual DbSet<CheckOut> CheckOuts { get; set; } = null!;
        public virtual DbSet<Cliente> Clientes { get; set; } = null!;
        public virtual DbSet<Empleado> Empleados { get; set; } = null!;
        public virtual DbSet<Habitacione> Habitaciones { get; set; } = null!;
        public virtual DbSet<Reserva> Reservas { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CheckIn>(entity =>
            {
                entity.HasKey(e => e.IdCheckIn)
                    .HasName("PK__CheckIns__0C3EEE7A8E8B4A8B");

                entity.Property(e => e.IdCheckIn).ValueGeneratedNever();

                entity.Property(e => e.Estado)
                    .HasMaxLength(25)
                    .IsUnicode(false);

                entity.Property(e => e.FechaCheckIn).HasColumnType("datetime");

                entity.HasOne(d => d.IdReservaNavigation)
                    .WithMany(p => p.CheckIns)
                    .HasForeignKey(d => d.IdReserva)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__CheckIns__IdRese__412EB0B6");
            });

            modelBuilder.Entity<CheckOut>(entity =>
            {
                entity.HasKey(e => e.IdCheckOut)
                    .HasName("PK__CheckOut__789911D96A77AC90");

                entity.Property(e => e.IdCheckOut).ValueGeneratedNever();

                entity.Property(e => e.Estado)
                    .HasMaxLength(25)
                    .IsUnicode(false);

                entity.Property(e => e.FechaCheckOut).HasColumnType("datetime");

                entity.HasOne(d => d.IdReservaNavigation)
                    .WithMany(p => p.CheckOuts)
                    .HasForeignKey(d => d.IdReserva)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__CheckOuts__IdRes__440B1D61");
            });

            modelBuilder.Entity<Cliente>(entity =>
            {
                entity.HasKey(e => e.IdCliente)
                    .HasName("PK__Clientes__D5946642541E823A");

                entity.Property(e => e.IdCliente)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.ApellidoMaterno)
                    .HasMaxLength(15)
                    .IsUnicode(false);

                entity.Property(e => e.ApellidoPaterno)
                    .HasMaxLength(15)
                    .IsUnicode(false);

                entity.Property(e => e.CorreoElectronico)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FechaNacimiento).HasColumnType("date");

                entity.Property(e => e.Nacionalidad)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Nombre)
                    .HasMaxLength(15)
                    .IsUnicode(false);

                entity.Property(e => e.Telefono)
                    .HasMaxLength(20)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Empleado>(entity =>
            {
                entity.HasKey(e => e.IdEmpleado)
                    .HasName("PK__Empleado__CE6D8B9ED152A9C0");

                entity.Property(e => e.IdEmpleado).ValueGeneratedNever();

                entity.Property(e => e.ApellidoMaterno)
                    .HasMaxLength(15)
                    .IsUnicode(false);

                entity.Property(e => e.ApellidoPaterno)
                    .HasMaxLength(15)
                    .IsUnicode(false);

                entity.Property(e => e.CorreoElectronico)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Nombre)
                    .HasMaxLength(15)
                    .IsUnicode(false);

                entity.Property(e => e.Telefono)
                    .HasMaxLength(20)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Habitacione>(entity =>
            {
                entity.HasKey(e => e.IdHabitacion)
                    .HasName("PK__Habitaci__8BBBF9018E23006F");

                entity.Property(e => e.IdHabitacion).ValueGeneratedNever();

                entity.Property(e => e.Estado)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.PrecioNoche).HasColumnType("decimal(10, 2)");

                entity.Property(e => e.TipoHabitacion)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Reserva>(entity =>
            {
                entity.HasKey(e => e.IdReserva)
                    .HasName("PK__Reservas__0E49C69DC0B6F567");

                entity.Property(e => e.IdReserva).ValueGeneratedNever();

                entity.Property(e => e.FechaFin).HasColumnType("date");

                entity.Property(e => e.FechaInicio).HasColumnType("date");

                entity.Property(e => e.IdCliente)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.PrecioTotal).HasColumnType("decimal(10, 2)");

                entity.HasOne(d => d.IdClienteNavigation)
                    .WithMany(p => p.Reservas)
                    .HasForeignKey(d => d.IdCliente)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Reservas__IdClie__3C69FB99");

                entity.HasOne(d => d.IdEmpleadoNavigation)
                    .WithMany(p => p.Reservas)
                    .HasForeignKey(d => d.IdEmpleado)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Reservas__IdEmpl__3D5E1FD2");

                entity.HasOne(d => d.IdHabitacionNavigation)
                    .WithMany(p => p.Reservas)
                    .HasForeignKey(d => d.IdHabitacion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Reservas__IdHabi__3E52440B");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
