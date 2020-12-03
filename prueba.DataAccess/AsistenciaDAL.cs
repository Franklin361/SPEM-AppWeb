using prueba.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.DataAccess
{
    public class AsistenciaDAL
    {
        #region Asistencia-Alumno
        public static Array Asistencia(int id)
        {
            Array tabla = null;
            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var fecha = (from f in dbctx.Asistencias where 
                             f.Id_alumno == id select new
                             {   FechaAsitencia = f.Fecha,
                                 Asistencia = f.Respuesta_asistencia
                            }).ToArray();

                tabla = fecha;    
            }
            return tabla;
        }
        #endregion

        #region ExportarAsistencia
        public static string[] ExportarAsistencia(int idlumno)
        {
            string[] asisistencias = new string[] { };

            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var fecha = (from f in dbctx.Asistencias
                             where f.Id_alumno == idlumno
                             select f.Fecha + "---"+ f.Respuesta_asistencia).ToArray();

                asisistencias = fecha;
            }

            return asisistencias;
        }
        #endregion

        #region Asistencia_Maestro
        public static bool GuardarAsistencia(string fecha, string asistencia, string nombre)
        {
            bool exito = false;

            

            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var idAlumno = (from a in dbctx.Alumnos where a.Nombre_alumnoCompleto == nombre select a.Id_alumno).SingleOrDefault();

                int id = Convert.ToInt32(idAlumno);

                var query = dbctx.Asistencias.Where(x => x.Fecha == fecha && x.Id_alumno == id).SingleOrDefault();

                if (query != null)
                {
                    //actualizar

                    query.Id_alumno = id;
                    query.Fecha = fecha;
                    query.Respuesta_asistencia = asistencia;

                    dbctx.SaveChanges();

                    exito = true;
                }
                else
                {
                    Asistencia asis = new Asistencia();
                    asis.Id_alumno = id;
                    asis.Respuesta_asistencia = asistencia;
                    asis.Fecha = fecha;

                    dbctx.Asistencias.Add(asis);
                    dbctx.SaveChanges();

                    var comprobar = dbctx.Asistencias.Where(x => x.Fecha == fecha && x.Id_alumno == id).SingleOrDefault();
                    if (comprobar != null)
                    {
                        exito = true;
                    }
                }

            }
            
                return exito;

        }
        #endregion

        #region ObtenerAsistenciasAlumnos
        public static Tuple<string[], string[]> ObtenerAsistenciasAlumnos( string fecha, string grupo)
        {
            string[] nombres = new string[] { };
            string[] asistencias = new string[] { };

            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var Alumnos = (from g in dbctx.Grupo_alumnos
                               join a in dbctx.Grupos on g.Id_grupo equals a.Id_grupo
                               where a.Nombre_grupo == grupo
                               select new { id = g.Id_alumno.ToString() }).ToList();

                string[] listaAlumnos = new string[] { };
                listaAlumnos = new string[Alumnos.Count()];

                int j = 0;
                foreach (var m in Alumnos)
                {
                    listaAlumnos[j] = m.id;
                    j++;
                }

                //...............................

                var nombre = (from a in dbctx.Alumnos
                              join b in dbctx.Asistencias on a.Id_alumno equals b.Id_alumno
                              where b.Fecha == fecha && listaAlumnos.Contains(a.Id_alumno.ToString())
                              select new { name = a.Nombre_alumnoCompleto }).ToList();
                
                var asistencia = (from a in dbctx.Alumnos
                                  join b in dbctx.Asistencias on a.Id_alumno equals b.Id_alumno
                                  where b.Fecha == fecha && listaAlumnos.Contains(a.Id_alumno.ToString())
                                  select new { valor = b.Respuesta_asistencia.ToString() }).ToList();


                int cantidadConsultas = nombre.Count();
                int cantidadValores = asistencia.Count();
                int indice = 0;
                int inidceDos = 0;
                nombres = new string[cantidadConsultas];
                asistencias = new string[cantidadValores];

                foreach (dynamic n in  nombre)
                {
                    nombres[indice] = n.name;
                    indice = indice + 1;
                }

                foreach (dynamic v in asistencia)
                {
                    asistencias[inidceDos] = v.valor;
                    inidceDos = inidceDos + 1;
                }

            }

                return Tuple.Create(nombres, asistencias);
        }
        #endregion
    }
}
