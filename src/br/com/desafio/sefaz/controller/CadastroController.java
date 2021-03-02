package br.com.desafio.sefaz.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.desafio.sefaz.dao.UsuarioDao;
import br.com.desafio.sefaz.model.Usuario;
import br.com.desafio.sefaz.util.Constantes;

@WebServlet("/Cadastrar")
public class CadastroController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UsuarioDao usuarioDao = new UsuarioDao();
	Usuario usuario;
 
    public CadastroController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/usuario-form.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String nome = request.getParameter(Constantes.NAME_COL_NAME);
		String email = request.getParameter(Constantes.EMAIL_COL_NAME);
		String senha = request.getParameter(Constantes.PASSWORD_COL_NAME);
		
		Usuario usuarioNovo = new Usuario();
		usuarioNovo.setNome(nome);
		usuarioNovo.setEmail(email);
		usuarioNovo.setSenha(senha);

		usuarioDao.inserir(usuarioNovo);
		session.setAttribute("msg", "Usuário cadastrado com sucesso!");
		response.sendRedirect(request.getContextPath() + "/login.jsp");
	}
}
