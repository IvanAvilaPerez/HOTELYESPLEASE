using System;
using System.Collections.Generic;

namespace ProyectoHotel.Models
{
    public partial class Cliente
    {
        public Cliente()
        {
            Reservas = new HashSet<Reserva>();
        }

        public string IdCliente { get; set; } = null!;
        public string Nombre { get; set; } = null!;
        public string ApellidoPaterno { get; set; } = null!;
        public string ApellidoMaterno { get; set; } = null!;
        public string Nacionalidad { get; set; } = null!;
        public DateTime FechaNacimiento { get; set; }
        public string CorreoElectronico { get; set; } = null!;
        public string Telefono { get; set; } = null!;

        public virtual ICollection<Reserva> Reservas { get; set; }
    }
}
