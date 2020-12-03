using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.BusinessLogic
{
    public class ComentarioBBL
    {
        public static string[] Mensajes(int alumnoID, int idGrupo)
        {
            string[] mensajes = DataAccess.ComentarioDAL.Mensajes(alumnoID, idGrupo);
            return mensajes;
        }
        public static void AgregarMensaje(string mensaje, string fecha)
        {
            DataAccess.ComentarioDAL.AgregarMensaje(mensaje, fecha);
        }
        public static int ObtenerID(string mensaje, string fecha)
        {
            int id = Convert.ToInt32(DataAccess.ComentarioDAL.ObtenerID(mensaje, fecha));
            return id;
        }

        public static string[] MensajesMestro(int maestroID, string grupo)
        {
            string[] mensajes = DataAccess.ComentarioDAL.MensajesMestro(maestroID, grupo);
            return mensajes;
        }
    }
}
