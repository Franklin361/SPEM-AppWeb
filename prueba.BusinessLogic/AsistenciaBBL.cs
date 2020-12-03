using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.BusinessLogic
{
    public class AsistenciaBBL
    {
        #region Asistencia
        public static Array Asistencia(int id)
        {
            Array tabla = DataAccess.AsistenciaDAL.Asistencia(id);

            return tabla;
        }
        #endregion

        #region GuardarAsistencia
        public static string GuardarAsistencia(string fecha, string asistencia, string nombre)
        {
            string mensaje = ""; 
            bool a = DataAccess.AsistenciaDAL.GuardarAsistencia(fecha, asistencia, nombre);
            if (a)
            {
                mensaje = "Se agrego la asistencia correctamente";
            }
            else
            {
                mensaje = "Error";
            }
            return mensaje;
        }
        #endregion

        #region ObtenerAsistenciasAlumnos
        public static Tuple<string[], string[]> ObtenerAsistenciasAlumnos(string fecha,string grupo )
        {
            string[] nombres = DataAccess.AsistenciaDAL.ObtenerAsistenciasAlumnos(fecha,grupo).Item1;
            string[] asistencias  = DataAccess.AsistenciaDAL.ObtenerAsistenciasAlumnos(fecha,grupo).Item2;

            return Tuple.Create(nombres, asistencias);
        }
        #endregion

        #region ExportarAsistencia
        public static string[] ExportarAsistencia(int idlumno)
        {
            string[] asisstencias = DataAccess.AsistenciaDAL.ExportarAsistencia(idlumno);
            return asisstencias;
        }
        #endregion
    }
}
