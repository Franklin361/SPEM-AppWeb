using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prueba.WebApp.maestro
{
    public partial class administrar_grupo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["click"] == null)
            {
                Response.Redirect("~/inicio/maestro.aspx");
            }
            else
            {
                modalbody.Attributes.Add("class", "");
                btnCerrarSesion.Visible = false;
                btnAceptar.InnerText = "Aceptar";
                LlenarSelectGrupo();

            }
            
        }
        #region Llenar-Select-Grupo
        private void LlenarSelectGrupo()
        {
            int id = Convert.ToInt32(Session["click"]);

            List<string> lista = BusinessLogic.GrupoBBL.ObtenerGrupos(id);

            if (selec_grupo.Items.Count == 0)
            {
                foreach (string g in lista)
                {
                    selec_grupo.Items.Add(g);
                }
            }
        }
        #endregion

        protected void btn_seleccionarGrupo_Click(object sender, EventArgs e)
        {
            //1.consultar nombre y apellido alumnos
            LlenarSelectAlumno();

            //2.consultar actividades
            LlenarSelectActividad();
        }
        #region Llenar-Select-Alumno
        private void LlenarSelectAlumno()
        {
            string grupo = selec_grupo.SelectedValue;
            List<string> nombres = BusinessLogic.AlumnoBBL.ObtenerAlumnosGrupo(grupo);
    
            if (nombres.Count != 0)
            {
                if (selec_alumno.Items.Count == 0)
                {
                    foreach (string n in nombres)
                    {
                        selec_alumno.Items.Add(n);
                    }
                }
            }
            else
            {
                selec_alumno.Items.Clear();
            }
        }
        #endregion

        #region Llenar-Select-Actividades
        private void LlenarSelectActividad()
        {
            string grupo = selec_grupo.SelectedValue;
            List<string> actividades = BusinessLogic.ActividadBBL.ObtenerActvidadesGrupoMaestro(grupo);

            if (actividades.Count != 0)
            {
                if (selec_actividad.Items.Count == 0)
                {
                    foreach (string a in actividades)
                    {
                        selec_actividad.Items.Add(a);
                    }
                }
            }
            else
            {
                selec_actividad.Items.Clear();
            }
        }
        #endregion

        protected void btn_editarGrupo_Click(object sender, EventArgs e)
        {
            //obtener id de grupo
            string grupo = selec_grupo.SelectedValue;
            string nombreGrupo = txt_nombreGrupo.Text;
            string password = txt_passwordGrupo.Text;

            if (Page.IsValid)
            {
                if (nombreGrupo == "" && password == "")
                {                    
                    modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>Al menos un campo es <strong>obligatorio</strong></p>";
                    staticBackdropLabelID.InnerText = "Ocurrio un Error";
                    modalbody.Attributes.Add("class", "mensaje equivocado");
                }
                else
                {
                    if (password.Length < 8 && password.Length > 0)
                    {
                        modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>La contraseña debe contener minimo <strong>8 caracteres</strong></p>";
                        staticBackdropLabelID.InnerText = "Ocurrio un Error";
                        modalbody.Attributes.Add("class", "mensaje equivocado");
                    }
                    else if (nombreGrupo.Length < 8 && nombreGrupo.Length > 0)
                    {
                        
                        modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>El nombre del grupo debe contener minimo <strong>8 caracteres</strong></p>";
                        staticBackdropLabelID.InnerText = "Ocurrio un Error";
                        modalbody.Attributes.Add("class", "mensaje equivocado");
                    }
                    else
                    {
                        int idGrupo = BusinessLogic.GrupoBBL.ObtenerID(grupo);
                        string mensaje = BusinessLogic.GrupoBBL.EditarGrupo(nombreGrupo, password, idGrupo) ;

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
                            txt_nombreGrupo.Text = "";
                            txt_passwordGrupo.Text = "";
                            selec_grupo.Items.Clear();
                            LlenarSelectGrupo();
                        }
                    }
                }
            }
                
        }

        protected void btn_eliminarGrupo_Click(object sender, EventArgs e)
        {
            string grupo = selec_grupo.SelectedValue;
            int idGrupo = BusinessLogic.GrupoBBL.ObtenerID(grupo);
            string mensaje = BusinessLogic.GrupoBBL.EliminarGrupo(idGrupo);

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
                LlenarSelectGrupo();
            }


        }

        protected void btn_editarAlumno_Click(object sender, EventArgs e)
        {
            string nombreNuevo = txt_nombreAlumno.Text;
            string nombre = selec_alumno.SelectedValue;
            
            if (nombre == "" )
            {
                modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>Seleccione un <strong>GRUPO</strong> para que aparezcan los alumnos pertenecientes</p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
                modalbody.Attributes.Add("class", "mensaje equivocado");
            }
            else if (nombreNuevo=="")
            {
                modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>Al menos un campo es <strong>obligatorio</strong></p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
                modalbody.Attributes.Add("class", "mensaje equivocado");
            }
            else
            {
                if ((nombreNuevo.Length < 5 && nombreNuevo.Length > 0))
                {
                    modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>El nombre del alumno debe contener minimo <strong>5 caracteres</strong></p>";
                    staticBackdropLabelID.InnerText = "Ocurrio un Error";
                    modalbody.Attributes.Add("class", "mensaje equivocado");

                }
                else
                {
                    
                    int idAlumno = BusinessLogic.AlumnoBBL.ObtenerID(nombre);

                    string mensaje = BusinessLogic.AlumnoBBL.EditarAlumno(nombreNuevo, idAlumno);

                    if (mensaje.Contains("Error"))
                    {
                        
                        staticBackdropLabelID.InnerText = "Ha ocurrido un error!";
                        modalbody.InnerHtml = "<p  class='py-2 text-center alert alert-danger font-weight-bold'>" + mensaje + "</p>";
                        modalbody.Attributes.Add("class", "mensaje equivocado");
                    }
                    else
                    {
                        txt_nombreAlumno.Text = "";
                        staticBackdropLabelID.InnerText = "Exito!";
                        modalbody.InnerHtml = "<p  class='py-2 text-center alert alert-success font-weight-bold'>" + mensaje + "</p>";
                        modalbody.Attributes.Add("class", "mensaje desequivocado");
                        selec_alumno.Items.Clear();
                        LlenarSelectAlumno();
                    }
                }
            }

          
        }

        protected void btn_eliminarAlumno_Click(object sender, EventArgs e)
        {
            string nombre = selec_alumno.SelectedValue;
            

            if (nombre == "")
            {
                modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>Seleccione un <strong>GRUPO</strong> para que aparezcan los alumnos pertenecientes</p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
                modalbody.Attributes.Add("class", "mensaje equivocado");
            }
            else
            {            
                int idAlumno = BusinessLogic.AlumnoBBL.ObtenerID(nombre);
                string mensaje = BusinessLogic.AlumnoBBL.EliminarAlumno(idAlumno);

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
                    selec_alumno.Items.Clear();
                    LlenarSelectAlumno();
                }

                
            }
        }

        protected void btn_editarActividad_Click(object sender, EventArgs e)
        {
            string nombreActividad = txt_nombreActividad.Text;
            string valor = txt_valorActividad.Text;
            string nombreActividadSelec = selec_actividad.SelectedValue;           

            if (nombreActividadSelec == "")
            {
                modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>Seleccione un <strong>GRUPO</strong> para que aparezcan los actividades pertenecientes</p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
                modalbody.Attributes.Add("class", "mensaje equivocado");
            }
            else if (nombreActividad =="" && valor=="")
            {
                modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>Al menos un campo es <strong>obligatorio</strong></p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
                modalbody.Attributes.Add("class", "mensaje equivocado");
            }
            else
            {
                if ((nombreActividad.Length < 5 && nombreActividad.Length > 0))
                {
                        modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>El nombre de la actividad debe tener minimo <strong>5 caracteres</strong></p>";
                        staticBackdropLabelID.InnerText = "Ocurrio un Error";
                        modalbody.Attributes.Add("class", "mensaje equivocado");                    
                }
                else
                {
                    int idAct = BusinessLogic.ActividadBBL.ObtenerID(nombreActividadSelec);
                    string mensaje = BusinessLogic.ActividadBBL.EditarActividad(nombreActividad, valor, idAct);
                    if (mensaje.Contains("Error"))
                    {
                        staticBackdropLabelID.InnerText = "Ha ocurrido un error!";
                        modalbody.InnerHtml = "<p  class='py-2 text-center alert alert-danger font-weight-bold'>" + mensaje + "</p>";
                        modalbody.Attributes.Add("class", "mensaje equivocado");
                    }
                    else
                    {
                        txt_nombreActividad.Text = "";
                        txt_valorActividad.Text = "";
                        staticBackdropLabelID.InnerText = "Exito!";
                        modalbody.InnerHtml = "<p  class='py-2 text-center alert alert-success font-weight-bold'>" + mensaje + "</p>";
                        modalbody.Attributes.Add("class", "mensaje desequivocado");
                        selec_actividad.Items.Clear();
                        LlenarSelectActividad();
                    }
                }
            }
           
        }

        protected void btn_eliminarActividad_Click(object sender, EventArgs e)
        {
            string nombreActividad = selec_actividad.SelectedValue;            

            if (nombreActividad == "")
            {
                
                modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>Seleccione un <strong>GRUPO</strong> para que aparezcan los actividades pertenecientes</p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
                modalbody.Attributes.Add("class", "mensaje equivocado");
            }
            else
            {
                int idAct = BusinessLogic.ActividadBBL.ObtenerID(nombreActividad);

               string mensaje = BusinessLogic.ActividadBBL.EliminarActividad(idAct);

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
                    selec_actividad.Items.Clear();
                    LlenarSelectActividad();
                }
            }
            
            
        }

        protected void btn_cerrar_Click(object sender, EventArgs e)
        {
            staticBackdropLabelID.InnerText = "Cerrar sesión";
            modalbody.Attributes.Add("class", "mensaje equivocado");
            modalbody.InnerHtml = "<p class='py-2 text-center alert alert-danger'>¿Seguro que desea cerrar la sesión?</p>";
            btnCerrarSesion.Visible = true;
            btnAceptar.InnerText = "No cerrar sesión";
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["click"] = null;
            Response.Redirect("administrar-grupo.aspx");
        }
    }
}