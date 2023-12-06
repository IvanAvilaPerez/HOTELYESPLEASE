using System;
using System.Collections.Generic;

namespace ProyectoHotel.Models
{
    public partial class Habitacione
    {
        public Habitacione()
        {
            Reservas = new HashSet<Reserva>();
        }

        public int IdHabitacion { get; set; }
        public string TipoHabitacion { get; set; } = null!;
        public decimal PrecioNoche { get; set; }
        public int Capacidad { get; set; }
        public string Estado { get; set; } = null!;

        public virtual ICollection<Reserva> Reservas { get; set; }
    }
}
