<%@page import="src.modelo.Servidor_model"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.modelo.Usuario"%>
<%@page import="java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%Servidor_model servidor = (Servidor_model) request.getAttribute("ttc");
    Usuario usuario = (Usuario) session.getAttribute("usuario");%>

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
                            <form class="form-horizontal style-form" action="AttPessoal.jsp" method="post">
                                <h3 class="centered"><i class="fa fa-angle-double-right"></i><b> Atualização de TTC</b></h3><br><br>
                                <i class="center-block"><font color="red">${mensagem}</font></i>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Nome:</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="nome" name="nome" value="<%out.print(servidor.getNome());%>" required>
                                    </div>
                                    <label class="col-sm-1 col-sm-2 control-label">NIP:</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="nip" name="nip" value="<%out.print(servidor.getNip());%>" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Posto/Graduação:</label>
                                    <div class="col-sm-2">
                                        <select class="form-control" size="1" name="grad" required>
                                            <%if (servidor.getGrad() == 18) {%><option value="18">AE</option><%}%>
                                            <%if (servidor.getGrad() == 17) {%><option value="17">VA</option><%}%>
                                            <%if (servidor.getGrad() == 16) {%><option value="16">CA</option><%}%>
                                            <%if (servidor.getGrad() == 15) {%><option value="15">CMG</option><%}%>
                                            <%if (servidor.getGrad() == 14) {%><option value="14">CF</option><%}%>
                                            <%if (servidor.getGrad() == 13) {%><option value="13">CC</option><%}%>                                            
                                            <%if (servidor.getGrad() == 12) {%><option value="12">CT</option><%}%>                                            
                                            <%if (servidor.getGrad() == 11) {%><option value="11">1T</option><%}%>
                                            <%if (servidor.getGrad() == 10) {%><option value="10">2T</option><%}%>
                                            <%if (servidor.getGrad() == 9) {%><option value="9">GM</option><%}%>
                                            <%if (servidor.getGrad() == 8) {%><option value="8">SO</option><%}%>
                                            <%if (servidor.getGrad() == 7) {%><option value="7">1SG</option><%}%>
                                            <%if (servidor.getGrad() == 6) {%><option value="6">2SG</option><%}%>
                                            <%if (servidor.getGrad() == 5) {%><option value="5">3SG</option><%}%>
                                            <%if (servidor.getGrad() == 4) {%><option value="4">CB</option><%}%>
                                            <%if (servidor.getGrad() == 2) {%><option value="2">MN</option><%}%>
                                            <option value="2">MN</option>
                                            <option value="4">CB</option>
                                            <option value="5">3ºSG</option>
                                            <option value="6">2ºSG</option>
                                            <option value="7">1ºSG</option>
                                            <option value="8">SO</option>
                                            <option value="9">GM</option>
                                            <option value="10">2ºT</option>
                                            <option value="11">1ºT</option>
                                            <option value="12">CT</option>
                                            <option value="13">CC</option>
                                            <option value="14">CF</option>
                                            <option value="15">CMG</option>
                                            <option value="16">CA</option>
                                            <option value="17">VA</option>
                                            <option value="18">AE</option>
                                        </select>
                                    </div> 
                                    <label class="col-sm-1 col-sm-2 control-label">Quadro:</label>
                                    <div class="col-sm-2">
                                        <select class="form-control" size="1" name="quadro" required>
                                            <%if (servidor.getQuadro().equals("CA")) {%><option value="CA">CA</option><%}%>
                                            <%if (servidor.getQuadro().equals("T")) {%><option value="T">T</option><%}%>
                                            <%if (servidor.getQuadro().equals("MD")) {%><option value="MD">MD</option><%}%>
                                            <%if (servidor.getQuadro().equals("QC")) {%><option value="QC">QC-IM</option><%}%>                                            
                                            <%if (servidor.getQuadro().equals("CPA")) {%><option value="CPA">CPA</option><%}%>
                                            <%if (servidor.getQuadro().equals("AA")) {%><option value="AA">AA</option><%}%>
                                            <%if (servidor.getQuadro().equals("CD")) {%><option value="CD">CD</option><%}%>
                                            <%if (servidor.getQuadro().equals("EN")) {%><option value="EN">EN</option><%}%>                                            
                                            <%if (servidor.getQuadro().equals("CAP")) {%><option value="CAP">CAP</option><%}%>
                                            <%if (servidor.getQuadro().equals("QEPA")) {%><option value="QEPA">QEPA</option><%}%>
                                            <%if (servidor.getQuadro().equals("CPRM")) {%><option value="CPRM">CPRM</option><%}%>
                                            <option value="CPA">CPA</option>
                                            <option value="CAP">CAP</option>
                                            <option value="QEPA">QEPA</option>
                                            <option value="CPRM">CPRM</option>
                                            <option value="CA">CA</option>
                                            <option value="T">T</option>
                                            <option value="MD">MD</option>
                                            <option value="QC">QC-IM</option>
                                            <option value="AA">AA</option>
                                            <option value="CD">CD</option>
                                            <option value="EN">EN</option>
                                        </select>
                                    </div>                                            
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Data de embarque:</label>
                                    <div class="col-sm-3"> 
                                        <%String data = String.valueOf(servidor.getEmb());%>
                                        <input name="emb" id="emb" type="date" class="form-control" required="" min="1910-01-01" max="2016-01-01" value="<% out.print(data); %>">
                                    </div>
                                    <label class="col-sm-2 col-sm-2 control-label">Nome de guerra:</label>
                                    <div class="col-sm-2"> 
                                        <input type="text"  class="form-control" id="guerra" name="guerra" value="<%out.print(servidor.getGuerra());%>">
                                    </div> 

                                </div> 
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Especialidade:</label>
                                    <div class="col-sm-2">
                                        <input type="text" class="form-control" id="esp" name="esp" value="<%out.print(servidor.getEsp());%>">
                                    </div>
                                    <label class="col-sm-1 col-sm-2 control-label">Ramal:</label>
                                    <div class="col-sm-2">
                                        <input type="text"  class="form-control" id="ramal" name="ramal" value="<%out.print(servidor.getRamal());%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Departamento:</label>
                                    <div class="col-sm-2">
                                        <select class="form-control" size="1" name="dep" required>
                                            <%if (servidor.getDep() == 1) {%><option value="1">BH-01</option><%}%>
                                            <%if (servidor.getDep() == 2) {%><option value="2">BH-02</option><%}%>
                                            <%if (servidor.getDep() == 3) {%><option value="3">BH-03</option><%}%>
                                            <%if (servidor.getDep() == 4) {%><option value="4">BH-04</option><%}%>
                                            <%if (servidor.getDep() == 5) {%><option value="5">BH-05</option><%}%>
                                            <%if (servidor.getDep() == 6) {%><option value="6">BH-06</option><%}%>
                                            <%if (servidor.getDep() == 7) {%><option value="7">BH-07</option><%}%>
                                            <%if (servidor.getDep() == 8) {%><option value="8">BH-08</option><%}%>
                                            <%if (servidor.getDep() == 10) {%><option value="10">BH-10</option><%}%>
                                            <%if (servidor.getDep() == 20) {%><option value="20">BH-20</option><%}%>
                                            <%if (servidor.getDep() == 30) {%><option value="30">BH-30</option><%}%>
                                            <%if (servidor.getDep() == 40) {%><option value="40">BH-40</option><%}%>
                                            <%if (servidor.getDep() == 50) {%><option value="50">BH-50</option><%}%>
                                            <option value="1">BH-01</option>
                                            <option value="2">BH-02</option>
                                            <option value="3">BH-03</option>
                                            <option value="4">BH-04</option>
                                            <option value="5">BH-05</option>
                                            <option value="6">BH-06</option>
                                            <option value="7">BH-07</option>
                                            <option value="8">BH-08</option>
                                            <option value="10">BH-10</option>
                                            <option value="20">BH-20</option>
                                            <option value="30">BH-30</option>
                                            <option value="40">BH-40</option>
                                            <option value="50">BH-50</option>
                                        </select>
                                    </div>
                                    <label class="col-sm-1 col-sm-2 control-label">Divisão:</label>
                                    <div class="col-sm-2">
                                        <input type="text" class="form-control" id="div" name="div" value="<%out.print(servidor.getDiv());%>" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Data de Aniversario:</label>
                                    <div class="col-sm-3"> 
                                        <%String data3 = String.valueOf(servidor.getNasc());%>
                                        <input name="nasc" id="nasc" type="date" class="form-control" required="" min="1910-01-01" max="2016-01-01" value="<%out.print(data3);%>">
                                    </div> 
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Função:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="funcao" name="funcao" value="<%out.print(servidor.getFuncao());%>" required>
                                    </div>
                                </div>
                                <input type="hidden" class="form-control" id="user" name="user" value="<%out.print(usuario.getNip());%>">
                                <input type="hidden" class="form-control" id="type" name="type" value="3">
                                <input type="hidden" class="form-control" id="id" name="id" value="<%out.print(servidor.getId());%>">
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
