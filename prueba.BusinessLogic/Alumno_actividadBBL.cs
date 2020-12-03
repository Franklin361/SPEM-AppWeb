using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.BusinessLogic
{
    public class Alumno_actividadBBL
    {
        public static string CalificarActividad( string actividad, string alumno, int cali)
        {
            string mensaje =DataAccess.Alumno_actividadDAL.CalificarActividad(actividad,alumno,cali);

            return mensaje;
        }
    }
}
