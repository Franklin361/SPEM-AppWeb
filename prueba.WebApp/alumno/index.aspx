<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="prueba.WebApp.alumno.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link rel="shortcut icon" href="../img/logo.ico"/>
    <title>SPEM || Alumno</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>
</head>

<body style="background-color: #4158D0;
background-image: linear-gradient(43deg, #4158D0 0%, #C850C0 46%, #FFCC70 100%);">

  <form runat="server">

  
  <nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light">

    <a class="navbar-brand mr-5" href="#" >
      <img src="../img/logo.png" width="60" height="60" class="d-inline-block align-top" alt="" loading="lazy">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active px-md-4  bg-info rounded">
            <a class="nav-link text-white pl-2" href="index.aspx">Inicio</a>
          </li>
  
          <li class="nav-item px-md-5">
            <a class="nav-link pl-2" href="asistencia.aspx">Asistencia</a>
          </li>
  
          <li class="nav-item px-md-5">
              <a class="nav-link pl-2" href="actividades.aspx">Actividades</a>
            </li>
  
        
          <li class="nav-item dropdown px-md-5">
            <a class="nav-link pl-2" href="mensajes.aspx">Retroalimentación</a>
          </li>
          <li class="nav-item dropdown">
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
                <div class="col-lg-7 col-m-12">
                  <h1 class="display-2 d-none d-sm-block text-center">Bienvenido tutor del alumno</h1>
                    <h1 class="display-4 text-center d-sm-none d-block">Bienvenido tutor del alumno</h1>

                  <p class="lead text-center">Es hora de conocer el desempeño del estudiante</p>
                </div>
                <div class="col-lg-5 col-m-12">
                  <img src="../img/acercade02.svg" width="90%" height="90%" alt="">
                </div>
            </div>
              <div class="row">
              <div class="col-12 text-right my-2">
                  <button type="button" class="btn btn-warning rounded-pill p-3" data-toggle="modal" data-target="#staticBackdrop">
                      <span>Ayuda para cerrar sesión</span>
                      <i class="far fa-question-circle"></i>
                  </button>
              </div>
          </div>
          </div>
        </div>
        <div class="row">
            <div class="col-12 text-center my-3 text-light ">
              <h2>Que seccion desea visitar</h2>
            </div>
          <div class="col-12 col-lg-4 mt-4">
            <div class="card text-center p-3 bg-light">
              <img src="../img/img-caver/Actividades.svg" class="card-img-top" width="200" height="200" >
              <div class="card-body">
                <h5 class="card-title">Sección Actividades</h5>
                <p class="card-text">En esta seccion puedes revisar las actividades que encargan dia a dia.</p>
                <a href="actividades.aspx" class="btn btn btn-info">Ir a esta sección</a>
              </div>
            </div>
          </div>
          <div class="col-12 col-lg-4 mt-4">
            <div class="card text-center p-3 bg-light">
              <img src="../img/img-caver/Examen.svg" class="card-img-top" width="200" height="200" >
              <div class="card-body">
                <h5 class="card-title">Sección Retroalimentación</h5>
                <p class="card-text">En esta sección puedes revisar tus examenes.</p>
                <a href="mensajes.aspx" class="btn btn btn-info">Ir a esta sección</a>
              </div>
            </div>
          </div>
          <div class="col-12 col-lg-4 mt-4">
            <div class="card text-center p-3 bg-light">
              <img src="../img/img-caver/checklist.svg" class="card-img-top" width="200" height="200" >
              <div class="card-body">
                <h5 class="card-title">Sección Asistencia</h5>
                <p class="card-text">En esta sección puedes revisar tus asistencia en clase.</p>
                <a href="asistencia.aspx" class="btn btn btn-info">Ir a esta sección</a>
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
                    <h2 class="modal-title text-center" id="staticBackdropLabel">¿Cómo puedo cerrar sesión?</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body ">
                    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            
                            <div class="carousel-item active">
                                <div style="background-color: rgba(146, 121, 255, 0.315); min-height: 50vh;"
                                    class="d-flex justify-content-center align-items-center p-3 text-center text-dark">
                                    <div class="row">
                                        <div class="col-lg-10 col-12 mx-auto">
                                            <h3 class="font-weight-bold">1.Para cerrar sesión.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                Ubique el botón de “Cerrar Sesión” que se encuentra en la parte superior derecha del menú y es de color rojo.
                                                Presiónelo y lo redirigirá al formulario de inicio de sesión correspondiente, y ya no podrá entrar, al menos que vuelva a llenar el formulario de inicio de sesión.                                                
                                            </h5>                                           
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        
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
                    <asp:Button ID="btnCerrarSesion" class="btn btn-danger"  runat="server" Text="Cerrar sesión" OnClick="btnCerrarSesion_Click" />
                </div>
            </div>
        </div>
    </div>
</form>
      <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/5fa83d646f.js"></script>
    <script>
        const comprobar = '<%=Session["modal"]%>';

        $(document).ready(function () {
            if (comprobar == "0") {
                $('#staticBackdrop').modal('show')
            }
        });

        document.addEventListener("DOMContentLoaded", () => {
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
        })
    </script>
  </body>
</html>
