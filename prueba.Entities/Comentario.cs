using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.Entities
{
    public class Comentario
    {
        [Key]
        public int Id_mensaje { get; set; }

        [Required(ErrorMessage = "Mensaje es requerido")]
        public string Mensaje { get; set; }

        public string FechaMensaje { get; set; }

        //relación entre alumno-comentario
        public virtual ICollection<Mensaje_alumno_maestro> Mensaje_alumno_maestros { get; set; }
    }
}
