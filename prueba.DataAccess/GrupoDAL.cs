using K4os.Hash.xxHash;
using prueba.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prueba.DataAccess
{
    public class GrupoDAL
    {
        #region ObtenerGrupos
        public static List<string> ObtenerGrupos(int id)
        {
            List<string> lista = null;

            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var query = dbctx.Grupos.Where(x => x.Id_maestro == id).Select(x=> x.Nombre_grupo).ToList();
                if (query != null)
                {lista = query;} 
            }
            return lista;
        }
        #endregion

        #region GrupoUnitarioAlumno
        public static string GrupoUnitarioAlumno(int idGrupo)
        {
            string grupo = string.Empty;

            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var query = dbctx.Grupos.Where(x => x.Id_grupo == idGrupo).Select(x => x.Nombre_grupo).SingleOrDefault();

                if (query != null)
                { grupo = query; }
            }
            return grupo;
        }
        #endregion

        #region ObtenerGruposPassword
        public static Tuple<string[], string[]> ObtenerGruposPassword(int id)
        {
            string[] grupos = null;
            string[] passwords = null;

            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var grupo = (from g in dbctx.Grupos
                             where g.Id_maestro == id
                             select g.Nombre_grupo.ToString()).ToArray();
                
                var contras = (from g in dbctx.Grupos
                             where g.Id_maestro == id
                             select g.pass_grupo.ToString()).ToArray();

                if (grupo != null && contras != null)
                {
                    grupos = grupo;
                    passwords = contras;
                
                }
            }
            return Tuple.Create(grupos,passwords);
        }
        #endregion

        #region CrearGrupo
        public static string CrearGrupo(string nombreGrupo, string passGrupo, int id){

            string mensaje = string.Empty;
            //INSERTAR VALORES A LA TABLA
            using (pruebaDbContext dbCtx = new pruebaDbContext())
            {
                var grupoExistente = dbCtx.Grupos.Where(x=>x.Nombre_grupo== nombreGrupo && x.Id_maestro == id).SingleOrDefault();

                if (grupoExistente != null)
                {
                    mensaje = "Error, el grupo que trata de crear ya existe (<strong>cambie el nombre</strong>)";
                }
                else
                {
                    Grupo g = new Grupo();
                    g.Nombre_grupo = nombreGrupo;
                    g.pass_grupo = passGrupo;
                    g.Id_maestro = id; //agregar el maestro actual

                    dbCtx.Grupos.Add(g);
                    dbCtx.SaveChanges();
                    var query = dbCtx.Grupos.
                   Where(x => x.Nombre_grupo == nombreGrupo && x.pass_grupo == passGrupo && x.Id_maestro == id)
                   .ToList();

                    if (query != null)
                    {
                        mensaje = "Grupo creado exitosamente";
                    }
                }
                

                
            }
           
            return mensaje;
        }
        #endregion

        #region ObtenerID
        public static int ObtenerID(string grupo)
        {
            int idGrupo = 0;

            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var query = dbctx.Grupos.Where(x => x.Nombre_grupo == grupo).SingleOrDefault();

                if (query != null)
                {
                    idGrupo = Convert.ToInt32(query.Id_grupo);
                }
            }

            return idGrupo;
        }
        #endregion

        #region EditarNombreGrupo
        public static string EditarGrupo(string nombreGrupo, string password, int idgrupo)
        {
            string mensaje = "";

            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var validacion = dbctx.Grupos.Where(x => x.Nombre_grupo == nombreGrupo).SingleOrDefault();
                if (validacion != null)
                {
                    mensaje = "Error, ese grupo ya existe, elija otro nombre";
                }
                else
                {
                    if (nombreGrupo != null && (password == null || password == ""))
                    {
                        var editar = dbctx.Grupos.Where(x => x.Id_grupo == idgrupo).SingleOrDefault();
                        editar.Nombre_grupo = nombreGrupo;
                        dbctx.SaveChanges();

                        var comprobar = dbctx.Grupos.Where(x => x.Nombre_grupo == nombreGrupo).SingleOrDefault();
                        if (comprobar != null)
                        {
                            mensaje = "Se cambio el nombre del grupo correctamente";
                        }
                    }
                    else if (password != null && (nombreGrupo == null || nombreGrupo == ""))
                    {
                        var editar = dbctx.Grupos.Where(x => x.Id_grupo == idgrupo).SingleOrDefault();
                        editar.pass_grupo = password;
                        dbctx.SaveChanges();

                        var comprobar = dbctx.Grupos.Where(x => x.pass_grupo == password).SingleOrDefault();
                        if (comprobar != null)
                        {
                            mensaje = "Se cambio la contraseña del grupo correctamente";
                        }
                    }
                    else
                    {
                        var editar = dbctx.Grupos.Where(x => x.Id_grupo == idgrupo).SingleOrDefault();
                        editar.Nombre_grupo = nombreGrupo;
                        editar.pass_grupo = password;
                        dbctx.SaveChanges();

                        var comprobar = dbctx.Grupos.Where(x => x.pass_grupo == password && x.Nombre_grupo == nombreGrupo).SingleOrDefault();
                        if (comprobar != null)
                        {
                            mensaje = "Se cambio la contraseña y el nombre del grupo correctamente";
                        }
                    }
                }
            }
                return mensaje;
        }
        #endregion

        #region EliminarNombreGrupo
        public static bool EliminarGrupo(int id)
        {
            bool borrado = false;
            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var fila = dbctx.Grupos.Where(x => x.Id_grupo == id).SingleOrDefault();
                if (fila!=null)
                {
                    dbctx.Grupos.Remove(fila);
                    dbctx.SaveChanges();

                    var query = dbctx.Grupos.Where(x => x.Id_grupo == id).SingleOrDefault();
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
