using System;
using System.Collections.Generic;

namespace ProyectoHotel.Models
{
    public partial class Empleado
    {
        public Empleado()
        {
            Reservas = new HashSet<Reserva>();
        }

        public int IdEmpleado { get; set; }
        public string Nombre { get; set; } = null!;
        public string ApellidoPaterno { get; set; } = null!;
        public string ApellidoMaterno { get; set; } = null!;
        public string CorreoElectronico { get; set; } = null!;
        public string Telefono { get; set; } = null!;

        public virtual ICollection<Reserva> Reservas { get; set; }
    }
}
