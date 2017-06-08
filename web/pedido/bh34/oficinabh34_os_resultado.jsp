<%@page import="src.modelo.Pedido_move"%>
<%@page import="src.modelo.Pedido_model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%Pedido_model sate = (Pedido_model) request.getAttribute("sate");%>
<%ArrayList<Pedido_move> list = (ArrayList<Pedido_move>) request.getAttribute("satemove");%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta name="viewport"    content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author"      content="Sergey Pozhilov (GetTemplate.com)">

        <title>SIG-BASE || SATE</title>
        <link rel="shortcut icon" href="assets/images/gt_favicon.png">
        <link rel="stylesheet" media="screen" href="assets/css/font.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen" >
        <link rel="stylesheet" href="assets/css/main.css">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="assets/js/html5shiv.js"></script>
        <script src="assets/js/respond.min.js"></script>
        <![endif]-->
    </head>

    <body class="home">
        <!-- Fixed navbar -->
        <div class="navbar navbar-inverse navbar-fixed-top headroom" >
            <div class="container">
                <div class="navbar-header">
                    <!-- Button for smallest screens -->
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                    <a class="navbar-brand" href="http://www.bhmn.mb/"><img src="assets/images/logo.png" alt="BHMN"></a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav pull-right">
                        <li class="active"><a href="/sigbase/index.html">Home</a></li>
                        <li><a href="/sigbase/emConstrucao.html">Folha N</a></li>
                        <li><a href="/sigbase/loginSigbase.jsp">Sig-Base</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pedido de Serviço<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <!--<li><a href="emConstrucao.html">Ofícina BH-10</a></li>-->
                                <li><a href="/sigbase/pedido/bh34/oficinabh34.html">Telemática BH-34</a></li>
                                <li><a href="/sigbase/pedido/bh50/oficinabh50.html">Ofícina BH-50</a></li>
                                <li><a href="/sigbase/pedido/bh50/oficinabh50_viatura.html">Viatura BH-50</a></li>
                                <!--<li><a href="emConstrucao.html">Atracação Navio MB</a></li>
                                <li><a href="emConstrucao.html">Atracação Navio Extra-MB</a></li>-->
                            </ul>
                        </li>
                        <li><a href="oficinabh34_consulta.html">Consultar Pedido</a></li>
                        <li><a href="/sigbase/manual.html">Como Utilizar?</a></li>
                        <li><a href="/sigbase/emConstrucao.html">Contact</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </div>
        <!-- /.navbar -->
        <!-- Header -->
        <!-- /Header -->
        <!-- Intro -->
        <div class="container text-center">
            <br> 
            <br>
            <br>
            <%if (sate.getStatus().equals("FINALIZADO") && sate.getFeedback() == 0) {%>
            <div class="row"><br> 
                <br>
                <br>
                <div class="col-lg-12">
                    <div class="form-panel center-block">
                        <h3 class="mb"><i class="fa fa-angle-double-right"></i> <b>SATE 2.0</b> - <i>Serviço de Atendimento da Telemática.</i> </h3><br><br>
                        <form class="form-horizontal style-form" action="Feedback.jsp" method="post">
                            <div class="form-group">
                                <label class="col-sm-6 col-sm-6 control-label">Qual a sua avaliação sobre o serviço executado?</label>
                                <div class="col-sm-3">
                                    <select class="form-control" size="1" name="satisfacao" required>
                                        <option value="">Selecione!</option>
                                        <option value="5">Excelente</option>
                                        <option value="4">Muito-Bom</option>
                                        <option value="3">Bom</option>
                                        <option value="2">Regular</option>
                                        <option value="1">Ruim</option>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <input type="hidden"  class="form-control" id="os" name="os" value="<%out.println(sate.getOs());%>" disabled>
                                    <button type="submit" class="btn btn-theme center-block">Enviar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <%} else {%>
            
            <%}%>
            <h3 class="thin"><i class="fa fa-angle-double-right center-block"></i> <b>Detalhes da OS:</b> - <i><%out.println(sate.getOs());%></i> </h3><br><br>
            <h4 class="mb"><i class="fa fa-angle-double-down center-block"></i> <b>Status: </b> <i><%out.println(sate.getStatus());%></i> </h4><br><br>
            <a href=javascript:print();>Clique aqui para imprimir a pagina</a>
            <br><br>
            <br>
            <div class="row mt">
                <div class="col-lg-12">
                    <div class="form-panel">
                        <form class="form-horizontal style-form" action="">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Nome:</label>
                                <div class="col-sm-3">
                                    <p class="form-control-static" style="text-align: left;"><%out.println(sate.getPost());%>-<%out.println(sate.getNome());%></p>
                                </div>
                                <label class="col-sm-1 col-sm-2 control-label">NIP:</label>
                                <div class="col-sm-3">
                                    <p class="form-control-static" style="text-align: left;"><%out.println(sate.getNip());%></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Ramal:</label>
                                <div class="col-sm-3">
                                    <p class="form-control-static" style="text-align: left;"><%out.println(sate.getRamal());%></p>
                                </div>
                                <label class="col-sm-1 col-sm-2 control-label">Setor:</label>
                                <div class="col-sm-3">
                                    <p class="form-control-static" style="text-align: left;"><%out.println(sate.getSetor());%></p>
                                </div>                                            
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Atendimento:</label>
                                <div class="col-sm-2">
                                    <p class="form-control-static" style="text-align: left;"><%out.println(sate.getAtendimento());%></p>
                                </div> 
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Equipamento:</label>
                                <div class="col-sm-4">
                                    <p class="form-control-static" style="text-align: left;"><%out.println(sate.getEquipamento());%></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Solicitação:</label>
                                <div class="col-sm-8">
                                    <p class="form-control-static" style="text-align: left;"><%out.println(sate.getSolicitacao());%></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Descrição:</label>
                                <div class="col-sm-8">
                                    <p class="form-control-static" style="text-align: left;"><%out.println(sate.getDescricao());%></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Observação:</label>
                                <div class="col-sm-8">
                                    <p class="form-control-static" style="text-align: left;"><%out.println(sate.getObs());%></p>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>    
            </div>

            <table class="table table-striped table-advance table-hover">
                <hr>
                <thead>
                    <tr>
                        <th><i class="fa fa-angle-double-right text-center"></i> DATA</th>
                        <th><i class="fa fa-angle-double-right text-center"></i> MOVIMENTAÇÃO</th>
                        <th><i class="fa fa-angle-double-right text-center"></i> IP</th>
                    </tr>
                </thead>
                <tbody>
                    <%for (Pedido_move satemove : list) {%>
                    <tr>
                        <td><%out.println(satemove.getDatacadmov());%>-<%out.println(satemove.getHoracadmov());%></td>
                        <td><%out.println(satemove.getDescricao_move());%></td>
                        <td><%out.println(satemove.getIp());%></td>
                    </tr>
                    <% }%>


                </tbody>
            </table>
        </div>
        <!-- /Highlights -->






        <!-- JavaScript libs are placed at the end of the document so the pages load faster -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/headroom.min.js"></script>
        <script src="assets/js/jQuery.headroom.min.js"></script>
        <script src="assets/js/template.js"></script>
    </body>
</html>