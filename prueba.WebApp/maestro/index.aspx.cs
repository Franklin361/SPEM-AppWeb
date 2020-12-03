using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.Adapters;
using System.Web.UI.WebControls;

namespace prueba.WebApp.maestro
{
    public partial class inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["click"] == null)
            {
                Response.Redirect("~/inicio/maestro.aspx");
            }
            if (!Page.IsPostBack)
            {
                Session["modal"] = "0";
            }
            else
            {
                Session["modal"] = null;
            }

        }

        protected void cerrarSesion_Click(object sender, EventArgs e)
        {
            staticBackdropLabelID.InnerText = "Cerrar sesión";
            modalbody.Attributes.Add("class", "mensaje equivocado");
            modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>¿Seguro que desea cerrar la sesión?</p>";
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["click"] = null;
            Response.Redirect("index.aspx");
        }


    }
}