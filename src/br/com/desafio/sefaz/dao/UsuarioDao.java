package br.com.desafio.sefaz.dao;

import java.util.List;

import javax.persistence.EntityManager;
import br.com.desafio.sefaz.model.Usuario;
import br.com.desafio.sefaz.util.ConnectionDB;

public class UsuarioDao {
	
	private EntityManager em;
	
	public UsuarioDao() {
		em = ConnectionDB.getConnectionDB();
	}
	
	public void inserir(Usuario usuario) {

		try {
			
			em.getTransaction().begin();
			em.persist(usuario);
			em.getTransaction().commit();

		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Insert: " + e.getMessage());
		} finally {
			em.close();
		}
	}
	
	public void atualizar(Usuario usuario) {
		
		try {

			Usuario usuarioAtualizado = em.find(Usuario.class, usuario.getId());

			usuarioAtualizado.setNome(usuario.getNome());
			usuarioAtualizado.setEmail(usuario.getEmail());
//			usuarioAtualizado.setTelefones(usuario.getTelefones());

			em.getTransaction().begin();
			em.merge(usuarioAtualizado);
			em.getTransaction().commit();

		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Upadate: " + e.getMessage());
		} finally {
			em.close();
		}
	}
	
	public void excluir(long id) {
		
		try {
			
			em.getTransaction().begin();
			
			Usuario usuario = em.find(Usuario.class, id);
			em.remove(usuario);
			
			em.getTransaction().commit();
			
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Delete: " + e.getMessage());
		}finally {
			em.close();
		}
	}
	
	public Usuario procurarPorId(long id) {
		
		Usuario usuario = null;
		
		try {
			
			usuario = em.find(Usuario.class, id);
			
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Search: " + e.getMessage());
		} finally {
			em.close();
		}
		
		return usuario;
	}
	
	@SuppressWarnings("unchecked")
	public List<Usuario> listarTodos() {
		
		List<Usuario> usuarios = null;
		
		try {
			
			usuarios = em.createQuery("from Usuario").getResultList();
			
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("List: " + e.getMessage());
		} finally {
			em.close();
		}
		
		return usuarios;
	}
	
}
