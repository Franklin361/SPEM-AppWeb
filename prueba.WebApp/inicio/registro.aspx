<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registro.aspx.cs" Inherits="prueba.WebApp.inicio.registro" %>

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
                    <div class="col-lg-7 col-m-12">
                        <p class="display-3 w-50 mx-auto d-none d-sm-block text-center  "style="font-family: 'Lobster', cursive;">Registrate gratis</p>

                        <p class="display-4 text-center d-sm-none d-block"style="font-family: 'Lobster', cursive;">Registrate gratis</p>
                        
                        <h3 class="font-weight-light text-center">Y podras comenzar ya como docente</h3>
                    </div>
                    <div class="col-lg-5 col-m-12">
                        <img src="../img/img-kike/school.svg" width="90%" height="90%" alt="">
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 text-right my-2">
                        <button type="button" class="btn btn-warning rounded-pill p-3" data-toggle="modal" data-target="#staticBackdrop">
                            <span>Ayuda para llenar el formulario de registro</span>
                            <i class="far fa-question-circle"></i>
                        </button>
                    </div>
                </div>

            </div>
        </div>


        <div class=" row mt-5">
            <div class=" col-12 col-lg-10 mx-auto">
                <form runat="server">
                    <div class="card">
                    <div class=" card-body">
                        <h4 class="text-center my-4 pb-2 border-bottom w-100 mx-auto"><label>Registro para docentes</label></h4>
                        <div class="form-row px-lg-5">
                            <div class="form-group col-md-6">
                                <label for="inputPassword4">Nombre:</label>
                                <%--<input type="text" class="p-4 form-control" id="inputPassword4">--%>
                                <asp:TextBox ID="txt_nombre" AutoComplete="off" class="p-4 form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputPassword4">Apellidos:</label>
                                <%--<input type="text" class="p-4 form-control" id="inputPassword4">--%>
                                <asp:TextBox ID="txt_apellido" AutoComplete="off" class="p-4 form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputEmail4">Usuario</label>
                                <%--<input type="text" class="p-4 form-control" id="inputEmail4">--%>
                                <asp:TextBox ID="txt_usuario" AutoComplete="off" class="p-4 form-control" runat="server" data-toggle="tooltip" data-placement="left" title="Minimo 8 caracteres y sin espacios"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputEmail4">Correo electronico</label>
                                <%--<input type="email" class="p-4 form-control" id="inputEmail4">--%>
                                <asp:TextBox ID="txt_email" class="p-4 form-control" runat="server" AutoComplete="off" TextMode="Email"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputPassword4">Contraseña nueva:</label>
                                <%--<input type="password" class="p-4 form-control" id="inputPassword4">--%>
                                <asp:TextBox ID="txt_pass" class="p-4 form-control" runat="server" AutoComplete="off" TextMode="Password" Font-Size="Medium" data-toggle="tooltip" data-placement="left" title="Minimo 8 caracteres y sin espacios"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row text-center">
                        <div class="col-lg-6">
                            <%--<button type="submit" class="w-75 mb-5 btn btn-primary p-3">Crear cuenta</button>--%>
                            <asp:Button ID="Button2" class="w-75 mb-lg-5 mb-3 btn btn-primary p-3" runat="server" Text="Crear cuenta" OnClick="Button2_Click" />
                        </div>
                        <div class="col-lg-6">
                            <button class="w-75 mb-lg-5 btn btn-warning mb-3 p-3" id="btnLimpiar" data-toggle="tooltip" data-placement="right" title="Borrar el contenido de todos los campos">Limpiar campos</button>
                            
                        </div>
                    </div>
                </div>
                </form>
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
                    <h2 class="modal-title text-center" id="staticBackdropLabel ">¿Cómo Iniciar Sesión?</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body ">
                    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">

                            <div class="carousel-item active ">
                                <div style="background-color: rgba(146, 121, 255, 0.315); min-height: 50vh;"
                                    class="d-flex justify-content-center align-items-center p-1 text-dark">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <h3 class="font-weight-bold">1. Completa los datos solicitados correctamente</h3>
                                            <h5 class="text-justify pt-sm-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                <ul>
                                                    <li>Nombre y apellido completo</li>
                                                    <li>Nombre de usuario nuevo <span class="font-weight-bold">evita espacios en blanco.</span></li>
                                                    <li>Contraseña nueva <span class="font-weight-bold">evita espacios en blanco y minimo 8 caracteres.</span></li>
                                                    <li>Correo electronico valido</li>
                                                </ul>
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
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/5fa83d646f.js"></script>

    <script>

        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })

        const btnLimpiar = document.getElementById("btnLimpiar");
        const nombre = document.getElementById("txt_nombre");
        const apellido = document.getElementById("txt_apellido");
        const email = document.getElementById("txt_email");
        const pass = document.getElementById("txt_pass");
        const usuario = document.getElementById("txt_usuario");
        btnLimpiar.addEventListener('click', (e) => {
            e.preventDefault();
            nombre.value = "";
            apellido.value = "";
            email.value= "";
            pass.value = "";
            usuario.value = "";
            nombre.focus();
        })

        document.addEventListener('DOMContentLoaded', () => {
            const modalmE = document.querySelector('.desequivocado');
            const modalmEr = document.querySelector('.equivocado');


            $(document).ready(function () {
                if (modalmEr) {
                    $('#mimodal').modal('show')

                } else if (modalmE) {
                    $('#mimodal').modal('show');

                    setTimeout(() => {
                        window.location.href = "maestro.aspx";
                    }, 2500)
                }

            });
        })

       

        
    </script>
</body>

</html>
