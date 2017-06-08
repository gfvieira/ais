<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.modelo.Usuario"%>
<%@page import="java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%Usuario usuario = (Usuario) session.getAttribute("usuario");
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

        <title>SIG-BASE</title>
        <link rel="shortcut icon" href="assets/images/gt_favicon.png">
        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link href="assets3/js/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">

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
                <a href="#" class="logo"><b>COMANDO <%out.print(usuario.getSetor());%></b></a>
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
                    <ul class="sidebar-menu" id="nav-accordion">
                        <h5 class="centered"><%out.print(usuario.getPost());%>-<%out.print(usuario.getGuerra());%></h5>
                        <h5 class="centered"> BHMN</h5>
                        <li class="mt">
                            <a class="active" href="cmd_home.jsp">
                                <i class="fa fa-dashboard"></i>
                                <span>Principal</span>
                            </a>
                        </li>   
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class=" fa fa-bar-chart-o"></i>
                                <span style="color: red">Fale Conosco</span>
                            </a>
                            <ul class="sub">
                            </ul>
                        </li>    
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class=" fa fa-bar-chart-o"></i>
                                <span style="color: red">Plano de metas</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" style="color: red">Curto Prazo</a></li>
                                <li><a href="#" style="color: red">Médio Prazo</a></li>
                                <li><a href="#" style="color: red">Longo Prazo</a></li>
                            </ul>
                        </li>  
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class=" fa fa-bar-chart-o"></i>
                                <span>Assessorias</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" style="color: red">Netuno BH-05</a></li>
                                <li><a href="secom/secom_home.jsp">Secom BH-04</a></li>
                                <li><a href="bh08/bh08_home.jsp">Engenharia BH-08</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class=" fa fa-bar-chart-o"></i>
                                <span">Serviço Naútico BH-10</span>
                            </a>
                            <ul class="sub">
                                <li><a href="bh10/bh10_home.jsp">BH-10</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class=" fa fa-bar-chart-o"></i>
                                <span>Intendência BH-20</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" style="color: red">Obtenção BH-22</a></li>
                                <li><a href="bh20/bh25/Contador25.jsp">Municiamento BH-25</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class=" fa fa-bar-chart-o"></i>
                                <span>Administração BH-30</span>
                            </a>
                            <ul class="sub">
                                <li><a href="bh30/bh30_home.jsp" style="color: red">BH-30</a></li>
                                <li><a href="bh30/bh31/BH31.jsp?ind=HOME&access=<%out.print(usuario.getTypeAccess());%>">BH-31 pessoal</a></li>
                                <li><a href="bh30/bh32/bh32_home.jsp" style="color: red">BH-32 Saúde</a></li>
                                <li><a href="bh30/bh33/bh33_home.jsp" style="color: red">BH-33 Segurança</a></li>
                                <li><a href="bh30/bh34/BH34.jsp?ind=HOME&access=<%out.print(usuario.getTypeAccess());%>">BH-34 Telamática</a></li>
                                <li><a href="bh30/chapa/bh30_chapa.jsp">CHaPA</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class=" fa fa-bar-chart-o"></i>
                                <span style="color: red">Gráfica BH-40</span>
                            </a>
                            <ul class="sub">
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class=" fa fa-bar-chart-o"></i>
                                <span>Apoio BH-50</span>
                            </a>
                            <ul class="sub">
                                <li><a href="bh50/BH50.jsp?ind=HOME&access=<%out.print(usuario.getTypeAccess());%>">Apoio BH-50</a></li>
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
                    <!-- page start-->
                    <div class="row mt">
                        <aside class="col-lg-3 mt">
                            <h4><i class="fa fa-angle-right"></i> Agenda SIG-BASE</h4><br><hr>
                            <div id="external-events">
                                <form class="form-horizontal style-form" action="InsertSate.jsp" method="post">
                                    <div class="form-group">
                                        <label class="col-sm-3 col-sm-3 control-label">Assunto:</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="nome" name="nome" placeholder=" " maxlength="200" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 col-sm-3 control-label">Hora</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="nip" name="nip" placeholder=" " maxlength="30" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 col-sm-3 control-label">Dia</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="nip" name="nip" placeholder=" " maxlength="30" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-8 center-block">
                                            <button type="submit" class="btn btn-theme">Agendar</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </aside>
                        <aside class="col-lg-9 mt">
                            <section class="panel">
                                <div class="panel-body">
                                    <div id="calendar" class="has-toolbar"></div>
                                </div>
                            </section>
                        </aside>
                    </div>

                    <!-- page end-->
                </section><!-- /MAIN CONTENT -->

                <!--main content end-->
                <!--footer start-->
                <footer class="site-footer">
                    <div class="text-center">
                        <%out.print(year);%> - BHMN
                        <a href="cmd_home.jsp" class="go-top">
                            <i class="fa fa-angle-up"></i>
                        </a>
                    </div>
                </footer>
                <!--footer end-->
            </section>

            <!-- js placed at the end of the document so the pages load faster -->
            <script src="assets3/js/jquery.js"></script>
            <script src="assets3/js/jquery-ui-1.9.2.custom.min.js"></script>
            <script src="assets3/js/fullcalendar/fullcalendar.min.js"></script>    
            <script src="assets3/js/bootstrap.min.js"></script>
            <script class="include" type="text/javascript" src="assets3/js/jquery.dcjqaccordion.2.7.js"></script>
            <script src="assets3/js/jquery.scrollTo.min.js"></script>
            <script src="assets3/js/jquery.nicescroll.js" type="text/javascript"></script>


            <!--common script for all pages-->
            <script src="assets3/js/common-scripts.js"></script>

            <script type='text/javascript'>
                $(document).ready(function () {
                    $('#calendar').fullCalendar({
                        header: {
                            left: 'prev,next today',
                            center: 'title',
                            right: 'agendaWeek,month,agendaDay'

                        },
                        editable: false,
                        axisFormat: 'H:mmtt',
                        slotMinutes: 10,
                        firstHour: 8,
                        minTime: 8,
                        maxTime: 22,
                        monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
                        monthNamesShort: ['jan.', 'fev.', 'mar', 'abr', 'mai', 'jun', 'jul.', 'ago', 'set', 'out', 'nov', 'dez'],
                        dayNames: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
                        dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab'],
                        buttonText: {
                            today: 'Hoje',
                            day: 'dia',
                            week: 'Semana',
                            month: 'Mês'
                        },
                        events: function (start, end, callback) {
                            $.ajax({
                                cache: true,
                                url: '../cmd/teste2.jsp',
                                dataType: "json",
                                data: {month: start.getMonth(), year: start.getYear() + 1900},
                                success: function (response) {
                                    var myevents = [];
                                    $.each(response, function (i, task) {
                                        myevents.push({
                                            start: task.start,
                                            end: task.end,
                                            allDay: false,
                                            title: task.title,
                                            color: task.backgroundColor
                                        });
                                    });
                                    callback(myevents);
                                },
                                error: function () {
                                    alert('There was an error while fetching events!');
                                }
                            });

                        },
                        backgroundColor: 'green',
                        borderColor: 'green',
                        textColor: 'yellow'
                    });
                });

            </script>
        </section>
    </body>
</html>
