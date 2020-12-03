<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="acercade.aspx.cs" Inherits="prueba.WebApp.inicio.acercade" %>

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

        <a class="navbar-brand mr-5" href="#">
            <img src="../img/logo.png" width="60" height="60" class="d-inline-block align-top mr-5" alt="" loading="lazy">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto pl-2">

                <li class="nav-item active px-md-5 ">
                    <a class="nav-link pl-2" href="../index.aspx">Inicio</a>
                </li>

                <li class="nav-item px-md-5">
                    <a class="nav-link pl-2" href="alumno.aspx">Tutor del alumno</a>
                </li>


                <li class="nav-item px-md-5">
                    <a class="nav-link pl-2" href="maestro.aspx">Docentes</a>
                </li>

                <li class="nav-item px-md-5 bg-info rounded">
                    <a class="nav-link  text-white pl-2" href="acercade.aspx">Acerca de</a>
                </li>
            </ul>

        </div>


    </nav>

    <div class="container">

        <div class="jumbotron jumbotron-fluid p-0 pt-5" style="background-color: rgb(129, 140, 192);">
            <div class="container ">
                <div class="row">
                    <div class="col-lg-7 col-m-12">
                        <p class="text-center display-3 d-none d-sm-block" style="font-family: 'Lobster', cursive;">Aprende mas sobre SPEM</p>
                        <p class="text-center display-4 d-sm-none d-block" style="font-family: 'Lobster', cursive;">Aprende mas sobre SPEM</p>
                        <h3 class="font-weight-light  text-center">Conoce como usar esta aplicación</h3>
                    </div>
                    <div class="col-lg-5 col-m-12 d-flex justify-content-center align-items-center">
                        <img src="../img/img-kike/boock.svg" class="w-100" width="" height="" alt="">
                    </div>
                </div>
            </div>
        </div>

        <div class="row p-0">
            <div class="col-12">
                <h2 class="text-white text-center my-5"> Acerca de SPEM</h2>
            </div>
            <div class="col-12">
                <h5 class="text-white "> Ventajas de usar SPEM:</h5>
            </div>
        </div>

        <div class="row text-white pl-5">
            <div class="col-11 col-lg-9 rounded p-2 pl-5 bg-success my-2">
                <p class="m-0"> Dar una mejora en cuanto a el modo de organización por parte del docente, al momento de
                    calificar tareas, actividades.</p>
            </div>
            <div class="col-11 col-lg-9 rounded p-2 pl-5 bg-success my-2">
                <p class="m-0">Facilitando la retroalimentación entre el docente y el responsable a cargo del alumno o
                    inclusive el mismo alumno.</p>
            </div>
            <div class="col-11 col-lg-9 rounded p-2 pl-5 bg-success my-2">
                <p class="m-0">Otorgar una mejor compresión del desempeño actual del estudiante, logrando saber en qué
                    campos le resulta más difícil avanzar.</p>
            </div>
            <div class="col-11 col-lg-9 rounded p-2 pl-5 bg-success my-2">
                <p class="m-0">Conocer el comportamiento del estudiante.</p>
            </div>
            <div class="col-11 col-lg-9 rounded p-2 pl-5 bg-success my-2 ">
                <p class="m-0">La información que se otorgará será de manera completa y específica, para facilitar
                    cuales son las dificultades por las que pasa el alumno, con una interfaz amigable con el usuario.
                </p>
            </div>
        </div>

        <div class="row p-0">
            <div class="col-12">
                <h2 class="text-white text-center my-5"> Como usar SPEM</h2>
            </div>
        </div>

        <div class="row">
            <div class="col-12 mb-4">
                <h5 class="text-white">En caso de que seas docente:</h5>
            </div>

            <div class="col-12 mt-lg-0 mt-4 col-lg-3">
                <div class="card">
                    <h5 class="card-header">
                        <p class="rounded-pill text-white text-center py-2 m-0 bg-primary">1</p>
                    </h5>
                    <div class="card-body">
                        <p class="card-text">Inicia sesión con la cuenta de maestro, en caso de no tener una, regístrate
                            y consigue una cuenta nueva. Una vez iniciado sesión tendrás diferentes opciones a
                            configurar.</p>
                    </div>
                </div>
            </div>
            <div class="col-12 mt-lg-0 mt-4 col-lg-3">
                <div class="card">
                    <h5 class="card-header">
                        <p class="rounded-pill text-white text-center py-2 m-0 bg-primary">2</p>
                    </h5>
                    <div class="card-body">
                        <h5 class="card-title">Administración de actividades. </h5>
                        <p class="card-text">Podrás seleccionar un grupo y en la tabla podrás colocar una calificación.
                            Importante no olvidar presionar el botón de <b>Guardar cambios</b> después de haber
                            modificado calificaciones.</p>
                    </div>
                </div>
            </div>

            <div class="col-12 mt-lg-0 mt-4 col-lg-3">
                <div class="card">
                    <h5 class="card-header">
                        <p class="rounded-pill text-white text-center py-2 m-0 bg-primary">3</p>
                    </h5>
                    <div class="card-body">
                        <h5 class="card-title">Administración de actividades.</h5>
                        <p class="card-text">Podrás crear, editar y eliminar actividades, presionando el botón <b>Crear
                                nueva actividad</b>. Seleccionando el grupo al que quiera agregarle dicha actividad y
                            llenando los campos correspondientes. </p>
                    </div>
                </div>
            </div>

            <div class="col-12 mt-lg-0 mt-4 col-lg-3 ">
                <div class="card">
                    <h5 class="card-header">
                        <p class="rounded-pill text-white text-center py-2 m-0 bg-primary">4</p>
                    </h5>
                    <div class="card-body">
                        <h5 class="card-title">Administración de grupos. </h5>
                        <p class="card-text">Podrás seleccionar la opción de <b>Crear grupo</b> si desea crear un nuevo
                            grupo, además de agregar a los alumnos y materias del grupo (las cuales son obligatorias
                            para crear actividades).</p>
                    </div>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-12  mt-4 col-lg-3 mt-4">
                <div class="card">
                    <h5 class="card-header">
                        <p class="rounded-pill text-white text-center py-2 m-0 bg-primary">5</p>
                    </h5>
                    <div class="card-body">
                        <h5 class="card-title">Administración de grupos. </h5>
                        <p class="card-text">Podrás seleccionar la opción de <b>Administrar grupo</b> si desea modificar
                            la configuración del grupo como (contraseña, grado académico o el nombre), o eliminar el
                            grupo.</p>
                    </div>
                </div>
            </div>
            <div class="col-12  mt-4 col-lg-3 mt-4">
                <div class="card">
                    <h5 class="card-header">
                        <p class="rounded-pill text-white text-center py-2 m-0 bg-primary">6</p>
                    </h5>
                    <div class="card-body">
                        <h5 class="card-title">Administración de asistencia. </h5>
                        <p class="card-text">Podrás seleccionar un grupo (depende de cuales haya creado), seleccionar
                            una fecha y en la tabla de abajo, colocar la asistencia a los alumnos que haya en el grupo
                            seleccionado. Importante no olvidar presionar el botón de <b>Guardar cambios</b> después de
                            haber modificado asistencia.</p>
                    </div>
                </div>
            </div>
            <div class="col-12  mt-4 col-lg-3 mt-4">
                <div class="card">
                    <h5 class="card-header">
                        <p class="rounded-pill text-white text-center py-2 m-0 bg-primary">7</p>
                    </h5>
                    <div class="card-body">
                        <h5 class="card-title">Administración de asistencia. </h5>
                        <p class="card-text"> Podrás seleccionar un grupo (depende de cuales haya creado) y ver los
                            comentarios que han enviado. Además, se podrá responder dicho comentario. Importante no
                            olvidar presionar el botón de <b>Enviar</b> después de haber contestado el mensaje.</p>
                    </div>
                </div>
            </div>
            <div class="col-12  mt-4 col-lg-3 mt-4">
                <div class="card">
                    <h5 class="card-header">
                        <p class="rounded-pill text-white text-center py-2 m-0 bg-primary">8</p>
                    </h5>
                    <div class="card-body">
                        <h5 class="card-title">Sección de retroalimentacion. </h5>
                        <p class="card-text">Podrás responder mensajes de los alumnos.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 text-center my-5">
                <a href="maestro.aspx" class="btn btn-info w-50 p-3">Empezar como docente</a>
            </div>
        </div>
        <div class="row">
            <div class="col-12 mb-4">
                <h5 class="text-white my-5">En caso de que seas tutor del estudiante:</h5>
            </div>
            <div class="col-lg-4 col-12 mb-4">
                <div class="card">
                    <h5 class="card-header">
                        <p class="rounded-pill text-white text-center py-2 m-0 bg-primary">1</p>
                    </h5>
                    <div class="card-body">
                        <p class="card-text">Inicia sesión con la cuenta de administrador de estudiante, en caso de no
                            tener una, regístrate y consigue una cuenta nueva. Una vez iniciado sesión tendrás
                            diferentes opciones para administrar el desempeño del estudiante. </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-12 mb-4">
                <div class="card">
                    <h5 class="card-header">
                        <p class="rounded-pill text-white text-center py-2 m-0 bg-primary">2</p>
                    </h5>
                    <div class="card-body">
                        <p class="card-text">En cada sección que se mencionara a continuación, hay un apartado para
                            mandar un comentario al docente en caso de alguna duda. Importante no olvidar presionar el
                            botón de <b>Enviar</b> después de haber contestado el mensaje. </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-12 mb-4">
                <div class="card">
                    <h5 class="card-header">
                        <p class="rounded-pill text-white text-center py-2 m-0 bg-primary">3</p>
                    </h5>
                    <div class="card-body">
                        <h5 class="card-title">Actividades. </h5>
                        <p class="card-text"> Podrás seleccionar una materia (depende de cuales haya en el grupo) y
                            veras todas las actividades que se han creado, tú calificación actual, fecha de entrega, y
                            el valor total de la actividad.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-12 mb-4">
                <div class="card">
                    <h5 class="card-header">
                        <p class="rounded-pill text-white text-center py-2 m-0 bg-primary">4</p>
                    </h5>
                    <div class="card-body">
                        <h5 class="card-title">Exámenes.</h5>
                        <p class="card-text">Podrás seleccionar una materia (depende de cuales haya en el grupo) y veras
                            todos los exámenes que se han creado, tú calificación actual, fecha de entrega, y el valor
                            total del examen.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-12 mb-4">
                <div class="card">
                    <h5 class="card-header">
                        <p class="rounded-pill text-white text-center py-2 m-0 bg-primary">5</p>
                    </h5>
                    <div class="card-body">
                        <h5 class="card-title">Asistencias. </h5>
                        <p class="card-text">Veras una tabla con las fechas en una columna y en otra columna estará la
                            opción donde indica que si asististe a clase o no.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-12 mb-4">
                <div class="card">
                    <h5 class="card-header">
                        <p class="rounded-pill text-white text-center py-2 m-0 bg-primary">6</p>
                    </h5>
                    <div class="card-body">
                        <h5 class="card-title">Sección de respuestas. </h5>
                        <p class="card-text">Podrás mantener una retroalimentación con el docente acerca de una duda que
                            se haya tenido. Además, de ver respuestas a comentarios de otras secciones.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 text-center my-5">
                <a href="alumno.aspx" class="btn btn-info w-50 p-3">Empezar como tutor del estudiante</a>
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
