<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="crear-grupo.aspx.cs" Inherits="prueba.WebApp.maestro.crear_grupo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="shortcut icon" href="../img/logo.ico" />
    <title>SPEM || Maestro</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" />
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
                            <h1 class="display-2 d-none d-sm-block text-center">Creación de grupos</h1>
                            <h1 class="display-4 d-block d-sm-none text-center">Creación de grupos</h1>
                            <p class="lead text-center">Puedes crear grupos en esta sección</p>
                        </div>
                        <div class="col-lg-5 col-m-12">
                            <img src="../img/grupo-header.svg" class="w-100" alt="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 text-right my-2">
                            <button type="button" class="btn btn-warning rounded-pill p-3" data-toggle="modal" data-target="#staticBackdrop">
                                <span>Ayuda para crear grupos</span>
                                <i class="far fa-question-circle"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row my-5">
                <div class="col-12 mt-5">
                    <fieldset class="border border-light alert alert-dark p-3">
                        <legend class="bg-white rounded w-75 text-center">Crear nuevo grupo</legend>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-row ">
                                    <div class="col-md-6 mb-2">
                                        <label for="validationDefault02">Nombre del grupo:</label>
                                        
                                        <asp:TextBox ID="txtNombreGrupo" data-toggle="tooltip" data-placement="top" title="Minimo 8 caracteres" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 mb-2">
                                        <label for="validationDefault02">Contraseña del grupo:</label>
                                        
                                        <asp:TextBox ID="txtPassGrupo" data-toggle="tooltip" data-placement="top" title="Minimo 8 caracteres" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 text-center">
                                <div class="row">
                                    <div class="col-lg-4 col-12 text-lg-right">
                                        
                                        <asp:Button ID="btnCrearGrupo" class="btn btn-primary w-75 mt-3" runat="server" Text="Crear Grupo" OnClick="btnCrearGrupo_Click" />
                                    </div>
                                    <div class="col-lg-4 col-12">
                                        <button type="button" id="limpiarGrupo" class="btn btn-warning w-75 mt-3">Limpiar campos</button>
                                    </div>
                                    <div class="col-lg-4 col-12">
                                        <asp:Button ID="btnVerGrupos" class="btn btn-info w-75 mt-3" runat="server" Text="Ver grupos Creados" OnClick="btnVerGrupos_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </fieldset>
                </div>
            </div>

        

            <div class="row my-5">
                <div class="col-12 mt-5">
                    <fieldset class="border border-light alert alert-dark p-3">
                        <legend class="bg-white rounded w-75 text-center">Agregar alumnos</legend>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-row">
                                    <div class="col-md-6 mb-2">
                                        <label for="validationDefault02">Nombre del alumno:</label>
                                      
                                        <asp:TextBox ID="txtNombreAlumno" data-toggle="tooltip" data-placement="top" title="Coloca Nombres y apellidos del alumno" class="form-control" runat="server"></asp:TextBox>
                                    </div>

                                    

                                    <div class="col-md-6 mb-2">
                                        <label for="validationDefault02">Selecciona un grupo:</label>
                                        
                                        <asp:DropDownList ID="ddGrupos" class="form-control" runat="server" ></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 text-center">
                                <div class="row">
                                    <div class="col-lg-4 col-12 text-lg-right">
                         
                                        <asp:Button ID="btnAgregarAlumno" class="btn btn-primary w-75 mt-3" runat="server" Text="Agregar alumno" OnClick="btnAgregarAlumno_Click" />
                                    </div>
                                    <div class="col-lg-4 col-12">
                                        <button type="button" id="limpiarAlumno" class="btn btn-warning w-75 mt-3">Limpiar campos</button>
                                    </div>
                                    <div class="col-lg-4 col-12">
                                        <asp:Button ID="btnVerAlumnos" class="btn btn-info w-75 mt-3" runat="server" Text="Ver alumnos del grupo" OnClick="btnVerAlumnos_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </fieldset>
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
                    <h2 class="modal-title" id="staticBackdropLabel">¿Cómo crear un grupo y agregar alumnos?</h2>
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
                                            <h3 class="font-weight-bold">1.Crear un nuevo grupo.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                <ul>
                                                    <li>El nombre del grupo debe de ser único e irrepetible y debe contener mínimo 8 caracteres.</li>
                                                    <li>La contraseñe de grupo debe contener mínimo 8 caracteres.</li>
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
                                            <h3 class="font-weight-bold">2.Ver grupos creados.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                Este botón, permite visualizar una tabla con dos columnas: 
                                                <ul>
                                                    <li>Nombre de los grupos que has creado.</li>
                                                    <li>La contraseña de dichos grupos.</li>
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
                                            <h3 class="font-weight-bold">3.Agregar alumnos a un grupo.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                Se colocará el nombre y apellido del alumno correctamente.
                                                Verificar que este seleccionado el grupo, de la lista desplegable (se cargan automáticamente si es que ya ha creado grupos con anterioridad) correcto al que quieras agregar alumnos.                                                 
                                            </h5>
                                            <div class="row">
                                                <div class="col-12 rounded alert alert-warning text-justify">
                                                    <h5>
                                                        Nota: si el grupo que busca no aparece, en la sección de arriba puede crearlo.
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
                                            <h3 class="font-weight-bold">4.Ver alumnos de cierto grupo.</h3>
                                            <h5 class="text-justify pt-1"
                                                style="font-family: Raleway, sans-serif; font-weight: 500;">
                                                Este botón, permite visualizar una tabla con dos columnas, dependiendo del grupo seleccionado:
                                                <ul>
                                                    <li>Nombre de los alumnos.</li>
                                                    <li>Apellidos correspondientes.</li>
                                                </ul>
                                            </h5>
                                            <div class="row">
                                                <div class="col-12 rounded alert alert-warning text-justify">
                                                    <h5>
                                                        Nota: para visualizar la tabla de alumnos, se necesita tener seleccionada un grupo obligatoriamente.
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
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/5fa83d646f.js"></script>

    <script>
        
        const btnLimpiarGrupo = document.querySelector('#limpiarGrupo');
        const btnLimpiarAlumno = document.querySelector('#limpiarAlumno')

        const grupo = document.getElementById('txtNombreGrupo');
        const passGrupo = document.getElementById('txtPassGrupo');
        const nombre = document.getElementById('txtNombreAlumno');
        const apellido = document.getElementById('txtApellidoAlumno');

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
        })

        btnLimpiarGrupo.addEventListener('click', (e) => {
            e.preventDefault();
            grupo.value = "";
            passGrupo.value = "";
            grupo.focus();
        })
        btnLimpiarAlumno.addEventListener('click', (e) => {
            e.preventDefault();
            nombre.value = "";
            apellido.value = "";
            nombre.focus();
        })
                
    </script>
</body>

</html>
