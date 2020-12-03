using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prueba.WebApp.alumno
{
    public partial class mensajes : System.Web.UI.Page
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
                MostrarMensajesHTLM();                               
            }
            
        }
        private void MostrarMensajesHTLM()
        {

            int id = Convert.ToInt32(Session["alumno"]);
            int idgrupo = Convert.ToInt32(Session["grupo"]);
          

            bandeja_entrada.InnerHtml = "";
            string[] mensajes = BusinessLogic.ComentarioBBL.Mensajes(id, idgrupo);

            if(mensajes.Length != 0)
            {
                string html = "";
                for (int i = 0; i <= mensajes.Length - 1; i++)
                {
                    html += "<div class='col-12 mt-4 text-rigth bg-light rounded'> <p class='m-0 py-3'>" + mensajes[i] + "</p> </div>";
                }

                bandeja_entrada.InnerHtml = html;
            }
            else
            {
                mensaje.InnerHtml = "<div class='col-10 mx-auto'><h4 class='p-3 alert text-center alert-danger'><b>Por el momento no hay mensajes</b></h4></div>";
            }
           
        }

        protected void btn_enviar_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                string campoMensaje = campoMessaje.Value;
                string retroalimentacion = "";
                if (campoMensaje.Trim() == "")
                {
                    btnCerrarSesion.Visible = false;
                    staticBackdropLabelID.InnerText = "Error al tratar de enviar un mensaje";
                    modalbody.Attributes.Add("class", "mensaje equivocado");
                    modalbody.InnerHtml = "<p class='py-4 alert alert-danger text-center'>Para enviar mensajes, es obligatorio llenar el campo</p>";
                    campoMessaje.Focus();
                }
                else
                {
                    DateTime hora = DateTime.Now;
                    string idHora = hora.ToString();

                    int idAlumno = Convert.ToInt32(Session["alumno"]); //session

                    string nombre = BusinessLogic.AlumnoBBL.ObtneroNombreParaMensaje(idAlumno);

                    string mensaje = "<b>"+ nombre + "</b>" + ": " + campoMensaje; //concatenar con el nombre del alumno

                    BusinessLogic.ComentarioBBL.AgregarMensaje(mensaje, idHora);

                    int idGrupo = Convert.ToInt32(Session["grupo"]);
                    int idMensaje = BusinessLogic.ComentarioBBL.ObtenerID(mensaje, idHora);

                    retroalimentacion =  BusinessLogic.Mensaje_alumno_maestroBBL.AgregarMensaje(idAlumno, idGrupo, idMensaje);

                    if (retroalimentacion.Contains("Error"))
                    {
                        staticBackdropLabelID.InnerText = "Error";
                        modalbody.Attributes.Add("class", "mensaje equivocado");
                        modalbody.InnerHtml = "<p class='alert alert-danger py-4 text-center'>" + retroalimentacion + "</p>";
                    }
                    else
                    {

                        campoMessaje.Value = "";
                        staticBackdropLabelID.InnerText = "Exito!";
                        modalbody.Attributes.Add("class", "mensaje desequivocado");
                        modalbody.InnerHtml = "<p class='alert alert-success py-4 text-center'>" + retroalimentacion + "</p>";
                        MostrarMensajesHTLM();
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
    }
}