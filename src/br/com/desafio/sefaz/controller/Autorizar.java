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
public class Autorizar extends HttpServlet {
	private static final long serialVersionUID = 1L;
		UsuarioDao usuarioDao = new UsuarioDao();
		Usuario usuario;
    public Autorizar() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome = request.getParameter(Constantes.NAME_COL_NAME);
		String email = request.getParameter(Constantes.EMAIL_COL_NAME);
		
		Usuario usuarioLogado = new Usuario();

		if(usuarioDao.validar(nome, email) != null) {
			
			usuarioLogado = usuarioDao.validar(nome, email);
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();
			session.setAttribute("usuario", usuarioLogado);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("views/index.jsp");
			dispatcher.forward(request, response);
		
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("login-falha.jsp");
			dispatcher.forward(request, response);
		}
	}

}
