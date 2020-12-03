using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.Entities
{
    public class Alumno_actividad
    {
        
        
        public int calificacion { get; set; }



        [ForeignKey("Alumno")]
        public int Id_alumno { get; set; }
        public virtual Alumno Alumno { get; set; }


        [ForeignKey("Actividad")]
        public int Id_actividad { get; set; }
        public virtual Actividad Actividad { get; set; }

    }
}
