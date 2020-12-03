using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prueba.WebApp.inicio
{
    public partial class registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string mensaje = "";
            

           

            if (txt_apellido.Text == "" || txt_nombre.Text == "" || txt_email.Text == "" || txt_pass.Text == "" || txt_usuario.Text == "")
            {
                
                modalbody.InnerHtml = "<p class='py-2 alert alert-danger font-weight-bold'>Favor de llenar todos los campos, son obligatorios</p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
                modalbody.Attributes.Add("class", "mensaje equivocado");

                
                return;
            }
            if (txt_nombre.Text.Length < 2)
            {
                mensaje += "<p class='py-1 alert alert-danger font-weight-bold mb-1'>El nombre debe de llevar mas de 2 carateres</p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
                modalbody.Attributes.Add("class", "mensaje equivocado");
                modalbody.InnerHtml = mensaje;

            }
            if (txt_apellido.Text.Length < 10)
            {
                mensaje += "<p class='py-1 alert alert-danger font-weight-bold mb-1'>El apellido debe de llevar mas de 10 carateres</p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
                modalbody.Attributes.Add("class", "mensaje equivocado");
                modalbody.InnerHtml = mensaje;

            }
            if (txt_pass.Text.Length < 6)
            {
                mensaje += "<p class='py-1 alert alert-danger font-weight-bold mb-1'>La contraseña debe contener minimo 6 caracteres</p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
                modalbody.Attributes.Add("class", "mensaje equivocado");
                modalbody.InnerHtml = mensaje;

            }
            if (txt_usuario.Text.Length < 8)
            {
                mensaje += "<p class='py-1 alert alert-danger font-weight-bold mb-1'>El nombre de usuario debe contenern minimo 8 carateres</p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
                modalbody.Attributes.Add("class", "mensaje equivocado");
                modalbody.InnerHtml = mensaje;

            }

            if (txt_nombre.Text.Length >= 2 && txt_apellido.Text.Length >=10 && txt_pass.Text.Length >=6 && txt_usuario.Text.Length >=8)
            {
                
                
                string nombre = txt_nombre.Text;
                string apellido = txt_apellido.Text;
                string email = txt_email.Text;
                string usuario = txt_usuario.Text.Trim();
                string pass = txt_pass.Text.Trim();

                string mensajeBussines = BusinessLogic.MaestroBBL.CrearCuenta(nombre, apellido, usuario, pass, email);

                if (mensajeBussines.Contains("Error"))
                {
                    staticBackdropLabelID.InnerText = "Ha ocurrido un error!";
                    modalbody.InnerHtml = "<p  class='py-2 alert text-center alert-danger font-weight-bold'>" + mensajeBussines + "</p>";
                    modalbody.Attributes.Add("class", "mensaje equivocado");
                   
                }
                else
                {
                    staticBackdropLabelID.InnerText = "Exito!";
                    modalbody.InnerHtml = "<p  class='py-2 alert alert-success text-center font-weight-bold'>" + mensajeBussines + "</p>";
                    modalbody.Attributes.Add("class", "mensaje desequivocado");
                   
                }
                
               
            }


        }

    }  
    
}