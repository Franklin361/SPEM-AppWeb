using prueba.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.DataAccess
{
    public class Grupo_alumnoDAL
    {
        public static void IngresarIDAlumnoGrupo(int alumno, int grupo)
        {
          
            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var Existe = dbctx.Grupo_alumnos.Where(x => x.Id_alumno == alumno && x.Id_grupo == grupo).SingleOrDefault();

                if(Existe == null)
                {
                    Grupo_alumno ga = new Grupo_alumno();
                    ga.Id_alumno = alumno;
                    ga.Id_grupo = grupo;

                    dbctx.Grupo_alumnos.Add(ga);
                    dbctx.SaveChanges();
                }
                
            }
               
        }
    }
}
