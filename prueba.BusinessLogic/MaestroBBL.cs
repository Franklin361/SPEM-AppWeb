using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.BusinessLogic
{
    public class MaestroBBL
    {
        
        public static Tuple<string,int> IniciarSesion(string usuario, string pass)
        {
            
            string mensaje = DataAccess.MaestroDAL.IniciarSesion(usuario, pass);
            int idMaestro = DataAccess.MaestroDAL.ObtenerID(usuario, pass);

           
            return Tuple.Create(mensaje, idMaestro);
        }

        

        #region CrearCuenta
        public static string CrearCuenta(string nombre, string apellido, string usuario, string password, string email)
        {
            string mensaje = string.Empty;
            bool creada = DataAccess.MaestroDAL.CrearCuenta(nombre, apellido, usuario, password,email);
            if (creada)
            {mensaje = "Cuenta creada exitosamente";}
            else
            { mensaje = "Error, usuario ya existente, ingrese otro nombre de usuario";}
            return mensaje;
        }
        #endregion

        public static string ObtenerNombre(int id)
        {
            string nombre = DataAccess.MaestroDAL.ObtenerNombre(id);
            return nombre;
        }
    }
}
