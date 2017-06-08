package src;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.dao.DaoLogin;
import src.modelo.Usuario;

public class AltSenha extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String senha1 = "";
            String senha2 = "";
            Usuario usuario = null;
            DaoLogin daologin = null;
            usuario = new Usuario();
            Map mapRequest = request.getParameterMap();
            Map.Entry entryRequest;
            Iterator iteratorRequest = mapRequest.entrySet().iterator();
            String key;
            while (iteratorRequest.hasNext()) {
                entryRequest = (Map.Entry) iteratorRequest.next();
                key = (String) entryRequest.getKey();
                switch (key) {
                    case "senha1":
                        senha1 = request.getParameterValues(key)[0];
                        break;
                    case "senha2":
                        senha2 = request.getParameterValues(key)[0];
                        break;
                    case "nip":
                        usuario.setNip(request.getParameterValues(key)[0]);
                        break;
                }
            }
            if (senha1.equals(senha2)) {
                usuario.setSenha(senha1);
                daologin = new DaoLogin();
                usuario.setIp_access(request.getRemoteAddr());
                boolean check = daologin.zeraSenhaUsuario(usuario);
                if (check) {
                    check = daologin.zeraStatusUsuario(usuario);
                    if (check) {
                        check = daologin.attSenhaUsuario(usuario);
                        if (check) {
                            check = daologin.auditoria(usuario, "SENHA PADRÃO ALTERADA");
                            if (check) {
                                switch (usuario.getTipoAcesso()) {
                                    case 1:
                                        response.sendRedirect("admin/admin_home.jsp");
                                        break;
                                }
                            }
                        } else {
                            request.setAttribute("mensagem", "Não foi possível alterar a senha.");
                            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                            rd.forward(request, response);
                        }
                    } else {
                        request.setAttribute("mensagem", "Não foi possível alterar a senha.");
                        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                        rd.forward(request, response);
                    }
                } else {
                    request.setAttribute("mensagem", "Não foi possível alterar a senha.");
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
