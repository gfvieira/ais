<%@page import="src.modelo.Usuario"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%Usuario usuario = (Usuario) session.getAttribute("usuario");%>

<!DOCTYPE html>
<html lang="pt-br">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>= BAeNSPA =</title>
        <link rel="shortcut icon" href="assets/images/gt_favicon.png">

        <!-- Bootstrap Core CSS -->
        <link href="css/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/css/business-casual.css" rel="stylesheet">

        <!-- Fonts -->

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <!--[endif]-->

    </head>

    <body>

        <br><br><br>
        <div class="container">
            <div class="row text-center" style="margin-right: 300px; margin-left: 300px" >
                <div class="box">
                    <div class="col-lg-12">
                        <hr>
                        <h2 class="intro-text text-center">
                            Foi detectada senha "PADRÃO", por favor altere sua senha!
                        </h2>
                        <hr>
                        <form  class="form login text-center" action="AltSenha.jsp" method="POST" autocomplete="off">
                            <div class="row">
                                <div class="form-group col-lg-12" >
                                    <label>Senha Nova:</label>
                                    <input class="form-control text-center" name="senha1" id="senha1" type="password" required placeholder="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-12" >
                                    <label>Confirme Senha Nova:</label>
                                    <input class="form-control text-center" name="senha2" id="senha2" type="password" required placeholder="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-12" >
                                    <label id="caracteres1" class="caracteres1" style="color: red">Senhas Não Conferem</label>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="form-group col-lg-12">
                                    <input type="hidden" class="form-control text-center" id="nip" name="nip" value="<%out.print(usuario.getNip());%>">
                                    <input type="submit" class="btn btn-default" id="botao" value="Trocar" disabled>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container -->
        <br><br>
        <br><br>
        <br><br>
        <br><br>
        <footer>
            <div class="container">
                <div class="row">
                    <br>
                    <div style="font-size:11px; padding-bottom: 30px" class="col-lg-12 text-center">
                        <p>Todos os Direitos Reservados © 2016 - Base Aérea Naval de São Pedro da Aldeia</p>
                        <p>Rua Comandante Ituriel s/nº - CEP: 28944-054 - Bairro: Fluminense - São Pedro da Aldeia - RJ</p>
                    </div>
                    <br>
                    <br>
                </div>
            </div>
        </footer>

        <!-- jQuery -->
        <script src="css/js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="css/js/bootstrap.min.js"></script>

        <script>
            $(document).on("input", "#senha2", function () {
                var senha1 = document.getElementById("senha1").value;
                var senha2 = document.getElementById("senha2").value;
                if (senha1 === senha2) {
                    $(".caracteres1").text("OK");
                    document.getElementById("caracteres1").style.color = "green";
                    document.getElementById("botao").disabled = false;
                } else {
                    $(".caracteres1").text("Senhas Não Conferem");
                    document.getElementById("caracteres1").style.color = "red";
                    document.getElementById("botao").disabled = true;
                }
            });
        </script>
    </body>
</html>
