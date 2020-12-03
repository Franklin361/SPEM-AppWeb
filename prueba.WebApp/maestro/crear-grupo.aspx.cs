using prueba.Entities;
using prueba.WebApp.inicio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prueba.WebApp.maestro
{
    public partial class crear_grupo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["click"] == null)
            {
                Response.Redirect("~/inicio/maestro.aspx");
            }
            else
            {
                btnCerrarSesion.Visible = false;
                btnAceptar.InnerText = "Aceptar";
                modalbody.Attributes.Add("class", "");
                
               

                LlenarSelectGrupo();
            }            
           
        }

        #region Llenar-Select-Grupo
        private void LlenarSelectGrupo()
        {
            int id = Convert.ToInt32(Session["click"]);

            List<string> lista = BusinessLogic.GrupoBBL.ObtenerGrupos(id);

            if (ddGrupos.Items.Count == 0)
            {
                foreach (string g in lista)
                {
                    ddGrupos.Items.Add(g);
                }
            }
        }
        #endregion

        protected void btnCrearGrupo_Click(object sender, EventArgs e)
        {
            

                string nombreGrupo = txtNombreGrupo.Text;
                string passGrupo = txtPassGrupo.Text;
                string mensaje="";
                if(nombreGrupo=="" || passGrupo == "")
                {                   
                    modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>Llenar los campos <strong>obligatoriamente</strong></p>";
                    staticBackdropLabelID.InnerText = "Ocurrio un Error";
                    modalbody.Attributes.Add("class", "mensaje equivocado");
                }
                else
                {
                    if (passGrupo.Length < 8 || nombreGrupo.Length < 8)
                    {
                        if (passGrupo.Length < 8)
                        {
                            modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>La contraseña debe contener minimo <strong>8 caracteres</strong></p>";
                            staticBackdropLabelID.InnerText = "Ocurrio un Error";
                            modalbody.Attributes.Add("class", "mensaje equivocado");
                        }
                        if(nombreGrupo.Length < 8)
                        {
                            modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>El nombre del grupo debe contener minimo <strong>8 caracteres</strong></p>";
                            staticBackdropLabelID.InnerText = "Ocurrio un Error";
                            modalbody.Attributes.Add("class", "mensaje equivocado");
                        }

                        
                    }
                    else
                    {
                        int id = Convert.ToInt32(Session["click"]);

                        mensaje =  BusinessLogic.GrupoBBL.CrearGrupo(nombreGrupo, passGrupo, id) ;

                        if (mensaje.Contains("Error"))
                        {
                            staticBackdropLabelID.InnerText = "Ha ocurrido un error!";
                            modalbody.InnerHtml = "<p  class='py-2 text-center alert alert-danger font-weight-bold'>" + mensaje + "</p>";
                            modalbody.Attributes.Add("class", "mensaje equivocado");
                        }
                        else
                        {
                            txtNombreGrupo.Text = "";
                            txtPassGrupo.Text = "";
                            staticBackdropLabelID.InnerText = "Exito!";
                            modalbody.InnerHtml = "<p  class='py-2 text-center alert alert-success font-weight-bold'>" + mensaje + "</p>";
                            modalbody.Attributes.Add("class", "mensaje desequivocado");
                            ddGrupos.Items.Clear();
                            LlenarSelectGrupo();
                        }

                        
                    
                }
            }
        }

        protected void btnAgregarAlumno_Click(object sender, EventArgs e)
        {
            string nombre = txtNombreAlumno.Text;
            string grupo = ddGrupos.SelectedValue;
            string mensaje = "";

            if (nombre == "")
            {
                modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>Llenar los campos <strong>obligatoriamente</strong></p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
                modalbody.Attributes.Add("class", "mensaje equivocado");
            }
            else
            {
                if(nombre.Length<10)
                {
                    if (nombre.Length < 10)
                    {
                        modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger font-weight-bold'>El nombre del alumno debe contener minimo <strong>2 caracteres</strong></p>";
                        staticBackdropLabelID.InnerText = "Ocurrio un Error";
                        modalbody.Attributes.Add("class", "mensaje equivocado");
                    }
                    
                }
                else
                {
                    int IdGrupo = BusinessLogic.GrupoBBL.ObtenerID(grupo);

                    mensaje = BusinessLogic.AlumnoBBL.CrearAlumno(nombre, IdGrupo);

                    if (mensaje.Contains("Error"))
                    {
                        staticBackdropLabelID.InnerText = "Ha ocurrido un error!";
                        modalbody.InnerHtml = "<p  class='py-2 text-center alert alert-danger font-weight-bold'>" + mensaje + "</p>";
                        modalbody.Attributes.Add("class", "mensaje equivocado");
                    }
                    else
                    {
                        int idAlumno = BusinessLogic.AlumnoBBL.ObtenerID(nombre);

                        BusinessLogic.Grupo_alumnoBBL.IngresarIDAlumnoGrupo(idAlumno, IdGrupo);

                        txtNombreAlumno.Text = "";
                        staticBackdropLabelID.InnerText = "Exito!";
                        modalbody.InnerHtml = "<p  class='py-2 text-center alert alert-success font-weight-bold'>" + mensaje + "</p>";
                        modalbody.Attributes.Add("class", "mensaje desequivocado");
                    }
                }
                
            }
           
        }

        protected void btnVerGrupos_Click(object sender, EventArgs e)
        {
            int idMaestro = Convert.ToInt32(Session["click"]);
            string[] grupos = BusinessLogic.GrupoBBL.ObtenerGruposPassword(idMaestro).Item1;
            string[] passwords = BusinessLogic.GrupoBBL.ObtenerGruposPassword(idMaestro).Item2;

            if(grupos == null)
            {
                modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger font-weight-bold'>No tiene ningun grupo creado</p>";
                staticBackdropLabelID.InnerText = "Atención";
                modalbody.Attributes.Add("class", "mensaje equivocado");
            }
            else
            {
                staticBackdropLabelID.InnerText = "Grupos creados hasta el momento";

                string html = "";
                html += "<table class='table table-hover  table-bordered'><thead class='thead-dark'><tr><th scope='col'> Nombre del grupo</th><th scope='col'> Contraseña </th></tr></thead> <tbody> ";

                for (int i = 0; i <= grupos.Length - 1; i++)
                {
                    html += "<tr><td>" + grupos[i] + "</td><td>" + passwords[i] + "</td><tr>";
                }

                modalbody.Attributes.Add("class", "mensaje desequivocado");
                html += "</tbody></table> ";

                modalbody.InnerHtml = html;
                
            }
        }

        protected void btnVerAlumnos_Click(object sender, EventArgs e)
        {
            string grupo = ddGrupos.SelectedValue;


            List<string> nombre = BusinessLogic.AlumnoBBL.ObtenerAlumnosGrupo(grupo);

            if (nombre.Count() == 0)
            {
                modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>No hay alumnos en el grupo: <strong>" + grupo+ "</strong></p>";
                staticBackdropLabelID.InnerText = "Atención";
                modalbody.Attributes.Add("class", "mensaje equivocado");

            }
            else
            {
               staticBackdropLabelID.InnerText = "Alumnos agregados hasta el momento";

                string html = "";
                html += "<table class='table table-hover  table-bordered'><thead class='thead-dark'><tr><th scope='col'> Nombre del alumno</th></tr></thead> <tbody> ";

                for (int i = 0; i <= nombre.Count() - 1; i++)
                {
                    html += "<tr><td>" + nombre[i] + "</td><tr>";
                }
                modalbody.Attributes.Add("class", "mensaje desequivocado");
                html += "</tbody></table> ";

                modalbody.InnerHtml = html;
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
            Response.Redirect("crear-grupo.aspx");
        }
    }
}