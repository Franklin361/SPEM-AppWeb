using prueba.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.BusinessLogic
{
    public class GrupoBBL
    {
        #region ObtenerGrupos
        public static List<string> ObtenerGrupos(int id)
        {
            List<string> lista = DataAccess.GrupoDAL.ObtenerGrupos(id);
            return lista;
        }
        #endregion

        #region GrupoUnitarioAlumno
        public static string GrupoUnitarioAlumno(int idGrupo)
        {
            string grupo = DataAccess.GrupoDAL.GrupoUnitarioAlumno(idGrupo);
            return grupo;
        }
        #endregion

        #region ObtenerGruposPassword
        public static Tuple<string[], string[]> ObtenerGruposPassword(int id)
        {
            string[] grupo = DataAccess.GrupoDAL.ObtenerGruposPassword(id).Item1;
            string[] pass = DataAccess.GrupoDAL.ObtenerGruposPassword(id).Item2;

            return Tuple.Create(grupo, pass);
        }
        #endregion

        #region CrearGrupo
        public static string CrearGrupo(string nombreGrupo, string passGrupo, int id)
        {
            string mensaje = DataAccess.GrupoDAL.CrearGrupo(nombreGrupo,passGrupo,id);
            return mensaje;
        }
        #endregion

        #region ObtenreID
        public static int ObtenerID(string grupo)
        {
            int id = DataAccess.GrupoDAL.ObtenerID(grupo);

            return id;
        }
        #endregion

        #region EditarGrupo
        public static string EditarGrupo(string nombreGrupo, string password, int idgrupo)
        {
            string mensaje = DataAccess.GrupoDAL.EditarGrupo(nombreGrupo, password, idgrupo);
            return mensaje;
        }
        #endregion

        #region EliminarGrupo
        public static string EliminarGrupo(int id)
        {
            string mensaje = "";
            bool borrado = DataAccess.GrupoDAL.EliminarGrupo(id);
            if (borrado) {
                mensaje = "Grupo eliminado correctamente";
            }
            else
            {
                mensaje = "Error, el grupo no existe";
            }
            
            return mensaje;
        }
        #endregion
    }
}
