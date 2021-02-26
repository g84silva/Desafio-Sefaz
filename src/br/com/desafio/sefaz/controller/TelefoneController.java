package br.com.desafio.sefaz.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.desafio.sefaz.dao.TelefoneDao;
import br.com.desafio.sefaz.dao.UsuarioDao;
import br.com.desafio.sefaz.model.Telefone;
import br.com.desafio.sefaz.model.Usuario;
import br.com.desafio.sefaz.util.Constantes;

@WebServlet("/telefone/*")
public class TelefoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TelefoneDao telefoneDao;
	private UsuarioDao usuarioDao;

	public TelefoneController() {
		super();
	}

	@Override
	public void init() throws ServletException {
		telefoneDao = new TelefoneDao();
		usuarioDao = new UsuarioDao();
		super.init();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String acao = request.getParameter(Constantes.ACTION_KEY);

		try {

			if (acao == null || acao.isEmpty()) {
				listar(request, response);
			} else if (acao.equalsIgnoreCase(Constantes.NEW_ACTION)) {
				addform(request, response);
			} else if (acao.equalsIgnoreCase(Constantes.INSERT_ACTION)) {
				inserir(request, response);
			} else if (acao.equalsIgnoreCase(Constantes.EDIT_ACTION)) {
				editform(request, response);
			} else if (acao.equalsIgnoreCase(Constantes.UPDATE_ACTION)) {
				atualizar(request, response);
			} else if (acao.equalsIgnoreCase(Constantes.DELETE_ACTION)) {
				excluir(request, response);
			} else {
				listar(request, response);
			}

		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void excluir(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		long usuarioId = Integer.parseInt(request.getParameter(Constantes.USER_ID_COL_NAME));
		int id = Integer.parseInt(request.getParameter(Constantes.ID_COL_NAME));

		telefoneDao.excluir(id);
		response.sendRedirect(request.getContextPath() + "/telefone?acao=listar&usuario_id=" + usuarioId);
	}

	private void atualizar(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter(Constantes.ID_COL_NAME));
		long usuarioId = Integer.parseInt(request.getParameter(Constantes.USER_ID_COL_NAME));

		int ddd = Integer.parseInt(request.getParameter(Constantes.DDD_COL_NAME));
		String numero = request.getParameter(Constantes.NUMBER_COL_NAME);
		String tipo = request.getParameter(Constantes.TYPE_COL_NAME);

		Telefone telefoneRecuperado = telefoneDao.procurarPorId(id);

		telefoneRecuperado.setDdd(ddd);
		telefoneRecuperado.setNumero(numero);
		telefoneRecuperado.setTipo(tipo);

		telefoneDao.atualizar(telefoneRecuperado);
		response.sendRedirect(request.getContextPath() + "/telefone?acao=listar&usuario_id=" + usuarioId);
	}

	private void editform(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		long usuarioId = Integer.parseInt(request.getParameter(Constantes.USER_ID_COL_NAME));
		int id = Integer.parseInt(request.getParameter(Constantes.ID_COL_NAME));

		Telefone telefoneRecuperado = telefoneDao.procurarPorId(id);
		Usuario usuarioRecuperado = usuarioDao.procurarPorId(usuarioId);

		request.setAttribute("telefone", telefoneRecuperado);
		request.setAttribute("usuario", usuarioRecuperado);

		RequestDispatcher dispatcher = request.getRequestDispatcher("telefones-form.jsp");
		dispatcher.forward(request, response);
	}

	private void inserir(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int ddd = Integer.parseInt(request.getParameter(Constantes.DDD_COL_NAME));
		String numero = request.getParameter(Constantes.NUMBER_COL_NAME);
		String tipo = request.getParameter(Constantes.TYPE_COL_NAME);
		long usuarioId = Integer.parseInt(request.getParameter(Constantes.USER_ID_COL_NAME));

		Usuario usuario = usuarioDao.procurarPorId(usuarioId);
		Telefone novoTelefone = new Telefone();
		novoTelefone.setDdd(ddd);
		novoTelefone.setNumero(numero);
		novoTelefone.setTipo(tipo);
		novoTelefone.setUsuario(usuario);

		telefoneDao.inserir(novoTelefone);
		response.sendRedirect(request.getContextPath() + "/telefone?acao=listar&usuario_id=" + usuarioId);

	}

	private void addform(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long usuarioId = Integer.parseInt(request.getParameter(Constantes.USER_ID_COL_NAME));
		Usuario usuario = usuarioDao.procurarPorId(usuarioId);
		request.setAttribute("usuario", usuario);

		RequestDispatcher dispatcher = request.getRequestDispatcher("telefones-form.jsp");
		dispatcher.forward(request, response);

	}

	private void listar(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		long usuarioId = Integer.parseInt(request.getParameter(Constantes.USER_ID_COL_NAME));
		Usuario usuario = usuarioDao.procurarPorId(usuarioId);

		List<Telefone> telefones = telefoneDao.listarTelefonesPorUsuario(usuarioId);
		request.setAttribute("telefones", telefones);
		request.setAttribute("usuario", usuario);

		RequestDispatcher dispatcher = request.getRequestDispatcher("telefone-list.jsp");
		dispatcher.forward(request, response);
	}

}
