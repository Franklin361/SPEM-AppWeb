using prueba.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.DataAccess
{
    public class MaestroDAL
    {
        #region IniciarSesion
        public static string IniciarSesion(string usuario, string pass)
        {
            string mensaje = "";
            using (pruebaDbContext dbCtx = new pruebaDbContext())
            {
                var user = dbCtx.maestros.
                    Where(x => x.Usuario_maestro == usuario).SingleOrDefault();

                var password = dbCtx.maestros.
                    Where(x => x.Pass_maestro == pass && x.Usuario_maestro==usuario).SingleOrDefault();

                if (user == null && password == null)
                {
                    mensaje = "Error, el usuario y la contraseña no son validos";
                }
                else if (user != null && password == null)
                {
                    mensaje = "Error, la contraseña no coincide con el usuario";
                }
                else if (user == null && password != null)
                {
                    mensaje = "Error, el usuario que ha ingresado no existe";
                }
                else
                {
                    mensaje = "Inicio de sesión exitoso";
                }
            }                
                return mensaje;
        }
        #endregion

        #region CrearCuenta
        public static bool CrearCuenta(string nombre, string apellido, string usuario, string password, string email)
        {
            bool creada = false;
            //INSERTAR VALORES A LA TABLA
            using (pruebaDbContext dbCtx = new pruebaDbContext())
            {
                var comprobar = dbCtx.maestros.Where(x => x.Usuario_maestro == usuario).SingleOrDefault();
                if (comprobar == null)
                {
                    maestro m = new maestro();
                    m.Nombre_maestro = nombre;
                    m.Apellido_maestro = apellido;
                    m.Usuario_maestro = usuario;
                    m.Pass_maestro = password;
                    m.Email = email;

                    dbCtx.maestros.Add(m);
                    dbCtx.SaveChanges();
                }

            }

            using (pruebaDbContext dbCtx = new pruebaDbContext())
            {
                var query = dbCtx.maestros.
                    Where(x => x.Usuario_maestro == usuario && x.Pass_maestro == password && x.Nombre_maestro == nombre && x.Apellido_maestro == apellido)
                    .SingleOrDefault();
                if (query != null)
                { creada = true; }
            }
            return creada;
        }
        #endregion

        public static int ObtenerID(string user, string pass)
        {
            int idMaestro = 0;
            
            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var query= dbctx.maestros.Where(x => x.Pass_maestro == pass && x.Usuario_maestro == user).SingleOrDefault();

                if (query != null)
                {
                    idMaestro = Convert.ToInt32(query.Id_maestro);
                }
            }

                return idMaestro;
        }

        public static string ObtenerNombre(int id)
        {
            string nombre = "";
            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var query = (from m in dbctx.maestros where m.Id_maestro == id select m.Nombre_maestro + " " + m.Apellido_maestro).SingleOrDefault();

                nombre = query.ToString();
            }
                return nombre;
        }
    }
}
