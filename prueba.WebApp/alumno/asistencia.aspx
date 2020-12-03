<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="asistencia.aspx.cs" Inherits="prueba.WebApp.alumno.asistencia" %>

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
          <ul class="navbar-nav mr-auto ">
              
            <li class="nav-item active px-md-5">
                <a class="nav-link pl-2" href="index.aspx">Inicio</a>
              </li>
      
              <li class="nav-item px-md-5 bg-info rounded">
                <a class="nav-link text-white pl-2" href="asistencia.aspx">Asistencia</a>
              </li>
      
              <li class="nav-item px-md-5 ">
                  <a class="nav-link pl-2" href="actividades.aspx">Actividades</a>
                </li>
      
             
              <li class="nav-item dropdown px-md-5">
                <a class="nav-link pl-2" href="mensajes.aspx">Retroalimentación</a>
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
                    <div class="col-lg-7 col-m-12">
                        <h1 class="display-2 text-center d-none d-sm-block">Sección de Asistencia</h1>
                        <h1 class="display-4 text-center d-block d-sm-none">Sección de Asistencia</h1>
                    </div>
                    <div class="col-lg-5 col-m-12 text-center">
                        <img src="../img/img-caver/asistenciasiu.svg" width="70%" height="70%" alt="">
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12 text-center my-4">
                
                <asp:LinkButton ID="LinkButton2"  class="btn btn-dark rounded font-weight-bold py-3 text-white w-75" runat="server" OnClick="Button1_Click">Exportar asistencias a un archivo de texto
                    <i class="fas fa-download"></i>
                </asp:LinkButton>
                
            </div>
        </div>

        <div class="row" runat="server" id="tabla">
            <div class=" col-lg-10 col-12 mx-auto my-5 table-responsive mh-50">
              
                <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="8" CellSpacing="2" ForeColor="Black" Width="100%" CssClass="text-center">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
            </div>
        </div>
<hr class="bg-light">
        <div class="row  alert alert-dark rounded mt-5 p-3">
            <div class="col-12">
                <h2 class="text-center">Sección para responder</h2>
            </div>
            <div class="col-12">
                
                <div class="row">
                    <label for="exampleFormControlTextarea1">Mensaje:</label>                   

                         <textarea class="form-control" runat="server"  id="campoMessaje" rows="3"></textarea>    
                </div>
            </div>
            <div class="col-12 text-center">
                <div class="row">
                    <div class="col-lg-6 col-12 text-lg-right">
                        <%--<button type="button" >Enviar</button>--%>
                        <asp:Button ID="btn_enviar" class="btn btn-primary py-2 mt-3 w-100" runat="server" Text="Enviar" OnClick="btn_enviar_Click" />
                    </div>
                    <div class="col-lg-6 col-12">
                        <button type="button" id="btnLimpiar" class="btn btn-warning py-2 mt-3 w-100">Limpiar</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class ="" runat="server" id="col">
                <asp:Label ID="lbl_retro" runat="server" Text=""></asp:Label>
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

        const btnLimpiar = document.getElementById("btnLimpiar");
        const campoMensaje = document.getElementById("campoMessaje");

        btnLimpiar.addEventListener('click', (e) => {
            e.preventDefault();
            campoMensaje.value = "";
            campoMensaje.focus();
        })

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
