<%@page import="src.modelo.Indicador_bh10_model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="src.modelo.Indicador_model"%>
<%@page import="src.modelo.Usuario"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%Usuario usuario = (Usuario) session.getAttribute("usuario");
    ArrayList<Indicador_bh10_model> indarray = (ArrayList<Indicador_bh10_model>) request.getAttribute("array");
    DecimalFormat df = new DecimalFormat("0.00");
    String mes = "01";
    int temp1 = 0;
    int temp = Integer.parseInt(mes);
    switch (temp) {
        case 1:
            mes = "Janeiro";
            break;
        case 2:
            mes = "Fevereiro";
            break;
        case 3:
            mes = "Março";
            break;
        case 4:
            mes = "Abril";
            break;
        case 5:
            mes = "Maio";
            break;
        case 6:
            mes = "Junho";
            break;
        case 7:
            mes = "Julho";
            break;
        case 8:
            mes = "Agosto";
            break;
        case 9:
            mes = "Setembro";
            break;
        case 10:
            mes = "Outubro";
            break;
        case 11:
            mes = "Novembro";
            break;
        case 12:
            mes = "Dezembro";
            break;
    }
    Timestamp tm = new Timestamp(System.currentTimeMillis());
    String year = new SimpleDateFormat("yyyy").format(tm);
%>

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
                    <div class="row mt">
                        <div class="col-lg-12 main-chart">
                            <div class="content-panel">		
                                <!--CUSTOM CHART START -->
                                <div class="border-head">
                                    <h3>BH-11 | Indicador de Eficácia no Atendimento de Serviços das Oficinas (IASO) </h3>
                                    <h5 class="text-center" style="color: black;font-size: 10px;">(Melhores práticas – Acima de 85%)</h5>
                                </div>
                                <div class="custom-bar-chart">
                                    <ul class="y-axis">
                                        <li><span><%out.print(df.format(100));%></span></li>
                                        <li><span><%out.print(df.format(80));%></span></li>
                                        <li><span><%out.print(df.format(60));%></span></li>
                                        <li><span><%out.print(df.format(40));%></span></li>
                                        <li><span><%out.print(df.format(20));%></span></li>
                                        <li><span>0%</span></li>
                                    </ul>
                                    <%for (Indicador_bh10_model ind : indarray) {
                                            String mesInd = "";
                                            switch (ind.getMes()) {
                                                case 1:
                                                    mesInd = "Janeiro";
                                                    break;
                                                case 2:
                                                    mesInd = "Fevereiro";
                                                    break;
                                                case 3:
                                                    mesInd = "Março";
                                                    break;
                                                case 4:
                                                    mesInd = "Abril";
                                                    break;
                                                case 5:
                                                    mesInd = "Maio";
                                                    break;
                                                case 6:
                                                    mesInd = "Junho";
                                                    break;
                                                case 7:
                                                    mesInd = "Julho";
                                                    break;
                                                case 8:
                                                    mesInd = "Agosto";
                                                    break;
                                                case 9:
                                                    mesInd = "Setembro";
                                                    break;
                                                case 10:
                                                    mesInd = "Outubro";
                                                    break;
                                                case 11:
                                                    mesInd = "Novembro";
                                                    break;
                                                case 12:
                                                    mesInd = "Dezembro";
                                                    break;
                                            }
                                            if (temp1 == 0) {
                                                temp1 = 2; %>  
                                    <div class="bar" style="width: 6%; margin: 0px 4%; margin-left: 50px;">
                                        <%} else {%>
                                        <div class="bar" style="width: 6%; margin: 0px 4%;">
                                            <%}
                                                if (ind.getValue() >= 85) {%>
                                            <div class="title" style="color: black; font-size: 14px;"><%out.print(mesInd);%>/<%out.print(ind.getAno());%></div>
                                            <div class="value tooltips" data-original-title="<%out.print(ind.getValue());%>" data-toggle="tooltip" data-placement="top" style="background: #006400"><%out.print(ind.getValue());%>%</div>
                                            <%} else {%>
                                            <div class="title" style="color: black; font-size: 14px;"><%out.print(mesInd);%>/<%out.print(ind.getAno());%></div>
                                            <div class="value tooltips" data-original-title="<%out.print(ind.getValue());%>" data-toggle="tooltip" data-placement="top" style="background: #ff3333"><%out.print(ind.getValue());%>%</div>
                                            <%}%>
                                        </div>
                                        <% }%>
                                    </div>
                                </div><!-- /panr -->	
                            </div>
                            <div class="col-lg-12 main-chart">
                                <table class="table table-hover">
                                    <hr>
                                    <thead>
                                        <tr>
                                            <%for (Indicador_bh10_model ind : indarray) {
                                                    String mesInd = "";
                                                    switch (ind.getMes()) {
                                                        case 1:
                                                            mesInd = "Janeiro";
                                                            break;
                                                        case 2:
                                                            mesInd = "Fevereiro";
                                                            break;
                                                        case 3:
                                                            mesInd = "Março";
                                                            break;
                                                        case 4:
                                                            mesInd = "Abril";
                                                            break;
                                                        case 5:
                                                            mesInd = "Maio";
                                                            break;
                                                        case 6:
                                                            mesInd = "Junho";
                                                            break;
                                                        case 7:
                                                            mesInd = "Julho";
                                                            break;
                                                        case 8:
                                                            mesInd = "Agosto";
                                                            break;
                                                        case 9:
                                                            mesInd = "Setembro";
                                                            break;
                                                        case 10:
                                                            mesInd = "Outubro";
                                                            break;
                                                        case 11:
                                                            mesInd = "Novembro";
                                                            break;
                                                        case 12:
                                                            mesInd = "Dezembro";
                                                            break;
                                                    }
                                                    if (ind.getValue() >= 85) {%>  
                                            <th style="color: black; font-size: 14px;"><%out.print(mesInd);%>/<%out.print(ind.getAno());%></th>
                                                <%} else {%>
                                            <th style="color: black; font-size: 14px;"><%out.print(mesInd);%>/<%out.print(ind.getAno());%></th>
                                                <%}
                                                }%>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <%for (Indicador_bh10_model ind : indarray) {
                                                         if (ind.getValue() >= 85) {%>
                                            <td style="color: black;"><%out.print(ind.getValue());%></td>
                                            <%} else {%>
                                            <td style="color: black;"><%out.print(ind.getValue());%></td>
                                            <%}
                                                        }%>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div><!-- /row -->
                </section>
            </section>

            <!--main content end-->
            <!--footer start-->
            <footer class="site-footer">
                <div class="text-center">
                    2016 - BHMN
                    <a href="bh10_indicadores.jsp" class="go-top">
                        <i class="fa fa-angle-up"></i>
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

        <script type="application/javascript">
            $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
            $(this).hide();
            });

            $("#my-calendar").zabuto_calendar({
            action: function () {
            return myDateFunction(this.id, false);
            },
            action_nav: function () {
            return myNavFunction(this.id);
            },
            ajax: {
            url: "show_data.php?action=1",
            modal: true
            },
            legend: [
            {type: "text", label: "Special event", badge: "00"},
            {type: "block", label: "Regular event", }
            ]
            });
            });


            function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
            }
        </script>


    </body>
</html>
