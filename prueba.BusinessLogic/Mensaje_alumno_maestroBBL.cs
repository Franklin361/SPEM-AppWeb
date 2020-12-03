using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.BusinessLogic
{
    public class Mensaje_alumno_maestroBBL
    {
        public static string AgregarMensaje(int idAlumno, int idGrupo, int idMensaje)
        {
            bool exito = DataAccess.Mensaje_alumno_maestroDAL.AgregarMensaje(idAlumno, idGrupo, idMensaje);
            string mensaje = "";
            if (exito)
            {
                mensaje = "Mensaje enviado correctamente";
            }
            else
            {
                mensaje = "Error";
            }
            return mensaje;
        }
        public static string AgregarMensajeMaestro(int idalumno, int idmensaje, int idmaestro)
        {
            bool exito = DataAccess.Mensaje_alumno_maestroDAL.AgregarMensajeMaestro(idalumno, idmensaje, idmaestro);
            string mensaje = "";
            if (exito)
            {
                mensaje = "Mensaje enviado correctamente";
            }
            else
            {
                mensaje = "Error";
            }
            return mensaje;
        }
    }
}
