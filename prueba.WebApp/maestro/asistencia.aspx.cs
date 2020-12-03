using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prueba.WebApp.maestro
{
    public partial class asistencia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (Session["click"] == null)
            {
                Response.Redirect("~/inicio/maestro.aspx");
            }
            else
            {
                btnLCerrarSesion.Visible = false;
                btnAceptar.InnerText = "Aceptar";
                modalbody.Attributes.Add("class", "");
                int id = Convert.ToInt32(Session["click"]);

                List<string> lista = BusinessLogic.GrupoBBL.ObtenerGrupos(id);
                if(lista.Count != 0)
                {
                    if (select_grupo.Items.Count == 0)
                    {
                        foreach (string l in lista)
                        {
                            select_grupo.Items.Add(l);
                        }
                    }
                }
                else {
                    select_grupo.Items.Clear();
                }
                
            }
            


        }

        protected void btn_asistencia_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string fecha = fecha_txt.SelectedDate.ToString();
                string asistencia = select_asistencia.SelectedValue;

                string alumno = selec_alumno.SelectedValue;

                //
                string nombre = selec_alumno.SelectedValue;

                
                if (alumno == "")
                {
                    staticBackdropLabelID.InnerText = "Ocurrio un estado";
                    modalbody.Attributes.Add("class", "mensaje equivocado");
                    modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>Seleccione un grupo para que aparezcan los alumnos en el campoSeleccione un <strong>ALUMNO</strong> para poder calificar</p>";

                    return;
                }
                else if (fecha.Contains("01/01/0001"))
                {
                    staticBackdropLabelID.InnerText = "Ocurrio un Error";
                    modalbody.Attributes.Add("class", "mensaje equivocado");
                    modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>Seleccione una fecha valida en el calendario (<strong>el recuadro de la fecha debe ponerse color azul</strong>)</p>";
                    return;
                }
                else if (asistencia == "0")
                {
                    staticBackdropLabelID.InnerText = "Ocurrio un Error";
                    modalbody.Attributes.Add("class", "mensaje equivocado");
                    modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>Seleccione una opcion de asistencia</p>";
                    return;
                }

                DateTime dia = new DateTime();
                dia = fecha_txt.SelectedDate;                              

                string nombreDia = dia.ToString("dddd");
                string numeroDia = dia.ToString("dd");
                string mes = dia.ToString("MMMM");
                string anio = dia.ToString("yyyy");

                fecha = nombreDia + " " + numeroDia + " de " + mes + " del " + anio;

                string mensaje = BusinessLogic.AsistenciaBBL.GuardarAsistencia(fecha, asistencia, nombre);

                if (mensaje.Equals("Error"))
                {
                    staticBackdropLabelID.InnerText = "Ha ocurrido un error!";
                    modalbody.InnerHtml = "<p  class='py-2 font-weight-bold text-center alert alert-danger'>" + mensaje + "</p>";
                    modalbody.Attributes.Add("class", "mensaje equivocado");
                }
                else
                {
                    staticBackdropLabelID.InnerText = "Exito!";
                    modalbody.InnerHtml = "<p  class='py-2 text-center font-weight-bold alert alert-success'>" + mensaje + "</p>";
                    modalbody.Attributes.Add("class", "mensaje desequivocado");
                }
               
            }
        }

        protected void btn_grupo_Click(object sender, EventArgs e)
        {
            
            string grupo = select_grupo.SelectedValue;

            //1.consultar nombre y apellido alumnos
            List<string> nombres = BusinessLogic.AlumnoBBL.ObtenerAlumnosGrupo(grupo);                     

            if(nombres.Count != 0)
            {
                if (selec_alumno.Items.Count == 0)
                {
                    foreach (string n in nombres)
                    {
                        selec_alumno.Items.Add(n);
                    }
                }
            }
            else
            {
                selec_alumno.Items.Clear();
            }
        }

        protected void btn_ver_Click(object sender, EventArgs e)
        {
            DateTime dia = new DateTime();
            dia = fecha_txt.SelectedDate;
            string nombreDia = dia.ToString("dddd");
            string numeroDia = dia.ToString("dd");
            string mes = dia.ToString("MMMM");
            string anio = dia.ToString("yyyy");

            string fecha = nombreDia + " " + numeroDia + " de " + mes + " del " + anio;

            if (!dia.ToString().Contains("01/01/0001"))
            {
                string grupo = select_grupo.SelectedValue;

                string[] nombres = BusinessLogic.AsistenciaBBL.ObtenerAsistenciasAlumnos(fecha, grupo).Item1;
                string[] asistencias = BusinessLogic.AsistenciaBBL.ObtenerAsistenciasAlumnos(fecha, grupo).Item2;


                //mostrar la cuantos alumnos
                List<string> alumnos = BusinessLogic.AlumnoBBL.ObtenerAlumnosGrupo(grupo);

                int semitotal = nombres.Count();
                int total = alumnos.Count();

                string fechaDia = dia.ToString().Substring(0,10);

                staticBackdropLabelID.InnerText = "Tabla de asistencia del dia: " + fechaDia;

                string html = "";
                html += "<div class='row'><div class='col-11 mb-3 mx-auto py-3 text-center bg-warning rounded'> Se tomo asistencia a: " + semitotal + " alumnos de los " + total + " que hay en total" + "</div></div>";

                html += "<table class='table table-hover  table-bordered'><thead class='thead-dark'><tr><th scope='col'> Nombre del alumno</th><th scope='col'> Asistencia </th></tr></thead> <tbody> ";

                for (int i = 0; i <= nombres.Count() - 1; i++)
                {
                    html += "<tr><td>" + nombres[i] + "</td><td>" + asistencias[i] + "</td><tr>";
                }

                modalbody.Attributes.Add("class", "mensaje desequivocado");
                html += "</tbody></table> ";

                modalbody.InnerHtml = html;
            }
            else
            {
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
                modalbody.Attributes.Add("class", "mensaje equivocado");
                modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>Seleccione una fecha valida en el calendario (<strong>el recuadro de la fecha debe ponerse color azul</strong>)</p>";
            }

        }

        protected void btn_cerrar_Click(object sender, EventArgs e)
        {
            staticBackdropLabelID.InnerText = "Cerrar sesión";
            modalbody.Attributes.Add("class", "mensaje equivocado");
            modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>¿Seguro que desea cerrar la sesión?</p>";
            btnLCerrarSesion.Visible = true;
            btnAceptar.InnerText = "No cerrar sesión";
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["click"] = null;
            Response.Redirect("asistencia.aspx");
        }
    }
}