<%@page import="java.util.ArrayList"%>

<%@page import="ejemplo03.dominio.Licencia"%>
<%@page import="java.util.List"%>
<%@page import="ejemplo03.dominio.Local"%>
<%@page import="java.util.Set"%>
<%@page import="org.springframework.web.util.HtmlUtils"%>
<%@page import="com.fpmislata.persistencia.dao.BussinessMessage"%>
<%@page import="ejemplo03.presentacion.FormOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    FormOperation formOperation = (FormOperation) request.getAttribute("formOperation");
    String labelButton = null;
    String urlAction;
    switch (formOperation) {
        case Insert:
            labelButton = "Insertar";
            urlAction = request.getContextPath() + "/locales/insert.html";
            break;
        case Update:
            labelButton = "Actualizar";
            urlAction = request.getContextPath() + "/locales/update.html";
            break;
        case Delete:
            labelButton = "Borrar";
            urlAction = request.getContextPath() + "/locales/delete.html";
            break;
        default:
            throw new RuntimeException("El valor de 'formOperation' no es válido" + formOperation);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Local</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

    </head>
    <body style="background:#FDFDFD">

        <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>


        <nav class="navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="#">Locales</a>
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
        <br>
        <div class="container">
            <div class="card" style="padding:20px;opacity:0.9"> 
                <div class="row">
                    <div class="span12">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h4 class="card-title">Locales</h4>
                        <h6 class="card-subtitle mb-2 text-muted"><%= labelButton%> local</h6>
                        <form action="<%=urlAction%>" method="post" >
                            <fieldset>
                                <div class="form-group">
                                    <label class="control-label" for="id">Id:</label>
                                    <input class="input-large disabled form-control " id="id" name="id" type="text" value="${local.id}">
                                </div>

                                <div class="form-group">
                                    <label class="control-label" for="emplazamiento">Emplazamiento</label>
                                    <input class="input-large disabled form-control"  id="emplazamiento" name="emplazamiento" type="text" value="${local.emplazamiento}">
                                </div>

                                <div class="form-group">
                                    <label class="control-label" for="codportal">Codigo Portal</label>
                                    <input class="input-large disabled form-control"  id="codportal" name="codportal" type="text" value="${local.codigoPortal}">
                                </div>

                                <div class="form-group">
                                    <label class="control-label" for="comentarios">Comentarios</label>
                                    <input class="input-large disabled form-control"  id="comentarios" name="comentarios" type="text" value="${local.comentarios}">
                                </div>


                            </fieldset>
                            <%
                                List<Licencia> licencias = new ArrayList<Licencia>();
                                if (request.getAttribute("licencias") != null) {
                                    licencias = (List<Licencia>) request.getAttribute("licencias");
                                }
                            %>    

                            <% if (licencias.size() > 0) {%>
                            <div class="row">
                                <p style="text-align:center;border-radius:10px; width: 100%;;" >Lista de licencias</p>
                                <table class="table">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>id</th>
                                            <th>Titulo</th>
                                            <th>Fecha Creacion</th>
                                            <th>Expediente</th>
                                            <th>Año</th>
                                            <th>LocalID</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (Licencia licencia : licencias) {
                                        %>
                                        <tr>
                                            <th scope="row"><%=HtmlUtils.htmlEscape(licencia.getIdLicencia() + "")%></th>
                                            <td><%=HtmlUtils.htmlEscape(licencia.getTitulo())%></td>
                                            <td><%=HtmlUtils.htmlEscape(licencia.getFechaCreacion().toString())%></td>
                                            <td><%=HtmlUtils.htmlEscape(licencia.getExpediente() + "")%></td>
                                            <td><%=HtmlUtils.htmlEscape(licencia.getAnyo() + "")%></td>
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
                            <%} else {%>
                            <div class="card bg-primary text-white">
                                <div class="card-body">
                                    <h4 class="card-title">No hay licencias</h4>
                                    <h6 class="card-subtitle mb-2 ">El local con id ${local.id} no tiene licencias. </h6>
                                    <p class="card-text">
                                        Empieza agregando nuevas licencias apretando al boton de agregar!
                                    </p>
                                    <a type="button" class="btn btn-outline-light" href="<%=request.getContextPath()%>/licencias/newForInsert.html?local=${local.id}">Insertar</a>
                                </div>
                            </div><br>

                            <%}%>

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
        </div>

    </body>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>

    <script>
        document.body.style.backgroundImage = "url(https://hdqwalls.com/download/galaxy-digital-universe-2048x1152.jpg)";
        document.body.style.width = "100%";
    </script>

</html>