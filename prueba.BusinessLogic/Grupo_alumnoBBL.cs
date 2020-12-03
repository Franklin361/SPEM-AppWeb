using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.BusinessLogic
{
    public class Grupo_alumnoBBL
    {
        public static void IngresarIDAlumnoGrupo(int alumno, int grupo)
        {
            DataAccess.Grupo_alumnoDAL.IngresarIDAlumnoGrupo(alumno,grupo);
        }
    }
}
