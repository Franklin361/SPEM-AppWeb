using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prueba.WebApp.alumno
{
    public partial class asistencia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["alumno"] == null)
            {
                Response.Redirect("../inicio/alumno.aspx");
            }
            else
            {
                btnCerrarSesion.Visible = false;
                btnAceptar.InnerText = "Aceptar";
                modalbody.Attributes.Add("class", "");

                PintarAsistencia();
            }

        }
        private void PintarAsistencia()
        {
            int idAlumno = Convert.ToInt32(Session["alumno"]);
            Array tabla = BusinessLogic.AsistenciaBBL.Asistencia(idAlumno);
            GridView1.DataSource = tabla;
            GridView1.DataBind();
        }

        protected void btn_enviar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string campoMensaje = campoMessaje.Value;
                string retroalimentacion = "";
                if (campoMensaje == "")
                {
                    btnCerrarSesion.Visible = false;
                    staticBackdropLabelID.InnerText = "Error al tratar de enviar un mensaje";
                    modalbody.Attributes.Add("class", "mensaje equivocado");
                    modalbody.InnerHtml = "<p class='py-4 alert alert-danger text-center'>Para enviar mensajes, es obligatorio llenar el campo</p>";
                    campoMessaje.Focus();
                }
                else
                {
                    int idAlumno = Convert.ToInt32(Session["alumno"]); //session

                    string nombre = BusinessLogic.AlumnoBBL.ObtneroNombreParaMensaje(idAlumno);

                    string mensaje = "<b>"+nombre+"</b>" + ": " + campoMensaje; //concatenar con el nombre del alumno
                    DateTime hora = DateTime.Now;
                    string idHora = hora.ToString();

                    BusinessLogic.ComentarioBBL.AgregarMensaje(mensaje, idHora);

                    int idGrupo = Convert.ToInt32(Session["grupo"]);
                    int idMensaje = BusinessLogic.ComentarioBBL.ObtenerID(mensaje, idHora);

                    retroalimentacion = BusinessLogic.Mensaje_alumno_maestroBBL.AgregarMensaje(idAlumno, idGrupo, idMensaje);

                    if (retroalimentacion.Contains("Error"))
                    {
                        staticBackdropLabelID.InnerText = "Error";
                        modalbody.Attributes.Add("class", "mensaje equivocado");
                        modalbody.InnerHtml = "<p class='alert alert-danger py-4 text-center'>" + retroalimentacion + "</p>";
                    }
                    else
                    {

                        campoMessaje.Value= "";
                        staticBackdropLabelID.InnerText = "Exito!";
                        modalbody.Attributes.Add("class", "mensaje desequivocado");
                        modalbody.InnerHtml = "<p class='alert alert-success py-4 text-center'>" + retroalimentacion + "</p>";
                    }
                }

                //lbl_retro.Text = retroalimentacion;
                //col.Visible = true;

            }
        }

        protected void btn_cerrar_Click(object sender, EventArgs e)
        {
            staticBackdropLabelID.InnerText = "Cerrar sesión";
            modalbody.Attributes.Add("class", "mensaje equivocado");
            modalbody.InnerHtml = "<p class='py-2 alert alert-danger'>¿Seguro que desea cerrar la sesión?</p>";
            btnCerrarSesion.Visible = true;
            btnAceptar.InnerText = "No cerrar sesión";
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["alumno"] = null;
            Response.Redirect("actividades.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int idAlumno = Convert.ToInt32(Session["alumno"]);
            string[] asistencias = BusinessLogic.AsistenciaBBL.ExportarAsistencia(idAlumno);

            string docpath = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);

            if (asistencias.Length !=0)
            {
                using (StreamWriter outpoutFile = new StreamWriter(Path.Combine(docpath, "Asistencia-Alumno_SPEM.txt")))
                {
                    outpoutFile.WriteLine("\t----- Asistencia del alumno -----\n");

                    for (int i = 0; i <= asistencias.Length - 1; i++)
                    {
                        outpoutFile.WriteLine((i + 1) + "•- " + asistencias[i]);
                    }
                }

                modalbody.InnerHtml = "<p class='py-2 alert alert-success text-center font-weight-bold'>La asistencia del alumno se ha exportado correctamente en un archivo de texto</p>";
                staticBackdropLabelID.InnerText = "Exportación correcta";

                modalbody.Attributes.Add("class", "mensaje desequivocado");
            }
            else
            {
                modalbody.InnerHtml = "<p class='py-2 alert alert-danger text-center font-weight-bold'>Por el momento no hay datos que exportar</p>";
                staticBackdropLabelID.InnerText = "Atención!";

                modalbody.Attributes.Add("class", "mensaje equivocado");
            }
        }
    }
}