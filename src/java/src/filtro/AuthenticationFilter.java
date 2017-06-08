package src.filtro;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.modelo.Usuario;

@WebFilter("/AuthenticationFilter")
public class AuthenticationFilter implements Filter {

    private ServletContext context;
    private Usuario usuario;

    @Override
    public void init(FilterConfig fConfig) throws ServletException {
        this.context = fConfig.getServletContext();
        this.context.log("AuthenticationFilter initialized");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);
        if (session != null) {
            usuario = (Usuario) session.getAttribute("usuario"); ///verificar excessao 
        }

        String uri = req.getRequestURI();
        this.context.log("Requested Resource:: " + uri);

        String url = "/ais/";

        boolean check;
        if (uri.equals(url) //pagina
                || uri.equals(url + "login.jsp")//pagina
                || uri.equals(url + "redefinir_senha.jsp")//pagina
                || uri.equals(url + "Login.jsp")//servlet
                || uri.equals(url + "AltSenha.jsp")//servlet
                ) {
            check = true;
        } else if (usuario != null) {
            if ((uri.equals(url + "admin/admin_home.jsp")
                    || uri.equals(url + "admin/admin_cadastro.jsp")
                    || uri.equals(url + "admin/ListarUsuariosAdmin.jsp")
                    || uri.equals(url + "admin/LogOff.jsp")
                    || uri.equals(url + "admin/ExibirUsuarioAdmin.jsp")
                    || uri.equals(url + "admin/AttUsuarioAdmin.jsp")
                    || uri.equals(url + "admin/CadastroAdmin.jsp"))
                    && usuario.getTipoAcesso() == 1) {
                check = true;
            } else if ((uri.equals(url + "bhmn/bh08/bh08_home.jsp")
                    || uri.equals(url + "bhmn/bh08/ChartsEl.jsp")
                    || uri.equals(url + "bhmn/bh08/ChartsAg.jsp")
                    || uri.equals(url + "bhmn/bh08/ChartsAno.jsp")
                    || uri.equals(url + "bh08_inserir.jsp"))
                    && (usuario.getTipoAcesso() == 1
                    || usuario.getTipoAcesso() == 1)) {
                check = true;
            } else if ((uri.equals(url + "bhmn/bh10/bh10_home.jsp") //
                    || uri.equals(url + "bhmn/bh10/pessoal/ListPessoal.jsp") //
                    || uri.equals(url + "bhmn/bh10/pessoal/ExibePessoal.jsp") //
                    || uri.equals(url + "bhmn/bh10/pessoal/FeriasControlePessoal.jsp") //
                    || uri.equals(url + "bhmn/bh10/folhaN/teste.jsp") //
                    || uri.equals(url + "bhmn/bh10/indicadores/Cad_Indicador.jsp") //
                    || uri.equals(url + "bhmn/bh10/indicadores/Exibe_indicador.jsp") //
                    || uri.equals(url + "bhmn/bh10/indicadores/Att_indicador.jsp") //
                    || uri.equals(url + "bhmn/bh10/indicadores/Update_indicador.jsp") //
                    || uri.equals(url + "bhmn/bh10/indicadores/bh10_indicador_bh11_iaeq.jsp") //
                    || uri.equals(url + "bhmn/bh10/indicadores/bh10_indicador_bh11_iaer.jsp") //
                    || uri.equals(url + "bhmn/bh10/indicadores/bh10_indicador_bh11_iaso.jsp") //
                    || uri.equals(url + "bhmn/bh10/indicadores/bh10_indicador_bh12_iid.jsp") //
                    || uri.equals(url + "bhmn/bh10/indicadores/bh10_indicador_bh12_imnp.jsp")
                    || uri.equals(url + "bhmn/bh10/indicadores/bh10_indicador_bh12_imnq.jsp") //
                    || uri.equals(url + "bhmn/bh10/indicadores/bh10_indicadores.jsp") //
                    || uri.equals(url + "bhmn/bh10/indicadores/bh10_indi_cad.jsp") //
                    || uri.equals(url + "bhmn/bh10/indicadores/bh10_indi_list.jsp") //
                    || uri.equals(url + "bhmn/bh10/indicadores/bh10_indi_update.jsp")) //
                    && (usuario.getTipoAcesso() == 1
                    || usuario.getTipoAcesso() == 1)) {
                check = true;
            } else if ((uri.equals(url + "bhmn/bh30/bh31/BH31.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh31/bh31_ferias.jsp")//pagina
                    || uri.equals(url + "bhmn/bh30/bh31/bh31_dbq.jsp")//pagina
                    || uri.equals(url + "bhmn/bh30/bh31/bh31_buscar.jsp")//pagina
                    || uri.equals(url + "bhmn/bh30/bh31/bh31_cadastrar_civil.jsp")//pagina
                    || uri.equals(url + "bhmn/bh30/bh31/bh31_cadastrar_praca.jsp")//pagina
                    || uri.equals(url + "bhmn/bh30/bh31/bh31_cadastrar_oficial.jsp")//pagina
                    || uri.equals(url + "bhmn/bh30/bh31/bh31_cadastrar_ttc.jsp")//pagina
                    || uri.equals(url + "bhmn/bh30/bh31/trocar.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh31/BuscarPessoal.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh31/ListPessoal.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh31/ExibePessoal.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh31/AttPessoal.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh31/DBQPessoal.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh31/FeriasPessoal.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh31/FeriasControlePessoal.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh31/bh31_buscar_ferias.jsp")//pagina
                    || uri.equals(url + "bhmn/bh30/bh31/BuscarFerias.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh31/Ferias.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh31/CadPessoal.jsp"))//servlet
                    && (usuario.getTipoAcesso() == 1
                    || usuario.getTipoAcesso() == 1
                    || usuario.getTipoAcesso() == 1)) {
                check = true;
            } else if ((uri.equals(url + "bhmn/bh30/bh34/oficina34_host_cadastro.jsp")//pagina
                    || uri.equals(url + "bhmn/bh30/bh34/oficina34_host_cadastro_1.jsp")//pagina
                    || uri.equals(url + "bhmn/bh30/bh34/oficina34_host_alterar.jsp")// pagina
                    || uri.equals(url + "bhmn/bh30/bh34/oficina34_sate.jsp")// pagina
                    || uri.equals(url + "bhmn/bh30/bh34/oficina34_por_periodo.jsp")//pagina
                    || uri.equals(url + "bhmn/bh30/bh34/oficina34_sw.jsp")//pagina
                    || uri.equals(url + "bhmn/bh30/bh34/ListarFile34.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh34/UploadFile34.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh34/RetiraSw.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh34/InsertSate.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh34/List.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh34/Hosts.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh34/BH34.jsp") //servlet
                    || uri.equals(url + "bhmn/bh30/bh34/BH34_anual.jsp") //servlet
                    || uri.equals(url + "bhmn/bh30/bh34/BH34_periodo.jsp") //servlet
                    || uri.equals(url + "bhmn/bh30/bh34/Exibe_indicador_34.jsp") //servlet
                    || uri.equals(url + "bhmn/bh30/bh34/OsManage.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh34/Movimentacao.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh34/Finaly.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh34/trocarbh34.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh34/TrocarOf.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh34/Priori34.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh34/Hosts.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh34/HostIp.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh34/Feedback.jsp")//servlet
                    || uri.equals(url + "bhmn/bh30/bh34/RecusarOs.jsp") //servlet
                    || uri.equals(url + "bhmn/bh30/bh34/AlterarIp.jsp")) //servlet
                    && (usuario.getTipoAcesso() == 1
                    || usuario.getTipoAcesso() == 1
                    || usuario.getTipoAcesso() == 1)) {
                check = true;
            } else if ((uri.equals(url + "bhmn/bh30/bh30_home.jsp")//
                    || uri.equals(url + "bhmn/bh30/bh31/bh30_indicadores.jsp")//
                    || uri.equals(url + "bhmn/bh30/bh31/Exibe_indicador_30.jsp")//
                    || uri.equals(url + "bhmn/bh30/bh31/bh30_indicador_bh32_senso.jsp") //
                    )
                    && (usuario.getTipoAcesso() == 1
                    || usuario.getTipoAcesso() == 1)) {
                check = true;
            } else if ((uri.equals(url + "bhmn/bh30/chapa/bh30_chapa.jsp")//pagina
                    || uri.equals(url + "bhmn/bh30/chapa/bh30_chapa_cadfila.jsp") //pagina
                    || uri.equals(url + "bhmn/bh30/chapa/CadFila.jsp") //servlet
                    || uri.equals(url + "bhmn/bh30/chapa/ExibeFila.jsp") //servlet
                    || uri.equals(url + "bhmn/bh30/chapa/RetiraFila.jsp") //servlet
                    || uri.equals(url + "bhmn/bh30/chapa/EditMilitar.jsp") //servlet
                    )
                    && (usuario.getTipoAcesso() == 1
                    || usuario.getTipoAcesso() == 1
                    || usuario.getTipoAcesso() == 1)) {
                check = true;
            } else if ((uri.equals(url + "bhmn/bh50/BH50.jsp")//
                    || uri.equals(url + "bhmn/bh50/OfList.jsp")//
                    || uri.equals(url + "bhmn/bh50/OsManage50.jsp")//
                    || uri.equals(url + "bhmn/bh50/Movi50.jsp")//
                    || uri.equals(url + "bhmn/bh50/Finaly50.jsp")//
                    || uri.equals(url + "bhmn/bh50/TrocarOf50.jsp")//
                    || uri.equals(url + "bhmn/bh50/UploadFile50.jsp")//
                    || uri.equals(url + "bhmn/bh50/oficina50_por_periodo.jsp")//
                    || uri.equals(url + "bhmn/bh50/BH50_periodo.jsp")//
                    || uri.equals(url + "bhmn/bh50/Priori50.jsp")//
                    || uri.equals(url + "bhmn/bh50/bh50_indicadores.jsp")//
                    || uri.equals(url + "bhmn/bh50/BH50_anual.jsp")//
                    || uri.equals(url + "bhmn/bh50/oficina50_cad_viatura.jsp"))//
                    && (usuario.getTipoAcesso() == 1
                    || usuario.getTipoAcesso() == 1)) {
                check = true;
            } else if ((uri.equals(url + "bhmn/secom/secom_home.jsp")//
                    || uri.equals(url + "bhmn/secom/secom_enviar.jsp")//
                    || uri.equals(url + "bhmn/secom/UploadFile.jsp")//
                    || uri.equals(url + "bhmn/secom/RetiraDoc.jsp")//
                    || uri.equals(url + "bhmn/secom/ListarFile.jsp"))//
                    && (usuario.getTipoAcesso() == 1
                    || usuario.getTipoAcesso() == 1)) {
                check = true;
            } else if ((uri.equals(url + "bhmn/cmd_home.jsp")
                    || uri.equals(url + "cmd/teste2.jsp"))//
                    && usuario.getTipoAcesso() == 1) {
                check = true;
            } else if ((uri.equals(url + "bhmn/bh20/bh25/Contador25.jsp")//
                    || uri.equals(url + "bhmn/bh20/bh25/bh25_diario.jsp")//
                    || uri.equals(url + "bhmn/bh20/bh25/bh25_semanal.jsp")//
                    || uri.equals(url + "bhmn/bh20/bh25/Pergunta.jsp")//
                    || uri.equals(url + "bhmn/bh20/bh25/Controle.jsp")//
                    || uri.equals(url + "bhmn/bh20/bh25/History.jsp")//
                    || uri.equals(url + "bhmn/bh20/bh25/ContadorDiario.jsp")//
                    || uri.equals(url + "bhmn/bh20/bh25/ContadorSemanal.jsp"))//
                    && (usuario.getTipoAcesso() == 1
                    || usuario.getTipoAcesso() == 1
                    || usuario.getTipoAcesso() == 1)) {
                check = true;
            } else if ((uri.equals(url + "identificador/Contador.jsp") //
                    || uri.equals(url + "identificador/Cad_Identi.jsp")//
                    || uri.equals(url + "identificador/Listar_identi.jsp")//
                    || uri.equals(url + "identificador/identi_cad_estacionamento.jsp")
                    || uri.equals(url + "identificador/identi_cad_cracha.jsp"))
                    && (usuario.getTipoAcesso() == 1
                    || usuario.getTipoAcesso() == 1
                    || usuario.getTipoAcesso() == 1)) {
                check = true;
            } else if (uri.equals(url + "redefinir_senha.jsp")
                    || uri.equals(url + "AltSenha.jsp")) {
                check = true;
            } else if (uri.equals(url + "LogOff.jsp")) {
                session.invalidate();
                check = false;
            } else {
                check = false;
            }
        } else {
            check = false;
        }
        if (check == false) {// implementar log de recusa de acesso
            Timestamp tm = new Timestamp(System.currentTimeMillis());
            String d = new SimpleDateFormat("dd/MM/yyyy-HH:mm:ss").format(tm);
            this.context.log("====== ACESSO NAO AUTORIZADO PARA IP: " + request.getRemoteAddr() + " "
                    + "AS " + d);
            res.sendRedirect(url + "loginSigbase.jsp");
        } else {
            // pass the request along the filter chain
            chain.doFilter(request, response);
        }

    }

    @Override
    public void destroy() {
        //close any resources here
    }

}
