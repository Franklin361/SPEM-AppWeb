using prueba.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.DataAccess
{
    public class Alumno_actividadDAL
    {
        #region Insertar
        public static string CalificarActividad(string actividad,string alumno,int cali)
        {
            string mensaje = "";

            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var idAct = dbctx.Actividades.Where(x => x.Nombre_actividad == actividad).Select(x => x.Id_actividad).SingleOrDefault();

                var idAlum = dbctx.Alumnos.Where(x => x.Nombre_alumnoCompleto == alumno ).Select(x => x.Id_alumno).SingleOrDefault();

                int alumn = Convert.ToInt32(idAlum);
                int act = Convert.ToInt32(idAct);

                var query = dbctx.Alumno_actividades.Where(x => x.Id_actividad == act && x.Id_alumno == alumn).SingleOrDefault();
                
                if(query == null)
                {
                   
                        Alumno_actividad aa = new Alumno_actividad();
                        aa.Id_actividad = act;
                        aa.Id_alumno = alumn;
                        aa.calificacion = cali;

                        dbctx.Alumno_actividades.Add(aa);
                        dbctx.SaveChanges();
                        mensaje = "Se calificó la actividad";
                    
                }
                else if(query != null)
                {

                    query.calificacion = cali;
                    dbctx.SaveChanges();

                    mensaje = "Se modico la calificación, ya que anteriormente se habia calificado";
                }
            }
            return mensaje;
        }

        #endregion
       
    }
}
