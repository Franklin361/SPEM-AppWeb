using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prueba.WebApp.alumno
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["alumno"] == null)
            {
                Response.Redirect("../inicio/alumno.aspx");
            }
            else
            {
                modalbody.Attributes.Add("class", "");

                if (!Page.IsPostBack)
                {
                    Session["modal"] = "0";
                }
                else
                {
                    Session["modal"] = null;
                }
            }
           
        }

        protected void btn_cerrar_Click(object sender, EventArgs e)
        {
            
            staticBackdropLabelID.InnerText = "Cerrar sesión";
            modalbody.Attributes.Add("class", "mensaje equivocado");
            modalbody.InnerHtml = "<p class='py-2 alert alert-danger'>¿Seguro que desea cerrar la sesión?</p>";

        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["alumno"] = null;
            Response.Redirect("../inicio/alumno.aspx");
        }
    }
}