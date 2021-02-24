package br.com.desafio.sefaz.test;

import java.util.ArrayList;
import java.util.List;

import br.com.desafio.sefaz.dao.UsuarioDao;
import br.com.desafio.sefaz.model.Telefone;
import br.com.desafio.sefaz.model.Usuario;

public class TestApp {
	public static void main(String[] args) {
		List<Usuario> usuarios = new ArrayList<>();
		List<Telefone> telefones = new ArrayList<>();
		
//		Usuario usu2 = new Usuario();
//		usu2.setNome("Nelson Nede");
//		usu2.setEmail("NelsonN@hotmail.com");
//		Telefone tel2 = new Telefone();
//		tel2.setDdd(81);
//		tel2.setNumero("9.9001-0001");
//		tel2.setTipo("Celular");
//		telefones.add(tel2);
//		Telefone tel3 =  new Telefone();
//		tel3.setDdd(81);
//		tel3.setNumero("3222-0001");
//		tel3.setTipo("Residencial");
//		telefones.add(tel3);
//		usu2.setTelefones(telefones);
		UsuarioDao usuDao = new UsuarioDao();
//		usuDao.inserir(usu2);
		
//		Usuario usu1 = new Usuario();
//		usu1.setId(1);
//		usu1.setNome("Creuza Josefa");
//		usu1.setEmail("CJosefa@gmail.com");
		usuDao.excluir(2);
		
//		System.out.println(usu1.toString());
		
	}

}
