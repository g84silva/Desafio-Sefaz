package br.com.desafio.sefaz.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.desafio.sefaz.dao.UsuarioDao;
import br.com.desafio.sefaz.model.Usuario;
import br.com.desafio.sefaz.util.Constantes;

@WebServlet("/usuario/*")
public class UsuarioController extends HttpServlet {
	private UsuarioDao usuarioDao;
	private static final long serialVersionUID = 1L;

	public UsuarioController() {
		super();
	}

	@Override
	public void init() throws ServletException {
		usuarioDao = new UsuarioDao();
		super.init();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String acao = request.getParameter(Constantes.ACTION_KEY);

		try {

			if (acao == null || acao.isEmpty()) {
				login(request, response);
			} else if (acao.equalsIgnoreCase(Constantes.LIST_ACTION)) {
				listar(request, response);
			} else if (acao.equalsIgnoreCase(Constantes.EDIT_ACTION)) {
				editform(request, response);
			} else if (acao.equalsIgnoreCase(Constantes.UPDATE_ACTION)) {
				atualizar(request, response);
			} else if (acao.equalsIgnoreCase(Constantes.DELETE_ACTION)) {
				excluir(request, response);
			} else if (acao.equalsIgnoreCase(Constantes.LOGOUT_ACTION)) {
				deslogar(request, response);
			}else {
				login(request, response);
			}

		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void deslogar(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		session.removeAttribute("usuario");
		
		session.invalidate();
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
	}

	private void excluir(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		
		long id = Integer.parseInt(request.getParameter(Constantes.ID_COL_NAME));
		usuarioDao.excluir(id);
		HttpSession session = request.getSession();
		session.removeAttribute("usuario");
		
		session.invalidate();
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
	}

	private void atualizar(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		
		long id = Integer.parseInt(request.getParameter(Constantes.ID_COL_NAME));
		String nome = request.getParameter(Constantes.NAME_COL_NAME);
		String email = request.getParameter(Constantes.EMAIL_COL_NAME);
		String senha = request.getParameter(Constantes.PASSWORD_COL_NAME);

		Usuario usuario = new Usuario();
		usuario.setId(id);
		usuario.setNome(nome);
		usuario.setEmail(email);
		usuario.setSenha(senha);

		usuarioDao.atualizar(usuario);
		response.sendRedirect(request.getContextPath() + "/usuario?acao=listar");
	}

	private void editform(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		
		long id = Integer.parseInt(request.getParameter(Constantes.ID_COL_NAME));
		Usuario usuarioSelecionado = usuarioDao.procurarPorId(id);
		request.setAttribute("usuario", usuarioSelecionado);
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/usuario-atualiza.jsp");
		dispatcher.forward(request, response);
	}

	private void listar(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		
		List<Usuario> usuarios = usuarioDao.listarTodos();
		request.setAttribute("usuarios", usuarios);
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/usuario-list.jsp");
		dispatcher.forward(request, response);
	}
}

