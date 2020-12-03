<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="crear-actividad.aspx.cs" Inherits="prueba.WebApp.maestro.crear_actividad" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link rel="shortcut icon" href="../img/logo.ico"/>
    <title>SPEM || Maestro</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>
</head>
<body style="background-image: linear-gradient( 109.6deg, rgba(48,207,208,1) 11.2%, rgba(51,8,103,1) 92.5% ); ">

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
                <li class="nav-item">
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
                            <h2 class="display-2 text-center d-none d-lg-block">Creación de actividades</h2>
                            <h2 class="display-4 text-center d-block d-lg-none">Creación de actividades</h2>
                            <p class="lead text-center">Ahora puedes crear una actividad</p>
                        </div>
                        <div class="col-lg-5 col-m-12 d-flex justify-content-center align-items-center">
                            <img src="../img/img-caver/examenes.svg" class="w-75" alt="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 text-right my-2">
                            <button type="button" class="btn btn-warning rounded-pill p-3" data-toggle="modal" data-target="#staticBackdrop">
                                <span>Ayuda para crear actividades</span>
                                <i class="far fa-question-circle"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

  

            <div class="row">
                <div class="col-12 mt-5">
                    <fieldset class="border border-light p-3 alert alert-secondary">
                        <legend class="bg-white border border-dark rounded w-75 text-center">Crear actvidad</legend>



                        <form action="" class="text-white">
                            <div class="row">
                                <div class="col-12">
                                    <form action="" class="text-white">
                                        <div class="form-row">

                                            <div class="col-md-4 mb-3">
                                                <label for="validationDefault02" class="">Nombre de la actividad:</label>
                                                <%--<input type="text" class="form-control" id="validationDefault02" required>--%>
                                                <asp:TextBox ID="txt_nombreact" data-toggle="tooltip" data-placement="top" title="Minimo 5 caracteres" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-md-4 mb-3">
                                                <label for="validationDefault01" class="">Valor de la actividad:</label>
                                                <%--<input type="number"  id="validationDefault01" required>--%>
                                                <asp:TextBox ID="txt_valor" data-toggle="tooltip" data-placement="top" title="Solo números del 0 al 100" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
                                            </div>
                                            <div class="col-md-4 mb-3">
                                                <label for="validationDefault02" class="">Selecciona el grupo:</label>
                                                <asp:DropDownList ID="selec_grupo" class="form-control" runat="server"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-lg-6 col-12 text-lg-right">
                                            <%--<button type="button" >Crear actividad</button>--%>
                                            <asp:Button ID="btn_crear" class="btn btn-primary font-weight-bold mt-3 py-2 w-100" runat="server" Text="Crear actividad" OnClick="btn_crear_Click" />
                                        </div>
                                        <div class="col-12 col-lg-6">
                                            <button type="button" id="btnlimpiar" class="btn btn-warning w-100 font-weight-bold py-2 mt-3">Limpiar campos</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                  
                    </fieldset>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-5 col-12 mx-auto text-white text-center my-3">
                    <asp:Button ID="btn_ver" class="btn btn-info border-info font-weight-bold w-100 mt-3 py-3" runat="server" Text="Ver actividades para este grupo" OnClick="btn_ver_Click" />
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
                    <h2 class="modal-title" id="staticBackdropLabel">¿Cómo crear actividades?</h2>
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
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">Antes de realizar cualquier otra acción, primero selecciona un grupo.
                                                Esto con el fin de obtener los alumnos de dicho grupo y poder
                                                seleccionar al alumno y colocarle la asistencia.
                                            </h5>
                                            <div class="row">
                                                <div class="col-12 rounded alert alert-warning text-justify">
                                                    <h5>Nota: si no te aparece ningún grupo en la lista, ve a la sección de Grupos -> Crear grupos y crea un grupo nuevo y asígnale alumnos al dicho grupo.
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
                                            <h3 class="font-weight-bold">2.Nombre de la actividad.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">Este campo admite mínimo 5 caracteres para un nombre que le quiera dar a una actividad y no debe ir vacío al momento de crear la actividad.                                              
                                            </h5>
                                            <div class="row">
                                                <div class="col-12 rounded alert alert-warning text-justify">
                                                    <h5>Nota: no se permite colocarle el mismo nombre a más de una actividad en un grupo.
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
                                            <h3 class="font-weight-bold">3.Valor de la actividad</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">En el campo para colocar el valor de la actividad, solo acepta números del 0 al 100 y no debe ir vacío al momento de crear la actividad.
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
                                            <h3 class="font-weight-bold">4.Crear actividad.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">Este botón, evaluará que los campos no vengan vacíos y después de pasar esa validación se creará la actividad y ya podrá ir a la sección Actividades -> Calificar actividad y poder darle una calificación a la actividad.
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
                                            <h3 class="font-weight-bold">5.Ver actividades para este grupo. </h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">El botón, permite visualizar lo referente a las actividades que se han creado para cierto grupo:

                                                <ul>
                                                    <li>El nombre de las actividades.</li>
                                                    <li>El valor que se le coloco a las dichas actividades.</li>
                                                </ul>
                                            </h5>
                                            <div class="row">
                                                <div class="col-12 rounded alert alert-warning text-justify">
                                                    <h5>Nota: para visualizar las actividades de un grupo, se necesita tener seleccionada un grupo obligatoriamente.
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
                  <%--<asp:Button ID="btnCerrarSesion"   runat="server" Text="Cerrar sesión" OnClick="BBBB" />--%>
                    <%--<asp:Button ID="btnACerrarSesion" runat="server" Text="Cerrar sesión" />--%>
                    <asp:LinkButton ID="btnLCerrarSesion" class="btn btn-danger" OnClick="Cerrar_Click" runat="server">Cerrar Sesión</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
  </form>    
    <script>
        

        document.addEventListener('DOMContentLoaded', GetUserName);
        const btnLimpiar = document.getElementById("btnlimpiar");
        const txtnombre = document.getElementById("txt_nombreact");
        const txtvalor = document.getElementById("txt_valor");

        btnLimpiar.addEventListener('click', (e) => {
            e.preventDefault();
            txtnombre.value = "";
            txtvalor.value = "";
            txtnombre.focus();
        })

            
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

        }    

    </script>
    <script src="https://kit.fontawesome.com/5fa83d646f.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
