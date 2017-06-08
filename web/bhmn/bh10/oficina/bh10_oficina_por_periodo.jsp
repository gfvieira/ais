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

        <title>SIG-BASE || OFICINA BH-34</title>

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
                <a href="index.html" class="logo"><b>SIG-BASE || OFICINA BH-34</b></a>
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
                            <a class="active" href="BH34.jsp?ind=HOME&access=<%out.print(usuario.getTypeAccess());%>">
                                <i class="fa fa-dashboard"></i>
                                <span>Principal</span>
                            </a>
                        </li>
                        <li class="mt">
                            <a class="active" href="oficina34_sate.jsp">
                                <i class="fa fa-dashboard"></i>
                                <span>SATE</span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class="fa fa-desktop"></i>
                                <span>Pedidos</span>
                            </a>
                            <ul class="sub">
                                <li><a href="List.jsp?access=<%out.print(usuario.getTypeAccess());%>&type=EM">Aguardando aprovação</a></li>
                                <li><a href="List.jsp?access=<%out.print(usuario.getTypeAccess());%>&type=NOT">Não Iniciado</a></li>
                                <li><a href="List.jsp?access=<%out.print(usuario.getTypeAccess());%>&type=IN">Em Aberto</a></li>
                                <li><a href="List.jsp?access=<%out.print(usuario.getTypeAccess());%>&type=MES">Pedidos do Mês</a></li>
                                <li><a href="List.jsp?access=<%out.print(usuario.getTypeAccess());%>&type=ALL">Todos os Pedidos</a></li>
                            </ul>
                        </li>
                        <%if (usuario.getTypeAccess().equals("SUPERVISOR") || usuario.getTypeAccess().equals("ENCARREGADOBH34")) {%>                  
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class="fa fa-cogs"></i>
                                <span>Faturamento</span>
                            </a>
                            <ul class="sub">
                                <li><a href="Faturar.jsp">Faturar</a></li>
                                <li><a href="Faturado.jsp?fat=MES">Faturado no Mês</a></li>
                                <li><a href="Faturado.jsp?fat=ALL">Todas as Faturas</a></li>
                            </ul>
                        </li><%}%>  
                        <%if (usuario.getTypeAccess().equals("HARDWARE")
                                    || usuario.getTypeAccess().equals("REDE")
                                    || usuario.getTypeAccess().equals("SUPERVISOR")
                                    || usuario.getTypeAccess().equals("ENCARREGADOBH34")) {%>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class="fa fa-book"></i>
                                <span>Controle de IP's</span>
                            </a>
                            <ul class="sub">
                                <li><a href="Hosts.jsp?hostname=DISP">IP Disponível</a></li>
                                <li><a href="oficina34_host_cadastro.jsp">Cadastrar</a></li>
                                <li><a href="Hosts.jsp?hostname=HARDWARE">Computadores</a></li>
                                <li><a href="Hosts.jsp?hostname=SERVER">Servidores</a></li>
                                <li><a href="Hosts.jsp?hostname=SWITCH">Switch's</a></li>
                                <li><a href="Hosts.jsp?hostname=PRINT">Impressoras</a></li>
                                <li><a href="Hosts.jsp?hostname=ALL">Todos IP's</a></li>
                            </ul>
                        </li><%}%>   
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
                                <li><a  href="BH34.jsp?ind=MES&access=<%out.print(usuario.getTypeAccess());%>">Do mês</a></li>
                                <li><a  href="oficina34_por_periodo.jsp">Por periodo</a></li>
                                <li><a  href="BH34.jsp?ind=ALL&access=<%out.print(usuario.getTypeAccess());%>">Todos os pedidos</a></li>
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
                            <div class="form-panel">
                                <form class="form-horizontal style-form" action="InsertSate.jsp" method="post">
                                    Por periodo Determinado:<br><br>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Data de Inicio:</label>
                                        <div class="col-sm-3"> 
                                            <input name="emb" id="ini" type="date" class="form-control" required="" min="1910-01-01" max="2016-01-01">
                                        </div>
                                        <label class="col-sm-2 col-sm-2 control-label">Data de Fim:</label>
                                        <div class="col-sm-3"> 
                                            <input name="nasc" id="fim" type="date" class="form-control" required="" min="1910-01-01" max="2016-01-01">
                                        </div> 
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-2">
                                            <button type="submit" class="btn btn-theme">Visualizar</button>
                                        </div>
                                    </div>
                                </form>
                                <form class="form-horizontal style-form" action="InsertSate.jsp" method="post">
                                    Por Mês (Resultado Mensal):<br><br>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label text-center">Mês:</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" size="1" name="mesm" required>
                                                <option value="Selecione">Selecione!</option>
                                                <option value="1">Janeiro</option>
                                                <option value="2">Fevereiro</option>
                                                <option value="3">Março</option>
                                                <option value="4">Abril</option>
                                                <option value="5">Maio</option>
                                                <option value="6">Junho</option>
                                                <option value="7">Julho</option>
                                                <option value="8">Agosto</option>
                                                <option value="9">Setembro</option>
                                                <option value="10">Outubro</option>
                                                <option value="11">Novembro</option>
                                                <option value="12">Dezembro</option>
                                            </select>
                                        </div> 
                                        <div class="col-sm-2">
                                            <button type="submit" class="btn btn-theme">Visualizar</button>
                                        </div>
                                    </div>
                                </form>
                                <form class="form-horizontal style-form" action="InsertSate.jsp" method="post">
                                    Por Mês (Resultado Semanal):<br><br>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label text-center">Mês:</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" size="1" name="mess" required>
                                                <option value="Selecione">Selecione!</option>
                                                <option value="1">Janeiro</option>
                                                <option value="2">Fevereiro</option>
                                                <option value="3">Março</option>
                                                <option value="4">Abril</option>
                                                <option value="5">Maio</option>
                                                <option value="6">Junho</option>
                                                <option value="7">Julho</option>
                                                <option value="8">Agosto</option>
                                                <option value="9">Setembro</option>
                                                <option value="10">Outubro</option>
                                                <option value="11">Novembro</option>
                                                <option value="12">Dezembro</option>
                                            </select>
                                        </div> 
                                        <div class="col-sm-2">
                                            <button type="submit" class="btn btn-theme">Visualizar</button>
                                        </div>
                                    </div>
                                </form>
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
