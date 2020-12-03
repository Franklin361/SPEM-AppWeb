using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.Entities
{
    public class Grupo_alumno
    {
       

        [ForeignKey("Grupo")]
        public int Id_grupo { get; set; }
        public virtual Grupo Grupo { get; set; }


        [ForeignKey("Alumno")]
        public int Id_alumno { get; set; }
        public virtual Alumno Alumno { get; set; }
    }
}
