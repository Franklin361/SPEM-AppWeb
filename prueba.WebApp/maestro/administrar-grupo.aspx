<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="administrar-grupo.aspx.cs" Inherits="prueba.WebApp.maestro.administrar_grupo" %>

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

                <li class="nav-item dropdown px-xl-5 px-md-3 px-1">
                    <a class="nav-link dropdown-toggle  pl-2" href="#" id="navbarDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Actividades
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item pl-2" href="actividades.aspx">Calificar actividades</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item pl-2" href="crear-actividad.aspx">Crear actividades</a>
                    </div>
                </li>

                <li class="nav-item dropdown px-xl-5 px-md-3 px-1 bg-info rounded">
                    <a class="nav-link dropdown-toggle text-white pl-2" href="#" id="navbarDropdown" role="button"
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
                            <h2 class="display-2 text-center d-none d-sm-block">Administración de grupos</h2>

                            <h2 class="display-4 text-center d-block d-sm-none">Administrar de grupos</h2>
                            <p class="lead text-center">Modifica tus grupos creados</p>
                        </div>
                        <div class="col-lg-5 col-m-12">
                            <img src="../img/grupo-header.svg" class="w-100" alt="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 text-right my-2">
                            <button type="button" class="btn btn-warning rounded-pill p-3" data-toggle="modal" data-target="#staticBackdrop">
                                <span>Ayuda para administrar grupos</span>
                                <i class="far fa-question-circle"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <%-- select de grupo --%>
            <div class="row">
                <div class="col-12 text-white">
                    <div class="row">
                        <div class="col-12 col-lg-4 d-flex align-items-center justify-content-lg-end justify-content-xs-start">
                            <h5 for="exampleFormControlSelect1">Selecciona un grupo:</h5>
                        </div>
                        <div class="col-12 col-lg-6">
                            <asp:DropDownList ID="selec_grupo" class="form-control" runat="server"></asp:DropDownList>
                        </div>

                        <div class="col-12 col-lg-2 d-flex justify-content-center align-items-center mt-3 mt-lg-0">
                            <asp:Button ID="btn_seleccionarGrupo" runat="server" class="btn btn-info" Text="Seleccionar" OnClick="btn_seleccionarGrupo_Click" />
                        </div>
                    </div>
                </div>
            </div>


            <div runat="server" id="ocultar">
                 <%-- Update or delete grupo --%>
            <div class="row my-5">
                <div class="col-12 mt-5">
                    <fieldset class="border border-light alert alert-dark p-3">
                        <legend class="bg-light rounded w-75 text-center">Editar grupo</legend>
                        <div class="row">
                            <div class="col-12 ">
                                <div class="form-row">
                                    <div class="col-md-6 mb-2">
                                        <label for="validationDefault02">Nombre del grupo:</label>
                                        <asp:TextBox ID="txt_nombreGrupo" data-toggle="tooltip" data-placement="top" title="Minimo 8 caracteres" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 mb-2">
                                        <label for="validationDefault02">Contraseña del grupo:</label>
                                        <asp:TextBox ID="txt_passwordGrupo" data-toggle="tooltip" data-placement="top" title="Minimo 8 caracteres y sin espacios" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 text-center">
                                <div class="row">
                                    <div class="col-lg-4 col-12 text-lg-right">
                                        <asp:Button ID="btn_editarGrupo" class="btn btn-primary w-75 py-2 mt-3" runat="server" Text="Guardar cambios" OnClick="btn_editarGrupo_Click" />
                                    </div>
                                    <div class="col-lg-4 col-12">
                                        <button type="button" id="limpiarGrupo" class="btn btn-warning py-2 w-75 mt-3">Limpiar campos</button>
                                    </div>
                                    <div class="col-lg-4 col-12">
                                        <asp:Button ID="btn_eliminarGrupo" class="btn btn-danger w-75 py-2 mt-3" runat="server" Text="Eliminar grupo" OnClick="btn_eliminarGrupo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </fieldset>
                </div>
            </div>

            <div class="row my-4">
                <div class="col-lg-4 col-12 mx-auto text-center">
                    <a href="crear-grupo.aspx" class="btn btn-info p-3 font-weight-bold w-100">Crear nuevo grupo</a>
                </div>
            </div>
            <%-- Update or delete alumnos  --%>
            <div class="row my-5">
                <div class="col-12 mt-5">
                    <fieldset class="border border-light alert alert-dark p-3">
                        <legend class="bg-light rounded w-75 text-center">Editar alumno</legend>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-row">
                                    <div class="col-md-4 mb-2">
                                        <label for="validationDefault02">Selecciona un alumno:</label>
                                         <asp:DropDownList ID="selec_alumno" class="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                    <div class="col-md-8 mb-2">
                                        <label for="validationDefault02">Nombre del alumno:</label>
                                        <asp:TextBox ID="txt_nombreAlumno" data-toggle="tooltip" data-placement="top" title="Coloca nombres y apellidos correctamente" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 text-center">
                                <div class="row">
                                    <div class="col-lg-4 col-12 text-lg-right">
                                        <asp:Button ID="btn_editarAlumno" class="btn btn-primary w-75 py-2 mt-3" runat="server" Text="Guardar cambios" OnClick="btn_editarAlumno_Click" />
                                    </div>
                                    <div class="col-lg-4 col-12">
                                        <button type="button" id="limpiarAlumno" class="btn btn-warning py-2 w-75 mt-3">Limpiar campos</button>
                                    </div>
                                    <div class="col-lg-4 col-12">
                                        <asp:Button ID="btn_eliminarAlumno" class="btn btn-danger w-75 py-2 mt-3" runat="server" Text="Eliminar alumno" OnClick="btn_eliminarAlumno_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </fieldset>
                </div>
            </div>

            <div class="row my-4">
                <div class="col-lg-4 col-12 mx-auto text-center">
                    <a href="crear-grupo.aspx" class="btn btn-info p-3 w-100 font-weight-bold">Agregar alumno nuevo a un grupo</a>
                </div>
            </div>

            <%-- Update or delete actividades  --%>
            <div class="row my-5">
                <div class="col-12 mt-5">
                    <fieldset class="border border-light alert alert-dark p-3">
                        <legend class="bg-light rounded w-75 text-center">Editar actividad</legend>
                        <div class="row">
                            <div class="col-12 ">
                                <div class="form-row">
                                    <div class="col-md-4 mb-2">
                                        <label for="validationDefault02">Selecciona una actividad:</label>
                                         <asp:DropDownList ID="selec_actividad" class="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                    <div class="col-md-4 mb-2">
                                        <label for="validationDefault02">Nombre de la actividad:</label>
                                        <asp:TextBox ID="txt_nombreActividad" data-toggle="tooltip" data-placement="top" title="Minimo 5 caracteres" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4 mb-2">
                                        <label for="validationDefault02">Valor de la actividad:</label>
                                        <asp:TextBox ID="txt_valorActividad" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 text-center">
                                <div class="row">
                                    <div class="col-lg-4 col-12 text-lg-right">
                                        <asp:Button ID="btn_editarActividad" class="btn btn-primary py-2 w-75 mt-3" runat="server" Text="Guardar cambios" OnClick="btn_editarActividad_Click" />
                                    </div>
                                    <div class="col-lg-4 col-12">
                                        <button type="button" id="limpiarAct" class="btn btn-warning py-2 w-75 mt-3">Limpiar campos</button>
                                    </div>
                                    <div class="col-lg-4 col-12">
                                        <asp:Button ID="btn_eliminarActividad" class="btn btn-danger py-2 w-75 mt-3" runat="server" Text="Eliminar actividad" OnClick="btn_eliminarActividad_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </fieldset>
                </div>
            </div>

            <div class="row my-4">
                <div class="col-lg-4 col-12 mx-auto  text-center">
                    <a href="crear-actividad.aspx" class="btn btn-info font-weight-bold p-3 w-100">Crear una nueva actividad</a>
                </div>
            </div>
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
                    <h2 class="modal-title" id="staticBackdropLabel">¿Cómo administrar grupos?</h2>
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
                                            <h3 class="font-weight-bold">2.Editar un grupo.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                Una vez seleccionado el grupo, modifica mínimo uno de los dos campos que se presentan en el formulario “Editar grupo” con nuevos datos y correctamente, sin nombres repetidos y/o contraseñas con menos de 8 caracteres.                                      
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
                                            <h3 class="font-weight-bold">3.Eliminar grupo.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                Las actividades se cargarán automáticamente una vez seleccionado un grupo.                                              
                                            </h5>
                                            <div class="row">
                                                <div class="col-12 rounded alert alert-warning text-justify">
                                                    <h5>
                                                        Nota: Asegurarse que el grupo que vaya a eliminar sea el indicado, ya que se eliminara de forma permanente.
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
                                            <h3 class="font-weight-bold">4.Crear nuevo grupo.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                Este botón te redirige a la sección Grupos -> Crear grupos.

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
                                            <h3 class="font-weight-bold">5.Editar alumno.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                Una vez seleccionado el grupo y seleccionado el alumno, modifica mínimo uno de los dos campos que se presentan en el formulario “Editar alumno” con nuevos datos y correctamente.
                                            </h5>
                                            <div class="row">
                                                <div class="col-12 rounded alert alert-warning text-justify">
                                                    <h5>
                                                        Nota: si no te aparece ningún alumno en la lista desplegable del formulario “Editar alumno”, ve a la sección de Grupos -> Crear grupos, selecciona un grupo y agrega los alumnos correspondientes.
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
                                            <h3 class="font-weight-bold">6.Eliminar alumno.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                Una vez seleccionado el grupo y seleccionado al alumno, solamente da clic en el botón de “Eliminar alumno”.
                                            </h5>
                                            <div class="row">
                                                <div class="col-12 rounded alert alert-warning text-justify">
                                                    <h5>
                                                        Nota: Asegurarse que el alumno que vaya a eliminar sea el correcto, ya que se eliminara de forma permanente.
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
                                            <h3 class="font-weight-bold">7.Agregar alumno nuevo a un grupo.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                Este botón te redirige a la sección Grupos -> Crear grupos.
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
                                            <h3 class="font-weight-bold">8.Editar actividad.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                Una vez seleccionado el grupo y seleccionado la actividad, modifica mínimo uno de los dos campos que se presentan en el formulario “Editar actividad” con nuevos datos y correctamente, en el caso del valor, solo números del 0 al 100.

                                            </h5>
                                            <div class="row">
                                                <div class="col-12 rounded alert alert-warning text-justify">
                                                    <h5>
                                                        Nota: si no te aparece ninguna actividad en la lista desplegable del formulario “Editar actividad”, ve a la sección de Actividades -> Crear actividad, seleccionas un grupo al cual le quieres agregar actividades y colocas los respectivos datos que te piden correctamente.
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
                                            <h3 class="font-weight-bold">9.Eliminar actividad.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                Una vez seleccionado el grupo y seleccionado la actividad, solamente da clic en el botón de “Eliminar actividad”.
                                            </h5>
                                            <div class="row">
                                                <div class="col-12 rounded alert alert-warning text-justify">
                                                    <h5>
                                                        Nota: Asegurarse que la actividad que vaya a eliminar sea el correcto, ya que se eliminara de forma permanente.
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
                                            <h3 class="font-weight-bold">10.Crear una nueva actividad.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                Este botón te redirige a la sección Actividades -> Crear actividad.
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
                    <asp:Button ID="btnCerrarSesion"  class="btn btn-danger"  runat="server" Text="Cerrar sesión" OnClick="btnCerrarSesion_Click" />
                </div>
            </div>
        </div>
    </div>
    </form>

    <script>
       

        document.addEventListener('DOMContentLoaded', () => {

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
            
        });

        const limpiarGrupo = document.getElementById('limpiarGrupo');
        const limpiarAlumno = document.getElementById('limpiarAlumno');
        const limpiarAct = document.getElementById('limpiarAct');

        const txtNombreGrupo = document.querySelector('#txt_nombreGrupo');
        const txtPassGrupo = document.querySelector('#txt_passwordGrupo');
        const txtNombreAlumno = document.querySelector('#txt_nombreAlumno');
        const txtApellidoAlumno = document.querySelector('#txt_apellidoAlumno');
        const txtNombreAct = document.querySelector('#txt_nombreActividad');
        const txtValorAct = document.querySelector('#txt_valorActividad');

        limpiarGrupo.addEventListener('click', () => {
            txtNombreGrupo.value = "";
            txtPassGrupo.value = "";
            txtNombreGrupo.focus();
            
        });
        limpiarAlumno.addEventListener('click', () => {
            txtNombreAlumno.value = "";
            txtApellidoAlumno.value = "";
            txtNombreAlumno.focus();
        });
        limpiarAct.addEventListener('click', () => {
            txtNombreAct.value = "";
            txtValorAct.value = "";
            txtNombreAct.focus();
        });

       

       
    </script>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/5fa83d646f.js"></script>
</body>
</html>
