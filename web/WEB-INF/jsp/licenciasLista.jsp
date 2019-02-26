<%@page import="java.util.ArrayList"%>
<%@page import="ejemplo03.dominio.Licencia"%>
<%@page import="ejemplo03.dominio.Local"%>
<%@page import="org.springframework.web.util.HtmlUtils"%>
<%@page import="ejemplo03.dominio.Profesor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Licencia> licencias = (List<Licencia>) request.getAttribute("licencias");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de licencias</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
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


        <div class="container-fluid" style="opacity: 0.9">
            <div class="row-fluid">
                <div class="span12">&nbsp;</div>
            </div>
            <div class="row-fluid">
                <div class="offset1  span10">
                    <div class="row-fluid">
                        <div class="span12">
                            <a id="btnNuevo" class="btn btn-primary" href="<%=request.getContextPath()%>/licencias/newForInsert.html">Nueva Licencia</a>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="span12">
                            <table class="table table-bordered table-hover table-condensed" style="background-color:White;">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Titulo.</th>
                                        <th>FechaCreacion</th>
                                        <th>Expediente</th>
                                        <th>Año</th>
                                        <th>LocalID</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (Licencia licencia : licencias) {
                                    %>
                                    <tr>
                                        <td><a href="<%=request.getContextPath()%>/licencia/readForUpdate.html?expediente=<%=licencia.getExpediente()%>" title="Editar" ><%=licencia.getExpediente()%></a></td>
                                        <td><%=HtmlUtils.htmlEscape(licencia.getTitulo())%></td>
                                        <td><%=HtmlUtils.htmlEscape(licencia.getFechaCreacion())%></td>
                                        <td><%=licencia.getExpediente()%></td>
                                        <td><%=HtmlUtils.htmlEscape(licencia.getAnyo())%></td>
                                        <td><%=HtmlUtils.htmlEscape(licencia.getLocal().getId() + "")%></td>


                                        <td>
                                            <a href="<%=request.getContextPath()%>/licencia/readForDelete.html?expediente=<%=licencia.getExpediente()%>" title="Borrar" ><i class="fas fa-trash-alt"></i></a>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>


                        </div>
                    </div>
                </div>
                <div class="span1"></div>
            </div>

            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>

            <script>
                document.body.style.backgroundImage = "url(https://wallpaperplay.com/walls/full/f/4/9/87849.jpg)";
                document.body.style.width = "100%";
            </script>
        </div>
    </body>
</html>