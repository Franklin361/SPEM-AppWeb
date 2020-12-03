using prueba.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace prueba.DataAccess
{
    public class ActividadDAL
    {
        #region ExportarActividad
        public static string[] ExportarActividad(int idAlumno)
        {
            string[] actividades = new string[] { };

            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var nombres = (from a in dbctx.Actividades
                               join aa in dbctx.Alumno_actividades on a.Id_actividad equals aa.Id_actividad
                               where aa.Id_alumno == idAlumno
                               select "'"+a.Nombre_actividad+"'" +" - Con valor de: "+a.Valor_actividad.ToString() + " - Calificación obtenida: "+aa.calificacion.ToString()).ToArray();

                actividades = nombres;
            }

            return actividades;
        }
        #endregion

        #region ObtenerActvidades
        public static Tuple<string[],string[], string[]> ObtenerActividades(int idAlumno)
        {
            string[] name = new string[] {};
            string[] value = new string[] {};
            string[] valortotal = new string[] {};


            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var nombres = (from a in dbctx.Actividades
                               join aa in dbctx.Alumno_actividades on a.Id_actividad equals aa.Id_actividad
                               where aa.Id_alumno == idAlumno
                               select new
                               {
                                   Nombre = a.Nombre_actividad.ToString()

                               }).ToArray();

                //obtener calificacion que vale la act
                var valorT = (from a in dbctx.Actividades
                               join aa in dbctx.Alumno_actividades on a.Id_actividad equals aa.Id_actividad
                               where aa.Id_alumno == idAlumno
                               select new
                               {
                                   total = a.Valor_actividad.ToString()

                               }).ToArray();

                var valores = (from a in dbctx.Actividades
                               join aa in dbctx.Alumno_actividades on a.Id_actividad equals aa.Id_actividad
                               where aa.Id_alumno == idAlumno
                               select new
                               {

                                   Valor = aa.calificacion.ToString()

                               }).ToArray();

                int cantidadConsultas = nombres.Count();
                int cantidadValores = valores.Count();
                int cantidadC = valorT.Count();

                int indice = 0;
                int inidceDos = 0;
                int inidcetres = 0;

                name = new string[cantidadConsultas];
                value = new string[cantidadValores];
                valortotal = new string[cantidadC];

                foreach (dynamic n in nombres)
                {
                    name[indice] = n.Nombre;
                    indice = indice + 1;
                }

                foreach (dynamic v in valores)
                {
                    value[inidceDos] = v.Valor;
                    inidceDos = inidceDos + 1;
                }

                foreach (dynamic v in valorT)
                {
                    valortotal[inidcetres] = v.total;
                    inidcetres = inidcetres + 1;
                }
            }
                return Tuple.Create(name,value,valortotal);
        }
        #endregion  

        #region ObtenerActvidadesGrupoMaestro
        public static List<string> ObtenerActvidadesGrupoMaestro(string grupo)
        {
            List<string> lista = null;

            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var IDgrupo = dbctx.Grupos.Where(x => x.Nombre_grupo == grupo).Select(x => x.Id_grupo).SingleOrDefault();

                int id = Convert.ToInt32(IDgrupo);

                var query = dbctx.Actividades.Where(x => x.Id_grupo == id).Select(x => x.Nombre_actividad).ToList();

                if (query != null)
                { lista = query; }
            }
            return lista;
        }
        #endregion

        #region ObtenerActvidadesValorGrupoMaestro
        public static List<string> ObtenerActvidadesValorGrupoMaestro(string grupo)
        {
            List<string> lista = null;

            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var IDgrupo = dbctx.Grupos.Where(x => x.Nombre_grupo == grupo).Select(x => x.Id_grupo).SingleOrDefault();
                int id = Convert.ToInt32(IDgrupo);


                var query = dbctx.Actividades.Where(x => x.Id_grupo == id).Select(x => "<strong>" + x.Nombre_actividad+ "</strong>"  + "\n\rValor: <strong>" + x.Valor_actividad+ "</strong>").ToList();

                if (query != null)
                { lista = query; }
            }
            return lista;
        }
        #endregion

        #region AgregarActividades
        public static string AgregarActividad(int Idgrupo, string nombreAct, string valor)
        {                       
            string mensaje = string.Empty;

            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var queryPrueba = dbctx.Actividades.Where(x => x.Nombre_actividad == nombreAct).Count();

                if(queryPrueba != 0)
                {
                    mensaje = "Error, esa actividad ya existe para este grupo";
                }
                else
                {
                    int valoF = Convert.ToInt32(valor);
                    if (valoF<0 || valoF>100)
                    {
                        mensaje = "Error, solo se aceptan números del  al 100";
                    }
                    else
                    {
                        Actividad a = new Actividad();
                        a.Nombre_actividad = nombreAct;
                        a.Valor_actividad = valoF;
                        a.Id_grupo = Idgrupo;

                        dbctx.Actividades.Add(a);
                        dbctx.SaveChanges();

                        var comprobar = dbctx.Actividades.Where(x => x.Id_grupo == Idgrupo && x.Nombre_actividad == nombreAct && x.Valor_actividad == valoF).SingleOrDefault();

                        if (comprobar != null)
                        {
                            mensaje = "Actividad creada correctamente";
                        }
                    }
                }
            }
                return mensaje;
        }
        #endregion

        #region ObtnerID
        public static int ObtenerID(string nombreAct)
        {
            int id = 0;
            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var query = dbctx.Actividades.Where(x => x.Nombre_actividad == nombreAct).SingleOrDefault();

                if (query != null)
                {
                    id = Convert.ToInt32(query.Id_actividad);
                }
            }
            return id;
        }
        #endregion

        #region EditarActividad
        public static string EditarActividad(string nombreActividad, string valor, int idAct)
        {
            string mensaje = "";
            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var validacion = dbctx.Actividades.Where(x => x.Nombre_actividad == nombreActividad ).SingleOrDefault();

                if (validacion != null)
                {
                    mensaje = "Error, esa actividad ya existe, ingresa otro nombre";
                }
                else
                {
                    if (nombreActividad != null && (valor == null || valor == ""))
                    {
                        var editar = dbctx.Actividades.Where(x => x.Id_actividad == idAct).SingleOrDefault();
                        editar.Nombre_actividad = nombreActividad;
                        dbctx.SaveChanges();

                        var comprobar = dbctx.Actividades.Where(x => x.Nombre_actividad == nombreActividad && x.Id_actividad == idAct).SingleOrDefault();

                        if (comprobar != null)
                        {
                            mensaje = "Se cambio el nombre de la actividad correctamente";
                        }
                    }
                    else if (valor != null && (nombreActividad == null || nombreActividad == ""))
                    {
                        int valorF = Convert.ToInt32(valor);

                        if (valorF < 0 || valorF > 100)
                        {
                            mensaje = "Solo se aceptan valores del 0 al 100";
                        }
                        else
                        {
                            var editar = dbctx.Actividades.Where(x => x.Id_actividad == idAct).SingleOrDefault();
                            
                            editar.Valor_actividad = valorF;
                            dbctx.SaveChanges();

                            var comprobar = dbctx.Actividades.Where(x => x.Valor_actividad == valorF && x.Id_actividad == idAct).SingleOrDefault();

                            if (comprobar != null)
                            {
                                mensaje = "Se cambio el valor de la actividad correctamente";
                            }
                        }
                    }
                    else
                    {
                        var editar = dbctx.Actividades.Where(x => x.Id_actividad == idAct).SingleOrDefault();
                        double valorsemi = Convert.ToDouble(valor);
                        int valorf = Convert.ToInt32(valor);

                        editar.Nombre_actividad = nombreActividad;
                        editar.Valor_actividad = valorf;
                        dbctx.SaveChanges();

                        var comprobar = dbctx.Actividades.Where(x => x.Nombre_actividad == nombreActividad && x.Valor_actividad == valorf && x.Id_actividad == idAct).SingleOrDefault();

                        if (comprobar != null)
                        {
                            mensaje = "Se cambio el nombre y el valor de la actividad correctamente";
                        }
                    }
                }
            }
                return mensaje;
        }
        #endregion

        #region EliminarActividad
        public static bool EliminarActividad(int id)
        {
            bool borrado = false;
            using (pruebaDbContext dbctx = new pruebaDbContext())
            {
                var fila = dbctx.Actividades.Where(x => x.Id_actividad == id).SingleOrDefault();

                if (fila != null)
                {
                    dbctx.Actividades.Remove(fila);
                    dbctx.SaveChanges();

                    var query = dbctx.Actividades.Where(x => x.Id_actividad == id).SingleOrDefault();
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
