using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prueba.WebApp.maestro
{
    public partial class actividades : System.Web.UI.Page
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

                int id = Convert.ToInt32(Session["click"]);

                List<string> lista = BusinessLogic.GrupoBBL.ObtenerGrupos(id);

                if (select_grupo.Items.Count == 0)
                {
                    foreach (string l in lista)
                    {
                        select_grupo.Items.Add(l);
                    }
                }

                CAJAtitulo.Visible = false;
                caja_information.Visible = false;
             

            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string grupo = select_grupo.SelectedValue;

            //1.consultar nombre y apellido alumnos
            List<string> nombres = BusinessLogic.AlumnoBBL.ObtenerAlumnosGrupo(grupo);

            int longi = nombres.Count();
            string[] nombreCompleto = new string[longi];

            int a = selec_alumno.Items.Count;
            if(nombres.Count != 0)
            {
                if (a == 0)
                {
                    for (int i = 0; i <= longi - 1; i++)
                    {
                        nombreCompleto[i] = nombres[i];
                        selec_alumno.Items.Add(nombreCompleto[i]);
                    }
                }
            }
            else
            {
                selec_alumno.Items.Clear();                
                
            }
            

            //2.consultar actividades
            List<string> actividades = BusinessLogic.ActividadBBL.ObtenerActvidadesGrupoMaestro(grupo);
           if(actividades.Count != 0)
            {
                if (selec_actividad.Items.Count == 0)
                {
                    foreach (string l in actividades)
                    {
                        selec_actividad.Items.Add(l);
                    }
                }
            }
            else
            {
                selec_actividad.Items.Clear();
            }
                                  
        }

        protected void btn_calificar_Click(object sender, EventArgs e)
        {
            string nombre = selec_alumno.SelectedValue;
            string actividad = selec_actividad.SelectedValue;
            string calificacion = txt_cal.Text.Trim();
            string mensajeErrores = "";

            if (nombre == "")
            {
               
                mensajeErrores += "<p class='py-2 alert alert-danger '>Seleccione un <strong>ALUMNO</strong> para poder calificar</p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
                modalbody.Attributes.Add("class", "mensaje equivocado");
                modalbody.InnerHtml = mensajeErrores;

            }
            if (actividad == "")
            {
                
                mensajeErrores += "<p class='py-2 alert alert-danger'>Seleccione una <strong>ACTIVIDAD</strong> para poder calificar</p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
                modalbody.Attributes.Add("class", "mensaje equivocado");
                modalbody.InnerHtml = mensajeErrores;
            }
            if (calificacion == "")
            {
               
                mensajeErrores += "<p class='py-2 alert alert-danger'>El campo de calificación No debe ir vacío</p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
                modalbody.Attributes.Add("class", "mensaje equivocado");
                modalbody.InnerHtml = mensajeErrores;
            }
           
            if(nombre != "" && actividad != "" && calificacion != "")
            {
                if (Convert.ToInt32(calificacion) < 0 || Convert.ToInt32(calificacion) > 100)
                {
                    
                    mensajeErrores = "<p class='py-2 alert text-center alert-danger'>Solo números del 0 al 100</p>";
                    staticBackdropLabelID.InnerText = "Ocurrio un Error";
                    modalbody.Attributes.Add("class", "mensaje equivocado");
                    modalbody.InnerHtml = mensajeErrores;
                }
                else
                {                   

                    int cali = Convert.ToInt32(txt_cal.Text);                    

                    mensajeErrores = BusinessLogic.Alumno_actividadBBL.CalificarActividad( actividad, nombre, cali);                  

                    if (mensajeErrores.Contains("Error"))
                    {
                       
                        staticBackdropLabelID.InnerText = "Ha ocurrido un error!";
                        modalbody.InnerHtml = "<p  class='py-2 text-center alert alert-danger font-weight-bold'>" + mensajeErrores + "</p>";
                        modalbody.Attributes.Add("class", "mensaje equivocado");
                    }
                    else
                    {
                        staticBackdropLabelID.InnerText = "Exito!";
                        modalbody.InnerHtml = "<p  class='py-2 text-center alert alert-success font-weight-bold'>" + mensajeErrores + "</p>";
                        modalbody.Attributes.Add("class", "mensaje desequivocado");
                        

                    }                    
                }

                txt_cal.Text = "";
            }
        
        }

        protected void btn_vista_Click(object sender, EventArgs e)
        {

            string nombre = selec_alumno.SelectedValue;
            string mensajeErrores = "";

            if (nombre == "")
            {
                mensajeErrores = "<p class='py-2 text-center alert alert-danger'>Seleccione un <strong>ALUMNO</strong> para poder ver sus actividades calificadas</p>";
                staticBackdropLabelID.InnerText = "Ocurrio un Error";
                modalbody.Attributes.Add("class", "mensaje equivocado");
                modalbody.InnerHtml = mensajeErrores;
            }
            else
            {
                //1.-Nombre y apellido de los alumnos

                lbl_NombreAlumno.Text = "Calificaciones del alumno: <span class='text-white'>" + nombre+ "</span>";
                
                int id = BusinessLogic.AlumnoBBL.ObtenerID(nombre);


                //2. Nombre de actividades y calificacion del grupo seleccionado

                string[] name = BusinessLogic.ActividadBBL.ObtenerActividades(id).Item1;
                string[] value = BusinessLogic.ActividadBBL.ObtenerActividades(id).Item2;
                string[] valorTotal = BusinessLogic.ActividadBBL.ObtenerActividades(id).Item3;


                //3. Obtener act totales del grupo del maestro
                string grupo = select_grupo.SelectedValue;
                List<string> totalAct = BusinessLogic.ActividadBBL.ObtenerActvidadesGrupoMaestro(grupo);

                int rango = totalAct.Count() - name.Length;

                lbl_rango.Text = "Tareas calificadas: " + name.Length + " de " + totalAct.Count();

                #region JOIN-ARRAY
                /*-------------JOIN ARRAY-----------*/
                foreach (string a in name)
                {
                    Session["tareas"] += a + "&";
                }
                foreach (string a in valorTotal)
                {
                    Session["vale"] += a + "&";
                }
                foreach (string a in value)
                {
                    Session["valores"] += a + "&";
                }
                /*-------------JOIN ARRAY-----------*/
                #endregion


                if (rango == 0)
                {
                    caja_rango.Attributes.Add("class", "col-4 mx-auto my-3 py-3 rounded alert alert-success text-center");

                }
                else if (rango > 0)
                {
                    caja_rango.Attributes.Add("class", "col-4 mx-auto my-3 py-3 rounded alert alert-danger text-center");
                    //warning
                }
                CAJAtitulo.Visible = true;
                caja_information.Visible = true;
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