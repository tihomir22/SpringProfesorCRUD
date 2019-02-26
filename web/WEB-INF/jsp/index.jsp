<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@page import="org.springframework.web.util.HtmlUtils"%>
<%@page import="com.fpmislata.persistencia.dao.BussinessMessage"%>
<%@page import="ejemplo03.presentacion.FormOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Licencia</title>
        <style>
            input{
                width: 100%;
            }
            label{
                color:#0074D9;
            }



        </style>

        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body style="background:#FDFDFD">
        <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>

        <nav class="navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="#">Licencias</a>
            <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarsExample01" aria-controls="navbarsExample01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>


            <div class="navbar-collapse collapse" id="navbarsExample01" style="">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/SpringLocales/index.html">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/SpringLocales/listalocales.html">Locales</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/SpringLocales/listalicencias.html">Licencias</a>
                    </li>
            </div>

        </nav>



        <div class="container" >
            <br>

            <div class="jumbotron jumbotron bg-primary" style="text-center;color:white; ">
                <div class="container">
                 
                    
                    <h1 class="display-3">Locales y Licencias</h1>
                    <p class="lead">Pagina web destinada a la gestion de locales y licencias con sus funcionabilidades CRUD basicas.</p>
                </div>
            </div>
            <div class="card-deck">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Licencias</h4>
                        <p class="card-text">Las licencias forman parte del one2many con locales, es decir una licencia tiene muchos locales.</p>
                        <a type="button" class="btn btn-primary" href="/SpringLocales/listalicencias.html">Ver listado</a>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Locales</h4>
                        <p class="card-text">Los locales forman parte del many2one con licencias y tienen muchas licencias.</p>
                        <a type="button" class="btn btn-success" href="/SpringLocales/listalocales.html">Ver listado</a>
                    </div>
                </div>

            </div>

        </div>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>

        <script>
            document.body.style.backgroundImage = "url(https://wallpaperplay.com/walls/full/f/4/9/87849.jpg)";
            document.body.style.width = "100%";
        </script>
    </body>
</html>