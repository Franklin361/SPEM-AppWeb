using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prueba.WebApp.maestro
{
    public partial class crear_actividad : System.Web.UI.Page
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

                if (selec_grupo.Items.Count == 0)
                {
                    foreach (string l in lista)
                    {
                        selec_grupo.Items.Add(l);
                    }
                }
               
            }
            
        }

        protected void btn_crear_Click(object sender, EventArgs e)
        {
            string dato = txt_valor.Text;
            string nombreAct = txt_nombreact.Text;
            string mensaje = "";

            if (dato == "" || nombreAct == "")
            {
                mensaje += "<p class='py-2 text-center alert alert-danger'>Todos los campos son obligatorio llenarlosSeleccione un <strong>ALUMNO</strong> para poder calificar</p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
                modalbody.Attributes.Add("class", "mensaje equivocado");
                modalbody.InnerHtml = mensaje;
                return;
            }
            else if (nombreAct.Length<5)
            {
                mensaje += "<p class='py-2 text-center alert alert-danger'>El nombre de la actividad debe tener <strong>minimo 5 caracteres</strong></p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
                modalbody.Attributes.Add("class", "mensaje equivocado");
                modalbody.InnerHtml = mensaje;
                return;
            }
            else if (dato.Contains(".")|| dato.Contains(","))
            {
                mensaje += "<p class='py-2 text-center alert alert-danger'>Por el momento solo se aceptan números enteros</p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
                modalbody.Attributes.Add("class", "mensaje equivocado");
                modalbody.InnerHtml = mensaje;
                return;
            }
           
            string grupo = selec_grupo.SelectedValue;
            int IdGrupo = BusinessLogic.GrupoBBL.ObtenerID(grupo);
            
            

            mensaje = BusinessLogic.ActividadBBL.AgregarActividad(IdGrupo,nombreAct,dato);

            if (mensaje.Contains("Error"))
            {
                staticBackdropLabelID.InnerText = "Ha ocurrido un error!";
                modalbody.InnerHtml = "<p  class='py-2 text-center alert alert-danger font-weight-bold'>" + mensaje + "</p>";
                modalbody.Attributes.Add("class", "mensaje equivocado");
            }
            else
            {
                staticBackdropLabelID.InnerText = "Exito!";
                modalbody.InnerHtml = "<p  class='py-2 text-center alert alert-success font-weight-bold'>" + mensaje + "</p>";
                modalbody.Attributes.Add("class", "mensaje desequivocado");
                txt_nombreact.Text = "";
                txt_valor.Text = "";
            }

        }

        protected void btn_ver_Click(object sender, EventArgs e)
        {
            string grupo = selec_grupo.SelectedValue;
            //selccionar todas las act de el grupo que se hayan creado
            List<string> actividades = BusinessLogic.ActividadBBL.ObtenerActvidadesValorGrupoMaestro(grupo);

            if(actividades.Count != 0)
            {
                staticBackdropLabelID.InnerText = "Actividades que se han creado hasta ahora: ";

                string html = "";

                for (int i = 0; i <= actividades.Count() - 1; i++)
                {
                    html += "<div class='row'><div class='col-10 mx-auto mb-2 rounded p-3 text-left alert alert-dark'>"+(i+1)+".- "+ actividades[i] + "</div></div>";
                }

                modalbody.Attributes.Add("class", "mensaje desequivocado");


                modalbody.InnerHtml = html;
            }
            else
            {
                staticBackdropLabelID.InnerText = "Actividades que se han creado hasta ahora:"; 
                modalbody.InnerHtml = "<p  class='py-2 text-center rounded alert alert-danger'>No hay actividades creadas para este grupo</p>";
                modalbody.Attributes.Add("class", "mensaje equivocado");
            }

        }

        protected void btn_cerrar_Click(object sender, EventArgs e)
        {
            staticBackdropLabelID.InnerText = "Cerrar sesión";
            modalbody.Attributes.Add("class", "mensaje equivocado");
            modalbody.InnerHtml = "<p class='py-2 alert text-center alert-danger'>¿Seguro que desea cerrar la sesión?</p>";
            btnLCerrarSesion.Visible = true;
            btnAceptar.InnerText = "No cerrar sesión";
        }

        protected void Cerrar_Click(object sender, EventArgs e)
        {
            Session["click"] = null;
            Response.Redirect("crear-actividad.aspx");
        }

    }
}