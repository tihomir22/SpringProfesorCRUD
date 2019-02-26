<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@page import="org.springframework.web.util.HtmlUtils"%>
<%@page import="com.fpmislata.persistencia.dao.BussinessMessage"%>
<%@page import="ejemplo03.presentacion.FormOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Integer> localIDlist = (ArrayList<Integer>) request.getAttribute("localid");
%>
<%
    FormOperation formOperation = (FormOperation) request.getAttribute("formOperation");
    String labelButton = null;
    String urlAction;
    switch (formOperation) {
        case Insert:
            labelButton = "Insertar";
            urlAction = request.getContextPath() + "/licencia/insert.html";
            break;
        case Update:
            labelButton = "Actualizar";
            urlAction = request.getContextPath() + "/licencia/update.html";
            break;
        case Delete:
            labelButton = "Borrar";
            urlAction = request.getContextPath() + "/licencia/delete.html";
            break;
        default:
            throw new RuntimeException("El valor de 'formOperation' no es válido" + formOperation);
    }
%>
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
            <div class="row">
                <div class="span12">&nbsp;</div>
            </div>
            <div class="card" style="padding:20px;opacity:0.9"> 

                <div >
                    <h4 class="card-title">Licencia</h4>
                    <h6 class="card-subtitle mb-2 text-muted"><%= labelButton%> licencia</h6>
                    <form action="<%=urlAction%>" method="post" >
                        <fieldset>
                            <div class="form-group">
                                <label class="control-label" for="id">Id Licencia:</label><br>
                                <input class="form-control" id="id" name="id" type="number" value="${licencia.idLicencia}" required>
                            </div>

                            <div class="form-group">
                                <label class="control-label" for="local">Id Local:</label><br>
                                <select class="custom-select" name="local" required>
                                    <%
                                        if (labelButton.equalsIgnoreCase("Insertar")) {
                                    %>
                                    <%
                                        for (Integer idlocal : localIDlist) {
                                    %>
                                    <option value="<%=idlocal%>"><%=idlocal%></option>
                                    <%
                                        }
                                    %>
                                    <%
                                        }
                                    %>
                                    <%
                                        if (!labelButton.equalsIgnoreCase("Insertar")) {
                                    %>
                                    <option value="${licencia.local.id}">${licencia.local.id}</option>
                                    <%
                                        }
                                    %>

                                </select>
                            </div>

                            <div class="form-group">
                                <label class="control-label" for="expediente">Expediente</label><br>
                                <input class="form-control" id="expediente" name="expediente" type="text" value="${licencia.expediente}" required>
                            </div>

                            <div class="form-group">
                                <label class="control-label" for="titulo">Titulo</label><br>
                                <input class="form-control" id="titulo" name="titulo" type="text" value="${licencia.titulo}" required>
                            </div>

                            <div class="form-group">
                                <label class="control-label" for="fechaCreacion">Fecha Creacion:</label><br>
                                <input class="form-control" id="fechaCreacion" name="fechaCreacion" type="date" value="${licencia.fechaCreacion}" required>
                            </div>

                            <div class="form-group">
                                <label class="control-label" for="anyo">Año:</label><br>
                                <input class="form-control" id="anyo" name="anyo" type="number" value="${licencia.anyo}" required>
                            </div>


                        </fieldset>
                        <% if (request.getAttribute("bussinessMessages") != null) {%>
                        <div class="alert alert-error alert-block">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <ul>
                                <%for (BussinessMessage bussinessMessage : (Set<BussinessMessage>) request.getAttribute("bussinessMessages")) {%>
                                <li>
                                    <%if (bussinessMessage.getFieldName() != null) {
                                            out.print("<strong>" + HtmlUtils.htmlEscape(bussinessMessage.getFieldName()) + "</strong>");
                                        }
                                    %>
                                    <%=HtmlUtils.htmlEscape(bussinessMessage.getMessage())%>
                                </li>
                                <%} %>
                            </ul>
                        </div>
                        <%}%>
                        <div class="form-actions">
                            <button id="aceptarBtn" class="btn btn-primary" type="submit"><%=labelButton%></button>
                            <a class="btn" href="<%=request.getContextPath()%>/index.html" >Cancelar</a>
                        </div>
                    </form>
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