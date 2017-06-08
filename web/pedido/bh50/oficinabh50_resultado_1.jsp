<%@page import="src.modelo.Pedido_model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<%ArrayList<Pedido_model> list = (ArrayList<Pedido_model>) request.getAttribute("oficinaarray");%>
<%int qntd = (Integer) request.getAttribute("qnt");%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta name="viewport"    content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author"      content="Sergey Pozhilov (GetTemplate.com)">

        <title>SIG-BASE </title>

        <link rel="shortcut icon" href="assets/images/gt_favicon.png">
        <link rel="stylesheet" media="screen" href="assets/css/font.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!-- Custom styles for our template -->
        <link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen" >
        <link rel="stylesheet" href="assets/css/main.css">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="assets/js/html5shiv.js"></script>
        <script src="assets/js/respond.min.js"></script>
        <![endif]-->
    </head>

    <body class="home">
        <!-- Fixed navbar -->
        <div class="navbar navbar-inverse navbar-fixed-top headroom" >
            <div class="container">
                <div class="navbar-header">
                    <!-- Button for smallest screens -->
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                    <a class="navbar-brand" href="index.html"><img src="assets/images/logo.png" alt="BHMN"></a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav pull-right">
                        <li class="active"><a href="/sigbase/index.html">Home</a></li>
                        <li><a href="/sigbase/emConstrucao.html">Folha N</a></li>
                        <li><a href="/sigbase/loginSigbase.jsp">Sig-Base</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pedido de Serviço<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="/sigbase/emConstrucao.html">Ofícina BH-10</a></li>
                                <li><a href="/sigbase/pedido/oficinabh34.html">Telemática BH-34</a></li>
                                <li><a href="/sigbase/pedido/oficinabh50.html">Ofícina BH-50</a></li>
                                <li><a href="/sigbase/pedido/oficinabh50_viatura.html">Viatura BH-50</a></li>
                                <li><a href="/sigbase/emConstrucao.html">Atracação Navio MB</a></li>
                                <li><a href="/sigbase/emConstrucao.html">Atracação Navio Extra-MB</a></li>
                            </ul>
                        </li>
                        <li><a href="oficinabh34_consulta.html">Consultar Pedido</a></li>
                        <li><a href="/sigbase/manual.html">Como Utilizar?</a></li>
                        <li><a href="/sigbase/emConstrucao.html">Contact</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </div> 
        <!-- /.navbar -->

        <!-- Header -->
        <!-- /Header -->

        <!-- Intro -->
        <div class="container text-center">
            <br> <br>
            <%if (qntd == 0) {%>
            <h2 class="thin">Nenhum Pedido encontrado!</h2>
            <%} else {%>
            <h2 class="thin"><%out.println(list.size());%> Pedido(s) Encontrado(s):</h2>
            <%}%>
            <table class="table table-striped table-advance table-hover">
                <hr>
                <thead>
                    <tr>
                        <th><i class="fa fa-angle-double-right text-center"></i> OS</th>
                        <th><i class="fa fa-angle-double-right text-center"></i> Solicitante</th>
                        <th><i class="fa fa-angle-double-right text-center"></i> Nip</th>                                 
                        <th><i class="fa fa-angle-double-right text-center"></i> Oficina</th>
                        <th><i class="fa fa-angle-double-right text-center"></i> Solicitação</th>
                        <th><i class="fa fa-angle-double-right text-center"></i> Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%for (Pedido_model oficina : list) {%>
                    <tr>
                        <td><%out.println(oficina.getOs());%></td>
                        <td><%out.println(oficina.getNome());%></td>
                        <td><%out.println(oficina.getNip());%></td>
                        <td><%out.println(oficina.getAtendimento());%></td>
                        <td><%out.println(oficina.getSolicitacao());%></td>
                        <%if (oficina.getStatus().equals("AGUARDANDO ENCARREGADO")) {%>
                        <td><span class="label label-danger label-mini"><%out.println(oficina.getStatus());%></span></td>
                        <td>
                            <form class="col-sm-2 control-label" action="OficinaBh50ConsultOs.jsp" method="post">      
                                <button type="submit" title="EXIBIR DADOS DA OS" class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
                                <input type="hidden" class="form-control" id="os" name="os" maxlength="50" value="<% out.print(oficina.getOs()); %>" > 
                            </form>
                        </td>
                        <%} else if (oficina.getStatus().equals("NÃO INICIADO")) {%>
                        <td><span class="label label-danger label-mini"><%out.println(oficina.getStatus());%></span></td>
                        <td>
                            <form class="col-sm-2 control-label" action="OficinaBh50ConsultOs.jsp" method="post">      
                                <button type="submit" title="EXIBIR DADOS DA OS" class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
                                <input type="hidden" class="form-control" id="os" name="os" maxlength="50" value="<% out.print(oficina.getOs()); %>" > 
                            </form>
                        </td>
                        <%} else if (oficina.getStatus().equals("EM ANDAMENTO")) {%>
                        <td><span class="label label-warning label-mini"><%out.println(oficina.getStatus());%></span></td>
                        <td>
                            <form class="col-sm-2 control-label" action="OficinaBh50ConsultOs.jsp" method="post">      
                                <button type="submit" title="EXIBIR DADOS DA OS" class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
                                <input type="hidden" class="form-control" id="os" name="os" maxlength="50" value="<% out.print(oficina.getOs()); %>" > 
                            </form>
                        </td>
                        <%} else if (oficina.getStatus().equals("FINALIZADO")) {%>
                        <td><span class="label label-success label-mini"><%out.println(oficina.getStatus());%></span></td>
                        <td>
                            <form class="col-sm-2 control-label" action="OficinaBh50ConsultOs.jsp" method="post">      
                                <button type="submit" title="EXIBIR DADOS DA OS" class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
                                <input type="hidden" class="form-control" id="os" name="os" maxlength="50" value="<% out.print(oficina.getOs()); %>" > 
                            </form>
                        </td>
                        <%} else {%>
                        <td><%out.println(oficina.getStatus());%></td>
                        <%}%>
                    </tr>
                    <% }%>


                </tbody>
            </table>
        </div>









        <!-- JavaScript libs are placed at the end of the document so the pages load faster -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/headroom.min.js"></script>
        <script src="assets/js/jQuery.headroom.min.js"></script>
        <script src="assets/js/template.js"></script>
    </body>
</html>