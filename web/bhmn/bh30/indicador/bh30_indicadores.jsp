<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="src.modelo.Indicador_model"%>
<%@page import="src.modelo.Usuario"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%Usuario usuario = (Usuario) session.getAttribute("usuario");
    DecimalFormat df = new DecimalFormat("0.00");
    String mes = "01";
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
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">

        <title>SIG-BASE || BH-30</title>

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
                <a href="BH34.jsp?ind=HOME&access=<%out.print(usuario.getTypeAccess());%>" class="logo">
                    <b>SIG-BASE || <%out.print(usuario.getPost());%> - <%out.print(usuario.getGuerra());%></b></a>
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
                                <span>Pessoal</span>
                            </a>
                            <ul class="sub">
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
                        <div class="col-lg-8 main-chart">
                            <h3><b>INDICADORES DE DESEMPENHO | BH-30 </h3>
                            <div class="row">
                                <div class="col-lg-12 main-chart">
                                    <div class="content-panel">		
                                        <div class="border-head">
                                            <h3><b>CHaPA</b></h3>
                                        </div>
                                        <table class="table table-hover">
                                            <tbody>
                                                <tr>
                                                    <td>Indicador de Atendimento de Pedidos de Serviços (IAPS)</td>
                                                    <td><button type="submit" title="EXIBIR IAPS" class="btn btn-success btn-xs" onClick="iaps()"><i class="fa fa-check"></i></button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div><!-- /row -->
                                </div><!-- /row -->
                                <div class="col-lg-12 main-chart">
                                    <div class="content-panel">		
                                        <div class="border-head">
                                            <h3><b>BH-31 Divisão de Pessoal</b></h3>
                                        </div>
                                        <table class="table table-hover">
                                            <tbody>
                                                <tr>
                                                    <td>Seção de Detalhe - Indicador de Cumprimento de Punição (ICP)</td>
                                                    <td><button type="submit" title="EXIBIR ICP" class="btn btn-success btn-xs" onClick="icp()"><i class="fa fa-check"></i></button></td>
                                                </tr>
                                                <tr>
                                                    <td>Seção de Detalhe - Indicador de Militares para Escala de Serviço (IMES)</td>
                                                    <td><button type="submit" title="EXIBIR IMES" class="btn btn-success btn-xs" onClick="imes()"><i class="fa fa-check"></i></button></td>
                                                </tr>
                                                <tr>
                                                    <td>Seção de Adestramentos - Indicador de Cumprimento de Adestramento (ICA)</td>
                                                    <td><button type="submit" title="EXIBIR ICA" class="btn btn-success btn-xs" onClick="ica()"><i class="fa fa-check"></i></button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div><!-- /row -->
                                </div>
                                <div class="col-lg-12 main-chart">
                                    <div class="content-panel">		
                                        <div class="border-head">
                                            <h3><b>BH-32 Divisão de Saúde</b></h3>
                                        </div>
                                        <table class="table table-hover">
                                            <tbody>
                                                <tr>
                                                    <td>Seção de Medicina - Indicador de Tempo para Inspeção de Saúde (ITIS)</td>
                                                    <td><button type="submit" title="EXIBIR ITIS" class="btn btn-success btn-xs" onClick="itis()"><i class="fa fa-check"></i></button></td>
                                                </tr>
                                                <tr>
                                                    <td>Seção de Medicina - Senso "A saúde vai até você 2016/BHMN"</td>
                                                    <td><button type="submit" title="EXIBIR SENSO" class="btn btn-success btn-xs" onClick="senso()"><i class="fa fa-check"></i></button></td>
                                                </tr>
                                                <tr>
                                                    <td>Seção de Odontologia - Coeficiente de Autossuficiência odontológico (CASOD)</td>
                                                    <td><button type="submit" title="EXIBIR CASOD" class="btn btn-success btn-xs" onClick="casod()"><i class="fa fa-check"></i></button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div><!-- /row -->
                                </div>
                                <div class="col-lg-12 main-chart">
                                    <div class="content-panel">		
                                        <div class="border-head">
                                            <h3><b>BH-33 Divisão de Segurança</b></h3>
                                        </div>
                                        <table class="table table-hover">
                                            <tbody>
                                                <tr>
                                                    <td>Seção de Identificação -O Indicador de Confecção de Crachás de Visitantes (ICCv)</td>
                                                    <td><button type="submit" title="EXIBIR ICCv" class="btn btn-success btn-xs" onClick="iccv()"><i class="fa fa-check"></i></button></td>
                                                </tr>
                                                <tr>
                                                    <td>Seção de Identificação -O Indicador de Confecção de Crachás de Militares (ICCm)</td>
                                                    <td><button type="submit" title="EXIBIR ICCm" class="btn btn-success btn-xs" onClick="iccm()"><i class="fa fa-check"></i></button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div><!-- /row -->
                                </div>
                                <div class="col-lg-12 main-chart">
                                    <div class="content-panel">		
                                        <div class="border-head">
                                            <h3><b>BH-34 Divisão de Telemática</b></h3>
                                        </div>
                                        <table class="table table-hover">
                                            <tbody>
                                                <tr>
                                                    <td>Seção de Oficinas - Indicador de Atendimento ao Usuário (IAUo)</td>
                                                    <td><button type="submit" title="EXIBIR IAUo" class="btn btn-success btn-xs" onClick="iauo()"><i class="fa fa-check"></i></button></td>
                                                </tr>
                                                <tr>
                                                    <td>Seção de Telefônia - Indicador de Atendimento ao Usuário (IAUt)</td>
                                                    <td><button type="submit" title="EXIBIR IAUt" class="btn btn-success btn-xs" onClick="iaut()"><i class="fa fa-check"></i></button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div><!-- /row -->
                                </div>
                            </div>
                        </div>
                    </div>
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
        <script>
                                                        function iaps()
                                                        {
                                                            location.href = "Exibe_indicador_30.jsp?ind=iaps"
                                                        }
                                                        function icp()
                                                        {
                                                            location.href = "Exibe_indicador_30.jsp?ind=icp"
                                                        }
                                                        function imes()
                                                        {
                                                            location.href = "Exibe_indicador_30.jsp?ind=imes"
                                                        }
                                                        function ica()
                                                        {
                                                            location.href = "Exibe_indicador_30.jsp?ind=ica"
                                                        }
                                                        function itis()
                                                        {
                                                            location.href = "Exibe_indicador_30.jsp?ind=itis"
                                                        }
                                                        function casod()
                                                        {
                                                            location.href = "Exibe_indicador_30.jsp?ind=casod"
                                                        }
                                                        function senso()
                                                        {
                                                            location.href = "bh30_indicador_bh32_senso.jsp"
                                                        }
                                                        function iccv()
                                                        {
                                                            location.href = "Exibe_indicador_30.jsp?ind=iccv"
                                                        }
                                                        function iccm()
                                                        {
                                                            location.href = "Exibe_indicador_30.jsp?ind=iccm"
                                                        }
                                                        function iauo()
                                                        {
                                                            location.href = "Exibe_indicador_30.jsp?ind=iauo"
                                                        }
                                                        function iaut()
                                                        {
                                                            location.href = "Exibe_indicador_30.jsp?ind=iaut"
                                                        }
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
