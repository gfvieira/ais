<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="src.modelo.Indicador_model"%>
<%@page import="src.modelo.Usuario"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%Usuario usuario = (Usuario) session.getAttribute("usuario");
    double qntd = (Integer) request.getAttribute("qnt");
    Indicador_model rede = (Indicador_model) request.getAttribute("rede");
    Indicador_model hard = (Indicador_model) request.getAttribute("hard");
    Indicador_model lotus = (Indicador_model) request.getAttribute("lotus");
    Indicador_model tel = (Indicador_model) request.getAttribute("tel");
    DecimalFormat df = new DecimalFormat("0.00");%>
<%Timestamp tm = new Timestamp(System.currentTimeMillis());
    String t = new SimpleDateFormat("HH").format(tm);
    String comprimento = "";
    int hour = Integer.parseInt(t);
    if (hour > -1 && hour < 12) {
        comprimento = "Bom dia!";
    } else if (hour > 11 && hour < 18) {
        comprimento = "Boa Tarde!";
    } else {
        comprimento = "Boa Noite!";
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">

        <title>SIG-BASE || CARTAS</title>

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
                <a href="BH34.jsp?ind=HOME&access=<%out.print(usuario.getTypeAccess());%>" class="logo"><b>SIG-BASE || <%out.print(usuario.getPost());%> - <%out.print(usuario.getGuerra());%></b></a>
                <!--logo end-->
                <div class="top-menu">
                    <ul class="nav pull-right top-menu">
                        <li><a class="logout" href="/SIG-BASE/LogOff.jsp">Sair</a></li>
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
                        <p class="centered"><a href="BH10_Cartas.jsp?ind=HOME&access=<%out.print(usuario.getTypeAccess());%>">
                                <img src="assets2/img/CBV.png" class="img-circle" width="80"></a></p>
                        <h5 class="centered">BHMN</h5>
                        <li class="mt">
                            <a class="active" href="BH10_Cartas.jsp?ind=HOME&access=<%out.print(usuario.getTypeAccess());%>">
                                <i class="fa fa-dashboard"></i>
                                <span>Principal</span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class="fa fa-desktop"></i>
                                <span>Cartas</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#">Nova Carta</a></li>
                                <li><a href="#">Cadastrar</a></li>
                                <li><a href="#">Listar</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class="fa fa-tasks"></i>
                                <span>Duvidas?</span>
                            </a>
                            <ul class="sub">
                                <li><a  href="emConstrucao.html">Manual</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class=" fa fa-bar-chart-o"></i>
                                <span>Indicadores</span>
                            </a>
                            <ul class="sub">
                                <li><a  href="BH10_Cartas.jsp?ind=CAD&access=<%out.print(usuario.getTypeAccess());%>">Cartas cadastradas</a></li>
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
                    <div class="row">
                        <div class="col-lg-9 main-chart">
                            <div class="row">
                                <div class="col-lg-12 main-chart">
                                    <div class="content-panel">		
                                        <!--CUSTOM CHART START -->
                                        <div class="border-head">
                                            <%if(usuario.getTypeAccess().equals("NACIONAL")){%>
                                            <h3>Cartas Nacionais || BH-34</h3>
                                            <%}else{%>
                                            <h3>Cartas Estrangereiras || BH-34</h3>
                                            <%}%>
                                        </div>
                                        <div class="custom-bar-chart">
                                            <ul class="y-axis">
                                                <li><span><%out.print(df.format(qntd));%></span></li>
                                                <li><span><%out.print(df.format((qntd / 5) * 4));%></span></li>
                                                <li><span><%out.print(df.format((qntd / 5) * 3));%></span></li>
                                                <li><span><%out.print(df.format((qntd / 5) * 2));%></span></li>
                                                <li><span><%out.print(df.format(qntd / 5));%></span></li>
                                                <li><span>0</span></li>
                                            </ul>
                                            <div class="bar" style="margin: 0px 8%;">
                                                <div class="title">LOTUS-SIGDEN</div>
                                                <div class="value tooltips" data-original-title="<%out.print(lotus.getTotal());%>" data-toggle="tooltip" data-placement="top"><%out.print((lotus.getTotal() * 100) / qntd);%>%</div>
                                            </div>
                                            <div class="bar" style="margin: 0px 8%;">
                                                <div class="title">HARDWARE-SOFTWARE</div>
                                                <div class="value tooltips" data-original-title="<%out.print(hard.getTotal());%>" data-toggle="tooltip" data-placement="top"><%out.print((hard.getTotal() * 100) / qntd);%>%</div>
                                            </div>
                                            <div class="bar" style="margin: 0px 8%;">
                                                <div class="title">REDE</div>
                                                <div class="value tooltips" data-original-title="<%out.print(rede.getTotal());%>" data-toggle="tooltip" data-placement="top"><%out.print((rede.getTotal() * 100) / qntd);%>%</div>
                                            </div>
                                            <div class="bar" style="margin: 0px 8%;">
                                                <div class="title">TELEFONIA</div>
                                                <div class="value tooltips" data-original-title="<%out.print(tel.getTotal());%>" data-toggle="tooltip" data-placement="top"><%out.print((tel.getTotal() * 100) / qntd);%>%</div>
                                            </div>
                                        </div>
                                    </div><!-- /row -->
                                </div>
                            </div>
                        </div><!-- /col-lg-9 END SECTION MIDDLE -->
                        <!-- **********************************************************************************************************************************************************
                        RIGHT SIDEBAR CONTENT
                        *********************************************************************************************************************************************************** -->                  
                        <div class="col-lg-3 ds">
                            <!--COMPLETED ACTIONS DONUTS CHART-->
                            <h3>QUADRO DE AVISO</h3>
                            <!-- First Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>2 Minutes Ago</muted><br/>
                                    <a href="#">CMG DAROS</a> Reunião de conselho hoje.<br/>
                                    </p>
                                </div>
                            </div>
                            <!-- Second Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>3 Hours Ago</muted><br/>
                                    <a href="#">CF LINS</a> Livro de parada.<br/>
                                    </p>
                                </div>
                            </div>
                            <!-- Third Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>7 Hours Ago</muted><br/>
                                    <a href="#">CMG DAROS</a> Lic amanhã.<br/>
                                    </p>
                                </div>
                            </div>
                            <!-- Fourth Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>11 Hours Ago</muted><br/>
                                    <a href="#">CF LINS</a> Reunião com BH-01 quarta às 10:00hrs.<br/>
                                    </p>
                                </div>
                            </div>
                            <!-- Fifth Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>18 Hours Ago</muted><br/>
                                    <a href="#">CMG NILBERTO</a> Indicadores.<br/>
                                    </p>
                                </div>
                            </div>

                        </div><!-- /col-lg-3 -->
                    </div><!--/row -->
                    <br><br><br><br><br>
                </section>
            </section>

            <!--main content end-->
            <!--footer start-->
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
                    title: 'Bem-vindo ao SIG-BASE',
                    // (string | mandatory) the text inside the notification
                    text: '<%out.print(comprimento);%> <%out.print(usuario.getPost());%>-<%out.print(usuario.getGuerra());%>! <br><br>Eu sou a Sigui, em que ajuda-lo?<br> Vejo em meu sistema que não temos nenhum pedido pendende, isso é otimo! Sinal que teremos um bom dia hoje.',
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
