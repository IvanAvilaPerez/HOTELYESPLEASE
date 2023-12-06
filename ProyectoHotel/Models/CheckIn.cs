using System;
using System.Collections.Generic;

namespace ProyectoHotel.Models
{
    public partial class CheckIn
    {
        public int IdCheckIn { get; set; }
        public int IdReserva { get; set; }
        public DateTime FechaCheckIn { get; set; }
        public string Estado { get; set; } = null!;

        public virtual Reserva IdReservaNavigation { get; set; } = null!;
    }
}
