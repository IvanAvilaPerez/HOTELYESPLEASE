using System;
using System.Collections.Generic;

namespace ProyectoHotel.Models
{
    public partial class Reserva
    {
        public Reserva()
        {
            CheckIns = new HashSet<CheckIn>();
            CheckOuts = new HashSet<CheckOut>();
        }

        public int IdReserva { get; set; }
        public string IdCliente { get; set; } = null!;
        public int IdEmpleado { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }
        public int IdHabitacion { get; set; }
        public decimal PrecioTotal { get; set; }

        public virtual Cliente IdClienteNavigation { get; set; } = null!;
        public virtual Empleado IdEmpleadoNavigation { get; set; } = null!;
        public virtual Habitacione IdHabitacionNavigation { get; set; } = null!;
        public virtual ICollection<CheckIn> CheckIns { get; set; }
        public virtual ICollection<CheckOut> CheckOuts { get; set; }
    }
}
