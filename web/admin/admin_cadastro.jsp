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

        <title>SIG-BASE || WEB-MASTER</title>

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
        <script language=javascript type="text/javascript">
            dayName = new Array("Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado");
            monName = new Array("janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro");
            now = new Date;
        </script>
        <script src="assets2/js/time_session.js" type="text/javascript"></script>

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
                <a href="index.html" class="logo"><b>SIG-BASE || WEB-MASTER</b></a>
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
                        <h5 class="centered">ADMIN</h5>
                        <h5 class="centered"> 
                            <script language=javascript type="text/javascript">
            document.write(dayName[now.getDay() ] + ", " + now.getDate() + " de " + monName [now.getMonth() ] + " de " + now.getFullYear());
                            </script>
                        </h5>
                        <h5 class="centered">
                            <div id="txt"></div>
                        </h5>
                        <li class="mt">
                            <a class="active" href="admin_home.jsp">
                                <i class="fa fa-dashboard"></i>
                                <span>Principal</span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a href="admin_cadastro.jsp" >
                                <i class=" fa fa-user"></i>
                                <span>Cadastrar</span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class=" fa fa-list"></i>
                                <span>Listar</span>
                            </a>
                            <ul class="sub">
                                <li><a href="ListarUsuariosAdmin.jsp?type=0">Todos</a></li>
                                <li><a href="ListarUsuariosAdmin.jsp?type=99">Desativados</a></li>
                                <li><a href="ListarUsuariosAdmin.jsp?type=1">Diacta</a></li>
                                <li><a href="ListarUsuariosAdmin.jsp?type=2">Esquadrões</a></li>
                                <li><a href="ListarUsuariosAdmin.jsp?type=3">Força</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class=" fa fa-check"></i>
                                <span>Auditoria</span>
                            </a>
                            <ul class="sub">
                                <li><a href="ListarUsuariosLogon.jsp?type=1">Hoje</a></li>
                                <li><a href="ListarUsuariosLogon.jsp?type=2">Anteriores</a></li>
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
                        <div class="col-lg-12">
                            <div class="form-panel">
                                <h3 class="mb"><i class="fa fa-angle-double-right"></i> <b>Cadastro de Usuarios</b></h3><br><br>
                                <form class="form-horizontal style-form" action="CadastroAdmin.jsp" method="post">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Nome</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="nome" name="nome" required="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">NIP</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="nip" name="nip" required="">
                                        </div>
                                        <label class="col-sm-1 col-sm-2 control-label">Nome de Guerra</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" id="guerra" name="guerra"  required="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Posto/Graduação</label>
                                        <div class="col-sm-2">
                                            <select class="form-control" size="1" name="grad">
                                                <option value="Selecione">Selecione!</option>
                                                <option value="0">SC</option>
                                                <option value="1">MN-RC</option>
                                                <option value="2">MN</option>
                                                <option value="3">MNE</option>
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
                                        <label class="col-sm-1 col-sm-2 control-label">Ramal</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="ramal" name="ramal" maxlength="4" required="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Tipo de Acesso</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" size="1" id="grupo" name="acesso" required>
                                                <option value="">Selecione!</option>
                                                <option value="1">Diacta</option>
                                                <option value="2">HS-1</option>
                                                <option value="3">HA-1</option>
                                                <option value="4">HU-1</option>
                                                <option value="5">HU-2</option>
                                                <option value="6">HI-1</option>
                                                <option value="7">VF-1</option>
                                                <option value="8">Força</option>
                                            </select>
                                        </div> 
                                    </div>
                                    <br>
                                    <hr>
                                    <br>
                                    <div>
                                        <button type="submit" class="btn btn-theme">Cadastrar</button>
                                        <input type="button"  class="btn btn-theme"  value="Cancelar" onClick="Voltar()">
                                    </div>
                                    <br>
                                    <br>
                                </form>
                            </div>
                        </div>
                    </div><!--/row -->
                </section>
            </section>
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
    </body>
</html>
