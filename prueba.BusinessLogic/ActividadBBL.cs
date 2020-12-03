using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.BusinessLogic
{
    public class ActividadBBL
    {
        #region ObtenerActividades
        public static Tuple<string[], string[], string[]> ObtenerActividades(int idAlumno)
        {
            string[] name = DataAccess.ActividadDAL.ObtenerActividades(idAlumno).Item1;
            string[] value = DataAccess.ActividadDAL.ObtenerActividades(idAlumno).Item2;
            string[] valortotal = DataAccess.ActividadDAL.ObtenerActividades(idAlumno).Item3;


            return Tuple.Create(name,value, valortotal);
        }
        #endregion

        #region ObtenerActvidadesGrupoMaestro
        public static List<string> ObtenerActvidadesGrupoMaestro(string grupo)
        {
            List<string> lista = null;
            lista = DataAccess.ActividadDAL.ObtenerActvidadesGrupoMaestro(grupo);
            return lista;
        }
        #endregion

        #region ObtenerActvidadesGrupoMaestro
        public static List<string> ObtenerActvidadesValorGrupoMaestro(string grupo)
        {
            List<string> lista = null;
            lista = DataAccess.ActividadDAL.ObtenerActvidadesValorGrupoMaestro(grupo);
            return lista;
        }
        #endregion

        #region AgregarActividad

        public static string AgregarActividad(int Idgrupo, string nombreAct, string valor)
        {
           
            string mensaje = DataAccess.ActividadDAL.AgregarActividad(Idgrupo, nombreAct, valor);
            
            return mensaje;
        }
        #endregion

        #region ObtenerID
        public static int ObtenerID(string nombreAct)
        {
            int id = DataAccess.ActividadDAL.ObtenerID(nombreAct);
            return id;
        }
        #endregion

        #region EditarActividad
        public static string EditarActividad(string nombreActividad, string valor, int idAct)
        {
            string mensaje = DataAccess.ActividadDAL.EditarActividad(nombreActividad, valor, idAct);
            return mensaje;
        }
        #endregion

        #region EliminarActividad
        public static string EliminarActividad(int id)
        {
            string mensaje = "";
            bool borrado = DataAccess.ActividadDAL.EliminarActividad(id);
            if (borrado)
            {
                mensaje = "Actividad eliminada correctamente";
            }
            else
            {
                mensaje = "Error, esa actividad no existe";
            }

            return mensaje;
        }
        #endregion

        #region ExportarActividad
        public static string[] ExportarActividad(int idAlumno)
        {
            string[] actividades = DataAccess.ActividadDAL.ExportarActividad(idAlumno);
            return actividades;
        }
        #endregion
    }
}
