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
import javax.servlet.http.HttpSession;
import src.dao.DaoLogin;
import src.modelo.Usuario;

public class Login extends HttpServlet {

    Usuario usuario = null;
    DaoLogin daologin = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            usuario = new Usuario();
            Map mapRequest = request.getParameterMap();
            Map.Entry entryRequest;
            Iterator iteratorRequest = mapRequest.entrySet().iterator();
            String key;
            while (iteratorRequest.hasNext()) {
                entryRequest = (Map.Entry) iteratorRequest.next();
                key = (String) entryRequest.getKey();
                switch (key) {
                    case "nip":
                        usuario.setNip(request.getParameterValues(key)[0]);
                        break;
                    case "senha":
                        usuario.setSenha(request.getParameterValues(key)[0]);
                        break;
                }
            }

            daologin = new DaoLogin();
            usuario = daologin.loginUsuario(usuario);

            if (usuario == null) {
                request.setAttribute("mensagem", "Usuario ou Senha inválida.");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            } else if (usuario.getAtivo() == 0) {
                request.setAttribute("mensagem", "Este usuario não possui acesso ao sistema.");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            } else {
                HttpSession session = request.getSession(true);
                session.setAttribute("usuario", usuario);
                usuario.setIp_access(request.getRemoteAddr());
                usuario.setId_session(session.getId());
                daologin.logon(usuario);
                if (usuario.getStatusSenha() == 1) {
                    RequestDispatcher rd = request.getRequestDispatcher("redefinir_senha.jsp");
                    rd.forward(request, response);
                } else {
                    switch (usuario.getTipoAcesso()) {
                        case 1:
                            response.sendRedirect("admin/admin_home.jsp");
                            break;
                    }

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
