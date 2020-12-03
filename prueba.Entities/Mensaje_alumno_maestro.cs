using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.Entities
{
    public class Mensaje_alumno_maestro
    {
    


        [ForeignKey("maestro")]
        public int Id_maestro { get; set; }
        public virtual maestro maestro { get; set; }


        [ForeignKey("Alumno")]
        public int Id_alumno { get; set; }
        public virtual Alumno Alumno { get; set; }



        [ForeignKey("Comentario")]
        public int Id_mensaje { get; set; }
        public virtual Comentario Comentario { get; set; }
    }
}
