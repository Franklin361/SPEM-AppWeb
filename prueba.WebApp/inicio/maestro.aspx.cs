using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prueba.WebApp.inicio
{
    public partial class maestro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Session["click"] = null;
        }
        
        protected void Button1_Click (object sender, EventArgs e)
        {

            if (usuario.Text == "" || password.Text=="")
            {
                
                modalbody.InnerHtml = "<p class='py-2 alert alert-danger text-center font-weight-bold'>Los campos deben de llenarse obligatoriamente</p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
    
                modalbody.Attributes.Add("class", "mensaje equivocado");
            }
            else
            {
                string username = usuario.Text.Trim();
                string pass = password.Text.Trim();
                var mensaje = BusinessLogic.MaestroBBL.IniciarSesion(username, pass).Item1;
                int id = BusinessLogic.MaestroBBL.IniciarSesion(username, pass).Item2;

                Session["click"] = id;

                if (mensaje.Contains("Error"))
                {
                    staticBackdropLabelID.InnerText = "Ha ocurrido un error!";
                    modalbody.InnerHtml = "<p  class='py-2 alert alert-danger text-center font-weight-bold'>" + mensaje + "</p>";
                    modalbody.Attributes.Add("class", "mensaje equivocado");
                }
                else
                {
                    staticBackdropLabelID.InnerText = "Exito!";
                    modalbody.InnerHtml = "<h6  class='py-2 alert alert-success text-center font-weight-bold'>" + mensaje + "</h6>";
                    modalbody.Attributes.Add("class", "mensaje desequivocado");
                    usuario.Text = "";
                    password.Text = "";
                }
                
                

            }

            
            

        }


    }
}