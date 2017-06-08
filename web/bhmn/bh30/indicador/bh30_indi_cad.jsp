<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="src.modelo.Indicador_model"%>
<%@page import="src.modelo.Usuario"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%Usuario usuario = (Usuario) session.getAttribute("usuario");%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">

        <title>SIG-BASE || BH-10</title>

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

                        <li class="mt">
                            <a class="active" href="bh30_home.jsp">
                                <i class="fa fa-dashboard"></i>
                                <span>Principal</span>
                            </a>
                        </li>
                        <%if (usuario.getTypeAccess().equals("CHEFEBH30")
                                    || usuario.getTypeAccess().equals("ENCARREGADOBH31")
                                    || usuario.getTypeAccess().equals("PESSOAL")) {%> 
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class="fa fa-desktop"></i>
                                <span>Cadastro</span>
                            </a>
                            <ul class="sub">
                                <li><a href="bh30_cadastrar_oficial.jsp">Oficiais</a></li>
                                <li><a href="bh30_cadastrar_praca.jsp">Praças</a></li>
                                <li><a href="bh30_cadastrar_ttc.jsp">TTC's</a></li>
                                <li><a href="bh30_cadastrar_civil.jsp">Cívis</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class="fa fa-desktop"></i>
                                <span>Pessoal</span>
                            </a>
                            <ul class="sub">
                                <li><a href="bh30_buscar.jsp">Buscar</a></li>
                                <li><a href="ListPessoal.jsp?type=2">Oficiais</a></li>
                                <li><a href="ListPessoal.jsp?type=1">Praças</a></li>
                                <li><a href="ListPessoal.jsp?type=3">TTC's</a></li>
                                <li><a href="ListPessoal.jsp?type=4">Civis</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class="fa fa-desktop"></i>
                                <span>Pessoal por Departamento</span>
                            </a>
                            <ul class="sub">
                                <li><a href="ListPessoal.jsp?type2=01">BH-01</a></li>
                                <li><a href="ListPessoal.jsp?type2=02">BH-02</a></li>
                                <li><a href="ListPessoal.jsp?type2=03">BH-03</a></li>
                                <li><a href="ListPessoal.jsp?type2=04">BH-04</a></li>
                                <li><a href="ListPessoal.jsp?type2=05">BH-05</a></li>
                                <li><a href="ListPessoal.jsp?type2=06">BH-06</a></li>
                                <li><a href="ListPessoal.jsp?type2=07">BH-07</a></li>
                                <li><a href="ListPessoal.jsp?type2=08">BH-08</a></li>
                                <li><a href="ListPessoal.jsp?type2=10">BH-10</a></li>
                                <li><a href="ListPessoal.jsp?type2=20">BH-20</a></li>
                                <li><a href="ListPessoal.jsp?type2=30">BH-30</a></li>
                                <li><a href="ListPessoal.jsp?type2=40">BH-40</a></li>
                                <li><a href="ListPessoal.jsp?type2=50">BH-50</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class="fa fa-cogs"></i>
                                <span>Controle de férias</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#">Lançar periodo</a></li>
                                <li><a href="#">Oficiais</a></li>
                                <li><a href="#">Praças</a></li>
                                <li><a href="#">TTC's</a></li>
                                <li><a href="#">Cívis</a></li>
                            </ul>
                        </li>
                        <%}
                            if (usuario.getTypeAccess().equals("CHEFEBH30")
                                    || usuario.getTypeAccess().equals("CHAPA")) {%> 
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
                        <%}
                            if (usuario.getTypeAccess().equals("CHEFEBH30")
                                    || usuario.getTypeAccess().equals("ENCARREGADOBH31")) {%> 
                        <li class="sub-menu">
                            <a  href="bh30_indicadores.jsp">
                                <i class="fa fa-bar-chart-o"></i> Indicadores</a>

                        </li>

                        <%}%>

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
                            <div class="form-panel">
                                <h3 class="mb"><i class="fa fa-angle-double-right"></i> <b>Apontador</b> - <i>Indicadores BH-10.</i> </h3><br><br>
                                <form class="form-horizontal style-form" action="Cad_Indicador.jsp" method="post">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Ano</label>
                                        <div class="col-sm-4">
                                            <select class="form-control" size="1" name="ano" required>
                                                <option value="">Selecione!</option>
                                                <option value="2013">2013</option>
                                                <option value="2014">2014</option>
                                                <option value="2015">2015</option>
                                                <option value="2016">2016</option>
                                                <option value="2017">2017</option>
                                                <option value="2018">2018</option>
                                                <option value="2019">2019</option>
                                                <option value="2020">2020</option>
                                                <option value="2021">2021</option>
                                                <option value="2022">2022</option>
                                            </select>
                                        </div>                                            
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Mês</label>
                                        <div class="col-sm-4">
                                            <select class="form-control" size="1" name="mes" required>
                                                <option value="">Selecione!</option>
                                                <option value="01">Janeiro</option>
                                                <option value="02">Fevereiro</option>
                                                <option value="03">Março</option>
                                                <option value="04">Abril</option>
                                                <option value="05">Maio</option>
                                                <option value="06">Junho</option>
                                                <option value="07">Julho</option>
                                                <option value="08">Agosto</option>
                                                <option value="09">Setembro</option>
                                                <option value="10">Outubro</option>
                                                <option value="11">Novembro</option>
                                                <option value="12">Dezembro</option>
                                            </select>
                                        </div> 
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Indicador</label>
                                        <div class="col-sm-4">
                                            <select class="form-control" size="1" name="indicador" required>
                                                <option value="">Selecione!</option>
                                                <option value="IAEQ">IAEQ</option>
                                                <option value="IAER">IAER</option>
                                                <option value="IASO">IASO</option>
                                                <option value="IID">IID</option>
                                                <option value="IMNP">IMNP</option>
                                                <option value="IMNQ">IMNQ</option>
                                            </select>
                                        </div> 
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Valor apurado</label>
                                        <div class="col-sm-4">
                                            <input type=""  class="form-control" id="valor" name="valor" maxlength="5" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Valor em R$</label>
                                        <div class="col-sm-4">
                                            <input type=""  class="form-control" id="real" name="real" value="0" maxlength="5">
                                             <h5 class="text-center" style="color: red;font-size: 10px;">(Se Existir)</h5>
                                        </div>
                                    </div>
                                    <br>
                                    <hr>
                                    <br>
                                    <div>
                                        <input type="hidden" id="access" name="user" value="<%out.print(usuario.getPost());%>-<%out.print(usuario.getGuerra());%>" > 
                                        <button type="submit" class="btn btn-theme">Cadastrar</button>
                                        <input type="button"  class="btn btn-theme"  value="Cancelar" onClick="Voltar()">
                                    </div>
                                    <br>
                                </form>
                            </div>
                        </div><!-- /col-lg-9 END SECTION MIDDLE -->
                    </div><!--/row -->
                    <br><br><br><br><br>
                </section>
            </section>

            <!--main content end-->
            <!--footer start-->
            <footer class="site-footer">
                <div class="text-center">
                    2016 - BHMN
                    <a href="BH10.jsp?ind=HOME&access=<%out.print(usuario.getTypeAccess());%>" class="go-top">
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
