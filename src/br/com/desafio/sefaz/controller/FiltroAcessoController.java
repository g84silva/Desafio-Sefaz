package br.com.desafio.sefaz.controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.desafio.sefaz.dao.UsuarioDao;
import br.com.desafio.sefaz.model.Usuario;


@WebFilter("/views/*")
public class FiltroAcessoController implements Filter {
	
	public FiltroAcessoController() {
        
    }

    public void destroy() {
    	
    }

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
//		String uri = req.getRequestURI();
//		HttpSession sessao = req.getSession(false);
//		
//		if(sessao != null || uri.lastIndexOf("login.jsp") !=-1 || uri.lastIndexOf("/usuario?=autenticar") !=-1) {
//			chain.doFilter(request, response);
//			
//		} else {
//			res.sendRedirect("login.jsp");
//		}
				
		HttpSession session = req.getSession();
		Usuario usuarioLogado = (Usuario) session.getAttribute("usuario");
				
		String urlParaAutenticar = req.getServletPath();
		System.out.println(urlParaAutenticar);
		
		if(usuarioLogado == null && !urlParaAutenticar.equalsIgnoreCase("/usuario?=autenticar")) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp?url="+urlParaAutenticar);
			dispatcher.forward(request, response);
			return;
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
			
	}

}
