using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prueba.WebApp.alumno
{
    public partial class actividades : System.Web.UI.Page
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
              
                int idAlumno = Convert.ToInt32(Session["alumno"]);

                string[] name = BusinessLogic.ActividadBBL.ObtenerActividades(idAlumno).Item1;
                string[] value = BusinessLogic.ActividadBBL.ObtenerActividades(idAlumno).Item2;
                string[] valorTotal = BusinessLogic.ActividadBBL.ObtenerActividades(idAlumno).Item3;

                //iterar

                foreach (string n in name)
                {
                    Session["nombres"] += n + "-";
                }
                foreach (string n in valorTotal)
                {
                    Session["total"] += n + "-";
                }
                foreach (string v in value)
                {
                    Session["valores"] += v + "-";
                }

            }       

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
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

                    string mensaje ="<b>"+ nombre +"</b>"+ ": " + campoMensaje; //concatenar con el nombre del alumno

                    DateTime hora = DateTime.Now;
                    string idHora = hora.ToString();

                    BusinessLogic.ComentarioBBL.AgregarMensaje(mensaje, idHora);

                    int idGrupo = Convert.ToInt32(Session["grupo"]);
                    int idMensaje = BusinessLogic.ComentarioBBL.ObtenerID(mensaje, idHora);

                    retroalimentacion = BusinessLogic.Mensaje_alumno_maestroBBL.AgregarMensaje(idAlumno, idGrupo, idMensaje);

                    if (retroalimentacion.Contains("Error"))
                    {
                        //col.Attributes.Add("class", "col-5 mx-auto text-center alert alert-danger my-2 py-3");
                        staticBackdropLabelID.InnerText = "Error";
                        modalbody.Attributes.Add("class", "mensaje equivocado");
                        modalbody.InnerHtml = "<p class='alert alert-danger py-4 text-center'>" + retroalimentacion + "</p>";
                    }
                    else
                    {
                        staticBackdropLabelID.InnerText = "Exito!";
                        modalbody.Attributes.Add("class", "mensaje desequivocado");
                        modalbody.InnerHtml = "<p class='alert alert-success py-4 text-center'>"+ retroalimentacion + "</p>";
                        campoMessaje.Value = "";                       
                    }
                }

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
            int idGrupo = Convert.ToInt32(Session["grupo"]);
            string grupo = BusinessLogic.GrupoBBL.GrupoUnitarioAlumno(idGrupo);
            List<string> totalAct = BusinessLogic.ActividadBBL.ObtenerActvidadesGrupoMaestro(grupo);

            int idAlumno = Convert.ToInt32(Session["alumno"]);
            string[] actividades = BusinessLogic.ActividadBBL.ExportarActividad(idAlumno);
            
            string docpath = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);


            if (actividades.Length != 0)
            {
                using (StreamWriter outpoutFile = new StreamWriter(Path.Combine(docpath, "Actividades-Alumno_SPEM.txt")))
                {
                    outpoutFile.WriteLine("----- Actividades calificadas hasta el momento -----\n");
                    outpoutFile.WriteLine("----- Faltan por calificar: " + (totalAct.Count() - actividades.Count()).ToString() + " actvidades-----\n");

                    for (int i = 0; i <= actividades.Length - 1; i++)
                    {
                        outpoutFile.WriteLine((i + 1) + " ► " + actividades[i]);
                    }
                }

                modalbody.InnerHtml = "<p class='py-2 alert alert-success text-center font-weight-bold'>Las actividades calificadas del alumno se ha exportado correctamente en un archivo de texto</p>";
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