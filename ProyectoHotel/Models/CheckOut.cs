using System;
using System.Collections.Generic;

namespace ProyectoHotel.Models
{
    public partial class CheckOut
    {
        public int IdCheckOut { get; set; }
        public int IdReserva { get; set; }
        public DateTime FechaCheckOut { get; set; }
        public string Estado { get; set; } = null!;

        public virtual Reserva IdReservaNavigation { get; set; } = null!;
    }
}
