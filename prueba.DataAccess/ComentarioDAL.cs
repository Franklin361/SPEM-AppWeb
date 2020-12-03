using prueba.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.DataAccess
{
    public class ComentarioDAL
    {
        public static string[] Mensajes(int alumnoID, int idGrupo)
        {
            string[] mensajes = new string[] { };

            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var Maestros = (from g in dbctx.Grupos
                               where g.Id_grupo == idGrupo
                               select g.Id_maestro).SingleOrDefault();

                int idmaestro = Convert.ToInt32(Maestros);

                var query = (from a in dbctx.Mensaje_alumno_maestros
                             join b in dbctx.Comentarios on a.Id_mensaje equals b.Id_mensaje
                             where a.Id_alumno == alumnoID && a.Id_maestro == idmaestro orderby b.Id_mensaje descending
                             select new
                             {
                                 texto = b.Mensaje.ToString()
                             }).ToArray();


                mensajes = new string[query.Length];

                int i = 0;

                foreach(var m in query)
                {
                    mensajes[i] = m.texto;
                    i++;
                }
            }

                return mensajes;
        }

        public static void AgregarMensaje(string mensaje, string fecha)
        {
          
            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                
                    Comentario c = new Comentario();
                    c.Mensaje = mensaje;
                    c.FechaMensaje = fecha;

                    dbctx.Comentarios.Add(c);
                    dbctx.SaveChanges();
                
            }
               
        }

        public static int ObtenerID(string mensaje, string fecha)
        {
            int id = 0;
            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var idm = (from c in dbctx.Comentarios
                           where c.Mensaje == mensaje && c.FechaMensaje == fecha
                           select c.Id_mensaje.ToString()).SingleOrDefault();
                
                if (idm != null)
                {
                    id = Convert.ToInt32(idm);
                }
            }
                return id;
        }

        public static string[] MensajesMestro(int maestroID, string grupo)
        {
            string[] mensajes = new string[] { };

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

                var query = (from a in dbctx.Mensaje_alumno_maestros
                             join b in dbctx.Comentarios on a.Id_mensaje equals b.Id_mensaje
                             where a.Id_maestro == maestroID && listaAlumnos.Contains(a.Id_alumno.ToString()) orderby b.Id_mensaje descending
                             select new
                             {
                                 texto = b.Mensaje.ToString()
                             }).ToArray();

                mensajes = new string[query.Length];

                int i = 0;

                foreach (var m in query)
                {
                    mensajes[i] = m.texto;
                    i++;
                }
            }

            return mensajes;
        }
    }
}
