using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.Entities
{
    public class Alumno
    {
        [Key]
        public int Id_alumno { get; set; }

      
        public string Nombre_alumnoCompleto { get; set; }

     


        //relacion entre alumno-asistencia
        public virtual ICollection<Asistencia> Asistencias{ get; set; }

        //relación entre alumno-comentario
        public virtual ICollection<Mensaje_alumno_maestro> Mensaje_alumno_maestros { get; set; }

        //relacion entre alumno-grupo
        public virtual ICollection<Grupo_alumno> Grupo_alumnos { get; set; }

        //relacion entre alumno-actividad
        public virtual ICollection<Alumno_actividad> Alumno_actividades { get; set; }
    }
}
