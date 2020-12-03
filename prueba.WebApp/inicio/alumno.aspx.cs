using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prueba.WebApp.inicio
{
    public partial class alumno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string pass = txt_pass.Text;
            string grupo = txt_grupo.Text;
            string nombre = txt_user.Text;
            string mensaje = "";

            if (nombre.Trim()==""||pass.Trim() == ""||grupo.Trim() == "")
            {
                modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger font-weight-bold'>Llenar los campos obligatoriamente</p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";

                modalbody.Attributes.Add("class", "mensaje equivocado");
            }
            else
            {
                int grupoID = BusinessLogic.GrupoBBL.ObtenerID(grupo);
                Session["grupo"] = grupoID;

                mensaje = BusinessLogic.AlumnoBBL.Init(nombre, pass, grupo, grupoID);

                int idAlumno = BusinessLogic.AlumnoBBL.ObtenerID(nombre);
                Session["alumno"] = idAlumno;

                if (mensaje.Contains("exitoso"))
                {
                    staticBackdropLabelID.InnerText = "Exito!";
                    modalbody.InnerHtml = "<p  class='py-2 alert text-center alert-success font-weight-bold'>" + mensaje + "</p>";
                    modalbody.Attributes.Add("class", "mensaje desequivocado");
                    txt_grupo.Text = "";
                    txt_pass.Text = "";
                    txt_user.Text = "";
                }
                else
                {
                    staticBackdropLabelID.InnerText = "Ha ocurrido un error!";
                    modalbody.InnerHtml = "<p  class='py-2 alert text-center alert-danger font-weight-bold'>" + mensaje + "</p>";
                    modalbody.Attributes.Add("class", "mensaje equivocado");
                    
                }
            }

        }
    }
}