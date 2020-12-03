using prueba.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.Linq;

namespace prueba.DataAccess
{
    public class AlumnoDAL
    {
        #region INIT
        public static string Init(string nombre, string pass, string grupo, int idGrupo)
        {
            string mensaje = "";

            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                /*informacion relacionada alumno-grupo*/
                var query = dbctx.Grupo_alumnos.Join(dbctx.Alumnos, x => x.Id_alumno, y => y.Id_alumno, (x, y) => new { x, y }).Where(z => z.y.Nombre_alumnoCompleto == nombre  && z.x.Id_grupo == idGrupo).SingleOrDefault();

                /*informacion relacionada con alumno*/
                var query_alumno = dbctx.Alumnos.Where(x => x.Nombre_alumnoCompleto == nombre).SingleOrDefault();

                /*informacion relacionada con grupo*/

                var query_grupo = dbctx.Grupos.Where(x => x.Nombre_grupo == grupo && x.pass_grupo == pass).SingleOrDefault();

                var query_grupoU = dbctx.Grupos.Where(x => x.Nombre_grupo == grupo).SingleOrDefault();

                var query_grupoP = dbctx.Grupos.Where(x => x.pass_grupo == pass).SingleOrDefault();


                if (query_alumno == null || query_grupo == null)
                {
                    if (query_grupo == null && query_alumno != null)
                    {
                        if (query_grupoP == null && query_grupoU != null)
                        {
                            mensaje = "contraseña no valida para el grupo ingresado";

                        }
                        else if (query_grupoU == null && query_grupoP != null)
                        {
                            mensaje = "nombre del grupo no es valido pero si la contraseña";
                        }
                        else
                        {
                            mensaje = "Nombre del grupo y contraseña del mismo no son validos";
                        }
                    }
                    else if (query_grupo != null && query_alumno == null)
                    {
                        mensaje = "El apellido y/o nombre del alumno no son validos";
                    }
                    else if (query_grupo == null && query_alumno == null)
                    {
                        mensaje = "Datos ingresados incorrectamente";
                    }

                }
                else if (query == null)
                {
                    mensaje = "El alumno no pertenece a este grupo";
                }
                else
                {
                    mensaje = "Inicio de sesion exitoso";
                }

            }

            return mensaje;

        }
        #endregion

        #region CrearAlumno
        public static bool CrearAlumno(string nombre, int idGrupo)
        {
            bool exito = false;
           
            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var AlumnoExisteGrupo = dbctx.Grupo_alumnos.Join(dbctx.Alumnos, x => x.Id_alumno, y => y.Id_alumno, (x, y) => new { x, y }).Where(z => z.y.Nombre_alumnoCompleto == nombre && z.x.Id_grupo == idGrupo).SingleOrDefault();

                var ALumnoExiste = dbctx.Alumnos.Where(x => x.Nombre_alumnoCompleto == nombre).Count();

                if (AlumnoExisteGrupo == null && ALumnoExiste == 0)
                {
                    Alumno al = new Alumno();
                    al.Nombre_alumnoCompleto = nombre;

                    dbctx.Alumnos.Add(al);
                    dbctx.SaveChanges();

                    var query = dbctx.Alumnos.Where(x => x.Nombre_alumnoCompleto == nombre).SingleOrDefault();

                    if (query != null)
                    { exito = true; }
                }
                else if (AlumnoExisteGrupo == null && ALumnoExiste != 0)
                {
                    var id = (from a in dbctx.Alumnos
                                    where a.Nombre_alumnoCompleto == nombre
                                    select a.Id_alumno).SingleOrDefault();

                    int idAlumno= Convert.ToInt32(id);

                    Grupo_alumno ga = new Grupo_alumno();
                    ga.Id_alumno = idAlumno;
                    ga.Id_grupo = idGrupo;

                    dbctx.Grupo_alumnos.Add(ga);
                    dbctx.SaveChanges();

                    var query = dbctx.Grupo_alumnos.Where(x => x.Id_grupo == idGrupo && x.Id_alumno == idAlumno).SingleOrDefault();

                    if (query != null)
                    { exito = true; }
                }

            }
           
            return exito;
        }
        #endregion

        #region ObtenerID
        public static int ObtenerID(string nombre)
        {
            int IdAlumno = 0;
            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var query = dbctx.Alumnos.Where(x => x.Nombre_alumnoCompleto == nombre).SingleOrDefault();

                if (query != null)
                {
                    IdAlumno = Convert.ToInt32(query.Id_alumno);
                }
            }
            return IdAlumno;
        }
        #endregion

        #region ObtenerAlumnosGrupo
        public static List<string> ObtenerAlumnosGrupo(string grupo)
        {
            List<string> nombres = new List<string>();

            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var query = dbctx.Grupos.Where(x => x.Nombre_grupo == grupo).Select(x => x.Id_grupo).SingleOrDefault();
                int idGrupo = Convert.ToInt32(query);

                var nombre = (from a in dbctx.Alumnos
                              join ga in dbctx.Grupo_alumnos on a.Id_alumno equals ga.Id_alumno
                              where ga.Id_grupo == idGrupo
                              select a.Nombre_alumnoCompleto).ToList();


                if (nombre != null)
                {
                    nombres = nombre;
                }
            }
                return nombres;
        }
        #endregion

        #region ObtneroNombreParaMensaje
        public static string ObtneroNombreParaMensaje(int id)
        {
            string nombre = string.Empty;
            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var query = (from a in dbctx.Alumnos
                             where a.Id_alumno == id
                             select a.Nombre_alumnoCompleto).SingleOrDefault();

                if (query != null)
                {
                    nombre = query.ToString();
                }
            }
                return nombre;
        }
        #endregion

        #region EditarAlumno
        public static string EditarAlumno(string nombreAlumno, int idAlumno)
        {
            string mensaje = "";

            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var validacion = dbctx.Alumnos.Where(x => x.Nombre_alumnoCompleto == nombreAlumno ).SingleOrDefault();

                if (validacion != null)
                {
                    mensaje = "Error, ese alumno ya existe";
                }
                else
                {
                   
                        var editar = dbctx.Alumnos.Where(x => x.Id_alumno == idAlumno).SingleOrDefault();
                        editar.Nombre_alumnoCompleto = nombreAlumno;
                        dbctx.SaveChanges();

                        var comprobar = dbctx.Alumnos.Where(x => x.Nombre_alumnoCompleto == nombreAlumno && x.Id_alumno == idAlumno).SingleOrDefault();

                        if (comprobar != null)
                        {
                            mensaje = "Se cambio el nombre del alumno correctamente";
                        }
                    
                }
            }
            return mensaje;
        }
        #endregion

        #region EliminarAlumno
        public static bool EliminarAlumno(int id)
        {
            bool borrado = false;
            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var fila = dbctx.Alumnos.Where(x => x.Id_alumno == id).SingleOrDefault();

                if (fila != null)
                {
                    dbctx.Alumnos.Remove(fila);
                    dbctx.SaveChanges();

                    var query = dbctx.Alumnos.Where(x => x.Id_alumno == id).SingleOrDefault();
                    if (query == null)
                    {
                        borrado = true;
                    }
                }
            }
            return borrado;
        }
        #endregion
    }
}
