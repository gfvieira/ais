<%@page import="src.modelo.Servidor_model"%>
<%@page import="src.modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%ArrayList<Servidor_model> list = (ArrayList<Servidor_model>) request.getAttribute("servidorarray");
    Usuario usuario = (Usuario) session.getAttribute("usuario");%>
<%@ page contentType="text/html; charset=UTF-8" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">

        <title>SIG-BASE || DEPARTAMENTO PESSOAL</title>

        <!-- Bootstrap core CSS -->
        <link href="assets2/css/bootstrap.css" rel="stylesheet">
        <!--external css-->
        <link href="assets2/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets2/css/zabuto_calendar.css">
        <link rel="stylesheet" type="text/css" href="assets2/js/gritter/css/jquery.gritter.css" />
        <link rel="stylesheet" type="text/css" href="assets2/lineicons/style.css">    

        <!-- Custom styles for this template -->
        <link href="assets2/css/style.css" rel="stylesheet">
        <link href="assets2/css/style-responsive.css" rel="stylesheet">

        <script src="assets2/js/chart-master/Chart.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>

        <section id="container" >
            <!-- **********************************************************************************************************************************************************
            TOP BAR CONTENT & NOTIFICATIONS
            *********************************************************************************************************************************************************** -->
            <!--header start-->
            <header class="header black-bg">
                <div class="sidebar-toggle-box">
                    <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
                </div>
                <!--logo start-->
                <a href="#" class="logo"><b>Departamento de Serviços Nauticos BH-10</b></a>
                <!--logo end-->
                <div class="top-menu">
                    <ul class="nav pull-right top-menu">
                        <li><a class="logout" href="/sigbase/LogOff.jsp">Sair</a></li>
                    </ul>
                </div>
            </header>
            <!--header end-->

            <!-- **********************************************************************************************************************************************************
            MAIN SIDEBAR MENU
            *********************************************************************************************************************************************************** -->
            <!--sidebar start-->
            
            <aside>
                <div id="sidebar"  class="nav-collapse ">
                    <!-- sidebar menu start-->
                    <ul class="sidebar-menu" id="nav-accordion">
                        <h5 class="centered"><%out.print(usuario.getPost());%>-<%out.print(usuario.getGuerra());%></h5>
                        <h5 class="centered"> BHMN</h5>
                        <%if (usuario.getPri().equals("TOTAL")) {%>
                        <li class="mt">
                            <a class="active" href="../cmd_home.jsp">
                                <i class="fa fa-dashboard"></i>
                                <span>Principal <%out.print(usuario.getSetor());%></span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a href="../bh10_home.jsp">
                                <i class="fa fa-dashboard"></i>
                                <span>Principal BH-10</span>
                            </a>
                        </li>
                        <%} else {%>
                        <li class="mt">
                            <a class="active" href="../bh10_home.jsp">
                                <i class="fa fa-dashboard"></i>
                                <span>Principal</span>
                            </a>
                        </li>
                        <%}%>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class="fa fa-book"></i>
                                <span>Pessoal</span>
                            </a>
                            <ul class="sub">
                                <li><a href="../pessoal/ListPessoal.jsp?type3=10">Listar</a></li>
                                <li><a href="../pessoal/FeriasControlePessoal.jsp?type2=10">Férias</a></li>
                            </ul>
                        </li><li class="sub-menu">
                            <a href="javascript:;" >
                                <i class="fa fa-book"></i>
                                <span>Indicadores</span>
                            </a>
                            <ul class="sub">
                                <li><a href="../indicadores/bh10_indicadores.jsp">Exibir</a></li>
                                <li><a href="../indicadores/bh10_indi_cad.jsp">Cadastrar</a></li>
                                <li><a href="../indicadores/bh10_indi_list.jsp">Atualizar</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class="fa fa-book"></i>
                                <span>folhaN</span>
                            </a>
                            <ul class="sub">
                                <li><a href="../folhaN/teste.jsp">Exibir</a></li>
                            </ul>
                        </li>
                    </ul>
                    <!-- sidebar menu end-->
                </div>
            </aside>
            <!--sidebar end-->

            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">
                    <div class="col-md-12 mt">
                        <div class="content-panel">
                            <table class="table table-hover">
                                <%if (list.size() == 0) {%>
                                <h2 class="centered">Nenhum Militar encontrado!</h2>
                                <%} else {%>
                                <h2 class="centered"><%out.println(list.size());%> Militar(es) Encontrado(s):</h2>
                                <%}%>
                                <hr>
                                <thead>
                                    <tr>
                                        <th><i class="fa fa-angle-double-right text-center"></i> Tipo</th>
                                        <th><i class="fa fa-angle-double-right text-center"></i> Posto/Grad</th>
                                        <th><i class="fa fa-angle-double-right text-center"></i> Nome</th>
                                        <th><i class="fa fa-angle-double-right text-center"></i> Nip</th>
                                        <th><i class="fa fa-angle-double-right text-center"></i> Departamento</th>
                                        <th><i class="fa fa-angle-double-right text-center"></i> Divisão</th>
                                        <th> </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (Servidor_model servidor : list) {%>
                                    <tr>
                                <%switch (servidor.getType()) {
                                        case 1:%><td><i class="center-block"></i>Praça</td>
                                    <%break;
                                        case 2:%><td><i class="center-block"></i>Oficial</td>
                                    <%break;
                                        case 3:%><td><i class="center-block"></i>TTC</td>
                                    <%break;
                                        case 4:%><td><i class="center-block"></i>Civil</td>
                                <%break;
                                    }%>
                                <%switch (servidor.getGrad()) {
                                        case 1:%><td><i class="center-block"></i>MN-RC</td>
                                    <%break;
                                        case 2:%><td><i class="center-block"></i>MN</td>
                                    <%break;
                                        case 3:%><td><i class="center-block"></i>MNE</td>
                                    <%break;
                                        case 4:%><td><i class="center-block"></i>CB</td>
                                <%break;
                                    case 5:%><td><i class="center-block"></i>3SG</td>
                                <%break;
                                    case 6:%><td><i class="center-block"></i>2SG</td>
                                <%break;
                                    case 7:%><td><i class="center-block"></i>1SG</td>
                                <%break;
                                    case 8:%><td><i class="center-block"></i>SO</td>
                                <%break;
                                    case 9:%><td><i class="center-block"></i>GM</td>
                                <%break;
                                    case 10:%><td><i class="center-block"></i>2T</td>
                                <%break;
                                    case 11:%><td><i class="center-block"></i>1T</td>
                                <%break;
                                    case 12:%><td><i class="center-block"></i>CT</td>
                                <%break;
                                    case 13:%><i class="center-block"></i><td>CC</td>
                                <%break;
                                        case 14:%><td><i class="center-block"></i>CF</td>
                                <%break;
                                    case 15:%><td><i class="center-block"></i>CMG</td>
                                <%break;
                                    case 16:%><td><i class="center-block"></i>CA</td>
                                <%break;
                                    case 17:%><td><i class="center-block"></i>VA</td>
                                <%break;
                                    case 18:%><td><i class="center-block"></i>AE</td>
                                <%break;
                                    }%>
                                <td><i class="center-block"></i><%out.println(servidor.getGuerra());%></td>
                                <td><i class="center-block"></i><%out.println(servidor.getNip());%></td>
                                <td><i class="center-block"></i><%out.println(servidor.getDep());%></td>
                                <td><i class="center-block"></i><%out.println(servidor.getDiv());%></td>
                                <td>
                                    <form class="col-sm-2 control-label" action="ExibePessoal.jsp" method="post">      
                                        <button type="submit" title="EXIBIR DADOS DO MILITAR" class="btn btn-primary btn-xs center-block"><i class="fa fa-check"></i></button>
                                        <input type="hidden" class="form-control" id="nip" name="nip" value="<% out.print(servidor.getNip()); %>" >
                                        <input type="hidden" id="type" name="type" value="<% out.print(servidor.getType()); %>" > 
                                        <input type="hidden" id="type2" name="type2" value="10" > 
                                    </form>
                                </td>
                                </tr>
                                <% }%>
                                </tbody>
                            </table>
                        </div><!--/row -->
                    </div><!--/row --> 
                </section>
            </section>

            <!--main content end-->
            <!--footer start-->
            <footer class="site-footer">
                <div class="text-center">
                    2015 - BHMN
                    </a>
                </div>
            </footer>
            <!--footer end-->
        </section>

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="assets2/js/jquery.js"></script>
        <script src="assets2/js/jquery-1.8.3.min.js"></script>
        <script src="assets2/js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="assets2/js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="assets2/js/jquery.scrollTo.min.js"></script>
        <script src="assets2/js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="assets2/js/jquery.sparkline.js"></script>


        <!--common script for all pages-->
        <script src="assets2/js/common-scripts.js"></script>

        <script type="text/javascript" src="assets2/js/gritter/js/jquery.gritter.js"></script>
        <script type="text/javascript" src="assets2/js/gritter-conf.js"></script>

        <!--script for this page-->
        <script src="assets2/js/sparkline-chart.js"></script>    
        <script src="assets2/js/zabuto_calendar.js"></script>	


    </body>
</html>
