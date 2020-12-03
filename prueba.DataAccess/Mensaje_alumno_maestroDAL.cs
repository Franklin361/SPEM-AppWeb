using prueba.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.DataAccess
{
    public class Mensaje_alumno_maestroDAL
    {
        public static bool AgregarMensaje(int idAlumno, int idGrupo, int idMensaje)
        {
            bool exito = false;
            using(pruebaDbContext dbctx = new pruebaDbContext())
            {
                var Maestroid = (from m in dbctx.Grupos
                                 where m.Id_grupo == idGrupo
                                 select m.Id_maestro).SingleOrDefault();
                int idMaestro = Convert.ToInt32(Maestroid);

                Mensaje_alumno_maestro mam = new Mensaje_alumno_maestro();
                mam.Id_alumno = idAlumno;
                mam.Id_maestro = idMaestro;
                mam.Id_mensaje = idMensaje;

                dbctx.Mensaje_alumno_maestros.Add(mam);
                dbctx.SaveChanges();

                var query = dbctx.Mensaje_alumno_maestros.Where(x => x.Id_mensaje == idMensaje && x.Id_maestro == idMaestro && x.Id_alumno == idAlumno).SingleOrDefault();

                if (query != null)
                {
                    exito = true;
                }
            }
                return exito;
        }

        public static bool AgregarMensajeMaestro(int idalumno, int idmensaje, int idmaestro)
        {
            bool exito = false;
            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                

                Mensaje_alumno_maestro mam = new Mensaje_alumno_maestro();
                mam.Id_alumno = idalumno;
                mam.Id_maestro = idmaestro;
                mam.Id_mensaje = idmensaje;

                dbctx.Mensaje_alumno_maestros.Add(mam);
                dbctx.SaveChanges();

                var query = dbctx.Mensaje_alumno_maestros.Where(x => x.Id_mensaje == idmensaje && x.Id_maestro == idmaestro && x.Id_alumno == idalumno).SingleOrDefault();

                if (query != null)
                {
                    exito = true;
                }
            }
            return exito;
        }
    }
}
