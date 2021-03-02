package br.com.desafio.sefaz.filter;

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
import br.com.desafio.sefaz.util.Constantes;


@WebFilter("/AutorizarUsuario")
public class AutorizarUsuario implements Filter {
	
	public AutorizarUsuario() {
        
    }

    public void destroy() {
    	
    }

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		
		if(session.getAttribute("usuario") == null) {
	
			RequestDispatcher dispatcher = request.getRequestDispatcher("login-falha.jsp");
			dispatcher.forward(request, response);
			
		} else {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
			
	}
}
