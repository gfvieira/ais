<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.modelo.Usuario"%>
<%@page import="java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%Usuario usuario = (Usuario) session.getAttribute("usuario");%>

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
                <a href="index.html" class="logo"><b>SIG-BASE || DEPARTAMENTO PESSOAL</b></a>
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

                        <p class="centered"><a href="profile.html"><img src="assets2/img/CBV.png" class="img-circle" width="80"></a></p>
                        <h5 class="centered">BHMN</h5>
                        <%if (usuario.getPri().equals("TOTAL")) {%>
                        <li class="mt">
                            <a class="active" href="../cmd_home.jsp">
                                <i class="fa fa-dashboard"></i>
                                <span>Principal <%out.print(usuario.getSetor());%></span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a href="bh30_home.jsp">
                                <i class="fa fa-dashboard"></i>
                                <span>Principal BH-30</span>
                            </a>
                        </li>
                        <%} else {%>
                        <li class="mt">
                            <a class="active" href="bh30_home.jsp">
                                <i class="fa fa-dashboard"></i>
                                <span>Principal</span>
                            </a>
                        </li>
                        <%}%>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class=" fa fa-bar-chart-o"></i>
                                <span style="color: red">Plano de metas</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" style="color: red">Inserir</a></li>
                                <li><a href="#" style="color: red">Visualizar</a></li>
                            </ul>
                        </li>
                        
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class=" fa fa-bar-chart-o"></i>
                                <span style="color: red">Pessoal</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" style="color: red">Listar</a></li>
                                <li><a href="#" style="color: red">Ferias</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a  href="bh30_indicadores.jsp">
                                <i class="fa fa-bar-chart-o"></i> Indicadores</a>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class=" fa fa-bar-chart-o"></i>
                                <span>Administração BH-30</span>
                            </a>
                            <ul class="sub">
                                <li><a href="bh31/BH31.jsp?ind=HOME&access=<%out.print(usuario.getTypeAccess());%>">BH-31 pessoal</a></li>
                                <li><a href="bh32/bh32_home.jsp" style="color: red">BH-32 Saúde</a></li>
                                <li><a href="bh33/bh33_home.jsp" style="color: red">BH-33 Segurança</a></li>
                                <li><a href="bh34/BH34.jsp?ind=HOME&access=<%out.print(usuario.getTypeAccess());%>">BH-34 Telamática</a></li>
                                <li><a href="chapa/bh30_chapa.jsp">CHaPA</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class=" fa fa-bar-chart-o"></i>
                                <span>Plano de metas</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" style="color: red">Inserir</a></li>
                                <li><a href="#" style="color: red">Visualizar</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a  href="bh30_indicadores.jsp">
                                <i class="fa fa-bar-chart-o"></i> Indicadores</a>
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
                    <div class="row">
                        <div class="col-lg-12 main-chart">
                            <div class="row">
                                <!-- TWITTER PANEL -->
                                <div class="col-md-4 mb">
                                    <div class="darkblue-panel pn">
                                        <div class="darkblue-header">
                                            <h5>FILA</h5>
                                        </div>
                                        <canvas id="serverstatus02" height="120" width="120"></canvas>
                                        <script>
                                            var doughnutData = [
                                                {
                                                    value: 60,
                                                    color: "#68dff0"
                                                },
                                                {
                                                    value: 40,
                                                    color: "#444c57"
                                                }
                                            ];
                                            var myDoughnut = new Chart(document.getElementById("serverstatus02").getContext("2d")).Doughnut(doughnutData);
                                        </script>
                                        <p>April 17, 2014</p>
                                        <footer>
                                            <div class="pull-left">
                                                <h5><i class="fa fa-hdd-o"></i> 17 GB</h5>
                                            </div>
                                            <div class="pull-right">
                                                <h5>60% Used</h5>
                                            </div>
                                        </footer>
                                    </div>
                                </div><!-- /col-md-4 -->

                                <div class="col-md-4 mb">
                                    <div class="darkblue-panel pn">
                                        <div class="darkblue-header">
                                            <h5>VAGO</h5>
                                        </div>
                                        <canvas id="serverstatus023" height="120" width="120"></canvas>
                                        <script>
                                            var doughnutData3 = [
                                                {
                                                    value: 30,
                                                    color: "#68dff0"
                                                },
                                                {
                                                    value: 70,
                                                    color: "#444c57"
                                                }
                                            ];
                                            var myDoughnut3 = new Chart(document.getElementById("serverstatus023").getContext("2d")).Doughnut(doughnutData3);
                                        </script>
                                        <p>April 17, 2014</p>
                                        <footer>
                                            <div class="pull-left">
                                                <h5><i class="fa fa-hdd-o"></i> 17 GB</h5>
                                            </div>
                                            <div class="pull-right">
                                                <h5>30% Used</h5>
                                            </div>
                                        </footer>
                                    </div><!-- /darkblue panel -->
                                </div><!-- /col-md-4 -->

                                <div class="col-md-4 mb">
                                    <div class="darkblue-panel pn">
                                        <div class="darkblue-header">
                                            <h5>OCUPADO</h5>
                                        </div>
                                        <canvas id="serverstatus013" height="120" width="120"></canvas>
                                        <script>
                                            var doughnutData2 = [
                                                {
                                                    value: 30,
                                                    color: "#68dff0"
                                                },
                                                {
                                                    value: 70,
                                                    color: "#444c57"
                                                }
                                            ];
                                            var myDoughnut2 = new Chart(document.getElementById("serverstatus013").getContext("2d")).Doughnut(doughnutData2);
                                        </script>
                                        <p>April 17, 2014</p>
                                        <footer>
                                            <div class="pull-left">
                                                <h5><i class="fa fa-hdd-o"></i> 17 GB</h5>
                                            </div>
                                            <div class="pull-right">
                                                <h5>30% Used</h5>
                                            </div>
                                        </footer>
                                    </div><!-- /darkblue panel -->
                                </div><!-- /col-md-4 -->
                            </div><!-- /row -->
                        </div><!-- /col-lg-9 END SECTION MIDDLE -->
                    </div><!--/row -->
                    <br><br><br><br><br>
                </section>
            </section>
            <section id="main-content">
                <section class="wrapper">

                    <div class="row">
                        <div class="col-lg-12 main-chart">
                            <div class="row">
                                <!-- TWITTER PANEL -->
                                <div class="col-md-4 mb">
                                    <div class="darkblue-panel pn">
                                        <div class="darkblue-header">
                                            <h5>PRAÇAS</h5>
                                        </div>
                                        <canvas id="serverstatus02" height="120" width="120"></canvas>
                                        <script>
                                            var doughnutData = [
                                                {
                                                    value: 60,
                                                    color: "#68dff0"
                                                },
                                                {
                                                    value: 40,
                                                    color: "#444c57"
                                                }
                                            ];
                                            var myDoughnut = new Chart(document.getElementById("serverstatus02").getContext("2d")).Doughnut(doughnutData);
                                        </script>
                                        <p>April 17, 2014</p>
                                        <footer>
                                            <div class="pull-left">
                                                <h5><i class="fa fa-hdd-o"></i> 17 GB</h5>
                                            </div>
                                            <div class="pull-right">
                                                <h5>60% Used</h5>
                                            </div>
                                        </footer>
                                    </div>
                                </div><!-- /col-md-4 -->

                                <div class="col-md-4 mb">
                                    <div class="darkblue-panel pn">
                                        <div class="darkblue-header">
                                            <h5>OFICIAIS</h5>
                                        </div>
                                        <canvas id="serverstatus023" height="120" width="120"></canvas>
                                        <script>
                                            var doughnutData3 = [
                                                {
                                                    value: 30,
                                                    color: "#68dff0"
                                                },
                                                {
                                                    value: 70,
                                                    color: "#444c57"
                                                }
                                            ];
                                            var myDoughnut3 = new Chart(document.getElementById("serverstatus023").getContext("2d")).Doughnut(doughnutData3);
                                        </script>
                                        <p>April 17, 2014</p>
                                        <footer>
                                            <div class="pull-left">
                                                <h5><i class="fa fa-hdd-o"></i> 17 GB</h5>
                                            </div>
                                            <div class="pull-right">
                                                <h5>30% Used</h5>
                                            </div>
                                        </footer>
                                    </div><!-- /darkblue panel -->
                                </div><!-- /col-md-4 -->

                                <div class="col-md-4 mb">
                                    <div class="darkblue-panel pn">
                                        <div class="darkblue-header">
                                            <h5>CIVIS</h5>
                                        </div>
                                        <canvas id="serverstatus013" height="120" width="120"></canvas>
                                        <script>
                                            var doughnutData2 = [
                                                {
                                                    value: 30,
                                                    color: "#68dff0"
                                                },
                                                {
                                                    value: 70,
                                                    color: "#444c57"
                                                }
                                            ];
                                            var myDoughnut2 = new Chart(document.getElementById("serverstatus013").getContext("2d")).Doughnut(doughnutData2);
                                        </script>
                                        <p>April 17, 2014</p>
                                        <footer>
                                            <div class="pull-left">
                                                <h5><i class="fa fa-hdd-o"></i> 17 GB</h5>
                                            </div>
                                            <div class="pull-right">
                                                <h5>30% Used</h5>
                                            </div>
                                        </footer>
                                    </div><!-- /darkblue panel -->
                                </div><!-- /col-md-4 -->
                            </div><!-- /row -->
                        </div><!-- /col-lg-9 END SECTION MIDDLE -->
                    </div><!--/row -->
                    <br><br><br><br><br>
                </section>
            </section>
            <footer class="site-footer">
                <div class="text-center">
                    2015 - BHMN
                    <a href="index.html#" class="go-top">
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

        <script type="text/javascript">
                                            $(document).ready(function () {
                                                var unique_id = $.gritter.add({
                                                    // (string | mandatory) the heading of the notification
                                                    title: 'Bem-vindo ao SIG-BASE!',
                                                    // (string | mandatory) the text inside the notification
                                                    text: 'Hover me to enable the Close Button. You can hide the left sidebar clicking on the button next to the logo. Free version for <a href="http://blacktie.co" target="_blank" style="color:#ffd777">BlackTie.co</a>.',
                                                    // (string | optional) the image to display on the left
                                                    image: 'assets2/img/CBV.png',
                                                    // (bool | optional) if you want it to fade out on its own or just sit there
                                                    sticky: true,
                                                    // (int | optional) the time you want it to be alive for before fading out
                                                    time: '',
                                                    // (string | optional) the class name you want to apply to that specific message
                                                    class_name: 'my-sticky-class'
                                                });

                                                return false;
                                            });
        </script>

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
