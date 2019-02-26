<%@page import="java.util.ArrayList"%>
<%@page import="ejemplo03.dominio.Licencia"%>
<%@page import="ejemplo03.dominio.Local"%>
<%@page import="org.springframework.web.util.HtmlUtils"%>
<%@page import="ejemplo03.dominio.Profesor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Local> locales = (List<Local>) request.getAttribute("locales");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Local lista</title>
           <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  
    </head>
    <body style="background:#FDFDFD" >
        <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>
        <nav class="navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="#" >Locales</a>
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

        <div class="container-fluid" >
            <div class="row-fluid">
                <div class="span12">&nbsp;</div>
            </div>
            <div class="row-fluid">
                <div class="offset1  span10">
                    <div class="row-fluid">
                        <div class="span12">
                            <a id="btnNuevo" class="btn btn-primary" href="<%=request.getContextPath()%>/locales/newForInsert.html">Nuevo Local</a>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="span12">
                            <table class="table table-bordered table-hover table-condensed" style="background:white;opacity:0.9;">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Ref. Muni.</th>
                                        <th>Emplazamiento</th>
                                        <th>Zona Saturada</th>
                                        <th>Codigo Portal</th>
                                        <th>Comentarios</th>
                                        <th>Licencias</th>  
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (Local local : locales) {
                                    %>
                                    <tr>
                                        <td><a href="<%=request.getContextPath()%>/locales/readForUpdate.html?id=<%=local.getId()%>" title="Editar" ><%=local.getId()%></a></td>
                                        <td><%=HtmlUtils.htmlEscape(local.getRefMuni())%></td>
                                        <td><%=HtmlUtils.htmlEscape(local.getEmplazamiento())%></td>
                                        <td><%=HtmlUtils.htmlEscape(local.getZonaSaturada())%></td>
                                        <td><%=HtmlUtils.htmlEscape(local.getCodigoPortal())%></td>
                                        <td><%=HtmlUtils.htmlEscape(local.getComentarios())%></td>
                                        <td>
                                            <%
                                                List<Licencia> mainList = new ArrayList<Licencia>();
                                                mainList.addAll(local.getLicencias());
                                                for (Licencia licencia : mainList) {
                                            %>
                                            <a href="<%=request.getContextPath()%>/licencias.html?id=<%=licencia.getIdLicencia()%>"><%=HtmlUtils.htmlEscape(licencia.getIdLicencia() + "")%></a>
                                            <%
                                                }
                                            %>
                                        </td>

                                        <td>
                                            <a href="<%=request.getContextPath()%>/locales/readForDelete.html?id=<%=local.getId()%>" title="Borrar" ><i class="fas fa-trash-alt"></i></a>
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
        </div>
    </body>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>

    <script>
        document.body.style.backgroundImage = "url(https://hdqwalls.com/download/galaxy-digital-universe-2048x1152.jpg)";
        document.body.style.width = "100%";
    </script>
</html>