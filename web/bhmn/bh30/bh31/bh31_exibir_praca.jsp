<%@page import="java.text.SimpleDateFormat"%>
<%@page import="src.modelo.Servidor_movi"%>
<%@page import="src.modelo.Servidor_model"%>
<%@page import="src.modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%Servidor_model servidor = (Servidor_model) request.getAttribute("praca");
    ArrayList<Servidor_movi> servidorarray = (ArrayList<Servidor_movi>) request.getAttribute("pracaarray");
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    String grad = "";
    switch (servidor.getGrad()) {
        case 1:
            grad = "MN-RC";
            break;
        case 2:
            grad = "MN";
            break;
        case 3:
            grad = "MNE";
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
                <a href="#" class="logo"><b>Divisão de Pessoal BH-31</b></a>
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
                            <a  href="BH31.jsp?ind=HOME&access=<%out.print(usuario.getTypeAccess());%>">
                                <i class="fa fa-desktop"></i>
                                <span>Principal BH-31</span>
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
                            <a  href="BH31.jsp?ind=HOME&access=<%out.print(usuario.getTypeAccess());%>">
                                <i class="fa fa-desktop"></i>
                                <span>Principal BH-31</span>
                            </a>
                        </li>
                        <%} else {%>
                        <li class="mt">
                            <a class="active" href="BH31.jsp?ind=HOME&access=<%out.print(usuario.getTypeAccess());%>">
                                <i class="fa fa-dashboard"></i>
                                <span>Principal BH-31</span>
                            </a>
                        </li>
                        <%}%>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class="fa fa-desktop"></i>
                                <span>Cadastro</span>
                            </a>
                            <ul class="sub">
                                <li><a href="bh31_cadastrar_oficial.jsp">Oficiais</a></li>
                                <li><a href="bh31_cadastrar_praca.jsp">Praças</a></li>
                                <li><a href="bh31_cadastrar_ttc.jsp">TTC's</a></li>
                                <li><a href="bh31_cadastrar_civil.jsp">Cívis</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class="fa fa-desktop"></i>
                                <span>Pessoal</span>
                            </a>
                            <ul class="sub">
                                <li><a href="bh31_buscar.jsp">Buscar</a></li>
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
                                <li><a href="FeriasControlePessoal.jsp?type=2">Oficiais</a></li>
                                <li><a href="FeriasControlePessoal.jsp?type=1">Praças</a></li>
                                <li><a href="FeriasControlePessoal.jsp?type=3">TTC's</a></li>
                                <li><a href="FeriasControlePessoal.jsp?type=4">Cívis</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class="fa fa-cogs"></i>
                                <span>Indicadores</span>
                            </a>
                            <ul class="sub">
                                <li><a href="BH31.jsp?ind=HOME&access=<%out.print(usuario.getTypeAccess());%>">Pessoal</a></li>
                                <li><a href="#">Férias</a></li>
                            </ul>
                        </li>
                    </ul>
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
                                        <p class="form-control-static" style="text-align: left;"><%out.print(servidor.getNome());%></p>
                                    </div>
                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align: right;"><font color="black"><b>NIP:</b></font></label>
                                    <div class="col-sm-3">
                                        <p class="form-control-static" style="text-align: left;"><%out.print(servidor.getNip());%></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align: right;"><font color="black"><b>Graduação:</b></font></label>
                                    <div class="col-sm-2">
                                        <p class="form-control-static" style="text-align: left;"><%out.print(grad);%></p>
                                    </div> 
                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align: right;"><font color="black"><b>Quadro:</b></font></label>
                                    <div class="col-sm-2">
                                        <p class="form-control-static" style="text-align: left;"><%out.print(servidor.getQuadro());%></p>
                                    </div>                                            
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align: right;"><font color="black"><b>Data de Embarque:</b></font></label>
                                    <div class="col-sm-2"> 
                                        <p class="form-control-static" style="text-align: left;"><%out.print(servidor.getEmb());%></p>
                                    </div>
                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align: right;"><font color="black"><b>Nome de Guerra:</b></font></label>
                                    <div class="col-sm-2"> 
                                        <p class="form-control-static" style="text-align: left;"><%out.print(servidor.getGuerra());%></p>
                                    </div> 

                                </div> 
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align: right;"><font color="black"><b>Especialidade:</b></font></label>
                                    <div class="col-sm-2">
                                        <p class="form-control-static" style="text-align: left;"><%out.print(servidor.getEsp());%></p>
                                    </div>
                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align: right;"><font color="black"><b>Ramal:</b></font></label>
                                    <div class="col-sm-2">
                                        <p class="form-control-static" style="text-align: left;"><%out.print(servidor.getRamal());%></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align: right;"><font color="black"><b>Departamento:</b></font></label>
                                    <div class="col-sm-2">
                                        <p class="form-control-static" style="text-align: left;"><%out.print(servidor.getDep());%></p>
                                    </div>
                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align: right;"><font color="black"><b>Divisão:</b></font></label>
                                    <div class="col-sm-2">
                                        <p class="form-control-static" style="text-align: left;"><%out.print(servidor.getDiv());%></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align: right;"><font color="black"><b>Data de Promoção:</b></font></label>
                                    <div class="col-sm-2"> 
                                        <p class="form-control-static" style="text-align: left;"><%out.print(servidor.getPromo());%></p>
                                    </div> 
                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align: right;"><font color="black"><b>Data de Aniversario:</b></font></label>
                                    <div class="col-sm-2"> 
                                        <p class="form-control-static" style="text-align: left;"><%out.print(servidor.getNasc());%></p>
                                    </div> 
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align: right;"><font color="black"><b>Função:</b></font></label>
                                    <div class="col-sm-8">
                                        <p class="form-control-static" style="text-align: left;"><%out.print(servidor.getFuncao());%></p>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>    
                    <div class="row">
                        <div class="col-md-12 mt" style="margin-top: 5px">
                            <div class="form-panel">
                                <%if (servidor.getAfast() == 0) {%>
                                <form  class="col-sm-2 control-label" action="ExibePessoal.jsp" method="post">
                                    <input type="hidden" class="form-control" id="nip" name="nip" value="<%out.print(servidor.getNip());%>">
                                    <input type="hidden" class="form-control" id="type" name="type" value="11">
                                    <button type="submit" class="btn btn-theme center-block">Editar</button>
                                </form>
                                <form class="col-sm-2 control-label" action="bh31_ferias.jsp" method="post">
                                    <input type="hidden" class="form-control" id="ferias" name="ferias" value="<%out.print(servidor.getNip());%>">
                                    <input type="hidden" class="form-control" id="typeferias" name="typeferias" value="1">
                                    <button type="submit" class="btn btn-theme center-block">Ferias</button>
                                </form>
                                <form class="col-sm-2 control-label" action="bh31_dbq.jsp" method="post">
                                    <input type="hidden" class="form-control" id="dbq" name="dbq" value="<%out.print(servidor.getNip());%>">
                                    <button type="submit" class="btn btn-theme center-block">Desembarque</button>
                                </form>
                                <%} else {%>
                                <span class="label label-danger label-mini">DBQ em: <%out.print(new SimpleDateFormat("dd/MM/yyyy").format(servidor.getDbq()));%></span>
                                <%}%>
                                <br>
                                <br>
                            </div>
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
