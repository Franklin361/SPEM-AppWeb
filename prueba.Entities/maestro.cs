using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.Entities
{
    public class maestro
    {
        [Key]
        public int Id_maestro { get; set; }

        [Required (ErrorMessage ="El nombre es obligatorio")]
        public string Nombre_maestro { get; set; }

        [Required(ErrorMessage = "El apellido es obligatorio")]
        public string Apellido_maestro { get; set; }

        [Required(ErrorMessage = "El usuario es obligatorio")]
        public string Usuario_maestro { get; set; }

     

        [Required(ErrorMessage = "La contraseña es obligatorio")]
        public string Pass_maestro { get; set; }

        [Required(ErrorMessage = "El correo electronico es obligatorio")]
        public string Email { get; set; }




        //se agrega la FK para la relacion entre maestro y grupo
        public virtual ICollection<Grupo> Grupos { get; set; }
        
        //relación entre alumno-comentario
        public virtual ICollection<Mensaje_alumno_maestro> Mensaje_alumno_maestros { get; set; }
    }
}
