<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="asistencia.aspx.cs" Inherits="prueba.WebApp.maestro.asistencia" %>

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

                <li class="nav-item px-xl-5 px-md-3 px-1 bg-info rounded">
                    <a class="nav-link pl-2  text-white" href="asistencia.aspx">Asistencia</a>
                </li>

                <li class="nav-item dropdown px-xl-5 px-md-3 px-1 ">
                    <a class="nav-link dropdown-toggle pl-2" href="#" id="navbarDropdown" role="button"
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
                        <h1 class="display-2 d-none d-sm-block text-center">Asignar asistencia</h1>
                        <h1 class="display-4 d-block d-sm-none text-center">Asignar asistencia</h1>
                        <p class="lead text-center">Administra la asistencia de los alumnos</p>
                    </div>
                    <div class="col-lg-5 col-m-12 d-flex justify-content-center align-items-center">
                        <img src="../img/asistencia02.svg"  class="w-75"  alt="">
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 text-right my-2">
                        <button type="button" class="btn btn-warning rounded-pill p-3" data-toggle="modal" data-target="#staticBackdrop">
                            <span>Ayuda para agregar asistencia</span>
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
                        class="col-12 col-lg-4 d-flex align-items-center justify-content-lg-end justify-content-xs-start">
                        <h5 for="exampleFormControlSelect1" class="font-weight-bold">Selecciona un grupo:</h5>
                    </div>
                    <div class="col-12 col-lg-6">
                        <asp:DropDownList ID="select_grupo" class="form-control" runat="server"></asp:DropDownList>
                    </div>

                    <div class="col-12 col-lg-2 d-flex justify-content-center align-items-center mt-3 mt-lg-0">
                        <asp:Button ID="btn_grupo" class="btn btn-info" runat="server" Text="Seleccionar" OnClick="btn_grupo_Click" />
                    </div>
                </div>
            </div>
        </div>

            <div runat="server" id="ocultar">
                <div class="row my-5">
                    <div class="col-12 mt-5">
                        <fieldset class="border border-light p-3">
                            <legend class="bg-white rounded w-75 d-none d-sm-block text-center">Selección de fecha para asistencia
                            </legend>
                            <legend class="bg-white rounded d-block d-sm-none w-100 p-0 p-1 text-center"> <p>Selección de fecha para asistencia</p>
                            </legend>
                            <form action="" class="text-white">
                                <div class="row">
                                    <div class="col-lg-6 col-12 w-100">
                                        <form action="">
                                            <div class="form-row mx-auto">
                                                <div class="col-md-12 col-12 mx-auto text-white mb-2">
                                                    <label for="validationDefault02">Fecha:</label>
                                                    <asp:Calendar ID="fecha_txt" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="100%">
                                                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                                                        <DayStyle BackColor="#CCCCCC" />
                                                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                                                        <OtherMonthDayStyle ForeColor="#999999" />
                                                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                                        <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                                                        <TodayDayStyle BackColor="#999999" ForeColor="White" />
                                                    </asp:Calendar>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="col-lg-6 col-12 w-100">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="card p-3 bg-light">
                                                    <label for="" class="text-center my-2 mb-4 font-weight-bold">Selecciona la opcion de asistencia</label>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="row">
                                                                <div class="col-12 mb-3">
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            <label for="exampleFormControlSelect1">Selecciona un alumno:</label>
                                                                        </div>
                                                                        <div class="col-12">
                                                                            <asp:DropDownList ID="selec_alumno" class="form-control" runat="server"></asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 my-2">
                                                            <label for="">El alumno:</label>
                                                            <asp:DropDownList ID="select_asistencia" class="form-control w-100 mb-3" runat="server" Width="88px">
                                                                <asp:ListItem Selected="True" Value="0">---Selecciona una opción--</asp:ListItem>
                                                                <asp:ListItem>Si asistio</asp:ListItem>
                                                                <asp:ListItem>No asistio</asp:ListItem>
                                                                <asp:ListItem>justificada</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:Button ID="btn_asistencia" class="btn btn-info mx-auto w-100 py-3 font-weight-bold mt-2" runat="server" Text="Colocar Asistencia" OnClick="btn_asistencia_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </fieldset>
                    </div>
                </div>

                <div class=" row">
                    <div class="col-12 text-center my-2">
                        <asp:Button ID="btn_ver" class="btn btn-warning font-weight-bold py-sm-4 py-lg-3 " runat="server" Text="Ver la asistencia" OnClick="btn_ver_Click" />
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
                    <h2 class="modal-title" id="staticBackdropLabel">¿Cómo colocar asitencia?</h2>
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
                                            <h3 class="font-weight-bold">2. Selecciona una fecha.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                En el calendario que se muestra,  selecciona la fecha. Puedes darle clic a otro numero del calendario y se pondrá color azul el recuadro del número (lo que significa que ya está seleccionado). Y podrás continuar con los demás recuadros del formulario.
                                                
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
                                            <h3 class="font-weight-bold"> 3. Selecciona a un alumno.</h3>
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
                                            <h3 class="font-weight-bold">4. Selecciona una opción de asistencia.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                El calendario por defecto ya selecciona la fecha que marca tu equipo. 
                                                Pero puedes darle clic a otro numero del calendario y se pondrá color azul el recuadro del número (lo que significa que ya está seleccionado). Y podrás continuar con los demás recuadros del formulario.
                                                En la lista desplegable aparecen 3 opciones:
                                                <ul>
                                                    <li>Si asistió.</li>
                                                    <li>No asistió.</li>
                                                    <li>Asistencia Justificada. </li>
                                                </ul>
                                                Puede seleccionar cualquiera de esas según sea el caso.
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
                                            <h3 class="font-weight-bold">5. Colocar asistencia.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">El botón realiza dos opciones.

                                                <ul>
                                                    <li>Agrega la asistencia (si es que no ha colocado la asistencia con anterioridad).</li>
                                                    <li>Modifica la asistencia (si a cierto alumno tenía ya una asistencia colocada, tiene la capacidad de modificarla, solamente colocando la nueva asistencia y dando clic en el botón de Colocar Asistencia).</li>
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
                                            <h3 class="font-weight-bold">6. Ver la asistencia.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                Este botón, permite visualizar una tabla con dos columnas:
                                                <ul>
                                                    <li>Nombre completo del alumno.</li>
                                                    <li>Asistencia colocada.</li>
                                                </ul>
                                            </h5>
                                            <div class="row">
                                                <div class="col-12 rounded alert alert-warning text-justify">
                                                    <h5>
                                                        Nota: para visualizar la asistencia, se necesita tener seleccionada una fecha y un grupo obligatoriamente.
                                                    </h5>
                                                </div>
                                            </div>
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
                    <%--<asp:Button ID="btnCerrarSesion"   runat="server" Text="Cerrar sesión" OnClick="btnCerrarSesion_Click" />--%>
                    <asp:LinkButton ID="btnLCerrarSesion" class="btn btn-danger" runat="server" OnClick="btnCerrarSesion_Click">Cerrar Sesión</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</form>

    <script>
             
        document.addEventListener('DOMContentLoaded', init);
              

        function init() {
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
        }               

    </script>
    <script src="https://kit.fontawesome.com/5fa83d646f.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
