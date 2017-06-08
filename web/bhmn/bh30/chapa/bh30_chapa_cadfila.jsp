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
<%String temp = (String) request.getAttribute("mensagem");%>



<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">

        <title>SIG-BASE</title>

        <!-- Bootstrap core CSS -->
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
                <a href="#" class="logo"><b>CHAPA BH-30</b></a>
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
                            <a class="active" href="../../cmd_home.jsp">
                                <i class="fa fa-dashboard"></i>
                                <span>Principal <%out.print(usuario.getSetor());%></span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a href="../bh30_home.jsp">
                                <i class="fa fa-dashboard"></i>
                                <span>Principal BH-30</span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a  href="bh30_chapa.jsp">
                                <i class="fa fa-desktop"></i>
                                <span>Principal CHaPA</span>
                            </a>
                        </li>
                        <%} else if (usuario.getPri().equals("BH30")) {%>
                        <li class="mt">
                            <a class="active" href="../bh30_home.jsp">
                                <i class="fa fa-dashboard"></i>
                                <span>Principal BH-30</span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a  href="bh30_chapa.jsp">
                                <i class="fa fa-desktop"></i>
                                <span>Principal CHaPA</span>
                            </a>
                        </li>
                        <%} else {%>
                        <li class="mt">
                            <a class="active" href="bh30_chapa.jsp">
                                <i class="fa fa-dashboard"></i>
                                <span>Principal</span>
                            </a>
                        </li>
                        <%}%>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class="fa fa-book"></i>
                                <span>Fila</span>
                            </a>
                            <ul class="sub">
                                <li><a href="bh30_chapa_cadfila.jsp">Cadastrar</a></li>
                                <li><a href="ExibeFila.jsp?type=home">Listar</a></li>
                            </ul>
                        </li> 
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class="fa fa-book"></i>
                                <span>Apartamentos</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#">Cadastrar Permissionário</a></li>
                                <li><a href="#">Permissionários</a></li>
                                <li><a href="#">Bloco 01</a></li>
                                <li><a href="#">Bloco 02</a></li>
                                <li><a href="#">Bloco 03</a></li>
                                <li><a href="#">Bloco 04</a></li>
                                <li><a href="#">Bloco 05</a></li>
                                <li><a href="#">Bloco 06</a></li>
                                <li><a href="#">Bloco 07</a></li>
                                <li><a href="#">Bloco 08</a></li>
                            </ul>
                        </li> 
                    </ul>
                    <!-- sidebar menu end-->
                </div>
            </aside>

            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">
                    <div class="col-lg-12">
                        <div class="form-panel">
                            <%if (temp != null) {
                                    if (temp.equals("OK")) {%>
                            <div class="alert alert-success centered"><b>Concluido!</b> Militar cadastrado com sucesso.</div>
                            <%} else if (temp.equals("EXIST")) {%>
                            <div class="alert alert-warning centered"><b>Erro!</b> Militar já cadastrado.</div>
                            <%} else {%>
                            <div class="alert alert-danger centered"><b>Erro!</b> A operação não pode ser concluida.</div>      				
                            <%}
                                }%>
                            <form class="form-horizontal style-form" action="CadFila.jsp" method="post">
                                <h3 class="centered"><i class="fa fa-angle-double-right"></i><b> Cadastro de Fila</b></h3><br><br>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Nome:</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="nome" name="nome" required>
                                    </div>
                                    <label class="col-sm-1 col-sm-2 control-label">NIP:</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="nip" name="nip" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Posto/Graduação</label>
                                    <div class="col-sm-2">
                                        <select class="form-control" size="1" name="grad" required>
                                            <option value="">Selecione!</option>
                                            <option value="2">MN</option>
                                            <option value="4">CB</option>
                                            <option value="5">3ºSG</option>
                                            <option value="6">2ºSG</option>
                                            <option value="7">1ºSG</option>
                                            <option value="8">SO</option>
                                            <option value="9">GM</option>
                                            <option value="10">1ºT</option>
                                            <option value="11">2ºT</option>
                                            <option value="12">CT</option>
                                            <option value="13">CC</option>
                                            <option value="14">CF</option>
                                            <option value="15">CMG</option>
                                            <option value="16">CA</option>
                                            <option value="17">VA</option>
                                            <option value="18">AE</option>
                                        </select>
                                    </div> 
                                    <label class="col-sm-1 col-sm-2 control-label">Mensagem</label>
                                    <div class="col-sm-2">
                                        <input type="text"  class="form-control" id="msg" name="msg" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">OM:</label>
                                    <div class="col-sm-2">
                                        <select class="form-control" size="1" name="om" required>
                                            <option value="">Selecione!</option>
                                            <option value="1">BHMN</option>
                                            <option value="2">DHN</option>
                                            <option value="3">GNHO</option>
                                            <option value="4">CAMR</option>
                                            <option value="5">CHM</option>
                                            <option value="6">NApOc Ary Rongel</option>
                                            <option value="7">NHi Sirius</option>
                                            <option value="8">NHo amorim do Vale</option>
                                            <option value="9">NHo Cruzeiro do Sul</option>
                                            <option value="10">NHo Taurus</option>
                                            <option value="11">NHoF Graça Aranha</option>
                                            <option value="12">NOc Antares</option>
                                            <option value="13">NPo Maximiano</option>
                                            <option value="14">NPqHo Vital de Oliveira</option>
                                        </select>
                                    </div>
                                    <label class="col-sm-1 col-sm-2 control-label">Ramal:</label>
                                    <div class="col-sm-2">
                                        <input type="text"  class="form-control" id="ramal" name="ramal" required>
                                    </div>
                                </div>
                                <input type="hidden" class="form-control" id="user" name="user" value="<%out.print(usuario.getNip());%>">
                                <button type="submit" class="btn btn-theme center-block">Cadastrar</button>
                            </form>
                        </div>
                    </div>     
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
