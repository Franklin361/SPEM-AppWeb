<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="actividades.aspx.cs" Inherits="prueba.WebApp.maestro.actividades" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link rel="shortcut icon" href="../img/logo.ico"/>
    <title>SPEM || Maestro</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>
</head>
<body style="background-image: linear-gradient( 109.6deg,  rgba(48,207,208,1) 11.2%, rgba(51,8,103,1) 92.5% ); ">



    <form runat="server">
        <nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light border border-dark">

        <a class="navbar-brand  mr-5" href="#">
            <img src="../img/logo.png" width="60" height="60" class="d-inline-block align-top" alt="" loading="lazy">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto ">

                <li class="nav-item active px-xl-5 px-md-3 px-1">
                    <a class="nav-link pl-2" href="index.aspx">Inicio</a>
                  </li>

                <li class="nav-item px-xl-5 px-md-3 px-1">
                    <a class="nav-link pl-2" href="asistencia.aspx">Asistencia</a>
                </li>

                <li class="nav-item dropdown px-xl-5 px-md-3 px-1 bg-info rounded">
                    <a class="nav-link dropdown-toggle text-white pl-2" href="#" id="navbarDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Actividades
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item pl-2" href="actividades.aspx">Calificar actividades</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item pl-2" href="crear-actividad.aspx">Crear actividades</a>
                    </div>
                </li>

                <li class="nav-item dropdown px-xl-5 px-md-3 px-1">
                    <a class="nav-link dropdown-toggle pl-2" href="#" id="navbarDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Grupos
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item pl-2" href="crear-grupo.aspx">Configuracion de grupos</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item pl-2" href="administrar-grupo.aspx">Administracion de grupos</a>
                    </div>
                </li>
                <li class="nav-item px-xl-5 px-md-3 px-1">
                    <a class="nav-link pl-2" href="retroalimentacion.aspx">Retroalimentación</a>
                </li>
                <li class="nav-item dropdown ">
                  <asp:LinkButton ID="LinkButton1" class="rounded bg-danger text-center nav-link text-white px-5" runat="server"  OnClick="btn_cerrar_Click">
                     <i class="fas fa-sign-out-alt"></i>
                 </asp:LinkButton>
              </li>
            </ul>

        </div>


    </nav>

    <div class="container">

        <div class="jumbotron jumbotron-fluid p-0 pt-5">
            <div class="container ">
                <div class="row">
                    <div class="col-lg-7 col-m-12 d-flex justify-content-center align-items-center flex-column">
                        <h2 class="display-2 text-center d-none d-sm-block">Administración de actividades</h2>

                        <h2 class="display-4 text-center d-block d-sm-none">Administrar actividades</h2>

                        <p class="lead text-center">Momento de calificar actividades</p>
                    </div>
                    <div class="col-lg-5 col-m-12">
                        <img src="../img/tarea.svg"  class="w-100"  alt="">
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 text-right my-2">
                        <button type="button" class="btn btn-warning rounded-pill p-3" data-toggle="modal" data-target="#staticBackdrop">
                            <span>Ayuda para calificar actividades</span>
                            <i class="far fa-question-circle"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12 text-white">
                <div class="row">
                    <div
                        class="col-12 col-lg-4 d-flex align-items-center font-weight-bold justify-content-lg-end justify-content-xs-start">
                        <h5 for="exampleFormControlSelect1">Selecciona un grupo:</h5>
                    </div>
                    <div class="col-12 col-lg-6">
                        <asp:DropDownList ID="select_grupo" class="col-12 form-control" runat="server"></asp:DropDownList>
                        
                    </div>

                    <div class="col-12 col-lg-2 d-flex justify-content-center align-items-center mt-3 mt-lg-0">
                        <asp:Button ID="Button3" class="btn  btn-info" runat="server" Text="Seleccionar" OnClick="Button3_Click" /> 
                    </div>
                </div>
            </div>
        </div>

        <div class="row my-5">
            <div class="col-12 col-lg-6">
                <div class="row my-3">
                    <div class="col-12">
                        <div class="row">
                            <div
                                class="col-12 text-white  d-flex align-items-center font-weight-bold justify-content-lg-start justify-content-xs-start">
                                <h5 for="exampleFormControlSelect1">Selecciona un alumno:</h5>
                            </div>
                            <div class="col-12">
                                <asp:DropDownList ID="selec_alumno" class="col-12 form-control" runat="server">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 my-5">
                        <div class="row">
                            <div
                                class="col-12 text-white d-flex font-weight-bold align-items-center justify-content-lg-start justify-content-xs-start">
                                <h5 for="exampleFormControlSelect1">Selecciona una actividad:</h5>
                            </div>
                            <div class="col-12">
                                <asp:DropDownList ID="selec_actividad" class="col-12 form-control" runat="server">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-6">
                
                <div class="row">
                    <div class="col-12 mx-auto">
                        <div class="card p-3 bg-light">
                            <asp:Label ID="lbl_titulo" class="text-center my-2" runat="server" Text=" Nombre de la actividad"></asp:Label>
                            <div class="row">
                                <div class="col-12 my-2 ">
                                    <label for="">Calificacion</label>
                                    <asp:TextBox ID="txt_cal" class="form-control" data-toggle="tooltip" data-placement="left" title="Coloca la números del 0 al 100" runat="server" TextMode="Number"></asp:TextBox>
                                    <asp:Button ID="btn_calificar" runat="server" class="btn btn-primary font-weight-bold mx-auto w-100 py-3 mt-2" Text="Calificar" OnClick="btn_calificar_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <div class="row">
            <div class="col-12 ">
                <div class="row">
                    <div class="col-12 col-lg-5 mx-auto text-center text-lg-right mt-4">
                        <%--<button class="btn btn-success p-2 w-75">Guardar cambios</button>--%>
                        <asp:Button ID="btn_vista" runat="server" class="btn btn-warning font-weight-bold py-3 w-75" Text="Vista previa" OnClick="btn_vista_Click" />
                    </div>
                    <div class="col-12 col-lg-5 mx-auto text-center mt-4">
                        <a href="crear-actividad.aspx" class="btn btn-warning font-weight-bold py-3 w-75">Crear actividad</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row" runat="server" id="CAJAtitulo">
            <div class="col-12 text-center mt-5 py-2">
                <h3><asp:Label ID="lbl_NombreAlumno" CssClass="font-weight-bold" runat="server" Text="lbl_nombreAlumno"></asp:Label></h3>
            </div>
        </div>

        <div class="row" runat ="server" id="caja_information">
            <div runat="server" id="caja_rango"> 
                <asp:Label ID="lbl_rango" runat="server" Text=""></asp:Label>
            </div>
        </div>
        
        <div class="row" runat="server" id="caja_lista">

        </div>
        
    </div>


    <footer class="container">
        <div class="row border-top py-4 mt-5 text-center">
            <div class="col-12">
                <p class="text-light ">Derechos reservados SPEM&copy; 2020</p>
            </div>
        </div>
    </footer>

   

    <!-- Modal Inicio de sesion -->
    <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="staticBackdropLabel">¿Cómo colocar calificación a las actividades?</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body ">
                    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">

                            <div class="carousel-item active ">
                                <div style="background-color: rgba(146, 121, 255, 0.315); min-height: 50vh;"
                                    class="d-flex justify-content-center align-items-center p-5 text-center text-dark">
                                    <div class="row">
                                        <div class="col-10 mx-auto">
                                            <h3 class="font-weight-bold">1. Selecciona un grupo.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                Antes de realizar cualquier otra acción, primero selecciona un grupo.
                                                Esto con el fin de obtener los alumnos de dicho grupo y poder
                                                seleccionar al alumno y colocarle la asistencia.
                                            </h5>
                                            <div class="row">
                                                <div class="col-12 rounded alert alert-warning text-justify">
                                                    <h5>
                                                        Nota: si no te aparece ningún grupo en la lista, ve a la sección de Grupos -> Crear grupos y crea un grupo nuevo y asígnale alumnos al dicho grupo.
                                                    </h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="carousel-item">
                                <div style="background-color: rgba(146, 121, 255, 0.315); min-height: 50vh;"
                                    class="d-flex justify-content-center align-items-center p-5 text-center text-dark">
                                    <div class="row">
                                        <div class="col-10 mx-auto">
                                            <h3 class="font-weight-bold">2. Selecciona a un alumno.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                Los alumnos dependen del grupo que seleccione, se cargaran automáticamente.                                                
                                            </h5>
                                            <div class="row">
                                                <div class="col-12 rounded alert alert-warning text-justify">
                                                    <h5>
                                                        Nota: si no te aparece ningún alumno en la lista, ve a la sección de Grupos -> Crear grupos y en la sección Agregar alumno, seleccionas un grupo al cual le quieres agregar alumnos y colocas los nombres y apellidos correctamente.
                                                    </h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="carousel-item">
                                <div style="background-color: rgba(146, 121, 255, 0.315); min-height: 50vh;"
                                    class="d-flex justify-content-center align-items-center p-5 text-center text-dark">
                                    <div class="row">
                                        <div class="col-10 mx-auto">
                                            <h3 class="font-weight-bold">3. Selecciona una actividad.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                Las actividades se cargarán automáticamente una vez seleccionado un grupo.

                                            </h5>
                                            <div class="row">
                                                <div class="col-12 rounded alert alert-warning text-justify">
                                                    <h5>
                                                        Nota: si no te aparece ninguna actividad en la lista, ve a la sección de Actividades -> Crear actividad, seleccionas un grupo al cual le quieres agregar actividades y colocas los respectivos datos que te piden correctamente.
                                                    </h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="carousel-item">
                                <div style="background-color: rgba(146, 121, 255, 0.315); min-height: 50vh;"
                                    class="d-flex justify-content-center align-items-center p-5 text-center text-dark">
                                    <div class="row">
                                        <div class="col-10 mx-auto">
                                            <h3 class="font-weight-bold">4.Calificar actividad.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                En el campo para calificar, solo acepta números del 0 al 100 y no debe ir vacío al momento de calificar.
                                                El botón Calificar realiza dos opciones:
                                                <ul>
                                                    <li>Agrega la calificación (si es que no ha colocado la calificación con anterioridad).</li>
                                                    <li>Modifica la calificación (si a cierto alumno tenía ya una calificación colocada, tiene la capacidad de modificarla, solamente colocando la nueva calificación y dando clic en el botón de Calificar).</li>
                                                </ul>
                                            </h5>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="carousel-item">
                                <div style="background-color: rgba(146, 121, 255, 0.315); min-height: 50vh;"
                                    class="d-flex justify-content-center align-items-center p-5 text-center text-dark">
                                    <div class="row">
                                        <div class="col-10 mx-auto">
                                            <h3 class="font-weight-bold">5.Vista previa.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                El botón, permite visualizar lo referente a las actividades que ya ha calificado a cierto alumno:

                                                <ul>
                                                    <li>El nombre de las actividades que ha calificado.</li>
                                                    <li>El valor que tiene dicha actividad.</li>
                                                    <li>La calificación que le coloco.</li>
                                                </ul>
                                            </h5>
                                            <div class="row">
                                                <div class="col-12 rounded alert alert-warning text-justify">
                                                    <h5>
                                                        Nota: para visualizar las actividades calificadas de cierto alumno, se necesita tener seleccionada un grupo y un alumno obligatoriamente.
                                                    </h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="carousel-item">
                                <div style="background-color: rgba(146, 121, 255, 0.315); min-height: 50vh;"
                                    class="d-flex justify-content-center align-items-center p-5 text-center text-dark">
                                    <div class="row">
                                        <div class="col-10 mx-auto">
                                            <h3 class="font-weight-bold">6. Ver la asistencia.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                Te redirige a la sección de Creación de actividades.
                                            </h5>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <a class="carousel-control-prev text-dark " href="#carouselExampleCaptions" role="button"
                            data-slide="prev">
                            <h2><i class="fas fa-chevron-circle-left"></i></h2>
                        </a>
                        <a class="carousel-control-next text-dark " href="#carouselExampleCaptions" role="button"
                            data-slide="next">
                            <h2><i class="fas fa-chevron-circle-right"></i></h2>
                        </a>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="mimodal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabelID" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" runat="server" id="staticBackdropLabelID">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div runat="server" id="modalbody">

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnAceptar" runat="server" class="btn btn-secondary" data-dismiss="modal">Aceptar</button>    
                    
                         <asp:Button ID="btnCerrarSesion" class="btn btn-danger"  runat="server" Text="Cerrar sesión" OnClick="btnCerrarSesion_Click" />
                </div>
            </div>
        </div>
    </div>
     </form>
    <script>
        
        
        document.addEventListener('DOMContentLoaded', GetUserName);

        const caja = document.getElementById('caja_lista');

            let nombre = '<%=Session["tareas"]%>'
            let total = '<%=Session["vale"]%>'
            let valor = '<%=Session["valores"]%>'
            const nombres = nombre.split("&");
            const valores = valor.split("&");
            const totales = total.split("&");
        let html = "";

        function GetUserName() {
                        
            const modalmE = document.querySelector('.desequivocado');
            const modalmEr = document.querySelector('.equivocado');

            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();

                if (modalmEr) {
                    $('#mimodal').modal('show')

                } else if (modalmE) {
                    $('#mimodal').modal('show');
                }

            });


            for (let i = 0; i <= nombres.length - 2; i++) {
                html += `<div class="col-12 col-lg-4 mt-4">
                <div class="card text-center p-3 alert alert-secondary">
                    <div class="card-body">
                        <h4 class="card-title ">${nombres[i]}</h4>
                        <div class="col-md-12 mb-3">
                            <label for="validationDefault02">Valor:</label>
                            <p class="form-control">${totales[i]}</p>
                        </div>
                        <div class="col-md-12 mb-3">
                            <label for="validationDefault02" >Calificación:</label>
                            <p class="form-control"  id="validationDefault02">${valores[i]}</p>
                        </div>
                        
                    </div>
                </div>
            </div>`;
                caja.innerHTML = html;
            }
            '<%=Session["tareas"]=null%>'
            '<%=Session["valores"]=null%>'
            '<%=Session["vale"]=null%>'

    
        }
       

        
    </script>
    <script src="https://kit.fontawesome.com/5fa83d646f.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>

</body>
</html>
