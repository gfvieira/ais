package src.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import src.ErroSql;
import src.modelo.Usuario;
import src.utilidades.Utilidade;

public class DaoAdmin {

    private ConnectDataBase connectDataBase = null;
    private Statement statement;
    private ErroSql erro = null;

    public DaoAdmin() {
        connectDataBase = new ConnectDataBase();
    }

    public Usuario buscaUsuario(Usuario usuario) {
        String selectTableSQL = "SELECT * from usuario WHERE nip='" + usuario.getNip() + "';";
        Usuario usuarioRetorno = null;

        try {
            if (connectDataBase.openConection() == null) {
                return null;//criar uma variavel no usauario pra condicao do banco
            }
            statement = connectDataBase.openConection().createStatement();
            ResultSet rs = statement.executeQuery(selectTableSQL);
            while (rs.next()) {
                usuarioRetorno = new Usuario();
                usuarioRetorno.setNip(usuario.getNip());
                usuarioRetorno.setNome(rs.getString("nome"));
                usuarioRetorno.setGraduacao(rs.getInt("graduacao"));
                usuarioRetorno.setGraduacaoNome(Utilidade.graduacaoParaString(rs.getInt("graduacao")));
                usuarioRetorno.setGuerra(rs.getString("guerra"));
                usuarioRetorno.setSetor(rs.getString("setor"));
                usuarioRetorno.setRamal(rs.getString("ramal"));
                usuarioRetorno.setLotus(rs.getString("lotus"));
                usuarioRetorno.setTipoAcesso(rs.getInt("tipoacesso"));
                usuarioRetorno.setAcesso(rs.getInt("acesso"));
                usuarioRetorno.setAtivo(rs.getInt("ativo"));
                usuarioRetorno.setStatusSenha(rs.getInt("senhaStatus"));
            }
            return usuarioRetorno;
        } catch (SQLException e) {
            erro = new ErroSql();
            erro.Gravar("DaoAdmin", "buscaUsuario", selectTableSQL, e.getMessage());
            return null;
        } finally {
            connectDataBase.closeConnection();
        }
    }

    public boolean insereUsuario(Usuario usuario) {
        Timestamp tm = new Timestamp(System.currentTimeMillis());
        String t = new SimpleDateFormat("HH:mm:ss").format(tm);
        Date date = new Date();
        LocalTime thisSec = LocalTime.parse(t);
        String insereTableSQL = "INSERT INTO usuario( "
                + "nip, ativo, senhastatus, nome, graduacao, guerra, setor, ramal, "
                + "lotus, tipoacesso, acesso, data, hora, ip) "
                + "VALUES ('" + usuario.getNip() + "', '1', '1', "
                + "'" + usuario.getNome() + "', '" + usuario.getGraduacao() + "', "
                + "'" + usuario.getGuerra() + "', '" + usuario.getSetor() + "', "
                + "'" + usuario.getRamal() + "', '" + usuario.getLotus() + "', "
                + "'" + usuario.getTipoAcesso() + "', '" + usuario.getAcesso() + "', "
                + "'" + date + "', '" + thisSec + "', '" + usuario.getIp_access() + "');";
        try {
            if (connectDataBase.openConection() == null) {
                return false;
            }
            statement = connectDataBase.openConection().createStatement();
            statement.executeUpdate(insereTableSQL);
            return true;
        } catch (SQLException e) {
            erro = new ErroSql();
            erro.Gravar("DaoAdmin", "insereUsuario", insereTableSQL, e.getMessage());
            return false;
        } finally {
            connectDataBase.closeConnection();
        }
    }

    public ArrayList<Usuario> listaUsuario() {
        String selectTableSQL = "SELECT * from usuario ORDER BY graduacao DESC;";
        Usuario usuarioRetorno = null;
        ArrayList<Usuario> lista = new ArrayList<>();
        try {
            if (connectDataBase.openConection() == null) {
                return null;//criar uma variavel no usauario pra condicao do banco
            }
            statement = connectDataBase.openConection().createStatement();
            ResultSet rs = statement.executeQuery(selectTableSQL);
            while (rs.next()) {
                usuarioRetorno = new Usuario();
                usuarioRetorno.setNip(rs.getString("nip"));
                usuarioRetorno.setNome(rs.getString("nome"));
                usuarioRetorno.setGraduacao(rs.getInt("graduacao"));
                usuarioRetorno.setGraduacaoNome(Utilidade.graduacaoParaString(rs.getInt("graduacao")));
                usuarioRetorno.setGuerra(rs.getString("guerra"));
                usuarioRetorno.setSetor(rs.getString("setor"));
                usuarioRetorno.setRamal(rs.getString("ramal"));
                usuarioRetorno.setLotus(rs.getString("lotus"));
                usuarioRetorno.setTipoAcesso(rs.getInt("tipoacesso"));
                usuarioRetorno.setAcesso(rs.getInt("acesso"));
                usuarioRetorno.setAtivo(rs.getInt("ativo"));
                usuarioRetorno.setStatusSenha(rs.getInt("senhaStatus"));
                lista.add(usuarioRetorno);
            }
            return lista;
        } catch (SQLException e) {
            erro = new ErroSql();
            erro.Gravar("DaoAdmin", "listaUsuario", selectTableSQL, e.getMessage());
            return null;
        } finally {
            connectDataBase.closeConnection();
        }
    }

    public boolean atualizaUsuario(Usuario usuario) {
        String insereTableSQL = "UPDATE usuario SET "
                + "ativo='" + usuario.getAtivo() + "', "
                + "senhastatus='" + usuario.getStatusSenha() + "', "
                + "nip='" + usuario.getNip() + "', "
                + "nome='" + usuario.getNome() + "', "
                + "graduacao='" + usuario.getGraduacao() + "', "
                + "guerra='" + usuario.getGuerra() + "', "
                + "setor='" + usuario.getSetor() + "', "
                + "ramal='" + usuario.getSetor() + "', "
                + "lotus='" + usuario.getRamal() + "', "
                + "tipoacesso='" + usuario.getTipoAcesso() + "', "
                + "acesso='" + usuario.getAcesso() + "' "
                + "WHERE nip='" + usuario.getNip() + "';";
        try {
            if (connectDataBase.openConection() == null) {
                return false;
            }
            statement = connectDataBase.openConection().createStatement();
            statement.executeUpdate(insereTableSQL);
            return true;
        } catch (SQLException e) {
            erro = new ErroSql();
            erro.Gravar("DaoAdmin", "atualizaUsuario", insereTableSQL, e.getMessage());
            return false;
        } finally {
            connectDataBase.closeConnection();
        }
    }
}
