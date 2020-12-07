<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="prueba.WebApp.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>SPEM || Inicio</title>
    
    <link rel="shortcut icon" href="img/logo.ico"/>
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>

</head>
<body style="background-image: linear-gradient(to top, #8d308d 0%, #054b53 100%);">

    <nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light
     border border-white">

        <a class="navbar-brand" href="#">
            <img src="img/logo.png" width="60" height="60" class="d-inline-block align-top mr-5" alt="" loading="lazy">
        </a>
        
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto ">

                <li class="nav-item active px-md-5 bg-info rounded">
                    <a class="nav-link text-white pl-2" href="index.aspx">Inicio</a>
                </li>

                <li class="nav-item px-md-5">
                    <a class="nav-link pl-2" href="inicio/alumno.aspx">Tutor del alumno</a>
                </li>

            
                <li class="nav-item px-md-5">
                    <a class="nav-link pl-2" href="inicio/maestro.aspx">Maestros</a>
                </li>

                <li class="nav-item px-md-5">
                    <a class="nav-link pl-2" href="inicio/acercade.aspx">Acerca de</a>
                </li>
            </ul>

        </div>


    </nav>

    <div class="container">

        <div class="jumbotron jumbotron-fluid p-0 pt-2" style="background-color: rgb(129, 140, 192);">
            <div class="container ">
                <div class="row">
                    <div class="col-lg-7 col-m-12 text-center">
                        <img src="img/logo.png" width="250" height="250" class="img-fluid" alt="">

                        <p class="display-4 d-none d-sm-block lead text-center" style="font-family: 'Lobster', cursive;">Student Performance Management</p>

                       
                        <h1 class="text-center d-block d-sm-none" style="letter-spacing:4x;font-family: 'Lobster', cursive;">Student Performance Management</h1>
                    </div>

                    <div class="col-lg-5 col-m-12">
                        <img src="img/img-kike/school.svg" width="90%" height="90%" alt="">
                    </div>
                </div>
            </div>
        </div>
        <h2 class="text-center text-white border-bottom pb-4 mt-5 pt-5">¿Que es SPEM?</h2>


        <div class="row">
            <div class="col-12 col-lg-6 d-flex justify-content-center align-items-center  ">
                <div class="card text-white bg-info">
                    <div class="card-body text-justify">
                        <h5 class="font-weight-normal card-text  py-3 px-2">SPEM (Student Performance Management) es una aplicación web para la
                            administración del rendimiento escolar de un estudiante que está cursando algún ciclo
                            escolar.
                            Por lo que nuestro objetivo principal es el siguiente: evitar un mal desempeño por parte de
                            los estudiantes.
                        </h5>
                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-6">
                <img src="img/img-kike/adm.svg" alt="">
            </div>
        </div>

        <h2 class="text-center text-white border-bottom pb-4">A quien va dirigido</h2>

        <div class="row">
            <div class="col-12 col-lg-6 mx-auto">
                <img src="img/img-kike/boock.svg" alt="">
            </div>
            <div class="col-12 col-lg-6 d-flex justify-content-center align-items-center bg  ">
                <div class="card text-white bg-info mb-3">

                    <div class="card-body text-justify ">

                        <h5 class="font-weight-normal card-text py-3 px-2">Esta aplicación está dirigida principalmente hacia los responsables que
                            necesiten conocer la situación en tiempo real acerca del desempeño escolar del estudiante,
                            ya sea los padres, familiares y/o los responsables a cargo del alumno o alumnos, o inclusive
                            el mismo estudiante le será útil para conocer su propio desempeño.
                        </h5>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="  mx-auto text-white border-bottom my-5 col-9 text-center">
                <h2 class="text-center text-white border-bottom pb-4">Puedes</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-lg-5 ">
                <div class=" card">
                    <img src="img/img-kike/teacher.svg" class="card-img-top" width="200" height="200" alt="...">
                    <div class="card-body text-center pt-0">
                        <h5 class=" text-dark card-title">Registrarte como: </h5>
                        <a href="inicio/maestro.aspx" class="btn btn-primary w-75 p-3">Docente</a>
                    </div>
                </div>
            </div>

            <div class="col-12 col-lg-2  d-flex justify-content-center align-items-center">
                <h2 class="text-white display-4 my-5 my-lg-0" style="font-family: 'Lobster', cursive;"> Ó </h2>
            </div>

            <div class="col-12 col-lg-5 ">
                <div class="card">
                    <img src="img/img-kike/school.svg" class="card-img-top" alt="..." width="200" height="200">
                    <div class="card-body text-center pt-0">
                        <h5 class="card-title">Registrarte como: </h5>
                        </p>
                        <a href="inicio/alumno.aspx" class="btn btn-primary w-75 p-3">Estudiante</a>
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



    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
