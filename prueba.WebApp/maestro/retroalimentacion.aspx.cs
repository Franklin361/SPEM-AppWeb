using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prueba.WebApp.maestro
{
    public partial class retroalimentacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["click"] == null)
            {
                Response.Redirect("~/inicio/maestro.aspx");
            }
            else
            {
            
                btnAceptar.InnerText = "Aceptar";
                btnCerrarSesion.Visible = false;
                modalbody.Attributes.Add("class", "");
                
                LlenarSelectGrupo();
            }           

        }

        #region Llenar-Select-Grupo
        private void LlenarSelectGrupo()
        {
            int id = Convert.ToInt32(Session["click"]);

            List<string> lista = BusinessLogic.GrupoBBL.ObtenerGrupos(id);

            if (select.Items.Count == 0)
            {
                foreach (string g in lista)
                {
                    select.Items.Add(g);
                }
            }
        }
        #endregion

        protected void btn_selec_Click(object sender, EventArgs e)
        {

            int id = Convert.ToInt32(Session["click"]);
            string grupo = select.SelectedValue;
            List<string> nombres = BusinessLogic.AlumnoBBL.ObtenerAlumnosGrupo(grupo);

            if (nombres.Count != 0)
            {
                if (select_alumno.Items.Count == 0)
                {
                    foreach (string n in nombres)
                    {
                        select_alumno.Items.Add(n);
                    }
                }
            }
            else
            {
                select_alumno.Items.Clear();
            }

            MostrarMensajes();

        }

        #region Mostrar-Mensajes
        private void MostrarMensajes()
        {
            mensajenohay.InnerHtml = "";
            int id = Convert.ToInt32(Session["click"]);
            string grupo = select.SelectedValue;
            showmensaje.InnerHtml = "";
            string[] mensajes = BusinessLogic.ComentarioBBL.MensajesMestro(id, grupo);

            string html = "";

            if (mensajes.Length != 0)
            {
                for (int i = 0; i <= mensajes.Length - 1; i++)
                {
                    html += "<div class='col-12 mt-4 text-rigth bg-light rounded'> <p class='m-0 py-3'>" + mensajes[i] + "</p> </div>";
                }
            }
            else
            {
                mensajenohay.InnerHtml = "<div class='col-5 mx-auto mt-4 text-center bg-warning rounded'><p class='m-0 py-2'>Aun no hay mensajes para usted</p> </div>";
            }

            showmensaje.InnerHtml = html;
        }
        #endregion

        protected void btn_enviar_Click(object sender, EventArgs e)
        {
            
            string nombre = select_alumno.SelectedValue;
            string retroalimentacion = "";

            /*mensaje*/
            string texto =campoMessaje.Value;

            string campo = texto;


            if (nombre == "")
            {                
                modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger font-weight-bold'>Debes de seleccionar un grupo para seleccionar un alumno y mandarle mensaje</p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
                modalbody.Attributes.Add("class", "mensaje equivocado");
                return;
            }
            else if (campo =="")
            {
                modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger font-weight-bold'>El campo de mensaje no puede ir vacío</p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
                modalbody.Attributes.Add("class", "mensaje equivocado");
                return;
            }
            else
            {
                if (Page.IsValid)
                {
                   

                    int idAlumno = BusinessLogic.AlumnoBBL.ObtenerID(nombre);
                    int idMAestro = Convert.ToInt32(Session["click"]);

                    string nombreMaestro = BusinessLogic.MaestroBBL.ObtenerNombre(idMAestro);
                    string mensaje = "<strong>"+ nombreMaestro + "</strong>" + ": " + campo;

                    DateTime hora = DateTime.Now;
                    string idHora = hora.ToString();

                    BusinessLogic.ComentarioBBL.AgregarMensaje(mensaje,idHora);

                    int idMensaje = BusinessLogic.ComentarioBBL.ObtenerID(mensaje, idHora);

                    retroalimentacion = BusinessLogic.Mensaje_alumno_maestroBBL.AgregarMensajeMaestro(idAlumno, idMensaje, idMAestro);

                    if (retroalimentacion.Contains("Error"))
                    {
                        staticBackdropLabelID.InnerText = "Ha ocurrido un error!";
                        modalbody.InnerHtml = "<p  class='py-2 text-center alert alert-danger font-weight-bold'>" + mensaje + "</p>";
                        modalbody.Attributes.Add("class", "mensaje equivocado");
                    }
                    else
                    {
                        staticBackdropLabelID.InnerText = "Exito!";
                        modalbody.InnerHtml = "<p  class='py-2 text-center alert alert-success font-weight-bold'>" + retroalimentacion + "</p>";
                        modalbody.Attributes.Add("class", "mensaje desequivocado");
                        campoMessaje.Value = "";
                        MostrarMensajes();
                    }
                }
            }

        }

        protected void btn_cerrar_Click(object sender, EventArgs e)
        {
            staticBackdropLabelID.InnerText = "Cerrar sesión";
            modalbody.Attributes.Add("class", "mensaje equivocado");
            modalbody.InnerHtml = "<p class='py-2 alert text-center alert-danger'>¿Seguro que desea cerrar la sesión?</p>";
            btnCerrarSesion.Visible = true;
            btnAceptar.InnerText = "No cerrar sesión";
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["click"] = null;
            Response.Redirect("actividades.aspx");
        }
    }
}