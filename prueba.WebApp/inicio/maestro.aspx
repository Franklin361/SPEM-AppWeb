<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="maestro.aspx.cs" Inherits="prueba.WebApp.inicio.maestro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>SPEM || Inicio</title>
    
    <link rel="shortcut icon" href="../img/logo.ico"/>
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>
</head>
<body style="background-image: linear-gradient(to top, #8d308d 0%, #054b53 100%);">

    <nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light
    border border-white">

        <a class="navbar-brand" href="#">
            <img src="../img/logo.png" width="60" height="60" class="d-inline-block align-top" alt="" loading="lazy">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto ">

                <li class="nav-item active px-md-5 ">
                    <a class="nav-link pl-2" href="../index.aspx">Inicio</a>
                </li>

                <li class="nav-item px-md-5 ">
                    <a class="nav-link pl-2" href="alumno.aspx">Tutor del alumno</a>
                </li>


                <li class="nav-item px-md-5 bg-info rounded">
                    <a class="nav-link text-white pl-2" href="maestro.aspx">Maestros</a>
                </li>

                <li class="nav-item px-md-5 ">
                    <a class="nav-link pl-2" href="acercade.aspx">Acerca de</a>
                </li>
            </ul>

        </div>


    </nav>

    <div class="container">

        <div class="jumbotron jumbotron-fluid p-0 pt-5 bg-info" style="background-color: rgb(129, 140, 192);">
            <div class="container ">
                <div class="row">
                    <div class="col-lg-7 col-m-12 px-5">
                        <p class="display-3 text-center d-none d-sm-block" style="font-family: 'Lobster', cursive;">Inicia como Docente</p>

                        <p class="display-4 text-center d-sm-none d-block" style="font-family: 'Lobster', cursive;">Inicia como Docente</p>

                        <h3 class="font-weight-light text-center">¿Qué esperas para empezar a administrar tú grupo?</h3>
                    </div>
                    <div class="col-lg-5 col-m-12">
                        <img src="../img/img-kike/school.svg" width="90%" height="90%" alt="">
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 text-right my-2">
                        <button type="button" class="btn btn-warning rounded-pill p-3" data-toggle="modal" data-target="#staticBackdrop">
                            <span>Ayuda para iniciar sesión como docente</span>
                            <i class="far fa-question-circle"></i>
                        </button>
                    </div>
                </div>

            </div>
        </div>

        <div class=" row mt-5">
            <div class=" col-lg-7 col-12">
                <form runat="server">
                    <div class="card">
                        <div class=" card-body">
                            <h4 class="text-center my-4 pb-2 border-bottom w-100 mx-auto">
                                <label>
                                    Inicio de sesión para
                                Docente</label></h4>
                            <div class="form-row px-lg-5">
                                <div class="form-group col-md-12">
                                    <label for="inputEmail4">Usuario:</label>
                                    <%--<input type="text" class="p-4 form-control" id="inputEmail4">--%>
                                    <asp:TextBox ID="usuario" data-toggle="tooltip" data-placement="right" title="Coloca el usuario para maestro" class="p-4 form-control" AutoComplete="on" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="inputPassword4">Contraseña:</label>
                                    <%--<input type="password" class="p-4 form-control" id="inputPassword4">--%>
                                    <asp:TextBox ID="password" data-toggle="tooltip" data-placement="right" title="Coloca la contraseña de dicho usuario" class="p-4 form-control" AutoComplete="off" runat="server" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <%--<button type="submit" class="mt-5 btn btn-primary p-3">Iniciar sesión</button>--%>
                        <asp:Button ID="Button1" class="mt-5 btn btn-primary p-3" runat="server" Text="Iniciar sesión" OnClick="Button1_Click" />
                    </div>
                </form>
            </div>
            <div class="col-lg-5 col-12 d-flex align-items-center justify-content-center">
                <img src="../img/img-kike/checklist.svg" class="w-100" alt="">
            </div>
        </div>

        <div class="row">
            <div class="col-12 my-5">
                <h5 class="font-weight-normal text-white text-center">Si aun no tienes una cuenta, <a href="registro.aspx" data-toggle="tooltip" data-placement="top" title="Enlace para crearte una cuenta" class="text-warning">Registrate aquí</a></h5>
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

    <%-- Modal tutorial --%>
   <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h2 class="modal-title text-center" id="staticBackdropLabel">¿Cómo Iniciar Sesión?</h2>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body ">
          <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">

              <div class="carousel-item active ">
                <div style="background-color: rgba(146, 121, 255, 0.315); min-height: 50vh;" class="d-flex justify-content-center align-items-center p-2 text-center text-dark">
                  <div class="row">
                    <div class="col-12 col-lg-9 mx-auto">
                      <h3 class="font-weight-bold">1. Registrate</h3>
                      <h5 class="text-justify pt-1" style="font-family: Raleway, sans-serif; font-weight: 500;">Primeramente, debes de registrarte si aun no lo has hecho. Debajo del formulario de inicio de sesión hay un link que te llevara al formulario para que puedas registrar tu cuenta como Docente</h5>
                    </div>
                  </div>
                </div>
              </div>

              <div class="carousel-item">
                <div style="background-color: rgba(146, 121, 255, 0.315); min-height: 50vh;" class="d-flex justify-content-center align-items-center p-2 text-center text-dark">
                  <div class="row">
                    <div class="col-lg-9 col-12 mx-auto">
                      <h3 class="font-weight-bold">2. Llena los campos correctamente</h3>
                      <h5 class="text-justify pt-1" style="font-family: Raleway, sans-serif; font-weight: 500;">
                      No dejes campos vacios, para no generar ningun error y lograr iniciar sesio exitosamente y al finalizar da click en el boton "iniciar sesión"
                      </h5>
                    </div>
                  </div>
                </div>
              </div>

              <div class="carousel-item">
                <div style="background-color: rgba(146, 121, 255, 0.315); min-height: 50vh;" class="d-flex justify-content-center align-items-center p-2 text-center text-dark">
                  <div class="row">
                    <div class="col-12 col-lg-9 mx-auto">
                      <h3 class="font-weight-bold">3.En caso de olvidar tu usuario y/o contraseña</h3>
                      <h5 class="text-justify pt-1" style="font-family: Raleway, sans-serif; font-weight: 500;">
                      Si por alguna razón olvidaste tu usuario y/o contraseña, comunicate a este número telefonico <span class="font-weight-bold">81-80-29-9900</span> para restableces tus datos.
                      </h5>
                    </div>
                  </div>
                </div>
              </div>

            </div>
              <a class=" carousel-control-prev text-dark " href="#carouselExampleCaptions" role="button"
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
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Aceptar</button>                    
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/5fa83d646f.js"></script>
    <script>



        document.addEventListener('DOMContentLoaded', () => {
            const modalmE = document.querySelector('.desequivocado');
            const modalmEr = document.querySelector('.equivocado');
            
               
                $(document).ready(function () {
                    if (modalmEr) {
                        $('#mimodal').modal('show')

                    } else if (modalmE) {
                        $('#mimodal').modal('show');

                        setTimeout(() => {
                            window.location.href = "../maestro/index.aspx";
                        },2000)
                    }

                });
           
            //const caja = document.querySelector(".franko");
            //if (caja) {
            //    setTimeout(() => {
            //        caja.remove();
            //        window.location.href = "../maestro/index.aspx"
            //    }, 2000)
            //}

           
        })


        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })

       <%-- const comprobar = '<%=Session["modal"]%>';

        $(document).ready(function () {
            if (comprobar == "0") {
                $('#staticBackdrop').modal('show')
            }
            
        });--%>
        
    </script>
</body>
</html>
