using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.Entities
{
    public class Grupo
    {
        [Key]
        public int Id_grupo { get; set; }

        [Required(ErrorMessage = "nombre obligatorio")]
        public string Nombre_grupo { get; set; }

        [Required(ErrorMessage = "contraseña obligatoria")]
        public string pass_grupo { get; set; }

        // se agrega la relacion entre maestro y grupo

        [ForeignKey("maestro")]
        public int Id_maestro { get; set; }
        public virtual maestro maestro { get; set; }


        //relacion entre alumno-grupo
        public virtual ICollection<Grupo_alumno> Grupo_alumnos { get; set; }

        public virtual ICollection<Actividad> Actividades { get; set; }
    }
}
