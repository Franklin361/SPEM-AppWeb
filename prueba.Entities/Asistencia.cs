using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.Entities
{
    public class Asistencia
    {
        public string Fecha { get; set; }

        public string Respuesta_asistencia { get; set; }

        // se agrega la relacion entre alumno y asistencia

        [ForeignKey("Alumno")]
        public int Id_alumno { get; set; }

        public virtual Alumno Alumno { get; set; }

    }
}
