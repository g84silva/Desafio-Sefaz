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


@WebServlet("/Autorizar")
public class AutorizacaoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UsuarioDao usuarioDao = new UsuarioDao();
	Usuario usuario;
	
	public AutorizacaoController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();

		if(session.getAttribute("usuario") == null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("views/index.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String email = request.getParameter(Constantes.EMAIL_COL_NAME);
		String senha = request.getParameter(Constantes.PASSWORD_COL_NAME);
		Usuario usuarioLogado = new Usuario();

		if(usuarioDao.validar(email, senha) != null) {
			usuarioLogado = usuarioDao.validar(email, senha);
			session.setAttribute("usuario", usuarioLogado);
			RequestDispatcher dispatcher = request.getRequestDispatcher("views/index.jsp");
			dispatcher.forward(request, response);

		} else {
			session.setAttribute("msg", "Usuário não encontrado!");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
	}
}
