package src.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Date;
import src.ErroSql;
import src.modelo.Usuario;
import src.utilidades.Utilidade;

public class DaoLogin {

    private ConnectDataBase connectDataBase = null;
    private Statement statement;
    private ErroSql erro = null;

    public DaoLogin() {
        connectDataBase = new ConnectDataBase();
    }

    public Usuario loginUsuario(Usuario usuario) {
        String selectTableSQL = "select * from usuario A, usuario_senha B "
                + "where A.nip = '" + usuario.getNip() + "' "
                + "and B.senha='" + usuario.getSenha() + "' "
                + "and B.status_senha='1' "
                + "and A.nip = B.nip;";
        Usuario usuarioRetorno = null;
        try {
            if (connectDataBase.openConection() == null) {
                return null;
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
                usuarioRetorno.setTipoAcesso(rs.getInt("tipoacesso"));
                usuarioRetorno.setAcesso(rs.getInt("acesso"));
                usuarioRetorno.setAtivo(rs.getInt("ativo"));
                usuarioRetorno.setStatusSenha(rs.getInt("senhaStatus"));
            }
            return usuarioRetorno;
        } catch (SQLException e) {
            erro = new ErroSql();
            erro.Gravar("DaoLogin", "loginUsuario", selectTableSQL, e.getMessage());
            return null;
        } finally {
            connectDataBase.closeConnection();
        }
    }

    public Boolean attSenhaUsuario(Usuario usuario) {
        Timestamp tm = new Timestamp(System.currentTimeMillis());
        String t = new SimpleDateFormat("HH:mm:ss").format(tm);
        Date date = new Date();
        LocalTime thisSec = LocalTime.parse(t);
        String insereTableSQL = "INSERT INTO usuario_senha("
                + " nip, status_senha, senha, data, hora, ip) "
                + "VALUES ('" + usuario.getNip() + "', '1','" + usuario.getSenha() + "', "
                + "'" + date + "', '" + thisSec + "', '" + usuario.getIp_access() + "');";
        try {
            if (connectDataBase.openConection() == null) {
                return false;
            }
            statement = connectDataBase.openConection().createStatement();
            statement.executeUpdate(insereTableSQL);
            statement.close();
            connectDataBase.closeConnection();
            return true;
        } catch (SQLException e) {
            erro = new ErroSql();
            erro.Gravar("DaoLogin", "attSenhaUsuario", insereTableSQL, e.getMessage());
            return false;
        } finally {
            connectDataBase.closeConnection();
        }
    }

    public Boolean logon(Usuario usuario) {
        Timestamp tm = new Timestamp(System.currentTimeMillis());
        String t = new SimpleDateFormat("HH:mm:ss").format(tm);
        Date date = new Date();
        LocalTime thisSec = LocalTime.parse(t);
        String insereTableSQL = "INSERT INTO usuario_logon ("
                + "nip, id_session, data, hora, ip) "
                + "VALUES ('" + usuario.getNip() + "', '" + usuario.getId_session() + "', "
                + "'" + date + "', '" + thisSec + "', '" + usuario.getIp_access() + "');";
        try {
            if (connectDataBase.openConection() == null) {
                return false;
            }
            statement = connectDataBase.openConection().createStatement();
            statement.executeUpdate(insereTableSQL);
            statement.close();
            connectDataBase.closeConnection();
            return true;
        } catch (SQLException e) {
            erro = new ErroSql();
            erro.Gravar("DaoLogin", "logon", insereTableSQL, e.getMessage());
            return false;
        } finally {
            connectDataBase.closeConnection();
        }
    }

    public boolean zeraSenhaUsuario(Usuario usuario) {
        String updateTableSQL = "UPDATE usuario_senha"
                + " SET status_senha='0'"
                + " WHERE nip='"+usuario.getNip()+"';";
        try {
            if (connectDataBase.openConection() == null) {
                return false;
            }
            statement = connectDataBase.openConection().createStatement();
            statement.executeUpdate(updateTableSQL);
            statement.close();
            connectDataBase.closeConnection();
            return true;
        } catch (SQLException e) {
            erro = new ErroSql();
            erro.Gravar("DaoLogin", "zeraSenhaUsuario", updateTableSQL, e.getMessage());
            return false;
        } finally {
            connectDataBase.closeConnection();
        }
    }

    public boolean zeraStatusUsuario(Usuario usuario) {
        String updateTableSQL = "UPDATE usuario"
                + " SET senhastatus='0'"
                + " WHERE nip='"+usuario.getNip()+"';";
        try {
            if (connectDataBase.openConection() == null) {
                return false;
            }
            statement = connectDataBase.openConection().createStatement();
            statement.executeUpdate(updateTableSQL);
            statement.close();
            connectDataBase.closeConnection();
            return true;
        } catch (SQLException e) {
            erro = new ErroSql();
            erro.Gravar("DaoLogin", "zeraStatusUsuario", updateTableSQL, e.getMessage());
            return false;
        } finally {
            connectDataBase.closeConnection();
        }
    }

    public boolean auditoria(Usuario usuario, String descricao) {
        Timestamp tm = new Timestamp(System.currentTimeMillis());
        String t = new SimpleDateFormat("HH:mm:ss").format(tm);
        Date date = new Date();
        LocalTime thisSec = LocalTime.parse(t);
        String insereTableSQL = "INSERT INTO usuario_auditoria("
                + "nip, descricao, data, hora, ip) "
                + "VALUES ('"+usuario.getNip()+"', '"+descricao+"',"
                + " '"+date+"', '"+thisSec+"', '"+usuario.getIp_access()+"');";
        try {
            if (connectDataBase.openConection() == null) {
                return false;
            }
            statement = connectDataBase.openConection().createStatement();
            statement.executeUpdate(insereTableSQL);
            statement.close();
            connectDataBase.closeConnection();
            return true;
        } catch (SQLException e) {
            erro = new ErroSql();
            erro.Gravar("DaoLogin", "auditoria", insereTableSQL, e.getMessage());
            return false;
        } finally {
            connectDataBase.closeConnection();
        }
    }
}
