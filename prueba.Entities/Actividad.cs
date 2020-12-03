using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.Entities
{
    public class Actividad
    {
        [Key]
        public int Id_actividad { get; set; }

        [Required(ErrorMessage = "El nombre del grupo es requerido")]
        public string Nombre_actividad { get; set; }

        public int Valor_actividad { get; set; }


        [ForeignKey("Grupo")]
        public int Id_grupo { get; set; }
        public virtual Grupo Grupo { get; set; }


        //relacion entre alumno-actividad
        public virtual ICollection<Alumno_actividad> Alumno_actividades { get; set; }


    }
}
