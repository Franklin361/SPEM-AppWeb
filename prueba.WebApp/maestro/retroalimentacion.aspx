<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="retroalimentacion.aspx.cs" Inherits="prueba.WebApp.maestro.retroalimentacion" %>

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

                <li class="nav-item dropdown px-xl-5 px-md-3 px-1 ">
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
                <li class="nav-item px-xl-5 px-md-3 px-1 bg-info rounded">
                    <a class="nav-link pl-2 text-white" href="retroalimentacion.aspx">Retroalimentación</a>
                </li>
                <li class="nav-item dropdown ml-lg-5 ml-0 mt-2 mt-lg-0">
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
                            <h2 class="display-3 text-center d-none d-sm-block">Retroalimentación</h2>
                            <h2 class="display-4 text-center d-block d-sm-none">Sección de mensajes</h2>
                            <p class="lead text-center">Revisa los mensajes pendientes</p>
                        </div>
                        <div class="col-lg-5 col-m-12">
                            <img src="../img/img-caver/mensaje.svg" class="w-100" alt="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 text-right my-2">
                            <button type="button" class="btn btn-warning rounded-pill p-3" data-toggle="modal" data-target="#staticBackdrop">
                                <span>Ayuda para mandar un mensaje</span>
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
                            <h5 for="exampleFormControlSelect1">Selecciona un grupo:</h5>
                        </div>
                        <div class="col-12 col-lg-6">
                            <asp:DropDownList ID="select" class="form-control" runat="server"></asp:DropDownList>
                        </div>

                        <div class="col-12 col-lg-2 d-flex justify-content-center align-items-center mt-3 mt-lg-0">
                            <asp:Button ID="btn_selec" class="btn btn-info" runat="server" Text="Seleccionar" OnClick="btn_selec_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-5">
                <div class="col-12 text-center my-3 text-light ">
                    <h2>Mensajes del grupo</h2>
                </div>
                
            </div>
            <div class="row" runat="server" id="mensajenohay">

            </div>
            <div class="row">
                <div class="col-lg-8 col-12 mx-auto">
                    <div class="row px-5" runat="server" id="showmensaje"  style="max-height: 30em; overflow-y: scroll;">
                        
                    </div>
                </div>
            </div>



            <div class="row  alert alert-dark rounded mt-5 p-3">
                <div class="col-12">
                    <h2 class="text-center">Seccion para responder</h2>
                </div>
                <div class="col-12">
                    <div class="row my-3">
                        <label for="exampleFormControlSelect1">Selecciona a un alumno:</label>
                        <asp:DropDownList ID="select_alumno" class="form-control" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="row">
                        <label for="exampleFormControlTextarea1">Mensaje:</label>
                        <%--<asp:TextBox ID="txt_mensaje" class="form-control" style="min-height: 8vh;" runat="server"></asp:TextBox>--%>
                        <textarea class="form-control" runat="server"   id="campoMessaje" rows="3"></textarea>    
                    </div>
                </div>
                <div class="col-12 text-center">
                    <div class="row">
                        <div class="col-lg-6 col-12 text-lg-right">
                            <asp:Button ID="btn_enviar" class="btn btn-primary py-2 w-75 mt-3" runat="server" Text="Enviar" OnClick="btn_enviar_Click" />
                        </div>
                        <div class="col-lg-6 col-12">
                            <button type="button" id="btnLimpiar" class="btn btn-warning py-2 w-75 mt-3">Limpiar campo</button>
                        </div>
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
                    <h2 class="modal-title" id="staticBackdropLabel">¿Cómo puedo enviar un mensaje?</h2>
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

                            <div class="carousel-item ">
                                <div style="background-color: rgba(146, 121, 255, 0.315); min-height: 50vh;"
                                    class="d-flex justify-content-center align-items-center p-5 text-center text-dark">
                                    <div class="row">
                                        <div class="col-10 mx-auto">
                                            <h3 class="font-weight-bold">2.Enviar mensaje.  </h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">Una vez seleccionado el grupo, se necesita seleccionar algún alumno de la lista desplegable. Después colocar un nuevo mensaje en el campo “Mensaje” y darle clic a “Enviar”.
                                            </h5>
                                            <div class="row">
                                                <div class="col-12 rounded alert alert-warning text-justify">
                                                    <h5>Nota: si no te aparece ningún alumno en la lista desplegable del formulario “Editar alumno”, ve a la sección de Grupos -> Crear grupos, selecciona un grupo y agrega los alumnos correspondientes.
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
                    <asp:Button ID="btnCerrarSesion" class="btn btn-danger"  runat="server" Text="Cerrar sesión" OnClick="btnCerrarSesion_Click" />
                </div>
            </div>
        </div>
    </div>

        </form>
    <script>
              
         document.addEventListener('DOMContentLoaded', init);


        const btnLimpiar = document.getElementById("btnLimpiar");
        const campoMensaje = document.getElementById("campoMessaje");

        btnLimpiar.addEventListener('click', (e) => {
            e.preventDefault();
            campoMensaje.value = "";
            campoMensaje.focus();
        })


     
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
