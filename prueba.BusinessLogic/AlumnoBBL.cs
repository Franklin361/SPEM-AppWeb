using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.BusinessLogic
{
    public class AlumnoBBL
    {
        //metodo para inciar sesion como alumno
        #region Init
        public static string Init(string nombre, string pass, string grupo, int grupoID)
        {
            

            string mensaje = DataAccess.AlumnoDAL.Init(nombre, pass, grupo, grupoID);

           

            return mensaje;
        }
        #endregion

        //metodo para agregar alumno a la BD
        #region CrearAlumno
        public static string CrearAlumno(string nombre, int idGrupo)
        {
            string mensaje = string.Empty;
            bool exito = DataAccess.AlumnoDAL.CrearAlumno(nombre, idGrupo);

            if (exito)
            { mensaje = "Alumno agregado exitosamente al grupo seleccionado"; }
            else
            { mensaje = "Error, el alumno que intenta agregar ya existe"; }
            return mensaje;
        }
        #endregion

        #region ObtenerID
        public static int ObtenerID(string nombre)
        {
            int idAlumno = DataAccess.AlumnoDAL.ObtenerID(nombre);
            return idAlumno;
        }
        #endregion

        #region ObtenerAlumnosGrupo
        public static  List<string> ObtenerAlumnosGrupo(string grupo)
        {
            List<string> nombres = DataAccess.AlumnoDAL.ObtenerAlumnosGrupo(grupo);

            return nombres;
        }

        #endregion

        #region ObtneroNombreParaMensaje
        public static string ObtneroNombreParaMensaje(int id)
        {
            string nombre = DataAccess.AlumnoDAL.ObtneroNombreParaMensaje(id);
            return nombre;
        }

        #endregion

        #region EditarAlumno
        public static string EditarAlumno(string nombreAlumno, int idAlumno)
        {
            string mensaje = DataAccess.AlumnoDAL.EditarAlumno(nombreAlumno, idAlumno);
            return mensaje;
        }
        #endregion

        #region EliminarAlumno
        public static string EliminarAlumno(int id)
        {
            string mensaje = "";
            bool borrado = DataAccess.AlumnoDAL.EliminarAlumno(id);
            if (borrado)
            {
                mensaje = "Alumno eliminado correctamente";
            }
            else
            {
                mensaje = "Error, el alumno no existe";
            }

            return mensaje;
        }
        #endregion

    }
}
