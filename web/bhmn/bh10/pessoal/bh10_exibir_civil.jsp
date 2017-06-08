<%@page import="java.text.SimpleDateFormat"%>
<%@page import="src.modelo.Servidor_movi"%>
<%@page import="src.modelo.Servidor_model"%>
<%@page import="src.modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%Servidor_model servidor = (Servidor_model) request.getAttribute("civil");
    ArrayList<Servidor_movi> servidorarray = (ArrayList<Servidor_movi>) request.getAttribute("civilarray");
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    String grad = "";
    switch (servidor.getGrad()) {
        case 2:
            grad = "MN";
            break;
        case 4:
            grad = "CB";
            break;
        case 5:
            grad = "3SG";
            break;
        case 6:
            grad = "2SG";
            break;
        case 7:
            grad = "1SG";
            break;
        case 8:
            grad = "SO";
            break;
        case 9:
            grad = "GM";
            break;
        case 10:
            grad = "2T";
            break;
        case 11:
            grad = "1T";
            break;
        case 12:
            grad = "CT";
            break;
        case 13:
            grad = "CC";
            break;
        case 14:
            grad = "CF";
            break;
        case 15:
            grad = "CMG";
            break;
        case 16:
            grad = "CA";
            break;
        case 17:
            grad = "VA";
            break;
        case 18:
            grad = "AE";
            break;
    }%>
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
                    <div class="col-lg-12">
                        <div class="form-panel">
                            <form class="form-horizontal style-form" action="ExibePessoal.jsp" method="post">
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align: right;"><font color="black"><b>Nome Completo:</b></font></label>
                                    <div class="col-sm-3">
                                        <p class="form-control-static" style="text-align: left;"><%out.println(servidor.getNome());%></p>
                                    </div>
                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align: right;"><font color="black"><b>NIP:</b></font></label>
                                    <div class="col-sm-3">
                                        <p class="form-control-static" style="text-align: left;"><%out.println(servidor.getNip());%></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align: right;"><font color="black"><b>Assemlhado:</b></font></label>
                                    <div class="col-sm-2">
                                        <p class="form-control-static" style="text-align: left;"><%out.println(grad);%></p>
                                    </div> 
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align: right;"><font color="black"><b>Data de Embarque:</b></font></label>
                                    <div class="col-sm-2"> 
                                        <p class="form-control-static" style="text-align: left;"><%out.println(servidor.getEmb());%></p>
                                    </div>
                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align: right;"><font color="black"><b>Data de Aniversario:</b></font></label>
                                    <div class="col-sm-2"> 
                                        <p class="form-control-static" style="text-align: left;"><%out.println(servidor.getNasc());%></p>
                                    </div> 
                                </div> 
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align: right;"><font color="black"><b>OS:</b></font></label>
                                    <div class="col-sm-2">
                                        <p class="form-control-static" style="text-align: left;"><%out.println(servidor.getOs());%></p>
                                    </div>
                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align: right;"><font color="black"><b>Ramal:</b></font></label>
                                    <div class="col-sm-2">
                                        <p class="form-control-static" style="text-align: left;"><%out.println(servidor.getRamal());%></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align: right;"><font color="black"><b>Departamento:</b></font></label>
                                    <div class="col-sm-2">
                                        <p class="form-control-static" style="text-align: left;"><%out.println(servidor.getDep());%></p>
                                    </div>
                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align: right;"><font color="black"><b>Divisão:</b></font></label>
                                    <div class="col-sm-2">
                                        <p class="form-control-static" style="text-align: left;"><%out.println(servidor.getDiv());%></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align: right;"><font color="black"><b>Função:</b></font></label>
                                    <div class="col-sm-8">
                                        <p class="form-control-static" style="text-align: left;"><%out.println(servidor.getFuncao());%></p>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>  
                    <div class="col-md-12 mt">
                        <div class="content-panel">
                            <table class="table table-hover">
                                <h4><i class="fa fa-angle-right centered"></i> HISTORICO</h4>
                                <hr>
                                <thead>
                                    <tr>
                                        <th><i class="fa fa-angle-double-right text-center"></i> DATA</th>
                                        <th><i class="fa fa-angle-double-right text-center"></i> MOVIMENTAÇÃO</th>
                                        <th><i class="fa fa-angle-double-right text-center"></i> IP</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (Servidor_movi move : servidorarray) {%>
                                    <tr>
                                        <td><%out.print(move.getDatacadmov());%> às <%out.print(move.getHoracadmov());%></td>
                                        <td><%out.print(move.getUsercadmov());%> | <%out.print(move.getDesc_mov());%></td>
                                        <td><%out.print(move.getIpcadmov());%></td>
                                    </tr>
                                    <% }%>
                                </tbody>
                            </table>
                        </div><!--/content-panel -->
                    </div><!-- /col-md-12 -->
                </section>
            </section>

            <!--main content end-->
            <!--footer start-->
            <footer class="site-footer">
                <div class="text-center">
                    2015 - BHMN
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
